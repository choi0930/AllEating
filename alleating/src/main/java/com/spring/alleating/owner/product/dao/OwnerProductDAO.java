package com.spring.alleating.owner.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("ownerProductDAO")
public interface OwnerProductDAO {
	public int insertNewProduct(Map newProductMap) throws DataAccessException;
	public void insertProductImageFile(ProductImgVO productImgVO)  throws DataAccessException;
	/*
	 * public ProductVO selectProductDetail(int productId) throws
	 * DataAccessException; public List selectProductImageFileList(int productId)
	 * throws DataAccessException;
	 */
	public List<ProductVO> selectAllOwnerProductList() throws Exception;
	
	public void deleteproduct(int productIdMap)throws DataAccessException;
	
	public void updateproduct(Map goodsMap) throws DataAccessException;
	public void updateproductimg(ProductImgVO productImageVO) throws DataAccessException;
	
	public ProductVO productEditdata(int productId) throws DataAccessException;
	public List productEditdataImg(int productId) throws DataAccessException; 
	
	/* 사업자 상품문의 게시판 (미완) */
	public List selectAllArticlesList() throws DataAccessException;
}

  