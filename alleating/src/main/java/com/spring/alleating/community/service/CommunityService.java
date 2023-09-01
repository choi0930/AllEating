package com.spring.alleating.community.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.community.vo.ReviewBoardVO;

public interface CommunityService {

	public int insertReview(Map reviewMap) throws Exception;
	 public void updateReviewStatus(Map reviewUpMap)throws Exception; 
	 public List selectWrittenReview(Map _writtenReviewInfo) throws DataAccessException; //마이페이지 작성가능한후기 조회



}
