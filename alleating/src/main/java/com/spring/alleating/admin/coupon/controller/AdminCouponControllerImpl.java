package com.spring.alleating.admin.coupon.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView couponList(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");
		
		String section2 = dataMap.get("section2");
		String pageNum2 = dataMap.get("pageNum2");
		
		Map<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}
		if(section2== null) {
			section2 = "1";
		}
		
		if(pageNum2== null) {
			pageNum2 = "1";
		}
		
		int _section = Integer.parseInt(section);
		int _pageNum = Integer.parseInt(pageNum);
		 int offset = (_section-1) * 100 +(_pageNum-1) * 5;
		condMap.put("offset",offset);
		condMap.put("secion", section);
		condMap.put("pageNum", pageNum);
		
		int _seciont2 = Integer.parseInt(section2);
		int _pageNum2 = Integer.parseInt(pageNum2);
		int offset2 = (_seciont2-1) * 100 +(_pageNum2-1) * 5;
		condMap.put("offset2",offset2);
		condMap.put("secion2", section2);
		condMap.put("pageNum2", pageNum2);
		
		Map couponMap = adminCouponService.couponList(condMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("couponMap", couponMap);
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
	@ResponseBody
	@RequestMapping(value="/admin/delCoupon.do", method = RequestMethod.POST)
	public String delCouponInfo(@RequestParam("couponId")String couponId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		adminCouponService.delCouponInfo(couponId);
		return "success";
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
	/*------------------------------------쿠폰 수정을 위한 쿠폰id로 정보 불러오기 끝----------------------------------------------*/
	
	
	/* 쿠폰 정보 수정 */
	@Override
	@RequestMapping(value="/admin/modifyCoupon.do", method = RequestMethod.POST)
	public ResponseEntity modfiyCouponInfo(@ModelAttribute CouponVO couponVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int result = adminCouponService.modfiyCouponInfo(couponVO);
			message= "<script>";
			message += " alert('쿠폰정보를 수정했습니다.');";
			message +=" location.href='"+request.getContextPath()+"/admin/couponList.do';";
			message +="</script>";
		} catch (Exception e) {
			e.printStackTrace();
			message= "<script>";
			message += " alert('쿠폰 정보수정을 실패했습니다.');";
			message +=" location.href='"+request.getContextPath()+"/admin/couponList.do';";
			message +="</script>";
			
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	/*------------------------------------쿠폰 정보 수정 끝----------------------------------------------*/
	
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
