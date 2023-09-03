package com.spring.alleating.servicecenter.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.servicecenter.dao.ServiceCenterDAO;
import com.spring.alleating.servicecenter.vo.BoardVO;

@Service("serviceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	
	/* 공지사항 목록 가져오기 */
	@Override
	public Map<String, ?> boardList(Map<String, ?> dataMap) throws DataAccessException {
		
		return null;
	}
	
	/* 공지사항 작성 */
	@Override
	public int addBoard(BoardVO boardVO) throws DataAccessException {
		
		return 0;
	}
	
	/* 공지사항 수정 */
	@Override
	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		
		return 0;
	}
	
	/* 공지사항 삭제 */
	@Override
	public int deleteBoard(String articleNO) throws DataAccessException {
		
		return 0;
	}

}
