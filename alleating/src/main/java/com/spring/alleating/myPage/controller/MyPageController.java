package com.spring.alleating.myPage.controller;

import java.net.http.HttpRequest;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.WishVO;

public interface MyPageController {
	public ModelAndView myPage_edit(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myPage_edit02(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView myPage_secession(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지관리 페이지 이동(로그인한 유저 배송지 목록 불러오기) */
	public ModelAndView myPage_address(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지 추가 */
	public String myPage_addDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지 삭제 */
	public String myPage_delDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 기본 배송지 변경 */
	public String myPage_modDefaultDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지 수정 팝업창*/
	public String myPage_modifDlieveryAddress(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 배송지 수정*/
	public String myPage_modAddress(@RequestBody Map<String,Object> deliveryInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 쿠폰 페이지 이동(로그인한 유저 쿠폰 목록 불러오기) */
	public ModelAndView myPage_coupon(HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 마이페이지: 쿠폰 등록 */
	public String myPage_addCoupon(@RequestParam("couponId")String couponId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView productCancel(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView productExchange(HttpServletRequest request, HttpServletResponse response)throws Exception ;
	public ModelAndView productReturn(HttpServletRequest request, HttpServletResponse response)throws Exception;

	//마이페이지 ( 찜목록 조회 )
	public ModelAndView selectWishList(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 ( 찜 목록 추가 )
	public int insertWish (WishVO wishVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 ( 찜 목록 삭제 )
	public int deleteWish( WishVO wishVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 ( 적립금 )
	public ModelAndView selectRewardHistory(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
