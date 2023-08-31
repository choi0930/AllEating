package com.spring.alleating.community.service;


import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.community.vo.ReviewBoardVO;

public interface CommunityService {

	void insertReview(Map<String, Object> reviewMap);

	/* public Map insertReview(ReviewBoardVO reviewBoardVO) throws Exception; */

}
