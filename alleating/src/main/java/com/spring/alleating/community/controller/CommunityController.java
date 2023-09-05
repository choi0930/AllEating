package com.spring.alleating.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.community.vo.ReviewBoardVO;

public interface CommunityController {
	public ModelAndView review_01(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public String addreview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity completeReview(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception; //후기 작성
	public ModelAndView writtenReview (@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response);
	//사용자들 후기들 목록
	public ModelAndView selectAllReview (HttpServletRequest request, HttpServletResponse response)throws Exception;

	
}
