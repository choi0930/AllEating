package com.spring.alleating.servicecenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;

public interface ServiceCenterController {
	/* 공지사항 목록 */
	public ModelAndView getBoardList(@RequestParam Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/* 공지사항 상세페이지 */
	public ModelAndView boardDetail(@RequestParam("articleNO")String articleNO, HttpServletRequest request)throws Exception;


	/* 상품문의 페이지 이동 */
	public ModelAndView personalQ(HttpServletRequest request) throws Exception;

	/*
	 * 상품문의 페이지 작성 public ModelAndView addQnA (HttpServletRequest request,
	 * HttpServletResponse response)throws Exception;
	 */

	// 상품 문의
	public ModelAndView productQnAList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 상품 등록
	public ModelAndView addQnA(@RequestParam Map<String, String>  QnAMap,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 상품 삭제
	public ModelAndView memberremoveArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 상품 수정
	public ModelAndView membermodArticle(@RequestParam Map articleMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
	// 사업자의 답글 보기
	public ModelAndView ownerviewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 일반 회원이 쓴 글보기
	public ModelAndView memberviewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
