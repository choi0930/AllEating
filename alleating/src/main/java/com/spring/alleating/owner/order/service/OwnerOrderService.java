package com.spring.alleating.owner.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;





public interface OwnerOrderService {
	
	public List listOwnerOrder() throws DataAccessException;
	
}
