package com.spring.alleating.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.alleating.mail.service.EmailService;
import com.spring.alleating.member.service.MemberService;
import com.spring.alleating.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private MemberVO memberVO;
	
	@Override //회원가입
	@RequestMapping(value="/member/join.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addMember(Map<String, String> memberInfo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		memberService.addMember(memberInfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/loginForm.do"); //add
		return mav;
	}
	
	@Override //로그인
	@RequestMapping(value="/member/login.do", method = {RequestMethod.POST})
	public ModelAndView login(Map<String, String> loginMemberInfo, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(loginMemberInfo.get("id"));
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMemberInfo);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", memberVO);
			session.setAttribute("isLoginON", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
					mav.setViewName("redirect:/main.do");
			}
		} else {
			
			mav.addObject("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	
	@Override //로그아웃
	@RequestMapping(value="/member/logOut.do", method = RequestMethod.GET)
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLoginOn",false);
		session.removeAttribute("loginMember");
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	
	@Override //아이디 중복 확인
	@RequestMapping(value="/member/checkId.do", method=RequestMethod.POST) 
	public void checkId(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = memberService.selectById(id);
		System.out.println(result);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			System.out.println("以묐났");
			out.print("no-usable");
		}else {
			out.print("usable");
		}
	}

	@Override //아이디 찾기 
	@RequestMapping(value="/member/find_id_01.do", method = RequestMethod.GET)
	public ModelAndView find_id_01(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override
	@RequestMapping(value= "/member/find_id_02.do", method = RequestMethod.GET)
	public ModelAndView find_id_02(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override //비밀번호 찾기
	@RequestMapping(value= "/member/find_pwd_01.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_01(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	@Override
	@RequestMapping(value= "/member/find_pwd_02.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_02(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	

	@Override
	@RequestMapping(value="/member/sendEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int number = emailService.sendMail(email);
		Map<String, Object> response1 = new HashMap<>();
		response1.put("number", number);
		return response1;
	}

	//폼이동
	@RequestMapping(value="/member/*Form.do", method = {RequestMethod.GET})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
