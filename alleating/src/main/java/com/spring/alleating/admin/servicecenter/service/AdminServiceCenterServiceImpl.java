package com.spring.alleating.admin.servicecenter.service;

import java.util.HashMap;
import java.util.List;
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
	public Map<String, Object> boardList(Map<String, Object> dataMap) throws DataAccessException {
		List<BoardVO> adminBoardList = adminServiceCenterDAO.boardList(dataMap);
		int boardTotal = adminServiceCenterDAO.selectBoardCount();
		
		Map<String, Object> boardMap = new HashMap();
		boardMap.put("adminBoardList", adminBoardList);
		boardMap.put("boardTotal", boardTotal);
		
		return boardMap;
	}

	@Override
	public int addBoard(BoardVO boardVO) throws DataAccessException {
		int result = adminServiceCenterDAO.insertBoard(boardVO);
		return result;
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		
		return 0;
	}

	@Override
	public int deleteBoard(String articleNO) throws DataAccessException {
		int result = adminServiceCenterDAO.deleteBoard(articleNO);
		return result;
	}
	/* 공지사항 상세 페이지 */
	@Override
	public BoardVO boardDetail(String articleNO) throws DataAccessException {
		return adminServiceCenterDAO.boardDetail(articleNO);
	}

}
