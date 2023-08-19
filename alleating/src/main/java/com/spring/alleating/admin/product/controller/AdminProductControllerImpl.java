package com.spring.alleating.admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminProductController")
public class AdminProductControllerImpl implements AdminProductController {

	@Override
	@RequestMapping(value="/admin/productMain.do", method = RequestMethod.GET)
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "admin_page");
		session.setAttribute("selectedTab", "tab-1");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
