package com.spring.alleating.community.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.community.vo.ReviewBoardVO;

public interface CommunityService {
    //사용자 후기 등록
	public int insertReview(Map reviewMap) throws Exception;
	//후기 쓰면 리뷰 유무 상태 업데이트 
	public void updateReviewStatus(Map reviewUpMap)throws Exception; 
	//사용자가 작성한 후기 목록
	public List selectWrittenReview(Map _writtenReviewInfo) throws DataAccessException; //마이페이지 작성가능한후기 조회
	//사용자들 후기 목록
	 public List selectAllReview(Map _allReviewInfo)throws DataAccessException;



}
