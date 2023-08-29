package com.spring.alleating.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;

@Mapper
@Repository("myPageDAO")
public interface MyPageDAO {
	/*마이페이지: 관리자가 등록한 쿠폰인지 확인*/
	public int findCoupon(String couponId)throws DataAccessException;
	/*마이페이지: 쿠폰 등록시 이미 등록한 쿠폰인지 확인*/
	public int findUserCoupon(UserCouponVO userCouponVO)throws DataAccessException;
	/*마이페이지: 쿠폰 추가하기*/
	public int insertUserCoupon(UserCouponVO userCouponVO)throws DataAccessException;
	/*마이페이지: 쿠폰 목록 불러오기*/
	public List<UserCouponVO>selectUserCoupon(String id)throws DataAccessException;
	/*마이페이지: 배송지 목록 불러오기*/
	public List<DeliveryAddressVO>selectAllDeliveryAddress(Map dataMap)throws DataAccessException;
	/*마이페이지: 배송지 추가*/
	public int insertDeilveryAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
}
