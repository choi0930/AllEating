package com.spring.alleating.servicecenter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InqueryBoardVO;
@Mapper
@Repository("serviceCenterDAO")
public interface ServiceCenterDAO {
	/* 공지사항 목록 가져오기 */
	public List<BoardVO> boardList(Map dataMap)throws DataAccessException;
	
	
	//상품 문의 목록
	public List<InqueryBoardVO> selectProductQnA (Map productQnAInfo) throws DataAccessException;
}
