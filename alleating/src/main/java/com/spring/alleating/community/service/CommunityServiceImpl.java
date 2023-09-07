package com.spring.alleating.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.community.dao.CommunityDAO;
import com.spring.alleating.community.vo.ReviewBoardVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.vo.ProductImgVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDAO communityDAO;
	@Autowired
	ReviewBoardVO reviewBoardVO;
	@Autowired
	UserPointVO userPointVO;
	
	@Override
	public int insertReview(Map reviewInfo) throws Exception {
		String id = (String) reviewInfo.get("id");
		communityDAO.insertReview(reviewInfo);
		 communityDAO.updateReviewStatus(reviewInfo);
		int articleNO = (int) reviewInfo.get("articleNO");
//		int articleNO = Integer.parseInt(_articleNO);
		
		Map pointInfo = new HashMap<>();
		pointInfo.put("id", id);
		UserPointVO userPointVO = communityDAO.selectReward(pointInfo);
		int point = userPointVO.getUserPoint();
		int _point = point+1000;
		
		communityDAO.updateReward(pointInfo);//포인트 적립
		
		String pointHistory = "+1000";
		String content="후기작성 포인트 적립";
		pointInfo.put("usePoint", pointHistory);
		pointInfo.put("content", content);
		
		communityDAO.insertRewardHistory(pointInfo); //포인트 적립 내역 
		
		
	
		return articleNO;
	}
	
	//후기 삭제
	@Override
	public int deleteReward(int articleNO) throws DataAccessException {
		return 	communityDAO.deleteReward(articleNO);
	}

	@Override
	public void updateReviewStatus(Map reviewUpMap) throws Exception {
	}

	@Override
	public List selectWrittenReview(Map _writtenReviewInfo) throws DataAccessException {
		List<ReviewBoardVO> reviewBoardVO = communityDAO.selectWrittenReview(_writtenReviewInfo);
		return reviewBoardVO;
	}

	@Override
	public List selectAllReview(Map _allReviewInfo) throws DataAccessException {
		List<ReviewBoardVO> allReviewBoardVO = communityDAO.selectAllReview(_allReviewInfo);
		return allReviewBoardVO;
	}

	
	
	/////////////////////////////////리뷰 작성 관련 포인트/////////////////////////////
	
	 
	
    
}