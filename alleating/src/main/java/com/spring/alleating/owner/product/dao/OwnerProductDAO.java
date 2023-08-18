package com.spring.alleating.owner.product.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("ownerproductDAO")
public interface OwnerProductDAO {
	public void insertProduct(Map productInfo)throws DataAccessException;
	public int selectByproductId(String productId)throws DataAccessException;
}
