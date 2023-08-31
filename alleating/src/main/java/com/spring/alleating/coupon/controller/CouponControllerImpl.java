package com.spring.alleating.coupon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.coupon.service.CouponService;
import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
@Controller("couponController")
public class CouponControllerImpl implements CouponController{
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private CouponVO couponVO;
	
	@Override
	@RequestMapping(value="/coupon/couponList.do", method = RequestMethod.GET)
	public ModelAndView allCouponList(HttpServletRequest request, HttpServletResponse response)
			throws DataAccessException {
		String viewName = (String) request.getAttribute("viewName");
		List<CouponVO> couponList = couponService.allcouponList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("couponList", couponList);
		mav.setViewName(viewName);
		return mav;	
	}
	
	@Override
	@GetMapping("/coupon/couponPopUp.do")
	public void couponPopUp(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		String id = memberVO.getId();
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) session.getAttribute("allEating");
		
		Map dataMap = new HashMap<>();
		
		dataMap.put("id", id);
		dataMap.put("alleatingOrderDetailes", allEatingOrderDetailes);
		
		couponService.payCouponList(dataMap);
	}

	
	
}
