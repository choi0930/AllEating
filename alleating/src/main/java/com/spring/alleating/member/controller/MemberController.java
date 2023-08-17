package com.spring.alleating.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface MemberController {
	public ModelAndView addMember(@RequestParam Map<String, String> memberInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMemberInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
