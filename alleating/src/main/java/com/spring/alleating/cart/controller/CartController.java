package com.spring.alleating.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addProductInCart(@RequestParam("id") String id, @RequestParam("productId") int productId,@RequestParam("cart_product_qty") int cart_product_qty, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("id") String id ,@RequestParam("productId") int productId,@RequestParam("cart_product_qty") int cart_product_qty,
			                  HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartProduct(@RequestParam("cartId") int cartId,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
