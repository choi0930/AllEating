package com.spring.alleating.point.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("userPointHistotyVO")
public class UserPointHistoryVO {
	private int pointNum;
	private String id;
	private String usePoint;
	private String content;
	private Date creDate;
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	
	
}
