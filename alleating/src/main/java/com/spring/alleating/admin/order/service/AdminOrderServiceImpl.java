package com.spring.alleating.admin.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.order.dao.AdminOrderDAO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{
	
	@Autowired
	private AdminOrderDAO adminOrderDAO;
	
	@Override
	public Map<String, Object> adminOrderList(Map dataMap) throws DataAccessException {
		Map<String, Object> orderMap = new HashMap<>();
		
		List<AllEatingOrderVO> orderList = adminOrderDAO.selectAdminOrder();
		orderMap.put("orderList", orderList);
		return orderMap;
	}

}
