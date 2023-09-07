package com.spring.alleating.admin.servicecenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.servicecenter.vo.BoardVO;

public interface AdminServiceCenterController {
	/* 공지사항 목록 */
	public ModelAndView getBoardList(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 공지사항 작성 */
	public ResponseEntity<?> addBoard(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 공지사항 수정 */
	public ResponseEntity<?> updateBoard(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 공지사항 삭제 */
	public String deleteBoard(@RequestParam String articleNO) throws Exception;
	/* 공지사항 상세 페이지 */
	public ModelAndView boardDetail(@RequestParam("articleNO")String articleNO, HttpServletRequest request)throws DataAccessException;
	/*공지사항 수정 페이지*/
	public ModelAndView updateBoardForm(@RequestParam("articleNO")String articleNO, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
