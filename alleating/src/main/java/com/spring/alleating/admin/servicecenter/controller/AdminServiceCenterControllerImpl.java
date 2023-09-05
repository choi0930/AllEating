package com.spring.alleating.admin.servicecenter.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.servicecenter.service.AdminServiceCenterService;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.servicecenter.vo.BoardVO;
@Controller("adminServiceCenterController")
public class AdminServiceCenterControllerImpl implements AdminServiceCenterController{
	
	@Autowired
	private AdminServiceCenterService adminServiceCenterService;
	
	@Autowired
	private BoardVO boardVO;
	
	/* 관리자 페이지: 공지사항 목록 가져오기 */
	@Override
	@RequestMapping(value="/admin/adminAnnouncement.do", method = RequestMethod.GET)
	public ModelAndView getBoardList(Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");
		
		Map<String,Object> condMap = new HashMap<>();
		
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
		
		Map<String, Object> boardMap =  adminServiceCenterService.boardList(condMap);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardMap", boardMap);
		mav.setViewName(viewName);
	
		return mav;
	}
	/*-------------------------------------------------------------------------------------*/
	
	/* 관리자 페이지: 공지사항 작성 */
	@Override
	@PostMapping(value="/admin/addBoard.do")
	public ResponseEntity<?> addBoard(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		
		String id = memberVO.getId();
		
		boardVO.setId(id);
		
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int result = adminServiceCenterService.addBoard(boardVO);
			message= "<script>";
			message += " alert('공지사항을 등록했습니다');";
			message +=" location.href='"+request.getContextPath()+"/admin/adminAnnouncement.do';";
			message +="</script>";
		} catch (Exception e) {
			e.printStackTrace();
			message= "<script>";
			message += " alert('공지사항 등록 실패');";
			message +=" location.href='"+request.getContextPath()+"/admin/adminAnnouncement.do';";
			message +="</script>";
			
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	/*-------------------------------------------------------------------------------------*/
	@Override
	public ResponseEntity<?> updateBoard(BoardVO boardVO, HttpServletRequest request) throws Exception {
		
		return null;
	}
	
	/* 공지사항 글 삭제 */
	@Override
	@ResponseBody
	@RequestMapping(value="/admin/delBoard.do", method = RequestMethod.POST)
	public String deleteBoard(String articleNO) throws Exception {
		
		int result = adminServiceCenterService.deleteBoard(articleNO);
		String msg;
		
		if(result==1) {
			msg="공지사항 삭제 완료";
		}else {
			msg="공지사항 삭제 실패";
		}
		
		return msg;
	}
	/*----------------------------------------------------------------------------*/
	/* 공지사항 상세 페이지 */
	@Override
	@RequestMapping(value="/admin/adminAnnouncement_detail.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam String articleNO, HttpServletRequest request) throws DataAccessException {
		boardVO = adminServiceCenterService.boardDetail(articleNO);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardVO", boardVO);
		mav.setViewName(viewName);
		return mav;
	}
	
	
}
