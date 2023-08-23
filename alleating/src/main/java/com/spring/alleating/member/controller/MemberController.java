package com.spring.alleating.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.alleating.member.vo.MemberVO;


public interface MemberController {
	public ModelAndView addMember(@RequestParam Map<String, String> memberInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public void checkId(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public Map<String, Object> sendEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMemberInfo, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response)throws Exception;
		
	public ModelAndView modMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView find_id_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView find_id_02(@RequestParam("name")String name,@RequestParam("email")String email, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView find_pwd_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView find_pwd_02(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
