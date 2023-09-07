package com.spring.alleating.community.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.community.vo.ReviewBoardVO;
import com.spring.alleating.point.vo.UserPointVO;

public interface CommunityService {
    //사용자 후기 등록
	public int insertReview(Map reviewMap) throws Exception;
	/* 후기 삭제 */
	public int deleteReward(int articleNO)throws DataAccessException;
	//후기 쓰면 리뷰 유무 상태 업데이트 
	public void updateReviewStatus(Map reviewUpMap)throws Exception; 
	//사용자가 작성한 후기 목록
	public List selectWrittenReview(Map _writtenReviewInfo) throws DataAccessException; //마이페이지 작성가능한후기 조회
	//사용자들 후기 목록
	 public List selectAllReview(Map _allReviewInfo)throws DataAccessException;
	 
		/*
		 * //적립금 select public List<UserPointVO> selectReward() throws
		 * DataAccessException; //구매후기 작성후 적립금 업데이트 public int updateReward (String
		 * id)throws DataAccessException; //구매후기 작성해서 받은 적립금 구매내역에 insert public int
		 * insertRewardHistory(Map addRewardMap)throws DataAccessException;
		 */


}
