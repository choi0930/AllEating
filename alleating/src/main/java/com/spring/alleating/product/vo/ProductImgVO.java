package com.spring.alleating.product.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("productImgVO")
public class ProductImgVO {
	private int imgId;
	private int productId;
	private String fileName;
	private String fileType;
	private Date creDate;
	private String reg_id;
	
	 

	
	
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

}
