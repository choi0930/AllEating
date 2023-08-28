package com.spring.alleating.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface CouponController {
	public ModelAndView allCouponList(HttpServletRequest request, HttpServletResponse response)throws DataAccessException;
	
}
