package com.spring.alleating.cart.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.cart.vo.CartVO;

public interface CartService {
	public Map myCartList(CartVO cartVO) throws DataAccessException;
	public boolean findCartProducts(CartVO cartVO) throws DataAccessException;
	public void addProductInCart(CartVO cartVO) throws DataAccessException;
	public boolean modifyCartQty(CartVO cartVO) throws DataAccessException;
	public void removeCartProducts(String cartId) throws DataAccessException;
	public void removeCartProductArray(List<CartVO> cartList)throws DataAccessException;
}
