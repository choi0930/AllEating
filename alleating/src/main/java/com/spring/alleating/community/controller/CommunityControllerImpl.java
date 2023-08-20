package com.spring.alleating.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("communityController")
public class CommunityControllerImpl implements CommunityController {
	@Override
	@RequestMapping(value= "/community/review_01.do", method = RequestMethod.GET)
	public ModelAndView review_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "review_01");
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	}