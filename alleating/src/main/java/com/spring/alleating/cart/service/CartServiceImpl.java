package com.spring.alleating.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alleating.cart.dao.CartDAO;
import com.spring.alleating.cart.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findCartProducts(CartVO cartVO) throws Exception {
		String check = cartDAO.selectCountInCart(cartVO);
		return Boolean.parseBoolean(check);
	}

	@Override
	public void addProductInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductInCart(cartVO);
	}

	@Override
	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result = true;
		cartDAO.updateCartQTY(cartVO);
		return result;
	}

	@Override
	public void removeCartProducts(int cartId) throws Exception {
		cartDAO.removeCart(cartId);
		
	}

}
