package com.spring.alleating.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MainController {
	/*
	 * public ModelAndView main(HttpServletRequest request, HttpServletResponse
	 * response)throws Exception;
	 */
	public ModelAndView mainProductDetail(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
