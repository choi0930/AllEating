package com.spring.alleating.coupon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.coupon.service.CouponService;
import com.spring.alleating.coupon.vo.CouponVO;
@Controller("couponController")
public class CouponControllerImpl implements CouponController{
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private CouponVO couponVO;
	
	@Override
	@RequestMapping(value="/coupon/couponList.do", method = RequestMethod.GET)
	public ModelAndView allCouponList(HttpServletRequest request, HttpServletResponse response)
			throws DataAccessException {
		String viewName = (String) request.getAttribute("viewName");
		List<CouponVO> couponList = couponService.allcouponList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("couponList", couponList);
		mav.setViewName(viewName);
		return mav;	
	}

}
