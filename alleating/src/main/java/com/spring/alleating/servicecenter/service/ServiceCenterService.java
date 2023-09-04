package com.spring.alleating.servicecenter.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.servicecenter.vo.BoardVO;

public interface ServiceCenterService {
	/* 공지사항 목록 가져오기 */
	public Map<String, ?> boardList(Map<String, ?> dataMap)throws DataAccessException;

	
	//상품 문의 목록
	public List selectProductQnA(Map _productQnAInfo) throws DataAccessException;
}
