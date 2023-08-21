package com.spring.alleating.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("mainDAO")
public interface MainDAO {

	public ProductVO selectMainProductDetail(String productId)throws DataAccessException;
	public List<ProductImgVO> selectMainProductDetailImage(String productId)throws DataAccessException;
	
}
