package com.spring.alleating.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {

	private int order_seq_num;
	private String orderId;
	private String deliveryType;
	private String delivery_request;
	private String delivery_status;
	private int productId;
	private String productName;
	private int productPrice;
	private int productQty;
	private int deliveryPrice;
	private int userPoint;
	private String couponId;
	private int totalPrice;
	private String product_pack_type;
	private String id;
	private String orderName;
	private String orderHp;
	private String orderEmail;
	private String receiverName;
	private String receiverHp1;
	private String receiverHp2;
	private String receiverHp3;
	private String zipcode;
	private String address;
	private String address2;
	private String addressDetail;
	private String card_com_name;
	private String card_pay_month;
	private Date payDate;
	private String thunderDate;
	private String thunderTime;
	private String shopping_ordercol;
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
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public String getDelivery_request() {
		return delivery_request;
	}
	public void setDelivery_request(String delivery_request) {
		this.delivery_request = delivery_request;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getProduct_pack_type() {
		return product_pack_type;
	}
	public void setProduct_pack_type(String product_pack_type) {
		this.product_pack_type = product_pack_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderHp() {
		return orderHp;
	}
	public void setOrderHp(String orderHp) {
		this.orderHp = orderHp;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverHp1() {
		return receiverHp1;
	}
	public void setReceiverHp1(String receiverHp1) {
		this.receiverHp1 = receiverHp1;
	}
	public String getReceiverHp2() {
		return receiverHp2;
	}
	public void setReceiverHp2(String receiverHp2) {
		this.receiverHp2 = receiverHp2;
	}
	public String getReceiverHp3() {
		return receiverHp3;
	}
	public void setReceiverHp3(String receiverHp3) {
		this.receiverHp3 = receiverHp3;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getCard_com_name() {
		return card_com_name;
	}
	public void setCard_com_name(String card_com_name) {
		this.card_com_name = card_com_name;
	}
	public String getCard_pay_month() {
		return card_pay_month;
	}
	public void setCard_pay_month(String card_pay_month) {
		this.card_pay_month = card_pay_month;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getThunderDate() {
		return thunderDate;
	}
	public void setThunderDate(String thunderDate) {
		this.thunderDate = thunderDate;
	}
	public String getThunderTime() {
		return thunderTime;
	}
	public void setThunderTime(String thunderTime) {
		this.thunderTime = thunderTime;
	}
	public String getShopping_ordercol() {
		return shopping_ordercol;
	}
	public void setShopping_ordercol(String shopping_ordercol) {
		this.shopping_ordercol = shopping_ordercol;
	}
	
	
}
