package com.spring.alleating.admin.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.order.service.AdminOrderService;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
@Controller("adminOrderController")
public class AdminOrderControllerImpl implements AdminOrderContorller {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@Autowired
	private AllEatingOrderVO alleatingOrderVO;
	@Autowired
	private AllEatingOrderDetailVO allEatingOrderDetailVO;
	
	@Override
	@RequestMapping(value="/admin/adminOrderList.do", method = RequestMethod.GET)
	public ModelAndView adminOrderList(Map<String, String> dataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");
		
		Map<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}
		condMap.put("section",section);
		condMap.put("pageNum",pageNum);
		
		Map adminOrderMap = new HashMap();
		adminOrderMap = adminOrderService.adminOrderList(condMap);
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminOrderMap", adminOrderMap);
		mav.setViewName(viewName);
		return mav;
	}

}
