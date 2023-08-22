package com.spring.alleating.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.spring.alleating.product.service.ProductService;

@Controller("productController")
public class ProductControllerImpl implements ProductController{
	
	@Autowired
	ProductService productService;
	
	/*
	 * @Override
	 * 
	 * @RequestMapping(value= "/product/product_detail_01.do", method =
	 * RequestMethod.GET) public ModelAndView product_detail_01(HttpServletRequest
	 * request, HttpServletResponse response)throws Exception{
	 * 
	 * 
	 * String viewName = (String)request.getAttribute("viewName");
	 * System.out.println(viewName);
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.setViewName(viewName); //add
	 * return mav; }
	 */
	@Override
	@RequestMapping(value= "/product/product_01.do", method = RequestMethod.GET)
	public ModelAndView product_01(@RequestParam("category")String category, HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "product_01");
		session.setAttribute("category", category);
		
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
	
	@Override
	@RequestMapping(value= "/product/new_product_01.do", method = RequestMethod.GET)
	public ModelAndView new_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override
	@RequestMapping(value= "/product/best_product_01.do", method = RequestMethod.GET)
	public ModelAndView best_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/product/sale_product_01.do", method = RequestMethod.GET)
	public ModelAndView sale_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "sale_product_01");
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	//제품 상세페이지 연결 컨트롤러
	@Override
	@RequestMapping(value="/product/userProductDetail.do?", method = RequestMethod.GET)
	public ModelAndView userProductDetail(@RequestParam("productId") String productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map userProductInfo = new HashMap<>();
		userProductInfo = productService.selectUserProductDetail(productId);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userProductInfo", userProductInfo);
		/* mav.addAttribute("productId", productId); */
		mav.setViewName(viewName);
		
		return mav;
}
}