package com.spring.alleating.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.dao.CouponDAO;
import com.spring.alleating.coupon.vo.CouponVO;
@Service("couponService")
public class CouponServiceImpl implements CouponService{
	
	@Autowired
	private CouponDAO couponDAO;
	
	@Override
	public List<CouponVO> allcouponList() throws DataAccessException {
		List<CouponVO> couponList = couponDAO.selectAllCouponList();
		return couponList;
	}

}
