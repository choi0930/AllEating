package com.spring.alleating.owner.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.owner.product.service.OwnerProductService;
import com.spring.alleating.product.vo.ProductVO;

@Controller("ownerProductController")
public class OwnerProductControllerImpl implements OwnerProductController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image";
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

	
	@Override
	@RequestMapping(value= "/owner/addproduct.do" , method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, String> productMap = new HashMap<String, String>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String productId = (String)enu.nextElement();
			String value = multipartRequest.getParameter(productId);
			productMap.put(productId,value);
		}
		String fileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		ProductVO productVO = (ProductVO)session.getAttribute("productlist");

		productMap.put("fileName", fileName);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		try {
			ownerProductService.addProduct(productMap);
			int productId = ownerProductService.addProduct(productMap);
			String cateCode = productMap.get("cateCode");
			if(fileName != null && fileName.length()!=0) {
				File srcFile = new File(PRODUCT_IMAGE_REPO+ "\\" + "temp" + "\\" + fileName);
				File destDir = new File(PRODUCT_IMAGE_REPO+ "\\" + cateCode + "\\" +productId);
				
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
			}
			message ="<script>";
			message += " alert('성공');";
			message += " location.href='"+multipartRequest.getContextPath()+"/owner/productMain.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	
		} catch (Exception e) {
			File srcFile = new File(PRODUCT_IMAGE_REPO+"\\" + "temp" +"\\"+fileName);
			srcFile.delete();
			
			message = "<script>";
			message += " alert('실패.'); ";
			message += " location.href='"+multipartRequest.getContextPath()+"/owner/productMain.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();

		}
		return resEnt;
	}
	
	
	
	
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(PRODUCT_IMAGE_REPO+"\\"+"temp" +"\\" +fileName);
			if(mFile.getSize()!=0){//File Null Check
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO + "\\" +"temp" +"\\" + image));
				}
			}
		}
		return image;	
	}




	

}
