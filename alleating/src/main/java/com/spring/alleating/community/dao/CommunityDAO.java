package com.spring.alleating.community.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.community.vo.ReviewBoardVO;



@Mapper
@Repository("communityDAO")
public interface CommunityDAO {
	
	public Map insertReview(ReviewBoardVO reviewBoardVO)throws DataAccessException;


}
