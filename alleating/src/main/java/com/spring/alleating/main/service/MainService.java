package com.spring.alleating.main.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MainService {
	public Map selectMainProductDetail(String productId)throws DataAccessException;
}
