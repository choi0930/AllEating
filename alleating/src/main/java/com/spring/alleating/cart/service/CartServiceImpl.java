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
		
		List<CartVO> cartList = cartDAO.selectMyCartList(cartVO);
		if(cartList.size() == 0) {
			return null;
		}
		Map<String, String> dataMap = new HashMap<>();
		String id = cartVO.getId();
		
		String deliveryType = "reserve"; //예약배송 상품
		dataMap.put("id", id);
		dataMap.put("deliveryType", deliveryType);
		List<CartVO> reserveProductList =cartDAO.selectCartProduct(dataMap);
		
		deliveryType="normal"; //일반배송 상품
		dataMap.put("deliveryType", deliveryType);
		List<CartVO> normalProductList =cartDAO.selectCartProduct(dataMap);
		
		Map<String, List<CartVO>> cartMap = new HashMap();
		cartMap.put("cartList", cartList);
		cartMap.put("reserveProductList", reserveProductList);
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