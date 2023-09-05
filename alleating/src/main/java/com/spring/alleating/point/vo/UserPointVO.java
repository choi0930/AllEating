package com.spring.alleating.point.vo;

import org.springframework.stereotype.Component;

@Component("userPointVO")
public class UserPointVO {
	private String id;
	private int userPoint;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	
	
}
