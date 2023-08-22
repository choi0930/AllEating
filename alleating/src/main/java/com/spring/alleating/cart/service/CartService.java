package com.spring.alleating.cart.service;


import java.util.List;
import java.util.Map;

import com.spring.alleating.cart.vo.CartVO;

public interface CartService {
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception;
	public boolean findCartProducts(CartVO cartVO) throws Exception;
	public void addProductInCart(CartVO cartVO) throws Exception;
	public boolean modifyCartQty(CartVO cartVO) throws Exception;
	public void removeCartProducts(int cartId) throws Exception;
}
