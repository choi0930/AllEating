package com.spring.alleating.owner.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.owner.product.service.OwnerProductService;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;


@Controller("ownerProductController")
public class OwnerProductControllerImpl extends BaseController implements OwnerProductController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image_repo";
	@Autowired
	private OwnerProductService ownerProductService;
	@Autowired
	private ProductVO productVO;
	
	@RequestMapping(value="/owner/productMain.do", method = RequestMethod.GET)
	public ModelAndView ownerProductMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		session.setAttribute("side_menuType", "owner_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
	
	
//사업자 상품관리 리스트
	@Override
	@RequestMapping(value= "/owner/ownerProductList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ownerProductList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "owner_page");

		String viewName = (String)request.getAttribute("viewName");
		List<ProductVO> ownerProductList = ownerProductService.ownerProductList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("ownerProductList", ownerProductList);
		return mav;
	}





	@RequestMapping(value="/owner/addNewProduct.do" ,method={RequestMethod.POST})
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map newProductMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newProductMap.put(name,value);
		}
		
		
		
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String reg_id = memberVO.getId();
		String join_type = memberVO.getJoin_type();
		newProductMap.put("reg_id", reg_id);//제품 등록자 id 입력
		newProductMap.put("join_type", join_type); //제품 등록자가 관리자등급인지 사업자 등급인지 입력
		
		List<ProductImgVO> imageFileList =upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(ProductImgVO productImgVO : imageFileList) {
				productImgVO.setReg_id(reg_id);
			}
			newProductMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int productId = ownerProductService.addNewProduct(newProductMap);
			String cateCode = (String) newProductMap.get("cateCode");
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ProductImgVO  productImgVO:imageFileList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+cateCode+"\\"+productId);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('새로운 상품등록 요청하였습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/owner/ownerProductList.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ProductImgVO  productImgVO:imageFileList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('요청 실패');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/owner/ownerProductList.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	
	

	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/owner/addNewProductImg.do"
	 * ,method={RequestMethod.POST}) public void
	 * addNewProductImg(MultipartHttpServletRequest multipartRequest,
	 * HttpServletResponse response) throws Exception {
	 * System.out.println("addNewProductImg");
	 * multipartRequest.setCharacterEncoding("utf-8");
	 * response.setContentType("text/html; charset=utf-8"); String fileName=null;
	 * 
	 * Map productMap = new HashMap(); Enumeration
	 * enu=multipartRequest.getParameterNames(); while(enu.hasMoreElements()){
	 * String name=(String)enu.nextElement(); String
	 * value=multipartRequest.getParameter(name); productMap.put(name,value); }
	 * 
	 * HttpSession session = multipartRequest.getSession(); MemberVO memberVO =
	 * (MemberVO) session.getAttribute("loginMember"); String reg_id =
	 * memberVO.getId(); String join_type = memberVO.getJoin_type();
	 * 
	 * productMap.put("reg_id", reg_id); productMap.put("join_type", join_type);
	 * List<ProductImgVO> imageFileList =upload(multipartRequest);
	 * if(imageFileList!= null && imageFileList.size()!=0) { for(ProductImgVO
	 * productImgVO : imageFileList) { productImgVO.setReg_id(reg_id); }
	 * productMap.put("imageFileList", imageFileList);
	 * 
	 * 
	 * try {
	 * 
	 * 
	 * 
	 * ownerProductService.addNewProductImg(imageFileList); for(ProductImgVO
	 * productImgVO:imageFileList) { imageFileName = productImgVO.getFileName();
	 * File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	 * File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+ imageFileName);
	 * FileUtils.moveFileToDirectory(srcFile, destDir,true); } } }catch(Exception e)
	 * { if(imageFileList!=null && imageFileList.size()!=0) { for(ProductImgVO
	 * productImgVO:imageFileList) { imageFileName = productImgVO.getFileName();
	 * File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	 * srcFile.delete(); } } e.printStackTrace(); } }
	 */

	

	//폼이동
	@RequestMapping(value="/owner/*Form.do",method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
