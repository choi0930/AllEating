package com.spring.alleating.coupon.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class CouponVO {
	
	private String couponId;
	private String coupon_name;
	private String coupon_range;
	private Date beginDate;
	private Date endDate;
	
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_range() {
		return coupon_range;
	}
	public void setCoupon_range(String coupon_range) {
		this.coupon_range = coupon_range;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}
