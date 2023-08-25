package com.spring.alleating.owner.order.service;

import java.util.List;

import com.spring.alleating.order.vo.AllEatingOrderVO;




public interface OwnerOrderService {
	public List<AllEatingOrderVO> ownerOrderList() throws Exception;
}
