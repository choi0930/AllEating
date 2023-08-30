package com.spring.alleating.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.spring.alleating.member.dao.MemberDAO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.point.dao.PointDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private MemberVO memberVO;
	
	@Override //회원가입
	public void addMember(Map<String, String> memberInfo) throws DataAccessException {
		String email1 = memberInfo.get("email1");
		String email2 = memberInfo.get("email2");
		String email3 = memberInfo.get("email3");
		String email;
		if(email3.equals("choose") || email3.equals("self")) {
			email = email1+"@"+email2;
		}else {
			email = email1+"@"+email3;
		}
		
		memberInfo.put("email", email);
		
		String _id = memberInfo.get("id");
		
		if(_id.contains("kakao_")) {
			memberInfo.put("pwd", "kakao");
			
		}
		
		memberDAO.insertMember(memberInfo);
		//회원가입시 기본 포인트 생성
		String id = memberInfo.get("id");
		int point = 0;
		
		Map<String,Object> userInfo = new HashMap<String, Object>();
		userInfo.put("id", id);
		userInfo.put("userPoint", point);
		
		pointDAO.insertJoinUserPoint(userInfo);
		
		
		///////////////////////////////////////////////////////////////////////////
		///////////////////////회원가입시 입력한 주소가 기본배송지로 설정////////////////////
		//////////////////////////////////////////////////////////////////////////
		String receiver_name = memberInfo.get("name");
		String receiver_hp1 = memberInfo.get("hp1");
		String receiver_hp2 = memberInfo.get("hp2");
		String receiver_hp3 = memberInfo.get("hp3");
		String zipcode = memberInfo.get("zipcode");
		String address = memberInfo.get("address");
		String address2 = memberInfo.get("address2");
		String address_detail = memberInfo.get("address_detail");
		String default_address = memberInfo.get("default_address");
		Map<String, String> defaultAddress = new HashMap<String, String>();
		defaultAddress.put("id", id);
		defaultAddress.put("receiver_name", receiver_name);
		defaultAddress.put("receiver_hp1", receiver_hp1);
		defaultAddress.put("receiver_hp2", receiver_hp2);
		defaultAddress.put("receiver_hp3", receiver_hp3);
		defaultAddress.put("zipcode", zipcode);
		defaultAddress.put("address", address);
		defaultAddress.put("address2", address2);
		defaultAddress.put("address_detail", address_detail);
		defaultAddress.put("default_address", default_address);
		
		memberDAO.joinMemberDeliveryaddress(defaultAddress);
		
	}

	@Override //로그인
	public MemberVO login(Map<String, String> loginMember) throws DataAccessException {
		MemberVO vo = memberDAO.selectByIdAndPwd(loginMember);
		return vo;
	}

	@Override
	public int selectById(String id) throws DataAccessException {
		int result = memberDAO.selectById(id);
		return result;
	}

	@Override
	public MemberVO modMember(String id) throws DataAccessException {
		/* MemberVO memberVO = new MemberVO(); */
		memberVO = memberDAO.selectMemberById(id);
		return memberVO;
	}

	@Override
	public int updateMember(Map<String, String> memberInfo) throws DataAccessException {
		String email1 = memberInfo.get("email1");
		String email2 = memberInfo.get("email2");
		String email3 = memberInfo.get("email3");
		String email;
		if(email3.equals("choose") || email3.equals("self")) {
			email = email1+"@"+email2;
		}else {
			email = email1+"@"+email3;
		}
		
		memberInfo.put("email", email);
			
		return memberDAO.updateMember(memberInfo);
	}
	/* 카카오 서버에서 인가토큰 받기 */
	@Override
	public String getKakaoAccessToken(String code) throws Exception {
		 String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=22821e5743829f1eb421764701cb07c1"); // TODO REST_API_KEY 입력
	            sb.append("&redirect_uri=http://localhost:8080/member/kakao.do"); // TODO 인가코드 받은 redirect_uri 입력
	            sb.append("&code=" + code);
	            bw.write(sb.toString());
	            bw.flush();

	            //결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return access_Token;
	}

	@Override
	public Map createKakaoUser(String token) throws Exception {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		Map<String, Object> snsUserInfo = new HashMap();
	    //access_token을 이용하여 사용자 정보 조회
	    try {
	       URL url = new URL(reqURL);
	       HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	       conn.setRequestMethod("POST");
	       conn.setDoOutput(true);
	       conn.setRequestProperty("Authorization", "Bearer " + token); //전송할 header 작성, access_token전송

	       //결과 코드가 200이라면 성공
	       int responseCode = conn.getResponseCode();
	       System.out.println("responseCode : " + responseCode);

	       //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	       BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       String line = "";
	       String result = "";

	       while ((line = br.readLine()) != null) {
	           result += line;
	       }
	       System.out.println("response body : " + result);

	       //Gson 라이브러리로 JSON파싱
	       JsonParser parser = new JsonParser();
	       JsonElement element = parser.parse(result);

	       String kakaoId = element.getAsJsonObject().get("id").getAsString();
	       String nickName = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname").getAsString();
	       boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
	       String email = "";
	       if(hasEmail){
	           email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
	           
	           	 String[] emailSplit = email.split("@");
		    	 String email1 = emailSplit[0];
		    	 String email2 = emailSplit[1];
		    	 
		    	 snsUserInfo.put("email1", email1);
		    	 snsUserInfo.put("email2", email2);
	       }
	       
	       System.out.println("snsId : " + kakaoId);
	       System.out.println("email : " + email);
	       snsUserInfo.put("id", "kakao_"+kakaoId);
	       snsUserInfo.put("nickName", nickName);
	       snsUserInfo.put("email", email);
	       br.close();

	       } catch (IOException e) {
	            e.printStackTrace();
	       }
	    
	     int result =  memberDAO.selectCheckSnsId(snsUserInfo);
	     
	     if(result == 0) {
	    	 snsUserInfo.put("status", "addMemer");
	    	 return snsUserInfo;
	     }else {
	    	 MemberVO memberVO = memberDAO.selectKaKaoLogin(snsUserInfo);
	    	 snsUserInfo.put("status", "login");
	    	 snsUserInfo.put("memberVO", memberVO);
	    	 return snsUserInfo;
	     }
	    
	}
		
	
	
	
}
