package com.spring.alleating.admin.member.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.member.service.AdminMemberService;
import com.spring.alleating.member.vo.MemberVO;
@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private MemberVO memberVO;
	
	/*관리자 페이지 일반 회원 목록*/
	@Override
	@RequestMapping(value="/admin/userMemberList.do", method = RequestMethod.GET)
	public ModelAndView listUserMembers(@RequestParam Map<String,String> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "admin_page");
		
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");
		
		Map<String, Object> reDataMap = new HashMap<String, Object>();
		
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}
		
		reDataMap.put("section", section);
		reDataMap.put("pageNum", pageNum);
		
		Map memberMap = new HashMap<>();
		memberMap = adminMemberService.listMembers(reDataMap);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap",memberMap);
		mav.setViewName(viewName);
		
		return mav;
	}
	/*--------------------------관리자 페이지 일반 회원 목록 끝----------------------------*/
	
	/*관리자 페이지 사업자 회원 목록*/
	@Override
	@RequestMapping(value="/admin/ownerMemberList.do", method = RequestMethod.GET)
	public ModelAndView listOwnerMembers(Map<String, String> dataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "admin_page");
		
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");
		
		Map<String, Object> reDataMap = new HashMap<String, Object>();
		
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}
		
		reDataMap.put("section", section);
		reDataMap.put("pageNum", pageNum);
		
		Map<String, ?> memberMap = new HashMap<>();
		memberMap = adminMemberService.listOwnerMembers(reDataMap);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap",memberMap);
		mav.setViewName(viewName);
		
		return mav;
	}
	/*--------------------------관리자 페이지 사업자 회원 목록 끝----------------------------*/
	
	/* 관리자 페이지 회원 상세보기 */
	@Override
	@RequestMapping(value="/admin/memberDetail.do", method = RequestMethod.GET)
	public ModelAndView memberDetail(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		memberVO = adminMemberService.memberDetail(id);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVO", memberVO);
		mav.setViewName(viewName);
		
		return mav;
	}
	/*--------------------------관리자 페이지 회원 상세보기 끝----------------------------*/
	
	


	/* 관리자 페이지 회원 탈퇴/복귀 처리*/
	@Override
	public ResponseEntity<Object> adminLeaveUser(@RequestParam Map memberInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = (String) memberInfo.get("id");
		String del_yn = (String) memberInfo.get("del_yn");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminMemberService.adminLeaveUser(memberInfo);
			
			message = "<script>";
			if(del_yn.equals("Y")) {
				message += " alert("+id+"'회원을 탈퇴처리 하였습니다.');";
			}else {
				message += " alert("+id+"'회원을 탈퇴 해제 처리 하였습니다.');";
			}
			message += " location.href='" + request.getContextPath() + "/admin/memberDetail.do?id=" + id
					+ "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('정보수정 실패');";
			message += " location.href='" + request.getContextPath() + "/admin/memberDetail.do?id=" + id
					+ "'";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	/*--------------------------관리자 페이지 회원 탈퇴/복귀 처리----------------------------*/

}
