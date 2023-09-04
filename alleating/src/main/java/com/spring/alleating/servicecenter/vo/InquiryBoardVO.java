package com.spring.alleating.servicecenter.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("inquiryBoardVO")
public class InquiryBoardVO {
	private int level;
	private String articleNO;
	private String parentNO;
	private String id;

	private int productId;

	private String board_status;
	private String title;
	private String content;
	private Date writeDate;

	private String fileName;
	private String cateCode;
	private String productBrand;
	private String productName;
	
	
	
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

	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	public String getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(String articleNO) {
		this.articleNO = articleNO;
	}
	public String getParentNO() {
		return parentNO;
	}
	public void setParentNO(String parentNO) {
		this.parentNO = parentNO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard_status() {
		return board_status;
	}
	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
}
