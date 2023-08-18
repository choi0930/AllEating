package com.spring.alleating.product.vo;

import java.sql.Date;

public class ProductImgVO {
	private String imgId;
	private String productId;
	private String fileName;
	private String img_type;
	private Date creDate;
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getImg_type() {
		return img_type;
	}
	public void setImg_type(String img_type) {
		this.img_type = img_type;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

}
