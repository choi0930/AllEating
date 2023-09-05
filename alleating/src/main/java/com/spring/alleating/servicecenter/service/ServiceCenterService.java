package com.spring.alleating.servicecenter.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;

public interface ServiceCenterService {
	/* 공지사항 목록 가져오기 */
	public Map<String, Object> boardList(Map<String, Object> dataMap)throws DataAccessException;
	/* 공지사항 목록 가져오기 */
	public BoardVO boardDetail(String articleNO)throws DataAccessException;
	
	//상품 문의 목록
	public Map selectProductQnA() throws DataAccessException;
	//상품 문의 등록
	public int insertQnA(Map QnAMap)throws DataAccessException;
}
