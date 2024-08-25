package com.app.snsLogin.utill;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@PropertySource("classpath:/snsapi/snsapi.properties")
@Component
public class NaverLoginApiManager {

	@Value("${sns.naver.client.id}")
	private String NAVER_CLIENT_ID;

	@Value("${sns.naver.client.secret}")
	private String NAVER_CLIENT_SECRET;

	public String naverLoginUrl() {
		String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + NAVER_CLIENT_ID
				+ "&redirect_uri=http://localhost:8080/naverlogin&state=1234";

		return url;
	}

	public String getAccessToken(String code, String state) {

		String accessToken = null;
		String reqUrl = "https://nid.naver.com/oauth2.0/token";

		try {

			RestTemplate restTemplate = new RestTemplate();

			HttpHeaders headers = new HttpHeaders();

			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", NAVER_CLIENT_ID);
			params.add("client_secret", NAVER_CLIENT_SECRET);
			params.add("code", code);
			params.add("state", state);

			HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(params, headers);

			ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, naverTokenRequest,
					String.class);

			String responseBody = response.getBody();
			System.out.println("Access Token Response: " + responseBody); // 응답 출력

			JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();

			if (jsonObject != null && jsonObject.has("access_token")) {

				JsonElement accessTokenElement = jsonObject.get("access_token");

				if (accessTokenElement != null) {

					accessToken = accessTokenElement.getAsString();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return accessToken;
	}

	public String getEmail(String accessToken) {

		String reqUrl = "https://openapi.naver.com/v1/nid/me";
		String email = null;

		try {

			RestTemplate restTemplate = new RestTemplate();

			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "Bearer " + accessToken);

			HttpEntity<Void> naverProfileRequest = new HttpEntity<>(headers);

			ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, naverProfileRequest,
					String.class);

			String responseBody = response.getBody();
			System.out.println("Profile Response: " + responseBody); // 응답 출력

			JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
			
			if (jsonObject != null && jsonObject.has("response")) {
				
				JsonObject responseObj = jsonObject.getAsJsonObject("response");
				
				if (responseObj != null && responseObj.has("email")) {
					
					JsonElement emailElement = responseObj.get("email");
					
					if (emailElement != null) {
						
						email = emailElement.getAsString();
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return email;
	}

}
