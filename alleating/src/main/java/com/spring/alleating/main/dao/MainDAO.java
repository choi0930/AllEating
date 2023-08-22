package com.spring.alleating.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("mainDAO")
public interface MainDAO {

	public List<ProductVO> selectMainProductDetail(Map differenceInfo)throws DataAccessException;
	public List<ProductImgVO> selectMainProductDetailImage()throws DataAccessException;
	
}
