package com.spring.alleating.owner.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductVO;



public interface OwnerProductService {
	public int  addNewProduct(Map newProductMap) throws Exception;
	
	/*
	 * public Map productDetail(int productId) throws Exception; public List
	 * productImageFile(int productId) throws Exception;
	 */
	
	public List<ProductVO> ownerProductList() throws Exception;
	
	//public void addNewProductImg(List imageFileList) throws Exception;
	
	public void removeproduct(int productId) throws DataAccessException;
			
}
