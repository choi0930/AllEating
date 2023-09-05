package com.spring.alleating.admin.servicecenter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.servicecenter.vo.BoardVO;

@Mapper
@Repository("adminServiceCenterDAO")
public interface AdminServiceCenterDAO {
	/* 공지사항 총개수 가져오기 */
	public int selectBoardCount()throws DataAccessException;
	/* 공지사항 목록 가져오기 */
	public List<BoardVO> boardList(Map dataMap)throws DataAccessException;
	/* 공지사항 작성 */
	public int insertBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 수정 */
	public int updateBoard(BoardVO boardVO)throws DataAccessException;
	/* 공지사항 삭제 */
	public int deleteBoard(String articleNO)throws DataAccessException;
	/* 공지사항 상세페이지 */
	public BoardVO boardDetail(String articleNO)throws DataAccessException;
}
