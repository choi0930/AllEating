package com.spring.alleating.admin.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.product.vo.ProductVO;

public interface AdminProductController {
	/* 관리자페이지 관리자 상품 페이징 기능 (tab메뉴 2번) */
	public ModelAndView listProducts(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 상품관리 페이지 첫 진입(tab메뉴 1번) */
	public ModelAndView adminProduct(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 관리자 상품 등록 */
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
	
	/* 상품관리 상세페이지 */
	public ModelAndView productDetail(@RequestParam("productId") String productId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 사업자 상품 등록 승인 or 거절 */
	public String modifyProductStatus(@RequestParam ("productId")String productId, @RequestParam("productStatus")String productStatus)throws Exception;
	
	/* 관리자 상품 수정 페이지 이동 */
	public ModelAndView modProduct(@RequestParam("productId")String productId, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/* 관리자 상품 삭제 */
	public String delProduct(@RequestBody ProductVO productVO ,HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	/*관리자 상품 이미지 수정*/
	public void modImgInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
	/*관리자 상품 이미지 삭제*/
	public void delProductImg(@RequestParam("productId")String productId,
							 @RequestParam("imgId")String imgId,
							 @RequestParam("fileName")String fileName,
							 @RequestParam("cateCode")String cateCode,
							 HttpServletRequest request,
							 HttpServletResponse response
									)throws Exception;
	/*관리자 상품 이미지 수정*/
	public String modProductInfo(@RequestBody ProductVO productVO, HttpServletRequest request, HttpServletResponse response)throws DataAccessException;
	
}
