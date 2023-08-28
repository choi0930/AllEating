package com.spring.alleating.admin.coupon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.coupon.vo.CouponVO;

public interface AdminCouponController {
	/*관리자 페이지 쿠폰 리스트 가져옴*/
	public ModelAndView couponList(@RequestParam Map<String, String> dataMap,HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*관리자 페이지 쿠폰 추가*/
	public ResponseEntity addCoupon(@ModelAttribute CouponVO couponVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 쿠폰 수정을 위한 쿠폰id로 정보 불러오기 */
	public ModelAndView couponFindById(@RequestParam("couponId")String couponId,HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*관리자 페이지 쿠폰 정보 삭제 처리*/
	public String delCouponInfo(@RequestParam("couponId")String couponId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*관리자 페이지 쿠폰 정보 수정*/
	public ResponseEntity modfiyCouponInfo(@ModelAttribute CouponVO couponVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
