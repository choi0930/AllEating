package com.spring.alleating.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.cart.dao.CartDAO;
import com.spring.alleating.cart.vo.CartVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	/* 로그인한 유저 카트 목록 가져오기 */
	@Override
	public Map myCartList(CartVO cartVO) throws DataAccessException {
		Map cartMap = new HashMap();
		List<CartVO> cartList = cartDAO.selectMyCartList(cartVO);
		if(cartList.size() == 0) {
			return null;
		}
		Map<String, String> dataMap = new HashMap<>();
		String id = cartVO.getId();
		
		//기본 배송지 가져오기
		DeliveryAddressVO deliveryAddressVO = cartDAO.selectDefaultDeliveryAddress(cartVO);
		cartMap.put("deliveryAddressVO", deliveryAddressVO);
		
		dataMap.put("id", id);
		dataMap.put("deliveryType", "reserve");
		List<CartVO> reserveProductList =cartDAO.selectCartProduct(dataMap);
		
		for(CartVO vo: reserveProductList) {
			int productDiscount = vo.getProductDiscount();
			int oneProductPrice = 0;
			if(productDiscount>0) {
				int productSalesPrice = vo.getProductSalesPrice();
				int cart_product_qty = vo.getCart_product_qty();
				oneProductPrice = productSalesPrice * cart_product_qty;
				System.out.println(oneProductPrice);
				
			}else {
				int productPrice = vo.getProductPrice();
				int cart_product_qty = vo.getCart_product_qty();
				oneProductPrice = productPrice * cart_product_qty;
				System.out.println(oneProductPrice);
				
			}
			vo.setOneProductPrice(oneProductPrice);
		}
		
		int reserveCount = reserveProductList.size();
		System.out.println(reserveCount);
		cartMap.put("reserveProductList", reserveProductList);
		cartMap.put("reserveCount", reserveCount);
		
		dataMap.put("deliveryType", "normal");
		List<CartVO> normalProductList =cartDAO.selectCartProduct(dataMap);
		
		for(CartVO vo: normalProductList) {
			int productDiscount = vo.getProductDiscount();
			int oneProductPrice=0;
			if(productDiscount>0) {
				int productSalesPrice = vo.getProductSalesPrice();
				int cart_product_qty = vo.getCart_product_qty();
				oneProductPrice = productSalesPrice * cart_product_qty;
			}else {
				int productPrice = vo.getProductPrice();
				int cart_product_qty = vo.getCart_product_qty();
				oneProductPrice = productPrice * cart_product_qty;
			}
			vo.setOneProductPrice(oneProductPrice);
		}
		int normalCount = normalProductList.size();
		cartMap.put("normalProductList", normalProductList);
		cartMap.put("normalCount", normalCount);
		
		return cartMap;
		
	}
	/*------------------------------------- 로그인한 유저 카트 목록 가져오기 ----------------------------------------------*/
	
	@Override
	public boolean findCartProducts(CartVO cartVO) throws DataAccessException {
		String check = cartDAO.selectCountInCart(cartVO);
		return Boolean.parseBoolean(check);
	}

	@Override
	public void addProductInCart(CartVO cartVO) throws DataAccessException {
		int cartId =cartDAO.selectMaxCartId();
		cartVO.setCartId(cartId);
		cartDAO.insertProductInCart(cartVO);
	}

	@Override
	public boolean modifyCartQty(CartVO cartVO) throws DataAccessException {
		boolean result = true;
		cartDAO.updateCartQTY(cartVO);
		return result;
	}

	@Override
	public void removeCartProducts(String cartId) throws DataAccessException {
		int _cartId = Integer.parseInt(cartId);
		cartDAO.removeCart(_cartId);
		
	}
	/* 장바구니 상품 체크한것만 삭제 */
	@Override
	public void removeCartProductArray(List<CartVO> cartList) throws DataAccessException {
		for(CartVO cartVO: cartList) {
			int cartId = cartVO.getCartId();
			cartDAO.removeCart(cartId);
		}
		
	}
	/*마이페이지에서 주문했던 상품 다시 모두 담기*/
	@Override
	public void addAllProductInCart(Map cartMap) throws DataAccessException {
		List<CartVO> cartList = (List<CartVO>) cartMap.get("cartList");
		MemberVO memberVO = (MemberVO)cartMap.get("memberVO");
		String id = memberVO.getId();
		
		for(CartVO cartVO: cartList) {
			cartVO.setId(id);
			
			Boolean check = Boolean.parseBoolean(cartDAO.selectCountInCart(cartVO)); //이미 장바구니에 있는지 확인
			
			if(check == false) { //장바구니에 없는 상품일때
				int cartId =cartDAO.selectMaxCartId();
				cartVO.setCartId(cartId);
				cartDAO.insertProductInCart(cartVO);
			}
			
		}
	
	}

}
