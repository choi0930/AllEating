package com.spring.alleating.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductVO;

public interface ProductService {
	/* 상품 상세페이지 */
	public Map selectUserProductDetail(int productId)throws DataAccessException;
	

	public Map selectnewProductDetail(Map newproductid)throws DataAccessException;

	/* 카테고리 조회 */
	public List selectCateProduct(Map bbbInfo)throws DataAccessException;
	/* 헤더 검색바 검색기능 */
	public Map<String,Object> searchProduct(Map dataMap)throws DataAccessException;
	
	public int selectCateCount () throws DataAccessException;
	
	/* 할인상품 목록 */
	public Map selectSaleProduct(Map saleProductMap) throws DataAccessException;
	
}
