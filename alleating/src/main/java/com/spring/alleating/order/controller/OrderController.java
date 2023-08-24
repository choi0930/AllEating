package com.spring.alleating.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {
	public ModelAndView oneProductOrder(@RequestParam("product_id")String productId, @RequestParam("qty")String qty, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView orderAllCartProducts( @RequestParam("cart_product_qtyy")  String[] cart_goods_qty, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
