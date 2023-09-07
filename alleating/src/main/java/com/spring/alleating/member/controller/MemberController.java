package com.spring.alleating.member.controller;

import java.net.http.HttpRequest;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.alleating.member.vo.MemberVO;


public interface MemberController {
	public ModelAndView addMember(@RequestParam Map<String, String> memberInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public void checkId(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public Map<String, Object> sendEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMemberInfo, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response)throws Exception;
		
	/*
	 * public ModelAndView modMember(@RequestParam("id") String id,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception;
	 */
	
	/*
	 * public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception;
	 */
	public ModelAndView updateMember(@RequestParam Map<String, String> memberInfo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*아이디 찾기*/
	public ModelAndView find_id_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String find_id_02(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findIdView(HttpServletRequest response, HttpServletResponse response2)throws DataAccessException;
	/*비밀번호 찾기*/
	public ModelAndView find_pwd_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String find_pwd_02(@RequestBody MemberVO memberVO,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView msgPwd(HttpServletRequest request, HttpServletResponse response)throws DataAccessException;
	public ModelAndView updatePwdForm(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity updatePwdInfo(@RequestParam("pwd")String pwd, HttpServletRequest request, HttpServletResponse response)throws Exception;
	/*카카오 로그인*/
	public ModelAndView kakaoLogin(@RequestParam String code, HttpServletRequest request)throws Exception;
	/*카카오 회원가입*/
	public ResponseEntity<?> kakaoJoin(@RequestParam Map<String, String> snsMemberInfo, HttpServletRequest request)throws Exception;
}
