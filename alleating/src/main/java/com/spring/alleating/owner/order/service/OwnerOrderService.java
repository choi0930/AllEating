package com.spring.alleating.owner.order.service;

import java.util.List;

import com.spring.alleating.order.vo.OrderVO;


public interface OwnerOrderService {
	public List<OrderVO> ownerOrderList() throws Exception;
}
