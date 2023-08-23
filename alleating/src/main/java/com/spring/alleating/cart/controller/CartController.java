package com.spring.alleating.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.cart.vo.CartVO;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addProductInCart(@RequestParam("id") String id, @RequestParam("productId") int productId,@RequestParam("cart_product_qty") int cart_product_qty, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody CartVO modifyCartQty(@RequestParam("cartId")int cartId,@RequestParam("productId") int productId,@RequestParam("cart_product_qty")int qty,@RequestParam("status") String status, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartProduct(@RequestParam("cartId") int cartId,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
