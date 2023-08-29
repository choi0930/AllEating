package com.spring.alleating.myPage.vo;

import org.springframework.stereotype.Repository;

@Repository("deliveryAddressVO")
public class DeliveryAddressVO {
	private String num;
	private String id;
	private String deliveryName;
	private String receiver_name;
	private String receiver_hp1;
	private String receiver_hp2;
	private String receiver_hp3;
	private String zipcode;
	private String address;
	private String address2;
	private String address_detail;
	private String default_address;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_hp1() {
		return receiver_hp1;
	}
	public void setReceiver_hp1(String receiver_hp1) {
		this.receiver_hp1 = receiver_hp1;
	}
	public String getReceiver_hp2() {
		return receiver_hp2;
	}
	public void setReceiver_hp2(String receiver_hp2) {
		this.receiver_hp2 = receiver_hp2;
	}
	public String getReceiver_hp3() {
		return receiver_hp3;
	}
	public void setReceiver_hp3(String receiver_hp3) {
		this.receiver_hp3 = receiver_hp3;
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
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getDefault_address() {
		return default_address;
	}
	public void setDefault_address(String default_address) {
		this.default_address = default_address;
	}
	
	
	
}
