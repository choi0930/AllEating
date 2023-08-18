package com.spring.alleating.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("myPagecontroller")
public class MyPageControllerImpl {
	@RequestMapping(value="/myPage/myPage_01.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPageMain(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/myPage/myPage_02.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_02(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/myPage/myPage_05.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_05(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
