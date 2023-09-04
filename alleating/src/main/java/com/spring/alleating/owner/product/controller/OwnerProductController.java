package com.spring.alleating.owner.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface OwnerProductController {
	public ModelAndView ownerProductList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ModelAndView deleteProduct(int productId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ownerupdateproduct(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 사업자 상품문의 게시판 (미완) */
//	public ModelAndView ownerinquirylist(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView ownerinquirylist(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView addOwnerInquiry(@RequestParam Map<String, String> articleMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView memviewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addReply(@RequestParam Map<String, String> articleMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	//public void  addNewProductImg(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
}

	

