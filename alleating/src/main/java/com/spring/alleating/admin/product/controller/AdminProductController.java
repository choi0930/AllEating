package com.spring.alleating.admin.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminProductController {
	public ModelAndView listProducts(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView adminProduct(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
}
