package com.spring.alleating.coupon.vo;

import org.springframework.stereotype.Component;

@Component("userCouponVO")
public class UserCouponVO {
	private String couponId;
	private String id;
	
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
