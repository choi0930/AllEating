package com.spring.alleating.owner.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OwnerOrderController {
//	public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;

//	public ModelAndView ownerOrderproduct(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 사업자의 주문상품 상제보기 */
	public ModelAndView ownerOrderHistoryDetail(@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse resonse) throws Exception;
	
	public ModelAndView updateOwnerDelivery(@RequestParam Map odinfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
