package com.spring.alleating.admin.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;


public interface AdminProductService {
	public Map selectAllProduct(Map dataMap)throws DataAccessException;
	public Map selectAdminProduct(Map dataMap)throws DataAccessException;
	public int addProduct(Map productInfo)throws DataAccessException;
	public Map selectProductDetail(String productId)throws DataAccessException;
	public void modifyProductStatus(ProductVO productVO)throws DataAccessException;
	
	/*관리자 상품 삭제*/
	public int deleteAdminProduct(ProductVO productVO)throws DataAccessException;
	/*관리자 상품 이미지 수정*/
	public void modifyProductImage(List<ProductImgVO> imageFileList)throws DataAccessException;
	/*관리자 상품 이미지 삭제*/
	public void delProductImage(String imgId)throws DataAccessException;
	/*관리자 상품 정보 수정*/
	public void modProductInfo(ProductVO productVO)throws DataAccessException;
}
