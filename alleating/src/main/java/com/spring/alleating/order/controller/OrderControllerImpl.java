package com.spring.alleating.order.controller;

import java.util.ArrayList;
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

import com.spring.alleating.cart.vo.CartVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.service.OrderService;
import com.spring.alleating.order.vo.OrderVO;
import com.spring.alleating.product.vo.ProductVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController{
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
		
		ProductVO productVO = orderService.oneProductOrder(orderMap);
		
		
		
		
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
		return mav;	
	}
	
	
	
	@Override
	@RequestMapping(value="/order/orderAllCartProducts.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView orderAllCartProducts(@RequestParam("cart_product_qtyy") String[] cart_product_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		Map cartMap=(Map)session.getAttribute("product_map");
		MemberVO memberVO=(MemberVO)session.getAttribute("loginMember");
		List myOrderList=new ArrayList();
		
		List<CartVO> myProductsList=(List<CartVO>)cartMap.get("reserveProductList");
		for(int i=0; i<cart_product_qty.length; i++){
			
			String[] cart_products=cart_product_qty[i].split(":");
			
			for(int j = 0; j< myProductsList.size();j++) {
				
				CartVO cartVO = myProductsList.get(j);
				int productId = cartVO.getProductId();
				
				if(productId == Integer.parseInt(cart_products[0])) {
					OrderVO _orderVO = new OrderVO();
					
					String productName = cartVO.getProductName();
					String productBrand = cartVO.getProductBrand();
					int productPrice = cartVO.getProductPrice();
					int productDiscount = cartVO.getProductDiscount();
					int productSalesPrice = cartVO.getProductSalesPrice();
					String fileName = cartVO.getFileName();
					
					_orderVO.setProductId(productId);
					_orderVO.setProductName(productName);
					_orderVO.setProductPrice(productPrice);
					_orderVO.setProductSalesPrice(productSalesPrice);
					_orderVO.setFileName(fileName);
					_orderVO.setProductQty(Integer.parseInt(cart_products[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
		}
		myProductsList=(List<CartVO>)cartMap.get("normalProductList");
		for(int i=0; i<cart_product_qty.length; i++){
			
			String[] cart_products=cart_product_qty[i].split(":");
			
			for(int j = 0; j< myProductsList.size();j++) {
				
				CartVO cartVO = myProductsList.get(j);
				int productId = cartVO.getProductId();
				
				if(productId == Integer.parseInt(cart_products[0])) {
					OrderVO _orderVO = new OrderVO();
					
					String productName = cartVO.getProductName();
					String productBrand = cartVO.getProductBrand();
					int productPrice = cartVO.getProductPrice();
					int productDiscount = cartVO.getProductDiscount();
					int productSalesPrice = cartVO.getProductSalesPrice();
					String fileName = cartVO.getFileName();
					
					_orderVO.setProductId(productId);
					_orderVO.setProductName(productName);
					_orderVO.setProductPrice(productPrice);
					_orderVO.setProductSalesPrice(productSalesPrice);
					_orderVO.setFileName(fileName);
					_orderVO.setProductQty(Integer.parseInt(cart_products[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
		}
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("order",memberVO );
		mav.setViewName("/order/pay_02");
		return mav;
	}

	@RequestMapping(value= "/order/pay_complete.do", method = RequestMethod.GET)
	public ModelAndView payComplete(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
}
