package com.spring.alleating.admin.coupon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.coupon.service.AdminCouponService;
import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.coupon.vo.CouponVO;

@Controller("adminCouponController")
public class AdminCouponControllerImpl extends BaseController implements AdminCouponController {
	
	@Autowired
	private AdminCouponService adminCouponService;
	@Autowired
	private CouponVO couponVO;
	
	@Override
	@RequestMapping(value="/admin/couponList.do", method = RequestMethod.GET)
	public ModelAndView couponList(@RequestParam Map dataMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	/*관리자 페이지 쿠폰 추가*/
	@Override
	@RequestMapping(value="/admin/addCoupon.do", method =  RequestMethod.POST)
	public ResponseEntity addCoupon(@ModelAttribute CouponVO couponVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int result = adminCouponService.addCoupon(couponVO);
			message= "<script>";
			message += " alert('새로운 쿠폰을 등록했습니다');";
			message +=" location.href='"+request.getContextPath()+"/admin/couponList.do';";
			message +="</script>";
		} catch (Exception e) {
			e.printStackTrace();
			message= "<script>";
			message += " alert('쿠폰 등록 실패');";
			message +=" location.href='"+request.getContextPath()+"/admin/couponList.do';";
			message +="</script>";
			
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
	}
	/*------------------------------------관리자 페이지 쿠폰 추가 끝----------------------------------------------*/
	
	
	@Override
	@RequestMapping(value="/admin/delCoupon.do", method = RequestMethod.POST)
	public String delCouponInfo(@RequestParam("couponId")String couponId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return null;
	}
	
	/* 쿠폰 수정을 위한 쿠폰id로 정보 불러오기 */
	@Override
	@RequestMapping(value="/admin/modCouponForm.do", method = RequestMethod.GET)
	public ModelAndView couponFindById(@RequestParam("couponId") String couponId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		couponVO = adminCouponService.couponFindByCouponId(couponId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("couponVO", couponVO);
		mav.setViewName(viewName);
		return mav;	
		}

	@Override
	@RequestMapping(value="/admin/modifyCoupon.do", method = RequestMethod.POST)
	public ModelAndView modfiyCouponInfo(@RequestParam CouponVO couponVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return null;
	}
	
	//폼이동
		@RequestMapping(value="/admin/*CouponForm.do",method = RequestMethod.GET)
		public ModelAndView form(HttpServletRequest request, HttpServletResponse response)throws Exception{
			HttpSession session = request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			Map<String, String> dateMap = calcCouponDate();
			ModelAndView mav = new ModelAndView();
			mav.addObject("dateMap", dateMap);
			mav.setViewName(viewName);
			return mav;
		}
}
