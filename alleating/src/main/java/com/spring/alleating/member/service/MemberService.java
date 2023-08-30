package com.spring.alleating.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.member.vo.MemberVO;

public interface MemberService {
	public void addMember(Map<String, String> memberInfo)throws DataAccessException;
	public MemberVO login(Map<String, String> loginMember)throws DataAccessException;
	public int selectById(String id)throws DataAccessException;
	
	public int updateMember(Map<String, String> memberInfo) throws DataAccessException;
	public MemberVO modMember(String id) throws DataAccessException;
	//카카오 로그인
	public String  getKakaoAccessToken (String code) throws Exception;
	public Map createKakaoUser(String token) throws Exception;
}
