package com.spring.alleating.admin.servicecenter.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.servicecenter.dao.AdminServiceCenterDAO;
import com.spring.alleating.servicecenter.vo.BoardVO;
@Service("adminServiceCenterService")
public class AdminServiceCenterServiceImpl implements AdminServiceCenterService{
	
	@Autowired
	private AdminServiceCenterDAO adminServiceCenterDAO;
	
	@Override
	public Map<String, ?> boardList(Map<String, ?> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addBoard(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(String articleNO) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

}
