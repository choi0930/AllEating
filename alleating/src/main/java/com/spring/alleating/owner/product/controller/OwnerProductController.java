package com.spring.alleating.owner.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface OwnerProductController {
	

	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
}
