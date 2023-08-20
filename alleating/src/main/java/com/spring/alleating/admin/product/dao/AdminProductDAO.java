package com.spring.alleating.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.product.vo.ProductImgVO;

@Mapper
@Repository("adminProductDAO")
public interface AdminProductDAO {
	public int insertNewProduct(Map newProductMap)throws DataAccessException;
	public void insertProductImageFile(ProductImgVO productImgVO)throws DataAccessException;
}
