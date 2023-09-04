package com.spring.alleating.servicecenter.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.servicecenter.dao.ServiceCenterDAO;
import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InqueryBoardVO;

@Service("serviceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	
	/* 공지사항 목록 가져오기 */
	@Override
	public Map<String, ?> boardList(Map<String, ?> dataMap) throws DataAccessException {
		
		return null;
	}

	
	
	//상품 문의 목록
	@Override
	public List selectProductQnA(Map _productQnAInfo) throws DataAccessException {
		List<InqueryBoardVO> inqueryBoardVO = serviceCenterDAO.selectProductQnA(_productQnAInfo);
		return inqueryBoardVO;
	}

}
