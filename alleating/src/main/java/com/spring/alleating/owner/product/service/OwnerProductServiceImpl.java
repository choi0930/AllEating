package com.spring.alleating.owner.product.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.owner.product.dao.OwnerProductDAO;

@Service("ownerProductService")
public class OwnerProductServiceImpl implements OwnerProductService {

	@Autowired
	private OwnerProductDAO ownerProductDAO;

	

	public int selectByproductId(String productId) throws DataAccessException {
		int result = ownerProductDAO.selectByproductId(productId);
		return result;
	}



	
	@Override
	public int addProduct(Map productMap) throws Exception {
		
		double num = Math.random();
		int productId = (int)(num * 899999);
		
		
		ownerProductDAO.insertProduct(productMap);
	
		
		return productId;
	}
	
	




		
	}



	

