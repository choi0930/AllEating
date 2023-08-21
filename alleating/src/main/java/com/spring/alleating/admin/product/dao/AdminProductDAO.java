package com.spring.alleating.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("adminProductDAO")
public interface AdminProductDAO {
	public int insertNewProduct(Map newProductMap)throws DataAccessException;
	public void insertProductImageFile(ProductImgVO productImgVO)throws DataAccessException;
	public List<ProductVO> selectProduct(Map dataMap)throws DataAccessException;
	public int selectTotalProduct(String join_type)throws DataAccessException;
	public ProductVO selectProductDetail(String productId)throws DataAccessException;
	public List<ProductImgVO> selectProductDetailImage(String productId)throws DataAccessException;
	public MemberVO selectMemberByRegId(String reg_id)throws DataAccessException;
	
}
