package com.spring.alleating.community.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.community.service.CommunityService;
import com.spring.alleating.community.vo.ReviewBoardVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Controller("communityController")
public class CommunityControllerImpl extends BaseController implements CommunityController {
	private static final String REVIEW_IMAGE_REPO = "C:\\alleating\\review_image_repo";
	@Autowired
	CommunityService communityService;
	
	
	@Autowired 
	ReviewBoardVO reviewBoardVO;
	@Override
	@RequestMapping(value= "/community/review_01.do", method = { RequestMethod.POST, RequestMethod.GET })
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
	public String addreview(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session  = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id= memberVO.getId();
		
		String productId = request.getParameter("productId");
		int _productId = Integer.parseInt(productId);
		
		String viewName = (String)request.getAttribute("viewName");	
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productId", _productId);
		mav.setViewName(viewName);
		return viewName; 
		
	
	}
	
	//////////////////////////////게시물 작성 ////////////////////////////
	
	

	@Override
	@RequestMapping(value="/myPage/completeReview.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView completeReview(@RequestParam("id") String id, MultipartFile reviewImage, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String productId = request.getParameter("productId");
		int _productId =Integer.parseInt(productId);
	     
		String productName = request.getParameter("productName");
		String content = request.getParameter("content");
		String productBrand= request.getParameter("productBrand");
	
		
		
		
		 // ReviewBoardVO 객체 생성과 설정
        ReviewBoardVO reviewBoardVO = new ReviewBoardVO();
        reviewBoardVO.setId(id);
        reviewBoardVO.setProductId(_productId);
      
        reviewBoardVO.setProductName(productName);
        reviewBoardVO.setContent(content);
        reviewBoardVO.setProductBrand(productBrand);

        // 서비스를 통해 데이터베이스에 INSERT 작업 수행
       communityService.insertReview(reviewBoardVO);

		
		
		ModelAndView mav = new ModelAndView();
		 mav.setViewName("redirect:/myPage/myPage_review.do");
		mav.addObject("id", id);
		mav.addObject("productId", productId);
		mav.addObject("productName", productName);
		mav.addObject("productBrand", productBrand);
		
	if(!reviewImage.isEmpty()) {
		try {
			// 업로드할 경로 설정
            String uploadDirectory = "/c:/alleating//review_image_repo/";
            
            // 파일 이름 설정 (예: 유니크한 ID나 타임스탬프를 사용)
            String fileName = System.currentTimeMillis() + "_" + reviewImage.getOriginalFilename();
            
            // 파일 경로 생성
            Path filePath = Paths.get(uploadDirectory, fileName);
            
            // 파일 저장
            Files.copy(reviewImage.getInputStream(), filePath);
            
            // 리뷰 객체에 이미지 경로 저장
            String imagePath = "/uploaded-images/" + fileName; // 예시 경로, 실제 경로에 맞게 수정
            reviewBoardVO.setImagePath(imagePath);
            
        } catch (IOException e) {
            // 업로드 실패 처리
            e.printStackTrace();
        }
    }
	
	
		return mav;
	}
	
		



		
	}




	

	


	
	
	
	