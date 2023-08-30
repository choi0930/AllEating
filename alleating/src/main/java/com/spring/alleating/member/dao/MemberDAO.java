package com.spring.alleating.member.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public void insertMember(Map memberInfo)throws DataAccessException;
	public MemberVO selectByIdAndPwd(Map loginMember)throws DataAccessException;
	public int selectById(String id)throws DataAccessException;
	
	public MemberVO selectMemberById(String id) throws DataAccessException;	
	public int updateMember(Map memberInfo) throws DataAccessException;
	public void joinMemberDeliveryaddress(Map defaultAddress)throws DataAccessException;

	/* 카카오id로 회원가입이 되어있는지 확인*/
	public int selectCheckSnsId(Map snsUserMap)throws DataAccessException;
	/*카카오 로그인*/
	public MemberVO selectKaKaoLogin(Map snsLoginInfo)throws DataAccessException;
}
