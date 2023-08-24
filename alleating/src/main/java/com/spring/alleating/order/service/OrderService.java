package com.spring.alleating.order.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.product.vo.ProductVO;

public interface OrderService {
	public ProductVO oneProductOrder(Map orderMap)throws DataAccessException;
}
