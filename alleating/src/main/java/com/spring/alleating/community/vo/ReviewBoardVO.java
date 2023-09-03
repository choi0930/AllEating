package com.spring.alleating.community.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.spring.alleating.product.vo.ProductImgVO;

@Component("reviewBoardVO")
public class ReviewBoardVO {
private int articleNO;
private String id;
private int productId;
private String productBrand;
private String productName;
private String  fileName;

private String content;
private String writeDate;

private int productPrice;
private int productQty;
private String delivery_status;


private String cateCode; //작성한 후기 inner join



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
public String getDelivery_status() {
	return delivery_status;
}
public void setDelivery_status(String delivery_status) {
	this.delivery_status = delivery_status;
}
public int getArticleNO() {
	return articleNO;
}
public void setArticleNO(int articleNO) {
	this.articleNO = articleNO;
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
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getWriteDate() {
	return writeDate;
}
public void setWriteDate(String writeDate) {
	this.writeDate = writeDate;
}




}
