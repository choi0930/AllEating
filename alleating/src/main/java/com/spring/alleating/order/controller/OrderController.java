package com.spring.alleating.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.order.vo.AllEatingOrderDetailVO;

public interface OrderController {
	public ModelAndView oneProductOrder(@RequestParam("product_id")String productId, @RequestParam("qty")String qty, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public void orderAllCartProducts(@RequestBody List<AllEatingOrderDetailVO> allEatingOrderDetailes, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
}
