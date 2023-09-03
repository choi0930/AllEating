package com.spring.alleating.servicecenter.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("inqueryBoardVO")
public class inqueryBoardVO {
	private String articleNO;
	private String parentNO;
	private String id;
	private String board_status;
	private String title;
	private String content;
	
	
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
	private Date writeDate;
}
