package com.spring.alleating.coupon.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

/* 쿠폰 정보 */
@Component("couponVO")
public class CouponVO {
	
	private String couponId;        //쿠폰 식별Id
	private String coupon_name;     //쿠폰 이름
	private String coupon_range;    //쿠폰 적용 카테고리
	private int couponDiscountRate; //쿠폰 할인 퍼센트
	private int coupon_quantity; //쿠폰 수량
	private Date beginDate;         //쿠폰 배포 beginDate
	private Date endDate;           //쿠폰 배포 endDate
	private Date coupon_startDate;  //쿠폰 시작일
	private Date coupon_endDate;    //쿠폰 만료일
	private String coupon_deleted;  //쿠폰 삭제여부
	
	

	public int getCoupon_quantity() {
		return coupon_quantity;
	}
	public void setCoupon_quantity(int coupon_quantity) {
		this.coupon_quantity = coupon_quantity;
	}
	public String getCoupon_deleted() {
		return coupon_deleted;
	}
	public void setCoupon_deleted(String coupon_deleted) {
		this.coupon_deleted = coupon_deleted;
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
