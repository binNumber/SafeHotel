package com.app.snsLogin.utill;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.logging.log4j.core.tools.picocli.CommandLine.Command;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@PropertySource("classpath:/snsapi/snsapi.properties")
@Component
public class KakaoLoginApiManager {

	@Value("${sns.kakao.restapi.key}")
	private String KAKAO_REST_API_KEY;

	@Value("${sns.kakao.redirect.url}")
	private String KAKAO_RDIRECT_URL;

	public String kakaoLoginUrl() {

		String url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" + KAKAO_REST_API_KEY
				+ "&redirect_uri=" + KAKAO_RDIRECT_URL;

		return url;
	}

	public String getAccessToken(String code) {
		String accessToken = null;
		String refreshToken = null;
		String reqUrl = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 필수 헤더 세팅
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true); // OutputStream으로 Post 데이터 전달

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();

			// 필수 쿼리 파라미터 세팅
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=").append(KAKAO_REST_API_KEY);
			sb.append("&redirect_uri=").append(KAKAO_RDIRECT_URL);
			sb.append("&code=").append(code);

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br;
			if (responseCode >= 200 && responseCode < 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String line = "";
			StringBuilder responseSb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				responseSb.append(line);
			}
			String result = responseSb.toString();

			JsonElement element = JsonParser.parseString(result);
			JsonObject jsonObject = element.getAsJsonObject();

			// access_token 필드 확인
			JsonElement accessTokenElement = jsonObject.get("access_token");
			if (accessTokenElement != null) {
				accessToken = accessTokenElement.getAsString();
			} else {
				System.err.println("access_token 필드가 JSON 응답에 없습니다.");
			}

			// refresh_token 필드 확인
			JsonElement refreshTokenElement = jsonObject.get("refresh_token");
			if (refreshTokenElement != null) {
				refreshToken = refreshTokenElement.getAsString();
			} else {
				System.err.println("refresh_token 필드가 JSON 응답에 없습니다.");
			}

			br.close();
			bw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return accessToken;
	}

	public String getEmail(String accessToken) {
		String email = null;
		String reqUrl = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqUrl);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			int responseCode = conn.getResponseCode();

			BufferedReader br;
			if (responseCode >= 200 && responseCode < 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String line = "";
			StringBuilder responseSb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				responseSb.append(line);
			}
			String result = responseSb.toString();

			JsonElement element = JsonParser.parseString(result);
			JsonObject jsonObject = element.getAsJsonObject();

			JsonObject kakaoAccount = jsonObject.get("kakao_account").getAsJsonObject();
			
			if (kakaoAccount != null) {
				JsonElement emailElement = kakaoAccount.get("email");
				if (emailElement != null) {
					email = emailElement.getAsString();
				} else {
					System.err.println("email 필드가 JSON 응답에 없습니다.");
				}
			} else {
				System.err.println("kakao_account 필드가 JSON 응답에 없습니다.");
			}

			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return email;
	}
}
