package com.spring.alleating.servicecenter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;
@Mapper
@Repository("serviceCenterDAO")
public interface ServiceCenterDAO {
	/* 공지사항 목록 가져오기 */
	public List<BoardVO> boardList(Map dataMap)throws DataAccessException;
	/* 공지사항 작성 */
	public int insertBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 수정 */
	public int updateBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 삭제 */
	public int deleteBoard(String articleNO)throws DataAccessException;
	//상품 문의 목록

	public List<InquiryBoardVO> productQnAList (Map productQnAInfo) throws DataAccessException;
   //상품 문의 등록
	public int insertQnA(Map QnAMap) throws DataAccessException;

	public List<InquiryBoardVO> selectProductQnA (Map productQnAInfo) throws DataAccessException;

}
