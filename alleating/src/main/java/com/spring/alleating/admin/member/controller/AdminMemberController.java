package com.spring.alleating.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMemberController {
	/*관리자 페이지 일반회원 목록*/
	public ModelAndView listUserMembers(@RequestParam Map<String,String> dataMap,HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*관리자 페이지 사업자회원 목록*/
	public ModelAndView listOwnerMembers(@RequestParam Map<String,String> dataMap,HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 관리자 페이지 회원 상세보기 */
	public ModelAndView memberDetail(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 관리자 페이지 회원 탈퇴/복귀 처리*/
	public ResponseEntity<Object> adminLeaveUser(@RequestParam Map memberInfo, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
