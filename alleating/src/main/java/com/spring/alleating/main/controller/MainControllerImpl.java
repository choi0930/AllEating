package com.spring.alleating.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.main.service.MainService;

@Controller ("mainController")
	public class MainControllerImpl extends BaseController implements MainController {
	
	@Autowired
	MainService mainService;
	
	
	//상품 목록들 보여주기 위한 컨트롤러
	@Override	
	@RequestMapping(value= "/main.do", method = RequestMethod.GET)
		public ModelAndView mainProductDetail( HttpServletRequest request, HttpServletResponse response)throws Exception {
		
			/* Map mainInfo = new HashMap<>(); */
			/* mainInfo = mainService.selectMainProductDetail */
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			/* mav.addObject("mainInfo", mainInfo); */
			mav.setViewName(viewName);
		 
			Map productPeriod = calcSearchPeriod("one_month");
			System.out.println(productPeriod.get(productPeriod));
			Map mainresult = mainService.selectMainProductDetail(productPeriod);
			
			mav.addObject("mainresult",mainresult);

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