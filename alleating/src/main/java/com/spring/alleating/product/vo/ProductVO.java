package com.spring.alleating.product.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {

	
	private int productId;
	private String deliveryType;
	private int deliveryPrice;
	private String cateCode;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int productSalesPrice;
	private String productUnit;
	private String productPackType;
	private String productWeight;
	private String productOrigin;
	private int productTotal;
	private String productExpireDate;
	private String productStatus;
	private String productBrand;
	private String productContentTitle;
	private String productContent;
	private Date creDate;
    private String reg_id;
    private String join_type;
    
    
	
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getJoin_type() {
		return join_type;
	}
	public void setJoin_type(String join_type) {
		this.join_type = join_type;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
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
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public int getProductSalesPrice() {
		return productSalesPrice;
	}
	public void setProductSalesPrice(int productSalesPrice) {
		this.productSalesPrice = productSalesPrice;
	}
	public String getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	public String getProductPackType() {
		return productPackType;
	}
	public void setProductPackType(String productPackType) {
		this.productPackType = productPackType;
	}
	public String getProductWeight() {
		return productWeight;
	}
	public void setProductWeight(String productWeight) {
		this.productWeight = productWeight;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public int getProductTotal() {
		return productTotal;
	}
	public void setProductTotal(int productTotal) {
		this.productTotal = productTotal;
	}
	public String getProductExpireDate() {
		return productExpireDate;
	}
	public void setProductExpireDate(String productExpireDate) {
		this.productExpireDate = productExpireDate;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductContentTitle() {
		return productContentTitle;
	}
	public void setProductContentTitle(String productContentTitle) {
		this.productContentTitle = productContentTitle;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	
}

