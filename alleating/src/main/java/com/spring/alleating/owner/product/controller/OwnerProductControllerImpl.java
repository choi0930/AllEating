package com.spring.alleating.owner.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

	

	@RequestMapping(value="/owner/addNewProduct.do" ,method={RequestMethod.POST})
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
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
			System.out.println(productId);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ProductImgVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+ imageFileName);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('��ǰ�� ��ϵǾ����ϴ�.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/owner/productMain.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ProductImgVO  productImgVO:imageFileList) {
					imageFileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/owner/productMain.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	
	

	@Override
	@RequestMapping(value="/owner/addNewProductImg.do" ,method={RequestMethod.POST})
	public void addNewProductImg(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		System.out.println("addNewProductImg");
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map productMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			productMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember");
		String reg_id = memberVO.getId();
		
		List<ProductImgVO> imageFileList=null;
		int productId=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(ProductImgVO productImgVO : imageFileList) {
					productId = Integer.parseInt((String)productMap.get("productId"));
					productImgVO.setProductId(productId);
					productImgVO.setReg_id(reg_id);
				}
				
			   ownerProductService.addNewProductImg(imageFileList);
				for(ProductImgVO  productImgVO:imageFileList) {
					imageFileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+ imageFileName);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ProductImgVO  productImgVO:imageFileList) {
					imageFileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
	}

	

	

}
