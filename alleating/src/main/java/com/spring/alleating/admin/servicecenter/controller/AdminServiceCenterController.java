package com.spring.alleating.admin.servicecenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.servicecenter.vo.BoardVO;

public interface AdminServiceCenterController {
	/* 공지사항 목록 */
	public ModelAndView getBoardList(@RequestParam Map<String, ?> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 공지사항 작성 */
	public String addBoard(@RequestBody BoardVO boardVO, HttpServletRequest request)throws Exception;
	/* 공지사항 수정 */
	public ResponseEntity<?> updateBoard(@RequestParam BoardVO boardVO, HttpServletRequest request)throws Exception;
	/* 공지사항 삭제 */
	public String deleteBoard(@RequestParam String articleNO) throws Exception;
}
