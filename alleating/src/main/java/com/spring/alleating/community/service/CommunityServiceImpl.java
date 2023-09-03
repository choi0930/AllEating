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
import com.spring.alleating.product.vo.ProductImgVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDAO communityDAO;
	@Autowired
	ReviewBoardVO reviewBoardVO;
	
	@Override
	public int insertReview(Map reviewInfo) throws Exception {
		
		communityDAO.insertReview(reviewInfo);
		 communityDAO.updateReviewStatus(reviewInfo);
		String _articleNO = (String) reviewInfo.get("articleNO");
		int articleNO = Integer.parseInt(_articleNO);
		return articleNO;
	}

	@Override
	public void updateReviewStatus(Map reviewUpMap) throws Exception {
	}

	@Override
	public List selectWrittenReview(Map _writtenReviewInfo) throws DataAccessException {
		List<ReviewBoardVO> reviewBoardVO = communityDAO.selectWrittenReview(_writtenReviewInfo);
		return reviewBoardVO;
	}

	 
    
}