package com.spring.alleating.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;

@Controller("productController")
public class ProductControllerImpl implements ProductController{
	
	@Override
	@RequestMapping(value= "/product/product_detail_01.do", method = RequestMethod.GET)
	public ModelAndView product_detail_01(HttpServletRequest request, HttpServletResponse response)throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override
	@RequestMapping(value= "/product/product_01.do", method = RequestMethod.GET)
	public ModelAndView product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "product_01");
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override
	@RequestMapping(value="/product/search_01.do", method = RequestMethod.GET)
	public ModelAndView search_01(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("searchKeyWord", searchWord);
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); 
		return mav;
	}
	
	
}