package com.spring.alleating.coupon.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("userCouponVO")
public class UserCouponVO {
	private String couponId;
	private String id;
	
	//table join
	private String coupon_name;
	private String coupon_range;
	private int couponDiscountRate;
	private Date coupon_startDate;
	private Date coupon_endDate;
	private String cateGoryName;
	
	
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
	
	public int getCouponDiscountRate() {
		return couponDiscountRate;
	}
	public void setCouponDiscountRate(int couponDiscountRate) {
		this.couponDiscountRate = couponDiscountRate;
	}
	public Date getCoupon_startDate() {
		return coupon_startDate;
	}
	public void setCoupon_startDate(Date coupon_startDate) {
		this.coupon_startDate = coupon_startDate;
	}
	public Date getCoupon_endDate() {
		return coupon_endDate;
	}
	public void setCoupon_endDate(Date coupon_endDate) {
		this.coupon_endDate = coupon_endDate;
	}
	public String getCateGoryName() {
		return cateGoryName;
	}
	public void setCateGoryName(String cateGoryName) {
		this.cateGoryName = cateGoryName;
	}
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
