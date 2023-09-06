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
	/*상품 상세 보기*/
	public ProductVO selectProductDetail(String productId)throws DataAccessException;
	public List<ProductImgVO> selectProductDetailImage(String productId)throws DataAccessException;
	public MemberVO selectMemberByRegId(String reg_id)throws DataAccessException;
	
	public void updateProductStatus(ProductVO productVO)throws DataAccessException;
	/*관리자 상품 삭제*/
	public int delProduct(ProductVO productVO)throws DataAccessException;
	/*관리자 상품 이미지 수정*/
	public void updateProductImg(ProductImgVO productImgVO)throws DataAccessException;
	/*관리자 상품 이미지 삭제*/
	public void deleteProductImg(String imgId)throws DataAccessException;
	/*관리자 상품 정보 수정*/
	public void updateProductInfo(ProductVO productVO)throws DataAccessException;
}
