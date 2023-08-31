package com.spring.alleating.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.order.vo.AllEatingOrderVO;

public interface AdminOrderService {
	public Map<String, Object> adminOrderList(Map dataMap)throws DataAccessException;
	/*관리자페이지: 사업자 주문정보 가져오기*/
	public Map<String, Object> ownerOrderList(Map dataMap)throws DataAccessException;
}
