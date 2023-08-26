package com.spring.alleating.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.member.vo.MemberVO;

@Mapper
@Repository("adminMemberDAO;")
public interface AdminMemberDAO {
	/*관리자 페이지 회원 목록*/
	public List<MemberVO> adminSelectUser(Map memberInfo)throws DataAccessException;
	/*관리자 페이지 회원 수 count*/
	public int adminCountUser(String join_type)throws DataAccessException;
	/* 관리자 페이지 회원 상세보기 */
	public MemberVO adminUserDetail(String id)throws DataAccessException;
	/* 관리자 페이지 회원 탈퇴/복귀 처리*/
	public void adminLeaveUser(Map memberInfo)throws DataAccessException;
	
}
