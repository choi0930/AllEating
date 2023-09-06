package com.spring.alleating.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.cart.vo.CartVO;

public interface CartController {
	/*장바구니 진입*/
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	/*장바구니에 상품 담기*/
	public String addProductInCart(@RequestParam("productId") String productId,@RequestParam("cart_product_qty")String select_qty, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	/*마이페이지에서 주문했던 상품 다시 모두 담기*/
	public String addAllProductInCart(@RequestBody List<CartVO> cartList, HttpServletRequest request)throws Exception;
	/*장바구니 상품 수량 수정*/
	public  @ResponseBody String modifyCartQty(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	/*장바구니 상품 삭제*/
	public ModelAndView removeCartProduct(@RequestParam("cartId") String cartId,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	/*장바구니 선택한 상품 삭제*/
	public String removeCartProducts(@RequestBody List<CartVO> cartList ,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
