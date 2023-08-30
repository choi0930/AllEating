package com.spring.alleating.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	/* 회원가입 */
	@Override 
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
	/*---------------------------------회원가입 끝------------------------------------*/
	
	
	/* 로그인 */
	@Override 
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
	/*---------------------------------로그인 끝------------------------------------*/
	
	/* 로그아웃 */
	@Override 
	@RequestMapping(value="/member/logOut.do", method = RequestMethod.GET)
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLoginON",false);
		session.removeAttribute("loginMember");
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	/*---------------------------------로그아웃 끝------------------------------------*/
	
	/* 아이디 중복 확인 */
	@Override 
	@RequestMapping(value="/member/checkId.do", method=RequestMethod.POST) 
	public void checkId(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = memberService.selectById(id);
		System.out.println(result);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.print("no-usable");
		}else {
			out.print("usable");
		}
	}
	/*---------------------------------아이디 중목 확인 끝------------------------------------*/
	
	
	/* 아이디 찾기화면으로 이동 */ //이름뒤에 form을 추가해 단순 페이지이동은 통일하는게 좋을듯 함
	@Override
	@RequestMapping(value="/member/find_id_01.do", method = RequestMethod.GET)
	public ModelAndView find_id_01(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	/* 아이디 찾기 */
	@Override
	@RequestMapping(value= "/member/find_id_02.do", method = RequestMethod.GET)
	public ModelAndView find_id_02(@RequestParam("name")String name,@RequestParam("email")String email, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	/*---------------------------------아이디 찾기 끝------------------------------------*/
	
	/* 비밀번호 찾기 페이지 이동 */ //위 아이디찾기 페이지 이동과 동일
	@Override //비밀번호 찾기
	@RequestMapping(value= "/member/find_pwd_01.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_01(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	/* 비밀번호 찾기 */
	@Override
	@RequestMapping(value= "/member/find_pwd_02.do", method = RequestMethod.GET)
	public ModelAndView find_pwd_02(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	/*---------------------------------비밀번호 찾기 끝------------------------------------*/
	
	
	 @PostMapping("/member/checkPasswordAndRedirect")
	    public String checkPasswordAndRedirect(@RequestParam("pwd") String providedPassword,
	                                           HttpSession session) {
	        // 세션에서 로그인한 회원 정보 가져오기 
	        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	        System.out.println("checkpwd");
	        if (loginMember != null && loginMember.getPwd().equals(providedPassword)) {
	            // 비밀번호가 맞는 경우
	            return "redirect:/myPage/myPage_edit02.do";
	        } else {
	            // 비밀번호가 틀린 경우
	            return "redirect:/myPage/myPage_edit.do";
	        }
	    }
	
	
		/*
		 * @Override
		 * 
		 * @RequestMapping(value = "/member/modMember.do", method = {
		 * RequestMethod.GET,RequestMethod.POST}) public ModelAndView
		 * modMember(@RequestParam("id") String id, HttpServletRequest request,
		 * HttpServletResponse response) throws Exception {
		 * System.out.println("Call modMember-method of control");
		 * request.setCharacterEncoding("utf-8"); String viewName = (String)
		 * request.getAttribute("viewName"); System.out.println("viewName: " +
		 * viewName); MemberVO memberVO = memberService.modMember(id); ModelAndView mav
		 * = new ModelAndView(); mav.addObject("member", memberVO);
		 * mav.setViewName(viewName); return mav; }
		 */


	@Override
	@RequestMapping(value = "/member/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(Map<String, String> memberInfo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("Call updateMember-method of control");
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.updateMember(memberInfo);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}

	/* 회원가입 이메일 인증 */
	@Override
	@RequestMapping(value="/member/sendEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int number = emailService.sendMail(email);
		Map<String, Object> response1 = new HashMap<>();
		response1.put("number", number);
		return response1;
	}
	/*---------------------------------회원가입 이메일 인증 끝------------------------------------*/

	
	/* 단순 페이지 이동(로그인 회원가입 페이지) */
	@RequestMapping(value="/member/*Form.do", method = {RequestMethod.GET})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	/*---------------------------------페이지이동 끝------------------------------------*/


	/* 카카오 로그인 */
	@Override
	@GetMapping(value="/member/kakao.do")
	public ModelAndView kokaoLogin(@RequestParam String code) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String access_Token = memberService.getKakaoAccessToken(code);
		System.out.println(access_Token);
		
		Map snsUserInfo = new HashMap();
		snsUserInfo = memberService.createKakaoUser(access_Token);
		String status = (String) snsUserInfo.get("status");
		
		if(status.equals("addMemer")) {
			mav.addObject("snsUserInfo", snsUserInfo);
			mav.setViewName("/member/snsMemberForm");
		}else {
			
		}
		return mav;
	}
	/*---------------------------------카카오 로그인 끝------------------------------------*/
}
