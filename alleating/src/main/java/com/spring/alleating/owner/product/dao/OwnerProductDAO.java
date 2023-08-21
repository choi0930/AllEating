package com.spring.alleating.owner.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("ownerproductDAO")
public interface OwnerProductDAO {
	public int insertNewProduct(Map newProductMap) throws DataAccessException;
	public void insertProductImageFile(ProductImgVO productImgVO)  throws DataAccessException;
	/*
	 * public ProductVO selectProductDetail(int productId) throws
	 * DataAccessException; public List selectProductImageFileList(int productId)
	 * throws DataAccessException;
	 */
}
