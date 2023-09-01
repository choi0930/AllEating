package com.spring.alleating.owner.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;





public interface OwnerOrderService {
	
	public List listOwnerOrder() throws DataAccessException;
	
	public Map OnwerOrderHistoryDetail (String orderId)throws DataAccessException; //주문내역 상세 정보들
	
	public void updateOwnerDelivery(Map odinfo) throws DataAccessException;
}
