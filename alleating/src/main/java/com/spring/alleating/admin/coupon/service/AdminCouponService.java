package com.spring.alleating.admin.coupon.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.coupon.vo.CouponVO;

public interface AdminCouponService {
	/*관리자 페이지 쿠폰 리스트 가져옴*/
	public Map couponList(Map couponMap)throws DataAccessException;
	/*관리자 페이지 쿠폰 추가*/
	public int addCoupon(CouponVO couponVO)throws DataAccessException;
	/* 쿠폰 수정을 위한 쿠폰id로 정보 불러오기 */	
	public CouponVO couponFindByCouponId(String couponId)throws DataAccessException;
	/*관리자 페이지 쿠폰 정보 삭제 처리*/
	public int delCouponInfo(Map couponInfo)throws DataAccessException;
	/*관리자 페이지 쿠폰 정보 수정*/
	public int modfiyCouponInfo(CouponVO couponVO)throws DataAccessException;
}
