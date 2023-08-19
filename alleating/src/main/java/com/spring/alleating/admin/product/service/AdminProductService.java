package com.spring.alleating.admin.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface AdminProductService {
	public Map selectAllProduct(Map info)throws DataAccessException;
	public int addProduct(Map productInfo)throws DataAccessException;
}
