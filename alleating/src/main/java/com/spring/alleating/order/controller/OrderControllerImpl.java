package com.spring.alleating.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("orderController")
public class OrderControllerImpl {
	
	@RequestMapping(value="/order/pay_01.do", method = RequestMethod.GET)
	public ModelAndView thunderDelivery(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	
	@RequestMapping(value="/order/pay_02.do", method = RequestMethod.GET)
	public ModelAndView pay(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	
	@RequestMapping(value= "/order/pay_complete.do", method = RequestMethod.GET)
	public ModelAndView payComplete(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
}
