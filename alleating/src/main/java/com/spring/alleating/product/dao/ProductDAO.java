package com.spring.alleating.product.dao;

import java.util.List;
import java.util.Map;

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
	
	public List<ProductVO> selectnewProductDetail(Map newproductid)throws DataAccessException; //신상품
	public int selectNewProductCount()throws DataAccessException; //신상품 수
	/* 검색 */
	public List<ProductVO> selectBySearchWord(Map product)throws DataAccessException;
	public int selectBySearchCount(String searchWord)throws DataAccessException;
	
	public List<ProductImgVO> selectnewProductDetailImage()throws DataAccessException;
	//카테고리 상품
	public List<ProductVO> selectCateProduct(Map aaaInfo)throws DataAccessException; 
    //카테고리 상품 count
	public int selectCateCount () throws DataAccessException;
	
	//할인 상품
	public List<ProductVO> selectSaleProduct(Map saleProductMap) throws DataAccessException;
	
	
}
