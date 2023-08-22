package com.spring.alleating.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.cart.service.CartService;
import com.spring.alleating.cart.vo.CartVO;
import com.spring.alleating.member.vo.MemberVO;

@Controller("cartController")
public class CartControllerImpl implements CartController{
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartVO cartVO;
	
	
	//@RequestMapping(value="/cart/myCart.do", method = RequestMethod.GET)
//	public ModelAndView myCart(HttpServletRequest request, HttpServletResponse response)throws Exception{
//		HttpSession session = request.getSession();
//		session.setAttribute("side_menuType", "cart_page");
//		String viewName = (String) request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}

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
			cartVO.setId("Non-members");
		}
		
		Map cartMap = cartService.myCartList(cartVO);
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("cartMap", cartMap);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/cart/addProduct", method = RequestMethod.POST)
	public @ResponseBody String addProductInCart(@RequestParam("id")String id, @RequestParam("productId") int productId, @RequestParam("cart_product_qty") int cart_product_qty,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		cartVO.setId(id);
		cartVO.setProductId(productId);
		cartVO.setCart_product_qty(cart_product_qty);
		
		Boolean check = cartService.findCartProducts(cartVO);
		if(check==true){
			return "already_existed";
		}else{
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
		
	}

	@Override
	@RequestMapping(value="/cart/modifyCartQty.do", method = RequestMethod.POST)
	public @ResponseBody String modifyCartQty(@RequestParam("id") String id, @RequestParam("productId") int productId,@RequestParam("cart_product_qty") int cart_product_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		cartVO.setId(id);
		cartVO.setCart_product_qty(cart_product_qty);
		cartVO.setProductId(productId);
		
		boolean result = cartService.modifyCartQty(cartVO);
		String data = Boolean.toString(result);
		return data;
	}

	@Override
	@RequestMapping(value="/cart/removeProduct", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView removeCartProduct(int cartId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		cartService.removeCartProducts(cartId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/cart/myCart.do");
		return mav;
	}
	
}
