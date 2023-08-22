package com.spring.alleating.admin.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface AdminProductService {
	public Map selectAllProduct(Map dataMap)throws DataAccessException;
	public Map selectAdminProduct(Map dataMap)throws DataAccessException;
	public int addProduct(Map productInfo)throws DataAccessException;
	public Map selectProductDetail(String productId)throws DataAccessException;
}
