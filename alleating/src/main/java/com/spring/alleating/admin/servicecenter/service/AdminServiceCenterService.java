package com.spring.alleating.admin.servicecenter.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.servicecenter.vo.BoardVO;

public interface AdminServiceCenterService {
	/* 공지사항 목록 가져오기 */
	public Map<String, Object> boardList(Map<String, Object> dataMap)throws DataAccessException;
	/* 공지사항 작성 */
	public int addBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 수정 */
	public int updateBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 삭제 */
	public int deleteBoard(String articleNO)throws DataAccessException;
	/* 공지사항 상세 페이지 */
	public BoardVO boardDetail(String articleNO)throws DataAccessException;
}
