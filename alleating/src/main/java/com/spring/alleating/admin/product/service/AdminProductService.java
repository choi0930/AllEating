package com.spring.alleating.admin.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductVO;


public interface AdminProductService {
	public Map selectAllProduct(Map dataMap)throws DataAccessException;
	public Map selectAdminProduct(Map dataMap)throws DataAccessException;
	public int addProduct(Map productInfo)throws DataAccessException;
	public Map selectProductDetail(String productId)throws DataAccessException;
	public void modifyProductStatus(ProductVO productVO)throws DataAccessException;
}
