package com.spring.alleating.myPage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("wishVO")
public class WishVO {
private int wishId;
private String id;
private int productId;
private Date wish_date;
private String wish_ny;

//wish product inner join
private String fileName;
private String cateCode;
private String productBrand;
private String productName;
private int productPrice;





public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getCateCode() {
	return cateCode;
}
public void setCateCode(String cateCode) {
	this.cateCode = cateCode;
}
public String getProductBrand() {
	return productBrand;
}
public void setProductBrand(String productBrand) {
	this.productBrand = productBrand;
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
public String getWish_ny() {
	return wish_ny;
}
public void setWish_ny(String wish_ny) {
	this.wish_ny = wish_ny;
}
public int getWishId() {
	return wishId;
}
public void setWishId(int wishId) {
	this.wishId = wishId;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getProductId() {
	return productId;
}
public void setProductId(int productId) {
	this.productId = productId;
}
public Date getWish_date() {
	return wish_date;
}
public void setWish_date(Date wish_date) {
	this.wish_date = wish_date;
}



}

