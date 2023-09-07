package com.spring.alleating.community.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.community.vo.ReviewBoardVO;
import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.vo.ProductImgVO;



@Mapper
@Repository("communityDAO")
public interface CommunityDAO {
	
	//후기 등록
	public int insertReview(Map reviewMap)throws DataAccessException;
    //후기 등록시 상태 업데이트
    public void updateReviewStatus(Map reviewUpMap)throws DataAccessException;  //상품 후기 업데이트
    //작성한 후기들 목록
    public List<ReviewBoardVO> selectWrittenReview (Map writtenReviewInfo) throws DataAccessException; //작성한 후기 목록 select
    //사용자들 전체 후기 목록
    public List<ReviewBoardVO> selectAllReview (Map allReviewInfo) throws DataAccessException;
    public UserPointVO selectReward(Map userInfo) throws DataAccessException; //사용자 적립금 가져오기
	public void updateReward(Map userInfo)throws DataAccessException;
    
	public void insertRewardHistory(Map Info)throws DataAccessException;
    /*
	  
	 * DataAccessException; //구매후기 작성후 적립금 업데이트 public int updateReward (String
	 * id)throws DataAccessException; //구매후기 작성해서 받은 적립금 구매내역에 insert public int
	 * insertRewardHistory(Map addRewardMap)throws DataAccessException;
	 */
}
