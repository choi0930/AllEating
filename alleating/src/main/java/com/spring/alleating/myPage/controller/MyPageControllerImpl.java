package com.spring.alleating.myPage.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.myPage.service.MyPageService;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.WishVO;
import com.spring.alleating.product.vo.ProductVO;

@Controller("myPagecontroller")
public class MyPageControllerImpl implements MyPageController {

	@Autowired
	private MyPageService myPageService;
	@Autowired
	private UserCouponVO userCouponVO;
	@Autowired
	private WishVO wishVO;
	@Autowired
	private ProductVO productVO;
	

	/* 마이페이지 쿠폰 등록페이지 */
	@Override
	@RequestMapping(value = "/myPage/myPage_coupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_coupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();
		List<UserCouponVO> couponList = myPageService.listCoupon(id);

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("couponList", couponList);
		mav.setViewName(viewName);
		return mav;
	}
	/*----------------------------------------마이페이지 쿠폰등록 페이지 끝----------------------------------------------------*/

	/* 마이페이지 쿠폰 등록 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/myPage/addCoupon.do", method = { RequestMethod.POST })
	public String myPage_addCoupon(@RequestParam("couponId") String couponId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();
		userCouponVO.setCouponId(couponId);
		userCouponVO.setId(id);
		int result = myPageService.addUserCoupon(userCouponVO);
		Map userInfo = myPageService.getUserPointAndCouponInfo(id);
		
		
		int couponCount = (int) userInfo.get("couponCount");
		session.setAttribute("couponCount", couponCount);
		String msg = "";

		switch (result) {
		case 1:
			msg = "쿠폰 등록 성공";
			break;
		case 2:
			msg = "없는 쿠폰입니다.";
			break;
		case 3:
			msg = "이미 등록한 쿠폰입니다.";
			break;
		default:
			msg = "쿠폰 등록에 실패하였습니다.";
			break;
		}

		return msg;
	}
	/*----------------------------------------마이페이지 등록 끝----------------------------------------------------*/

	/* 마이페이지: 배송지관리 목록 */
	@Override
	@RequestMapping(value = "/myPage/myPage_address.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_address(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String id = memberVO.getId();

		Map newAddressMap = new HashMap<>();
		newAddressMap.put("id", id);
		List<DeliveryAddressVO> addressList = myPageService.listAddress(newAddressMap); // 로그인 한 유저 배송지 정보목록 list 가져옴

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("addressList", addressList);
		mav.setViewName(viewName);
		return mav;
	}
	/*----------------------------------------마이페이지: 배송지관리 목록 끝----------------------------------------------------------*/

	/* 마이페이지: 배송지 추가 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/myPage/myPage_addAddress.do", method = RequestMethod.POST)
	public String myPage_addDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");

		String id = memberVO.getId();
		deliveryAddressVO.setId(id); // 로그인한사람 id set

		int result = myPageService.addDeliveryAddress(deliveryAddressVO);
		String msg = "";
		if (result == 1) {
			msg = "배송지 추가완료";
		} else {
			msg = "추가 실패";
		}
		return msg;
	}
	/*----------------------------------------마이페이지: 배송지 추가 끝----------------------------------------------------------*/

	/* 마이페이지: 배송지 삭제 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/myPage/myPage_delAddress.do", method = RequestMethod.POST)
	public String myPage_delDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");

		String id = memberVO.getId();
		deliveryAddressVO.setId(id); // 로그인한사람 id set
		int result = myPageService.deleteAddress(deliveryAddressVO);

		String msg = "";
		if (result == 1) {
			msg = "배송지 삭제완료";
		} else {
			msg = "삭제 실패";
		}
		return msg;
	}
	/*----------------------------------------마이페이지: 배송지 삭제 끝----------------------------------------------------------*/

	/* 마이페이지: 기본 배송지 변경 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/myPage/myPage_modDefaultAddress.do", method = RequestMethod.POST)
	public String myPage_modDefaultDlieveryAddress(@RequestBody DeliveryAddressVO deliveryAddressVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");

		String id = memberVO.getId();
		deliveryAddressVO.setId(id); // 로그인한사람 id set
		int result = myPageService.changeDefaultAddress(deliveryAddressVO);

		String msg = "";
		if (result == 1) {
			msg = "기본 배송지 변경 완료";
		} else {
			msg = "배송지 변경 실패";
		}
		return msg;
	}
	/*----------------------------------------마이페이지: 기본 배송지 변경 끝----------------------------------------------------------*/
	
	/*마이페이지: 배송지 수정*/
	@Override
	@GetMapping(value="/myPage/modDeliveryPop.do")
	public String myPage_modifyDlieveryAddress(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String num = request.getParameter("num");
			int _num = Integer.parseInt(num);
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
			String id = memberVO.getId();
			
			Map info = new HashMap<>();
			info.put("num",_num);
			info.put("id", id);
			
			DeliveryAddressVO deliveryAddressVO = myPageService.addressInfo(info);
			
			model.addAttribute("deliveryAddressVO", deliveryAddressVO);
		return "/myPage/modDeliveryPop";
	}
	/*----------------------------------------마이페이지: 배송지 수정 끝----------------------------------------------------------*/
	@Override
	@RequestMapping(value = "/myPage/myPage_productQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_productQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/myPage_edit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/myPage_edit02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_edit02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", memberVO);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/myPage_reserves.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_reserves(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/myPage_secession.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPage_secession(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/productCancel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/productExchange.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productExchange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/myPage/productReturn.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productReturn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/myPage/*Form.do", method = { RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

/////////////////////////마이페이지- 찜목록///////////////////////

	@Override
	@RequestMapping(value = "/myPage/myPage_wish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectWishList(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "my_page");

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		Map _wishMap = new HashMap<>();
		_wishMap.put("id", id);

		List wishList = myPageService.selectWishList(_wishMap);
		mav.addObject("wishList", wishList);
		return mav;
	}


	@Override
	@RequestMapping(value="/myPage/myPage_addWish.do", method ={ RequestMethod.POST, RequestMethod.GET })
	public int insertWish(WishVO wishVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");

		String id = memberVO.getId();
		wishVO.setId(id); 
		
		String _productId = request.getParameter("heartProductId");
		int productId = Integer.parseInt(_productId);
		wishVO.setProductId(productId);
		
		int insertWish = myPageService.insertWish(wishVO);
		return insertWish;
	}

	@Override
	@RequestMapping(value="/myPage/myPage_delWish.do", method ={ RequestMethod.POST, RequestMethod.GET })
	public int deleteWish(WishVO wishVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");

		String id = memberVO.getId();
		wishVO.setId(id); 
		
		int productId = productVO.getProductId();
		wishVO.setProductId(productId);
		
		int deleteWish = myPageService.deleteWish(wishVO);
		return deleteWish;
	}
	


	 

	////////////////////// 마이페이지 - 찜목록 끝///////////////////////
}
