package com.spring.alleating.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MyPageController {
	public ModelAndView myPage_03(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_04(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_edit(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_edit02(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_reserves(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_secession(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지관리 페이지 이동(로그인한 유저 배송지 목록 불러오기) */
	public ModelAndView myPage_address(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지 추가*/
	
	/* 마이페이지: 쿠폰 페이지 이동(로그인한 유저 쿠폰 목록 불러오기) */
	public ModelAndView myPage_coupon(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 쿠폰 등록 */
	public String myPage_addCoupon(@RequestParam("couponId")String couponId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView productCancel(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView productExchange(HttpServletRequest request, HttpServletResponse response)throws Exception ;
	public ModelAndView productReturn(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	
}
