package com.spring.alleating.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.member.dao.AdminMemberDAO;
import com.spring.alleating.member.vo.MemberVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	/*관리자 페이지 일반회원 목록*/
	@Override
	public Map<String, Object> listMembers(Map<String, Object> reDataMap) throws DataAccessException {
		Map<String,Object> member = new HashMap<String,Object>();

		//일반회원 리스트 select
		String joinType = "user";
		reDataMap.put("join_type", joinType);
		List<MemberVO>userMemberList = adminMemberDAO.adminSelectUser(reDataMap);
		
		for(MemberVO vo : userMemberList) {
			String hp1 = vo.getHp1();
			String hp2 = vo.getHp2();
			String hp3 = vo.getHp3();
			
			String hp = hp1+"-"+hp2+"-"+hp3;
			vo.setHp(hp);
		}
		
		
		//일반회원 회원수
		int userTotal = adminMemberDAO.adminCountUser(joinType);
		
		member.put("userMemberList", userMemberList);
		member.put("userTotal",userTotal);
		
		return member;
	}
	/*--------------------------관리자 페이지 일반회원 목록 끝----------------------------*/
	
	/*관리자 페이지 사업자회원 목록*/
	@Override
	public Map<String, Object> listOwnerMembers(Map<String, Object> reDataMap) throws DataAccessException {
		Map<String,Object> member = new HashMap();

		//사업자회원 리스트 select
		String joinType = "owner";
		reDataMap.put("join_type", joinType);
		List<MemberVO>ownerMemberList = adminMemberDAO.adminSelectUser(reDataMap);
		
		for(MemberVO vo : ownerMemberList) {
			String hp1 = vo.getOwner_tel1();
			String hp2 = vo.getOwner_tel2();
			String hp3 = vo.getOwner_tel3();
			
			String hp = hp1+"-"+hp2+"-"+hp3;
			vo.setHp(hp);
		}
		
		//사업자회원 회원수
		int ownerTotal = adminMemberDAO.adminCountUser(joinType);
		
		member.put("ownerMemberList", ownerMemberList);
		member.put("ownerTotal",ownerTotal);
		
		return member;
	}
	/*--------------------------관리자 페이지 사업자회원 목록 끝----------------------------*/
	
	/* 관리자 페이지 회원 상세보기 */
	@Override
	public MemberVO memberDetail(String id) throws DataAccessException {
		MemberVO vo = adminMemberDAO.adminUserDetail(id);
		return vo;
	}
	/*--------------------------관리자 페이지 회원 상세보기----------------------------*/
	
	
	/* 관리자 페이지 회원 탈퇴/복귀 처리*/
	@Override
	public void adminLeaveUser(Map memberInfo) throws DataAccessException {
		adminMemberDAO.adminLeaveUser(memberInfo);
	}
	/*--------------------------관리자 페이지 회원 탈퇴/복귀 처리----------------------------*/
}
