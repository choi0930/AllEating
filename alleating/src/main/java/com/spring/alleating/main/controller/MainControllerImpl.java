package com.spring.alleating.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller ("mainController")
	public class MainControllerImpl {
		@RequestMapping(value= "/main.do", method = RequestMethod.GET)
		public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {

			
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
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName); //add
			return mav;
		}

	
	}