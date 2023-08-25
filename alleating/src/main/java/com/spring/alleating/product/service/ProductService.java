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

}
