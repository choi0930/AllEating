package com.spring.alleating.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.coupon.vo.UserCouponVO;
@Mapper
@Repository("couponDAO")
public interface CouponDAO {
	public List<UserCouponVO> selectUserCoupon(String id)throws DataAccessException;
	public List<CouponVO> selectAllCouponList()throws DataAccessException;
	public CouponVO selectPayToCoupon(Map dateMap)throws DataAccessException;
}

