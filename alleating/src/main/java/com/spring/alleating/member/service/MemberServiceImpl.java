package com.spring.alleating.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

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
	
	
}
