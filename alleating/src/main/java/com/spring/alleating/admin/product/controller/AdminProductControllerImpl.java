package com.spring.alleating.admin.product.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.admin.product.service.AdminProductService;
import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

/* 관리자 페이지 상품관리 */

@Controller("adminProductController")
public class AdminProductControllerImpl extends BaseController implements AdminProductController {
	
	/*파일 업로드 위치*/
	private static final String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image_repo";
	
	@Autowired
	private AdminProductService adminProductService;
	
	@Autowired
	private ProductVO productVO;
	
	@Autowired
	private ProductImgVO productImgVO;
	
	/* 관리자페이지 관리자 상품 페이징 기능 */
	@Override
	@RequestMapping(value="/admin/listProducts.do", method = RequestMethod.GET)
	public ModelAndView listProducts(Map<String, String> dataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		/*사이드메뉴 타입 관리자페이지로 변경*/
		session.setAttribute("side_menuType", "admin_page");
		/*텝메뉴 2번으로 설정*/
		session.setAttribute("selectedTab", "tab-2");
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
		
		Map productMap = new HashMap();
		productMap = adminProductService.selectAdminProduct(condMap);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productMap", productMap);
		mav.setViewName("/admin/productMain");
		return mav;
	}
	/*---------------------------------관리자 상품 페이지 끝------------------------------------*/
	
	/*상품관리 페이지 첫 진입*/
	@Override
	@RequestMapping(value="/admin/productMain.do", method = RequestMethod.GET)
	public ModelAndView adminProduct(@RequestParam Map<String, String> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "admin_page");
		session.setAttribute("selectedTab", "tab-1");
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
		
		Map productMap = new HashMap();
		productMap = adminProductService.selectAllProduct(condMap);
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("productMap", productMap);
		mav.setViewName(viewName);
		return mav;
	}
	/*---------------------------------상품관리 페이지 첫 진입 끝------------------------------------*/
	
	/* 관리자 상품 등록 */
	@Override 
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
		MemberVO memberVO = (MemberVO) session.getAttribute("loginMember"); //세션에서 로그인한 사람의 정보가 담긴 memberVO객체 가져옴
		String reg_id = memberVO.getId();
		String join_type = memberVO.getJoin_type();
		
		newProductMap.put("reg_id", reg_id);//제품 등록자 id 입력
		newProductMap.put("join_type", join_type); //제품 등록자가 관리자등급인지 사업자 등급인지 입력
	
		 List<ProductImgVO> imageFileList = upload(multipartRequest); 
		 if(imageFileList != null && imageFileList.size() != 0) { 
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
			int productId = adminProductService.addProduct(newProductMap);
			String cateCode = (String) newProductMap.get("cateCode");
			if(imageFileList !=null && imageFileList.size() != 0) {
				for(ProductImgVO productImgVO:imageFileList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+cateCode+"\\"+productId);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message= "<script>";
			message += " alert('새로운 상품을 등록했습니다');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/productMain.do?selectedTab=tab-2';";
			message +=("</script>");
		} catch (Exception e) {
			e.printStackTrace();
			if(imageFileList !=null && imageFileList.size() != 0) {
				for(ProductImgVO productImgVO:imageFileList) {
					fileName = productImgVO.getFileName();
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
					srcFile.delete();
					}
				}
			message= "<script>";
			message += " alert('등록실패');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/adminAddProductForm.do;";
			message +=("</script>");
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	/*---------------------------------관리자 상품 등록 끝------------------------------------*/
	
	/* 상품관리 상세페이지 */
	@Override
	@RequestMapping(value="/admin/productDetail.do", method = RequestMethod.GET)
	public ModelAndView productDetail(String productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map productInfo = new HashMap<>();
		productInfo = adminProductService.selectProductDetail(productId);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("productInfo", productInfo);
		mav.setViewName(viewName);
		
		return mav;
	}
	/*---------------------------------상품관리 상세페이지 끝------------------------------------*/
	
	/* 사업자 상품 등록 승인 or 거절 */
	@Override
	@ResponseBody
	@RequestMapping(value="/admin/modifyProductStatus.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String modifyProductStatus(@RequestParam ("productId")String productId, @RequestParam("productStatus")String productStatus) throws Exception {
	    
		String data = "";
	   	int _productId = Integer.parseInt(productId);
	   	productVO.setProductId(_productId);
	   	productVO.setProductStatus(productStatus);
	    adminProductService.modifyProductStatus(productVO);
	    
	    Map<String, String> dataMap = new HashMap<>(); 
	    if(productStatus.equals("declined")) {
	        data = "요청 거절";
	    } else if(productStatus.equals("sale")) {
	    	data = "요청 승인";
	    }
	    return data;
	}
	/*---------------------------------사업자 상품 등록 승인 or 거절 끝------------------------------------*/
	
	/* 관리자 상품 수정 페이지 이동 */
	@Override
	@RequestMapping(value="/admin/adminModProductForm.do", method = RequestMethod.GET)
	public ModelAndView modProduct(@RequestParam("productId")String productId, HttpServletRequest request, HttpServletResponse response)throws Exception{
		Map productInfo = new HashMap<>();
		productInfo = adminProductService.selectProductDetail(productId);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("productInfo", productInfo);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/*---------------------------------관리자 상품 수정 페이지 이동 끝------------------------------------*/
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
