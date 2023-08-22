package com.spring.alleating.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alleating.cart.dao.CartDAO;
import com.spring.alleating.cart.vo.CartVO;
import com.spring.alleating.product.vo.ProductVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public Map myCartList(CartVO cartVO) throws Exception {
		Map cartMap = new HashMap();
		List<CartVO> cartList = cartDAO.selectMyCartList(cartVO);
		if(cartList.size() == 0) {
			return null;
		}
		Map<String, String> dataMap = new HashMap<>();
		String id = cartVO.getId();
		
		
		dataMap.put("id", id);
		dataMap.put("deliveryType", "reserve");
		List<CartVO> reserveProductList =cartDAO.selectCartProduct(dataMap);
		cartMap.put("reserveProductList", reserveProductList);
		
		dataMap.put("deliveryType", "normal");
		List<CartVO> normalProductList =cartDAO.selectCartProduct(dataMap);
		cartMap.put("normalProductList", normalProductList);
		
		return cartMap;
		
		
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
