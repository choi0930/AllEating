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
		
		List<AllEatingOrderVO> orderList = adminOrderDAO.selectAdminOrder(dataMap);
		int total = adminOrderDAO.adminOrderCount();
		orderMap.put("orderList", orderList);
		orderMap.put("total", total);
		return orderMap;
	}
	
	/*관리자페이지: 사업자 주문정보 가져오기*/
	@Override
	public Map<String, Object> ownerOrderList(Map dataMap) throws DataAccessException {
		Map<String, Object> orderMap = new HashMap<>();
		//사업자 상품 주문정보
		List<AllEatingOrderVO> orderList = adminOrderDAO.selectOwnerOrder(dataMap);
		System.out.println(orderList.size());
		//사업자 상품 주문정보 수
		int total = adminOrderDAO.ownerOrderCount();
		
		orderMap.put("orderList", orderList);
		orderMap.put("total", total);
		
		return orderMap;
	}
	
}
