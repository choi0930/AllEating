package com.spring.alleating.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.member.dao.MemberDAO;
import com.spring.alleating.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
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
		MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.selectMemberById(id);
		return memberVO;
	}

	@Override
	public int updateMember(MemberVO member) throws DataAccessException {
		return memberDAO.updateMember(member);
	}
	
	
}
