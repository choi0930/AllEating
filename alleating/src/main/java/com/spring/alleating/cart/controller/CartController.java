package com.spring.alleating.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.cart.vo.CartVO;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String addProductInCart(@RequestParam("productId") String productId,@RequestParam("cart_product_qty")String select_qty, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartProduct(@RequestParam("cartId") int cartId,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
