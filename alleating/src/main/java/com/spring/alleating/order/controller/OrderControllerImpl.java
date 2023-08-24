package com.spring.alleating.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.service.OrderService;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.OrderVO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.vo.ProductVO;

@Controller("orderController")
public class OrderControllerImpl extends BaseController implements OrderController{
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;
	
	@RequestMapping(value="/order/pay_01.do", method = RequestMethod.GET)
	public ModelAndView thunderDelivery(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}

	/* 상품 상세페이지에서 주문시 */
	@Override
	@RequestMapping(value="/order/orderEachProduct.do", method = RequestMethod.POST)
	public ModelAndView oneProductOrder(String productId, String qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		Map orderMap = new HashMap();
		
		int _productId = Integer.parseInt(productId);
		int _qty = Integer.parseInt(qty);
		orderVO.setProductId(_productId);
		orderVO.setProductQty(_qty);
		orderMap.put("orderVO", orderVO);
		orderMap.put("memberVO", memberVO);
		
		
		
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/pay_02");
		
		return mav;
	}
	/*-------------------- 상품 상세페이지에서 주문시 끝 --------------------*/
	
	
	
	@RequestMapping(value="/order/pay_02.do", method = RequestMethod.GET)
	public ModelAndView pay(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		Map dateInfo = calcSearchPeriod("four_day");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) session.getAttribute("allEating");
		
		Map cartMap = new HashMap();
		cartMap.put("memberVO", memberVO);
		cartMap.put("allEating",allEatingOrderDetailes);
		
		Map userInfo = orderService.userInfoToPay(cartMap);
		List<UserCouponVO> couponList = (List<UserCouponVO>) userInfo.get("couponList");
		UserPointVO userPointVO = (UserPointVO) userInfo.get("userPointVO");
		int totalPrice = (int) userInfo.get("totalPrice");
		int deliveryPrice = (int) userInfo.get("deliveryPrice");
		mav.addObject("dateInfo", dateInfo);
		mav.addObject("deliveryPrice", deliveryPrice);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("memberVO",memberVO);
		mav.addObject("userPointVO",userPointVO);
		mav.addObject("couponList",couponList);
		
		return mav;	
	}
	
	
	
	/* 장바구니에서 상품 여러개 구매 */
	@Override
	@RequestMapping(value="/order/orderAllCartProducts.do", method = {RequestMethod.POST})
	public void orderAllCartProducts(@RequestBody List<AllEatingOrderDetailVO> allEatingOrderDetailes, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("allEating", allEatingOrderDetailes);
		
			
		
	}
	/*-------------------장바구니에서 상품 여러개 구매-----------------*/

	@RequestMapping(value= "/order/pay_complete.do", method = RequestMethod.GET)
	public ModelAndView payComplete(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
}
