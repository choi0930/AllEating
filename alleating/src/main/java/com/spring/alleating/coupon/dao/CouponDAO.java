package com.spring.alleating.coupon.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.coupon.vo.UserCouponVO;
@Mapper
@Repository("couponDAO")
public interface CouponDAO {
	public UserCouponVO selectUserCoupon(String id)throws DataAccessException;
}
