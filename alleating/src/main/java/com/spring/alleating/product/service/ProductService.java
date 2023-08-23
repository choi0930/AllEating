package com.spring.alleating.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductVO;

public interface ProductService {
	public Map selectUserProductDetail(int productId)throws DataAccessException;
	
	public Map selectnewProductDetail(Map newproductid)throws DataAccessException;
}
