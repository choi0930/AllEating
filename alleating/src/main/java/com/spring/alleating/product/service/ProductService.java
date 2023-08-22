package com.spring.alleating.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ProductService {
	public Map selectUserProductDetail(String productId)throws DataAccessException;
}
