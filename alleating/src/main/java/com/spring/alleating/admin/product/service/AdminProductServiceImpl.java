package com.spring.alleating.admin.product.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.product.vo.ProductVO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

	@Override
	public Map selectAllProduct(Map info) throws DataAccessException {
		
		return null;
	}

	@Override
	public int addProduct(Map productInfo) throws DataAccessException {
		
		return 0;
	}
	
	
}
