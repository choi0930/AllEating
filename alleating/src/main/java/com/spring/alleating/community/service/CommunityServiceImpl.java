package com.spring.alleating.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.community.dao.CommunityDAO;
import com.spring.alleating.community.vo.reviewBoardVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.product.vo.ProductImgVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDAO communityDAO;
	@Autowired
	private MemberVO memberVO;
	
	

	@Override
	public int addReview(Map reviewInfo) throws Exception {
		
		
	String id = memberVO.getId();
		reviewInfo.put("id", id);
		
		
		communityDAO.insertReview(reviewInfo);
		String _produtId = (String) reviewInfo.get("productId");
		int productId = Integer.parseInt(_produtId);
		
		ArrayList<ProductImgVO> reviewImgList = (ArrayList) reviewInfo.get("reviewImgList");
		for(ProductImgVO productImgVO : reviewImgList) {
			productImgVO.setProductId(productId);
			communityDAO.insertReviewImg(productImgVO);
		}
		return productId;
	}
	
	

}
