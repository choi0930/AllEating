package com.spring.alleating.servicecenter.controller;

import java.util.HashMap;
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

import com.spring.alleating.servicecenter.service.ServiceCenterService;
import com.spring.alleating.servicecenter.vo.BoardVO;

@Controller("serviceCenterController")
public class ServiceCenterControllerImpl implements ServiceCenterController{

	@Autowired
	private ServiceCenterService serviceCenterService;
	@Autowired
	private BoardVO boardVO;
	
	/* 공지사항 목록 가져오기 */
	@Override
	@RequestMapping(value="/serviceCenter/announcement.do", method = RequestMethod.GET)
	public ModelAndView getBoardList(Map<String, ?> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		Map boardMap = serviceCenterService.boardList(dataMap);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		mav.addObject("boardMap", boardMap);
		return mav;
	}
	
	/* 공지사항 작성 */
	@Override
	@ResponseBody
	public String addBoard(BoardVO boardVO, HttpServletRequest request) throws Exception {
		
		return null;
	}
	
	/* 공지사항 수정 */
	@Override
	public ResponseEntity<?> updateBoard(BoardVO boardVO, HttpServletRequest request) throws Exception {
		
		return null;
	}

	/* 공지사항 삭제 */
	@Override
	public String deleteBoard(String articleNO) throws Exception {
		
		return null;
	}


	@Override
	@RequestMapping(value="/serviceCenter/personal_q_01.do", method = RequestMethod.GET)
	public ModelAndView personalQ(HttpServletRequest request) throws Exception {
		String viewName = (String)request.getParameter("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/serviceCenter/addPersonal.do", method = RequestMethod.GET)
	public ModelAndView addPersonalQ(HttpServletRequest request) throws Exception {
		String viewName = (String)request.getParameter("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}


	

	
	//상품 문의
	@Override
	@RequestMapping (value = "/serviceCenter/productQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productQnAList(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			HttpSession session = request.getSession();
			session.setAttribute("side_menuType", "customer_service_center");
			
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
		
			return mav;

}
}