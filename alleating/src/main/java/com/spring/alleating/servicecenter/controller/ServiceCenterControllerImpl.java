package com.spring.alleating.servicecenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.servicecenter.service.ServiceCenterService;
import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;

@Controller("serviceCenterController")
public class ServiceCenterControllerImpl implements ServiceCenterController{

	@Autowired
	private ServiceCenterService serviceCenterService;
	@Autowired
	private BoardVO boardVO;
	@Autowired
	private InquiryBoardVO inquiryBoardVO;
	@Autowired
	private MemberVO memberVO;
	
	
	/* 공지사항 목록 가져오기 */
	@Override
	@RequestMapping(value="/serviceCenter/announcement.do", method = RequestMethod.GET)
	public ModelAndView getBoardList(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "customer_service_center");
		
		String viewName = (String) request.getAttribute("viewName");
		String section = (String) dataMap.get("section");
		String pageNum = (String) dataMap.get("pageNum");

		Map<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}

			int _section = Integer.parseInt(section);
			int _pageNum = Integer.parseInt(pageNum);
		 int offset = (_section-1) * 100 +(_pageNum-1) * 5;
		condMap.put("offset",offset);
		Map boardMap = serviceCenterService.boardList(condMap);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		mav.addObject("boardMap", boardMap);
		return mav;
	}
	/* 공지사항 상세 페이지 */
	@Override
	@RequestMapping(value="/serviceCenter/announcement_detail.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(String articleNO, HttpServletRequest request) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		boardVO = serviceCenterService.boardDetail(articleNO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardVO", boardVO);
		mav.setViewName(viewName);
		
		return mav;
	}



	@Override
	@RequestMapping(value="/serviceCenter/personal_q_01.do", method = RequestMethod.GET)
	public ModelAndView personalQ(HttpServletRequest request) throws Exception {
		String viewName = (String)request.getParameter("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}
	


	

	
	//상품 문의
	@Override
	@RequestMapping(value = "/serviceCenter/productQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productQnAList(HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
	    HttpSession session = request.getSession();
	    session.setAttribute("side_menuType", "customer_service_center");
	    MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
	    String id = memberVO.getId();

	

	    Map userQnAInfo = new HashMap<>();
	    userQnAInfo = serviceCenterService.selectProductQnA();

	    String viewName = (String) request.getAttribute("viewName");
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName(viewName);

	    mav.addObject("userQnaInfo", userQnAInfo);
	    return mav;
	}

	
	
	@Override
	@RequestMapping (value = "/serviceCenter/addQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addQnA(Map QnAMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "customer_service_center");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id= memberVO.getId();
		
		/* int productId = inquiryBoardVO.getProductId(); */
		String productId = request.getParameter("productId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Map _QnAMap = new HashMap<>();
		_QnAMap.put("id", id);
		_QnAMap.put("productId", productId);
		_QnAMap.put("title", title);
		_QnAMap.put("content", content);
	
	    serviceCenterService.insertQnA(_QnAMap);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
        
		mav.addObject("_QnAMap", _QnAMap);
		mav.setViewName("redirect:/serviceCenter/productQnA.do");
	
	
	
		return mav;
	}
	
	@RequestMapping(value="/serviceCenter/addQnAForm.do",method = RequestMethod.GET)
	public ModelAndView form(@RequestParam ("productId") int productId,HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
          session.setAttribute("productId", productId);
          
          
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("productId", productId);
	
		return mav;
	}
	/*
	 * @RequestMapping(value="/serviceCenter/Form.do",method = RequestMethod.GET)
	 * public ModelAndView form(@RequestParam ("productId") int
	 * productId,HttpServletRequest request, HttpServletResponse response)throws
	 * Exception{ HttpSession session = request.getSession();
	 * session.setAttribute("productId", productId);
	 * 
	 * 
	 * 
	 * 
	 * String viewName = (String) request.getAttribute("viewName"); ModelAndView mav
	 * = new ModelAndView(); mav.setViewName(viewName); mav.addObject("productId",
	 * productId);
	 * 
	 * return mav; }
	 */




	


	

}
	
	
	
