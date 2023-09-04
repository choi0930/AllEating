package com.spring.alleating.admin.servicecenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.servicecenter.service.AdminServiceCenterService;
import com.spring.alleating.servicecenter.vo.BoardVO;
@Controller("adminServiceCenterController")
public class AdminServiceCenterControllerImpl implements AdminServiceCenterController{
	
	@Autowired
	private AdminServiceCenterService adminServiceCenterService;
	
	@Autowired
	private BoardVO boardVO;
	
	@Override
	public ModelAndView getBoardList(Map<String, ?> dataMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	
		return null;
	}

	@Override
	public String addBoard(BoardVO boardVO, HttpServletRequest request) throws Exception {
		
		return null;
	}

	@Override
	public ResponseEntity<?> updateBoard(BoardVO boardVO, HttpServletRequest request) throws Exception {
		
		return null;
	}

	@Override
	public String deleteBoard(String articleNO) throws Exception {
		
		return null;
	}

}
