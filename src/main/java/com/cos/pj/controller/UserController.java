package com.cos.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.cos.pj.model.KakaoProfile;
import com.cos.pj.model.OAuthToken;
import com.cos.pj.model.Users;
import com.cos.pj.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private final AuthenticationManager authenticationManager;
	

	
	@Value("${cos.key}")
	private String cosKey;
	
	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@GetMapping("/application")
	public String application() {
		return "user/application";
	}
	
	

	//카카오톡 로그인
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) { //Data를 리턴해주는 컨트롤러 함수
		
		//post 방식으로 key=value데이터를 요청(카카오쪽으로)
		//a태그를 통해 전달하는 방식은 get방식
		
		RestTemplate rt= new RestTemplate();
		
		//httpheader오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//httpbody오브젝트 생성
		MultiValueMap<String,String>params=new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "585ba951eb790dda136089278e378f7e");
		params.add("redirect_uri", "http://localhost:8010/auth/kakao/callback");
		params.add("code", code);
		
		//httpheader와 httpbody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>>kakaoTokenRequest2=
				new HttpEntity<>(params,headers);//body와 header값을 가지는 entity
		//http 요청하기-post방식으로-그리고 response변수의 응답 받음
		ResponseEntity<String>response=rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest2,
				String.class
				);
		
		ObjectMapper objectMapper=new ObjectMapper();
		OAuthToken oauthToken=null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(),OAuthToken.class);

		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰"+oauthToken.getAccess_token());
		
		RestTemplate rt2= new RestTemplate();
		
		//httpheader오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		
		//httpheader와 httpbody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>>kakaoProfileRequest=
				new HttpEntity<>(headers2);//body와 header값을 가지는 entity
		
		//http 요청하기-post방식으로-그리고 response변수의 응답 받음
		ResponseEntity<String>response2=rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
				);
		
		ObjectMapper objectMapper2=new ObjectMapper();
		KakaoProfile kakaoProfile=null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(),KakaoProfile.class);

		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Users kakaoUser=Users.builder()
				.name(kakaoProfile.getKakao_account().getProfile().getNickname())
				.username(kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId())
				.password(cosKey)
				.email(kakaoProfile.getKakao_account().getEmail())
				.oauth("kakao")
				.build();
		
		Users originUser=userService.회원찾기(kakaoUser.getUsername());
		
		if(originUser.getUsername()==null) {
			
			userService.회원가입(kakaoUser);
		}
		
	
		Authentication authentication = 
				authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), cosKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}
	
	

	

	
}
