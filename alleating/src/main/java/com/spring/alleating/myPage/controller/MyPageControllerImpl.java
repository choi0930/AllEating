package com.spring.alleating.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.member.vo.MemberVO;

@Controller("myPagecontroller")
public class MyPageControllerImpl{
	
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
	
	@RequestMapping(value="/myPage/myPage_03.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_03(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_04.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_04(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_review.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_review(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		session.setAttribute("selectedTab", "tab-1");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_edit.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_edit(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_edit02.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_edit02(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		session.setAttribute("side_menuType", "my_page");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		mav.addObject("member", member);
		 
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_reserves.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_reserves(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@RequestMapping(value="/myPage/myPage_secession.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_secession(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_address.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_address(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPage_coupon.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_coupon(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@RequestMapping(value="/myPage/productCancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView productCancel(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/productExchange.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView productExchange(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/productReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView productReturn(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/myPage/*Form.do", method = {RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
