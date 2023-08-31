package com.spring.alleating.community.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.community.service.CommunityService;
import com.spring.alleating.community.vo.ReviewBoardVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;

@Controller("communityController")
public class CommunityControllerImpl extends BaseController implements CommunityController {
	private static final String REVIEW_IMAGE_REPO = "C:\\alleating\\review_image_repo";
	@Autowired
	CommunityService communityService;
	
	
	@Autowired 
	ReviewBoardVO reviewBoardVO;
	@Override
	@RequestMapping(value= "/community/review_01.do", method = RequestMethod.GET)
	public ModelAndView review_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "review_01");
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}

	
/////////////////////////////////// 게시물 작성 페이지로 이동하기/////////////////
	@Override
	public void addreview(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session  = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id= memberVO.getId();
		
		String productId = request.getParameter("productId");
		int _productId = Integer.parseInt(productId);
		
		String viewName = (String)request.getAttribute("viewName");	
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); 
		
	
	}
	
	//////////////////////////////게시물 작성 ////////////////////////////
	



	@Override
	public void insertReviewImg(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		
	}



	

	


	
	
	
	}