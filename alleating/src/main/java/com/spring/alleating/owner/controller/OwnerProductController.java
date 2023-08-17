package com.spring.alleating.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface OwnerProductController {
	public ModelAndView ownerProductMain(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
