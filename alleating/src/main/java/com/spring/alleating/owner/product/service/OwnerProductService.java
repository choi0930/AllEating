package com.spring.alleating.owner.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;

public interface OwnerProductService {
	public int addNewProduct(Map newProductMap) throws Exception;

	/*
	 * public Map productDetail(int productId) throws Exception; public List
	 * productImageFile(int productId) throws Exception;
	 */

	public List<ProductVO> ownerProductList() throws Exception;

	// public void addNewProductImg(List imageFileList) throws Exception;

	public void removeproduct(int productId) throws DataAccessException;

	
//	  public void modifyproduct(Map goodsMap) throws Exception; 
		/*
		 * public void modifyproductImg(List<ProductImgVO> imageFileList) throws
		 * Exception;
		 */
	  
	  public Map productEditService(int EService) throws Exception;
	  
		/* 사업자 상품문의 게시판(미완) */
	  public List<InquiryBoardVO> listArticles() throws Exception; 
	  	  
//	  public int addNewArticle(Map articleMap) throws Exception;
	  
	  public InquiryBoardVO viewArticle(int articleNO) throws Exception;
	  
	  public int addReplyArticle(Map replyMap) throws Exception;
	  

	  /*사업자 상품 이미지 수정*/
		public void modifyProductImage(List<ProductImgVO> imageFileList)throws DataAccessException;
		/*사업자 상품 이미지 삭제*/
		public void delProductImage(String imgId)throws DataAccessException;
		/*사업자 상품 정보 수정*/
		public void modProductInfo(ProductVO productVO)throws DataAccessException;

	  public void removeArticle(int articleNO) throws Exception;
	  
	  public int modArticle(Map<String, String> articleMap) throws DataAccessException;



}
