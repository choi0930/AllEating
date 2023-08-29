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

	@Override
	@RequestMapping(value="/myPage/add_reviewForm.do", method= {RequestMethod.POST})
	public ResponseEntity addReview( @RequestParam(required=false,name="views") String view,MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map newReviewMap = new HashMap<>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newReviewMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
	
		String id1 = reviewBoardVO.getId();
		newReviewMap.put("id", id1);
		
		List<ProductImgVO> reviewImgList = upload(multipartRequest);
		if(reviewImgList!= null && reviewImgList.size()!=0) {
			for(ProductImgVO productImgVO : reviewImgList) {
				productImgVO.setReg_id(id1);
			}
			newReviewMap.put("reviewImgList", reviewImgList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int productId = communityService.addReview(newReviewMap);
	
			if(reviewImgList!=null && reviewImgList.size()!=0) {
				for(ProductImgVO  productImgVO:reviewImgList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(REVIEW_IMAGE_REPO+"\\"+productId);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('후기가 등록되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/myPage/myPage_review.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(reviewImgList!=null && reviewImgList.size()!=0) {
				for(ProductImgVO  productImgVO:reviewImgList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('내용을 입력해주세요.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/myPage/myPage_review.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	

	


	
	
	
	}