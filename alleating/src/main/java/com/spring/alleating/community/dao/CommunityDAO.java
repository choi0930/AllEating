package com.spring.alleating.community.dao;



import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.spring.alleating.product.vo.ProductImgVO;


@Mapper
@Repository("communityDAO")
public interface CommunityDAO {
	
	public int insertReview(Map newReviewMap)throws DataAccessException;
	public void insertReviewImg(ProductImgVO productImgVO) throws DataAccessException;

}
