package com.spring.alleating.cart.controller;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.spring.alleating.cart.service.CartService;
import com.spring.alleating.cart.vo.CartVO;
import com.spring.alleating.member.vo.MemberVO;

@Controller("cartController")
public class CartControllerImpl implements CartController{
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartVO cartVO;
	
	/* 카트 진입 */
	@Override
	@RequestMapping(value="/cart/myCart.do", method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "cart_page");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		if(memberVO != null) {
		String id = memberVO.getId();
			cartVO.setId(id);
		}else {
			cartVO.setId("NonMembers");
		}
		
		Map product_map = cartService.myCartList(cartVO);
		
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView();
		session.setAttribute("product_map", product_map);
		//mav.addObject("product_map", product_map);
		
		mav.setViewName(viewName);
		return mav;
	}
	/*------------------------------------------------------------------------*/
	
	/*장바구니 담기*/
	@Override
	@ResponseBody 
	@RequestMapping(value="/cart/addProduct.do", method = RequestMethod.POST)
	public String addProductInCart(@RequestParam("productId") String productId, @RequestParam("cart_product_qty")String select_qty ,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();
		int _productId = Integer.parseInt(productId);
		int _select_qty = Integer.parseInt(select_qty);
		cartVO.setId(id);
		cartVO.setProductId(_productId);
		cartVO.setCart_product_qty(_select_qty);
		
		Boolean check = cartService.findCartProducts(cartVO);
		if(check==true){
			return "already_existed";
		}else{
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
		
	}
	/*------------------------------------------------------------------------*/
	
	/*마이페이지에서 주문했던 상품 다시 모두 담기*/
	@Override
	@ResponseBody
	@RequestMapping(value="/cart/addAllProduct.do", method = RequestMethod.POST)
	public String addAllProductInCart(@RequestBody List<CartVO> cartList, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		
		Map<String, Object> cartMap = new HashMap<>();
		cartMap.put("cartList", cartList);
		cartMap.put("memberVO", memberVO);
		
		cartService.addAllProductInCart(cartMap);
		
		return "성공";
	}
	/*------------------------------------------------------------------------*/
	
	/*장바구니 수량 변경*/
	@Override
	@ResponseBody
	@RequestMapping(value="/cart/modifyCartQty.do", method = RequestMethod.POST)
	public String modifyCartQty(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();
		String qty = request.getParameter("cart_product_qty");
		String productId = request.getParameter("productId");
		String cartId = request.getParameter("cartId");
		
		int _qty = Integer.parseInt(qty);
		int _productId = Integer.parseInt(productId);
		int _cartId = Integer.parseInt(cartId);
		
		cartVO.setId(id);
		cartVO.setCart_product_qty(_qty);
		cartVO.setProductId(_productId);
		cartVO.setCartId(_cartId);
		
		boolean result = cartService.modifyCartQty(cartVO);
		String data = Boolean.toString(result);
		return "s";
	}
	/*------------------------------------------------------------------------*/
	
	/*장바구니 상품 삭제*/
	@Override
	@RequestMapping(value="/cart/removeProduct.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView removeCartProduct(@RequestParam("cartId") String cartId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		cartService.removeCartProducts(cartId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/cart/myCart.do");
		return mav;
	}
	/*------------------------------------------------------------------------*/
	
	/* 장바구니 체크한 상품 여러개 삭제 */
	@Override
	@ResponseBody
	@PostMapping(value="/cart/removeProductArray.do")
	public String removeCartProducts(@RequestBody List<CartVO> cartList , HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String msg="삭제완료";
		cartService.removeCartProductArray(cartList);
		return msg;
	}
	/*------------------------------------------------------------------------------------------------*/

	
}
