package com.spring.alleating.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.member.vo.MemberVO;

public interface AdminMemberService {
	/*관리자 페이지 일반 회원 목록*/
	public Map<String,Object> listMembers(Map<String, Object> reDataMap)throws DataAccessException;
	/*관리자 페이지 사업자 회원 목록*/
	public Map<String, Object> listOwnerMembers(Map<String, Object> reDataMap) throws DataAccessException;
	/* 관리자 페이지 회원 상세보기 */
	public MemberVO memberDetail(String id)throws DataAccessException;
	/* 관리자 페이지 회원 탈퇴/복귀 처리*/
	public void adminLeaveUser(Map memberInfo)throws DataAccessException;
}
