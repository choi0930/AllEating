package com.spring.alleating.cart.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.cart.vo.CartVO;

public interface CartService {
	public Map myCartList(CartVO cartVO) throws DataAccessException;
	public boolean findCartProducts(CartVO cartVO) throws DataAccessException;
	public void addProductInCart(CartVO cartVO) throws DataAccessException;
	/*마이페이지에서 주문했던 상품 다시 모두 담기*/
	public void addAllProductInCart(Map cartMap)throws DataAccessException;
	
	public boolean modifyCartQty(CartVO cartVO) throws DataAccessException;
	public void removeCartProducts(String cartId) throws DataAccessException;
	public void removeCartProductArray(List<CartVO> cartList)throws DataAccessException;
}
