package com.spring.alleating.servicecenter.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("boardVO")
public class BoardVO {
	private String articleNO;
	private String parentNO;
	private String id;
	private String title;
	private String content;
	private Date writeDate;
	
	
	public String getParentNO() {
		return parentNO;
	}
	public void setParentNO(String parentNO) {
		this.parentNO = parentNO;
	}
	public String getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(String articleNO) {
		this.articleNO = articleNO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
