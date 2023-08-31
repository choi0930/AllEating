package com.spring.alleating.owner.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.owner.order.service.OwnerOrderService;




@Controller("ownerOrderController")
public class OwnerOrderControllerImpl implements OwnerOrderController {

	@Autowired
	private OwnerOrderService ownerOrderService;
	
	//사업자 배송관리 리스트
//		@Override
//		@RequestMapping(value= "/owner/ownerOrderList.do", method = {RequestMethod.GET, RequestMethod.POST})
//		public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			HttpSession session = request.getSession();
//			session.setAttribute("side_menuType", "owner_page");
//			String viewName = (String)request.getAttribute("viewName");
//			List<AllEatingOrderVO> ownerOrderList = ownerOrderService.ownerOrderList();
//			ModelAndView mav = new ModelAndView(viewName);
//			mav.addObject("ownerOrderList", ownerOrderList);
//			return mav;
//		}

		@Override
		@RequestMapping(value="/owner/ownerOrderList.do", method = RequestMethod.GET)
		public ModelAndView ownerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			List orderlist = ownerOrderService.listOwnerOrder();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("orderlist", orderlist);
			mav.setViewName(viewName);
			return mav;
		}
			
		
		@Override
		@RequestMapping(value="/owner/ownerOrderHistoryDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView ownerOrderHistoryDetail(@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			HttpSession session = request.getSession();
			session.setAttribute("side_menuType", "owner_page");
			String viewName = (String) request.getAttribute("viewName");
	
			Map ownerOrderDetailInfo = new HashMap<>();
			ownerOrderDetailInfo = ownerOrderService.OnwerOrderHistoryDetail(orderId);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			mav.addObject("ownerOrderDetailInfo", ownerOrderDetailInfo);
			return mav;
		}
		

}
