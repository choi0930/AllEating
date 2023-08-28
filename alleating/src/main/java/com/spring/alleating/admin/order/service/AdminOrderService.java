package com.spring.alleating.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.order.vo.AllEatingOrderVO;

public interface AdminOrderService {
	public Map<String, Object> adminOrderList(Map dataMap)throws DataAccessException;
}
