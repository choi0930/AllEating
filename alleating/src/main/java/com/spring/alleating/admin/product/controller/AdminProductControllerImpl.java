package com.spring.alleating.admin.product.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.product.service.AdminProductService;
import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Controller("adminProductController")
public class AdminProductControllerImpl extends BaseController implements AdminProductController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image_repo";
	@Autowired
	private AdminProductService adminProductService;
	
	@Autowired
	private ProductVO productVO;
	
	@Autowired
	private ProductImgVO productImgVO;
	
	@Override //상품관리 페이지 첫 진입
	@RequestMapping(value="/admin/productMain.do", method = RequestMethod.GET)
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "admin_page");
		session.setAttribute("selectedTab", "tab-1");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override // 관리자 예약배송 상품 등록
	@RequestMapping(value="/admin/addNewProduct.do", method = RequestMethod.POST)
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName = null;
		
		Map newProductMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newProductMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String reg_id = memberVO.getId();
		String name = memberVO.getName();
		
		List<ProductImgVO> imageFileList = upload(multipartRequest);
		if(imageFileList != null && imageFileList.size() != 0) {
			for(ProductImgVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			newProductMap.put("imageFileList", imageFileList);
		}
		
		
		
		
		return null;
	}
	
	//폼이동
	@RequestMapping(value="/admin/*Form.do",method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		session.setAttribute("selectedTab", "tab-2");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
