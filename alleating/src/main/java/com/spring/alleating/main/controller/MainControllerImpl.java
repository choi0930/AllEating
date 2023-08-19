package com.spring.alleating.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller ("mainController")
	public class MainControllerImpl implements MainController {
	@Override	
	@RequestMapping(value= "/main.do", method = RequestMethod.GET)
		public ModelAndView main(HttpServletRequest request, HttpServletResponse response)throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName); 
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName); //add
			return mav;
		}
		
		@RequestMapping(value="/test.do", method = RequestMethod.GET)
		public ModelAndView test(HttpServletRequest request, HttpServletResponse response)throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName); 

		HttpSession session = request.getSession();
		session.setAttribute("selectedTab", "tab-1");
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName); //add
			return mav;
		}
		@RequestMapping(value="/test2.do", method = RequestMethod.GET)
		public ModelAndView test2(HttpServletRequest request, HttpServletResponse response)throws Exception{

			HttpSession session = request.getSession();
			session.setAttribute("selectedTab", "tab-2");
			 
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/test"); //add
			return mav;
		}
	
	}