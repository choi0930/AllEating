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
	
}
