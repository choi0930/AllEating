package com.spring.alleating.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.order.vo.AllEatingOrderVO;



public interface OrderService {
	/*寃곗젣�뿉 �븘�슂�븳 �쑀�� �쟻由쎄툑 荑좏룿 議고쉶*/
	public Map userInfoToPay(Map info)throws DataAccessException;
	
	public String pay(Map userOrder)throws DataAccessException;
	
	public Map selectOrderNum (String orderId) throws DataAccessException; //주문 완료
	
	public List selectOrderHistory (Map fffInfo) throws DataAccessException; //주문 내역
	
	public Map OrderHistoryDetail (String orderId)throws DataAccessException; //주문내역 상세 정보들
	
	
}
