package com.spring.alleating.admin.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.alleating.admin.coupon.service.AdminCouponService;
import com.spring.alleating.coupon.vo.CouponVO;

@Controller("adminCouponController")
public class AdminCouponControllerImpl {
	
	
	@Autowired
	CouponVO couponVO;
}
