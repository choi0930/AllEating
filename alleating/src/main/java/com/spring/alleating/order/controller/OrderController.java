package com.spring.alleating.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.order.vo.AllEatingOrderDetailVO;

public interface OrderController {
	public ModelAndView oneProductOrder(@RequestParam("product_id")String productId, @RequestParam("qty")String qty, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public void orderAllCartProducts(@RequestBody List<AllEatingOrderDetailVO> allEatingOrderDetailes, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	public String pay(@RequestBody Map<String, Object> userOrder, HttpServletRequest request)throws Exception;
	
	public ModelAndView selectOrderNum(@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse response) throws Exception;


    public ModelAndView orderHistory(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView OrderHistoryDetail(@RequestParam("orderId") String orderId, HttpServletRequest request, HttpServletResponse resonse) throws Exception;
    
    public ModelAndView selectUserReview(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
    /*배송지 변경 팝업창*/
    public void deliveryChangePopUp(Model model, HttpServletRequest request)throws Exception;
    /*팝업창에서 선택한 쿠폰 적용*/
    public Map<String, Object> couponApply(@RequestBody Map<String, Object>couponInfo, HttpServletRequest request)throws Exception;
}
