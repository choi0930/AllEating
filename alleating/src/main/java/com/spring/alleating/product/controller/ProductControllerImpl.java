package com.spring.alleating.product.controller;

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


import com.mysql.cj.Session;
import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.product.service.ProductService;

@Controller("productController")
public class ProductControllerImpl extends BaseController implements ProductController {
	
	@Autowired
	ProductService productService;
	
	/* 카테고리별 상품 목록 */
	@Override
	@RequestMapping(value= "/product/product_01.do", method = RequestMethod.GET)
	public ModelAndView product_01(@RequestParam("category")String category,HttpServletRequest request, HttpServletResponse response)throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "product_01");
		session.setAttribute("category", category);
		
		String viewName = (String)request.getAttribute("viewName");	
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); 
		
		/* int cateCount = productService.selectCateCount(); */
		
		Map bbbInfo = new HashMap<>();
		bbbInfo.put("cateCode", category);
		/* bbbInfo.put("cateCount", cateCount); */
		List cateResult = productService.selectCateProduct(bbbInfo);
		
		mav.addObject("cateResult",cateResult);
		
		return mav;
	}	
	
	/* 헤더 검색바 검색기능 */
	@Override
	@RequestMapping(value="/product/search_01.do", method = RequestMethod.GET)
	public ModelAndView search_01(@RequestParam Map dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String section = (String) dataMap.get("section");
		String pageNum = (String) dataMap.get("pageNum");

		Map<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}

		 int _section = Integer.parseInt(section);
		 int _pageNum = Integer.parseInt(pageNum);
		 int offset = (_section-1) * 100 +(_pageNum-1) * 20;
		 
		 
		HttpSession session = request.getSession();
		String searchWord = (String) dataMap.get("searchWord");
		session.setAttribute("searchKeyWord", searchWord);
		
		condMap.put("offset",offset);
		condMap.put("searchWord", searchWord);
		
		Map productMap = productService.searchProduct(condMap);
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productMap", productMap);
		mav.setViewName(viewName); 
		return mav;
	}
	
	/* 신상품 페이지 */
	@Override
	@RequestMapping(value= "/product/new_product_01.do", method = RequestMethod.GET)
	public ModelAndView new_product_01(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		String section = dataMap.get("section");
		String pageNum = dataMap.get("pageNum");

		Map<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		
		if(pageNum== null) {
			pageNum = "1";
		}

		 int _section = Integer.parseInt(section);
		 int _pageNum = Integer.parseInt(pageNum);
		 int offset = (_section-1) * 100 +(_pageNum-1) * 20;
		 condMap.put("offset",offset);
		
		Map newproresult = productService.selectnewProductDetail(condMap);
		
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
	
		
		
		mav.addObject("newproresult",newproresult);
		
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value= "/product/best_product_01.do", method = RequestMethod.GET)
	public ModelAndView best_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); //add
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/product/sale_product_01.do", method = RequestMethod.GET)
	public ModelAndView sale_product_01(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "product_01");
		
	    Map saleProductInfo = new HashMap<>();
		Map saleresult = productService.selectSaleProduct(saleProductInfo);
		
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName); 
	
		
		
		mav.addObject("saleresult",saleresult);
		
		return mav;
	}
	
	//제품 상세페이지
	@Override
	@RequestMapping(value="/product/userProductDetail.do", method = RequestMethod.GET)
	public ModelAndView userProductDetail(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map userProductInfo = new HashMap<>();
		userProductInfo = productService.selectUserProductDetail(productId);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userProductInfo", userProductInfo);
		/* mav.addAttribute("productId", productId); */
		mav.setViewName(viewName);
		
		return mav;
}
}