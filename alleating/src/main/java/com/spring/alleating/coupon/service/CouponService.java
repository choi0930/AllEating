package com.spring.alleating.coupon.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.coupon.vo.CouponVO;

public interface CouponService {
	public List<CouponVO> allcouponList()throws DataAccessException;
	/* 결제시 사용가능한 쿠폰 가져옴 */
	public Map payCouponList(Map dataMap)throws DataAccessException;
}
