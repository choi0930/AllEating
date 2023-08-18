package com.spring.alleating.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("cartController")
public class CartControllerImpl {
	@RequestMapping(value="/cart/myCart.do", method = RequestMethod.GET)
	public ModelAndView myCart(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "cart_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
}
