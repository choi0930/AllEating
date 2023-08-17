package com.spring.alleating.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	@Override
	@RequestMapping(value="/member/join.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addMember(Map<String, String> memberInfo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/login.do", method = {RequestMethod.POST})
	public ModelAndView login(Map<String, String> loginMemberInfo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return null;
	}

	@RequestMapping(value="/member/find_id_01.do", method = RequestMethod.GET)
	public ModelAndView find_id_01(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@RequestMapping(value= "/member/find_id_02.do", method = RequestMethod.GET)
	public ModelAndView find_id_02(HttpServletRequest request, HttpServletResponse response) {

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@RequestMapping(value= "/member/find_pwd_01.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_01(HttpServletRequest request, HttpServletResponse response) {

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@RequestMapping(value= "/member/find_pwd_02.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_02(HttpServletRequest request, HttpServletResponse response) {

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@RequestMapping(value="/member/*Form.do", method = {RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
