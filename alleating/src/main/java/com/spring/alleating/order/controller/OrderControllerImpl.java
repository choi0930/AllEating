package com.spring.alleating.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.myPage.service.MyPageService;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.RefundVO;
import com.spring.alleating.order.service.OrderService;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.point.vo.UserPointVO;

@Controller("orderController")
public class OrderControllerImpl extends BaseController implements OrderController{
	@Autowired
	private OrderService orderService;
	@Autowired
	private AllEatingOrderVO allEatingOrderVO;
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private AllEatingOrderDetailVO allEatingOrderDetailVO;
	
	
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
		allEatingOrderVO.setProductId(_productId);
		/* allEatingOrderVO.setProductQty(_qty); */
		orderMap.put("allEatingOrderVO", allEatingOrderVO);
		orderMap.put("memberVO", memberVO);
		
		
		
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/pay_02");
		
		return mav;
	}
	/*-------------------- 상품 상세페이지에서 주문시 끝 --------------------*/
	
	
	/* 결제 페이지로 이동 */
	@RequestMapping(value="/order/pay_02.do", method = RequestMethod.GET)
	public ModelAndView pay(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) session.getAttribute("allEating");
		
		Map cartMap = new HashMap();
		cartMap.put("memberVO", memberVO);
		cartMap.put("allEating",allEatingOrderDetailes);
		
		Map userInfo = orderService.userInfoToPay(cartMap);
//		List<UserCouponVO> couponList = (List<UserCouponVO>) userInfo.get("couponList");
//		UserPointVO userPointVO = (UserPointVO) userInfo.get("userPointVO");
//		int totalPrice = (int) userInfo.get("totalPrice");
//		int deliveryPrice = (int) userInfo.get("deliveryPrice");
//		DeliveryAddressVO dliveryAddressVO = (DeliveryAddressVO) userInfo.get("dliveryAddressVO");
//		String deliveryStatus = (String) userInfo.get("deliveryStatus");
		
//		mav.addObject("deliveryStatus", deliveryStatus);
//		mav.addObject("deliveryPrice", deliveryPrice);
//		mav.addObject("totalPrice", totalPrice);
//		mav.addObject("memberVO",memberVO);
//		mav.addObject("userPointVO",userPointVO);
//		mav.addObject("couponList",couponList);
//		mav.addObject("deliveryAddressVO",dliveryAddressVO);
		
		mav.addObject("userInfo", userInfo);
		
		return mav;	
	}
	/*----------------------------------------------- 결제 페이지로 이동 ----------------------------------------------------*/
	
	
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
	/*-------------------장바구니에서 상품 여러개 구매 끝-----------------*/
	
	/* 배송지 변경 팝업창 */
	@Override
	@GetMapping("/order/deliveryChangePopup.do")
	public void deliveryChangePopUp(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();
		List<DeliveryAddressVO> addressList =  orderService.getDeliveryAddressList(id);
		
		model.addAttribute("addressList", addressList);
		
	}
	/*-----------------------------------배송지 변경 팝업창 끝 ---------------------------------*/
	
	
	/*
	 * @RequestMapping(value= "/order/pay_complete.do", method = RequestMethod.GET)
	 * public ModelAndView payComplete(HttpServletRequest request,
	 * HttpServletResponse response) { String viewName =
	 * (String)request.getAttribute("viewName"); System.out.println(viewName);
	 * String orderId = request.getParameter("orderId"); ModelAndView mav = new
	 * ModelAndView(); mav.addObject("orderId",orderId); mav.setViewName(viewName);
	 * //add return mav; }
	 */
	/* 주문 */
	@Override
	@ResponseBody
	@PostMapping(value="/order/pay.do")
	public String pay(Map<String, Object> userOrder, HttpServletRequest request) throws Exception {
		Map order = new HashMap();
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) session.getAttribute("allEating");
		
		order.put("memberVO", memberVO);
		order.put("userOrder", userOrder);
		order.put("allEating", allEatingOrderDetailes);
		String orderId = orderService.pay(order);
		
		session.removeAttribute("allEating");
		return orderId;
	}
	/*------------------------------ 주문 끝 --------------------------------------*/

	///////////////////////////////주문 완료 페이지/////////////////////
	@Override
	@RequestMapping(value="/order/pay_complete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectOrderNum(@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map payCompleteInfo = new HashMap<>();
		payCompleteInfo = orderService.selectOrderNum(orderId);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("payCompleteInfo", payCompleteInfo);
		mav.setViewName(viewName);
		return mav;
	}
	
	//////////////////////////마이페이지 주문내역////////////////////////////////
	@Override
	@RequestMapping(value="/myPage/myPage_01.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderHistory(@RequestParam("id" ) String id,  HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");

		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		String _id = memberVO.getId();
		
		/*마이페이지 상단에 필요한 로그인한 유저 쿠폰 개수와 포인트 가져옴*/
		Map userInfo = myPageService.getUserPointAndCouponInfo(_id);
		
		int couponCount = (int) userInfo.get("couponCount");
		int point = (int) userInfo.get("point");
		
		session.setAttribute("couponCount", couponCount);
		session.setAttribute("userPointInfo", point);
		////////////////////////////////////////////////////////////
		
		/* String _id = request.getParameter(id); */
		
		/*
		 * Map orderHistoryInfo = new HashMap<>(); orderHistoryInfo =
		 * orderService.selectOrderHistory(id);
		 */

		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		
		 Map fffInfo = new HashMap<>(); 
			
		 fffInfo.put("id", id);
			 
		List orderHistoryResult = orderService.selectOrderHistory(fffInfo);
	
		mav.addObject("orderHistoryResult", orderHistoryResult);
		
		return mav;
	}

	
	
	/* 마이페이지 주문내역 상세페이지 */
	@Override
	@RequestMapping(value="/myPage/myPage_02.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView OrderHistoryDetail(@RequestParam("orderId") String orderId,
			 HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession(); //얘가 없으면
		session.setAttribute("side_menuType", "my_page"); //세션에 키와 값을 줄 지정할 수 없음
		
		Map orderDetailInfo = new HashMap<>();
		orderDetailInfo = orderService.OrderHistoryDetail(orderId);
	
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		mav.addObject("orderDetailInfo", orderDetailInfo);
	
		
		
		return mav;
	}
	

	@Override
	@RequestMapping(value="/myPage/myPage_review.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectUserReview(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.getParameter("id"); 
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		session.setAttribute("selectedTab", "tab-1");
		
		Map userReviewInfo = new HashMap<>();
		userReviewInfo = orderService.selectUserReview(id);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		mav.addObject("userReviewInfo",userReviewInfo);
		return mav;
	}
	/* 팝업창에서 선택한 쿠폰 적용 */
	@Override
	@PostMapping(value="/order/couponApply.do")
	@ResponseBody
	public Map<String, Object> couponApply(@RequestBody Map<String, Object> couponInfo, HttpServletRequest request)
			throws Exception {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		responseMap =  orderService.couponApply(couponInfo);
		
		return responseMap;
	}
	/* 한 개 상품 주문 취소 누를 시 상태 업데이트 */
	@Override
	@RequestMapping(value="/myPage/deliveryCancelUpdate.do" , method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deliveryCancelUpdate(@RequestParam("order_seq_num") int order_seq_num
			,@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(); 
		session.setAttribute("side_menuType", "my_page"); 
	
		orderService.deliveryCancelUpdate(order_seq_num);
	
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.setViewName("redirect:/myPage/myPage_02.do?orderId="+orderId);
		return mav;
	}
/* 전체 상품 주문 취소 누를 시 상태 업데이트 */
	@Override
	@RequestMapping(value="/myPage/deliveryAllCancelUpdate.do", method ={ RequestMethod.POST, RequestMethod.GET } )
	public ModelAndView deliveryAllCancelUpdate(String orderId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(); 
		session.setAttribute("side_menuType", "my_page"); 
		
		orderService.deliveryAllCancelUpdate(orderId);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.setViewName("redirect:/myPage/myPage_02.do?orderId="+orderId);
		return mav;
	}
	
	
	
}

	
	
