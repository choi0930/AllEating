package com.spring.alleating.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;

public interface MyPageService {
	/*마이페이지: 쿠폰 등록*/
	public int addUserCoupon(UserCouponVO userCouponVO)throws DataAccessException;
	/*마이페이지: 쿠폰 목록*/
	public List<UserCouponVO> listCoupon(String id)throws DataAccessException;
	/*마이페이지: 배송지관리 목록*/
	public List<DeliveryAddressVO> listAddress(Map dataMap)throws DataAccessException;
	/*마이페이지: 배송지 추가*/
	public int addDeliveryAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
	/*마이페이지: 배송지 삭제*/
	public int deleteAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
	/*마이페이지: 기본 배송지 변경*/
	public int changeDefaultAddress(DeliveryAddressVO deliveryAddressVO)throws DataAccessException;
}
