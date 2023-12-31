package com.spring.alleating.admin.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderContorller {
	public ModelAndView adminOrderList(@RequestParam Map<String, String>dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*사업자 상품 주문 정보 */
	public ModelAndView ownerOrderList(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
