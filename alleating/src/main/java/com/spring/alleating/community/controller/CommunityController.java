package com.spring.alleating.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {
	public ModelAndView review_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	
	
}
