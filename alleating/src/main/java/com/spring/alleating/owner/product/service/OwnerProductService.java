package com.spring.alleating.owner.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;



public interface OwnerProductService {
	public int addProduct(Map productMap) throws Exception;
	public int selectByproductId(String productId)throws DataAccessException;
	
}
