package com.spring.alleating.owner.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OwnerOrderController {
//	public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView ownerOrderproduct(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
