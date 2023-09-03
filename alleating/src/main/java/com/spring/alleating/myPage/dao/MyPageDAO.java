package com.spring.alleating.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.WishVO;

@Mapper
@Repository("myPageDAO")
public interface MyPageDAO {
	/*마이페이지: 관리자가 등록한 쿠폰인지 확인*/
	public int findCoupon(String couponId)throws DataAccessException;
	/*마이페이지: 쿠폰 등록시 이미 등록한 쿠폰인지 확인*/
	public int findUserCoupon(UserCouponVO userCouponVO)throws DataAccessException;
	/*마이페이지: 쿠폰 추가하기*/
	public int insertUserCoupon(UserCouponVO userCouponVO)throws DataAccessException;
	/*수량 줄일 쿠폰 가져오기*/
	public CouponVO selectCoupon(String couponId)throws DataAccessException;
	/*쿠폰 수량 줄이기*/
	public void updateCouponQuantity(CouponVO couponVO)throws DataAccessException;
	/*마이페이지: 쿠폰 목록 불러오기*/
	public List<UserCouponVO>selectUserCoupon(String id)throws DataAccessException;
	/*마이페이지: 배송지 목록 불러오기*/
	public List<DeliveryAddressVO>selectAllDeliveryAddress(Map dataMap)throws DataAccessException;
	/*마이페이지: 배송지 추가*/
	public int insertDeilveryAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
	/*마이페이지: 배송지 삭제*/
	public int deleteDeilveryAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
	/*마이페이지: 기본 배송지 검색*/
	public DeliveryAddressVO selectDefaultAddress(String id)throws DataAccessException;
	/*마이페이지: 기본 배송지 변경*/
	public int updateDefaultAddress(Map deliveryInfo)throws DataAccessException;
    //마이페이지-찜목록
	public List<WishVO> selectWishList(Map wishMap) throws DataAccessException;
	//마이페이지-찜하기
	public int insertWish(WishVO wishVO) throws DataAccessException;
	//마이페이지 찜 업데이트
	public int updateWish(WishVO wishVO) throws DataAccessException;
	//마이페이지-찜 삭제
	public int deleteWish(WishVO wishVO ) throws DataAccessException;
	//마이페이지-관리자나 사업자가 상품 삭제 시 그 상품에 대한 찜 전체 삭제
    public int deleteAllWish(WishVO wishVO) throws DataAccessException;


}
