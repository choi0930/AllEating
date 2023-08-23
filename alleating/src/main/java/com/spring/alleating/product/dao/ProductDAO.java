package com.spring.alleating.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Mapper
@Repository("productDAO")
public interface ProductDAO {
	public ProductVO selectUserProductDetail(int productId)throws DataAccessException;
	public List<ProductImgVO> selectUserProductDetailImage(int productId)throws DataAccessException;
	public MemberVO selectUserByRegId(String reg_id)throws DataAccessException;
	public ProductVO selectUserBycateCode (String cateCode) throws DataAccessException;
}
