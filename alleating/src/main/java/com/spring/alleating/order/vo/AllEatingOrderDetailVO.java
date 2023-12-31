package com.spring.alleating.order.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.alleating.coupon.vo.CouponVO;

@Component("allEatingOrderDetailVO")
public class AllEatingOrderDetailVO {
	private int order_seq_num;
	private String orderId;
	private int productId;
	private int productPrice;
	private int productDiscount;
	private int productQty;
	private String cateCode;
	private String deliveryType;
	private String delivery_status;
	private String review_ny; //리뷰 유무
	
	private String productName;
	private String fileName;
	private String productBrand;
	
	//결제시 카테고리 범위에 맞는 쿠폰리스트 가져옴
	private List<CouponVO> couponsList;
	
	

	public String getReview_ny() {
		return review_ny;
	}
	public void setReview_ny(String review_ny) {
		this.review_ny = review_ny;
	}
	public List<CouponVO> getCouponList() {
		return couponsList;
	}
	public void setCouponList(List<CouponVO> couponList) {
		this.couponsList = couponList;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getOrder_seq_num() {
		return order_seq_num;
	}
	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	
	
	
	
}
