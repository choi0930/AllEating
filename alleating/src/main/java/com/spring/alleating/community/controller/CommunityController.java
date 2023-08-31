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
	public ModelAndView completeReview(@RequestParam("id") String id,MultipartFile reviewImage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	
}
