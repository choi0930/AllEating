package com.spring.alleating.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ProductController {
	public ModelAndView product_detail_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView product_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView search_01(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView new_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView best_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView sale_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
