package com.spring.alleating.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.member.vo.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> listMembers(Map memberInfo)throws DataAccessException;
	public MemberVO memberDetail(String id)throws DataAccessException;
	public void adminLeaveUser(Map memberInfo)throws DataAccessException;
}
