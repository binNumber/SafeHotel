package com.app.snsLogin.utill;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.app.snsLogin.dto.google.GoogleInfResponse;
import com.app.snsLogin.dto.google.GoogleRequest;
import com.app.snsLogin.dto.google.GoogleResponse;

@PropertySource("classpath:/snsapi/snsapi.properties")
@Component
public class GoogleLoginApiManager {
	
	@Value("${sns.google.client.id}")
	private String GOOGLE_CLIENT_ID;

	@Value("${sns.google.client.pw}")
	private String GOOGLE_CLIENT_PW;
	
	public String googleLoginUrl() {
		String url = "https://accounts.google.com/o/oauth2/v2/auth?client_id="
					+ GOOGLE_CLIENT_ID
					+ "&redirect_uri=http://localhost:8080/api/v1/oauth2/google&response_type=code&scope=email%20profile%20openid&access_type=offline";
		
		return url;
	}
	
	public String getGoogleEmail(String code) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		GoogleRequest googleOAuthRequestParam = GoogleRequest
	            .builder()
	            .clientId(GOOGLE_CLIENT_ID)
	            .clientSecret(GOOGLE_CLIENT_PW)
	            .code(code)
	            .redirectUri("http://localhost:8080/api/v1/oauth2/google")
	            .grantType("authorization_code").build();
		
		ResponseEntity<GoogleResponse> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token",
	            googleOAuthRequestParam, GoogleResponse.class);
		
		String jwtToken=resultEntity.getBody().getId_token();
		
		Map<String, String> map=new HashMap<>();
		map.put("id_token",jwtToken);
		
		ResponseEntity<GoogleInfResponse> resultEntity2 = restTemplate.postForEntity("https://oauth2.googleapis.com/tokeninfo",
	            map, GoogleInfResponse.class);
		
		//구글 로그인에서 이메일 뽑아오기
		String email = resultEntity2.getBody().getEmail();
		
		return email;
	}
	
}
