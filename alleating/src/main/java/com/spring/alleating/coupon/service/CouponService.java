package com.spring.alleating.coupon.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.coupon.vo.CouponVO;

public interface CouponService {
	public List<CouponVO> allcouponList()throws DataAccessException;
}
