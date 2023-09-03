package com.spring.alleating.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.WishVO;

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
   //마이페이지 찜목록
	public List selectWishList(Map _wishMap) throws DataAccessException;
	//마이페이지 찜목록 추가
	public int insertWish(WishVO wishVO) throws DataAccessException;
	//마이페이지 찜 업데이트
	public void updateWish(WishVO wishVO) throws DataAccessException;
	//마이페이지 찜목록 삭제
	public int deleteWish(WishVO wishVO) throws DataAccessException;
	//마이페이지 - 관리자나 사업자가 상품 삭제 시 그 상품 찜 전체 삭제
	public int deleteAllWish(WishVO wishVO) throws DataAccessException;
}
