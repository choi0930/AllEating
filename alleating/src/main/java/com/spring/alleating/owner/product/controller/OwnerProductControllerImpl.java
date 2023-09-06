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
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.alleating.common.base.BaseController;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.owner.product.service.OwnerProductService;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;


@Controller("ownerProductController")
public class OwnerProductControllerImpl extends BaseController implements OwnerProductController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image_repo";
	@Autowired
	private OwnerProductService ownerProductService;
	@Autowired
	private ProductVO productVO;
	@Autowired
	private InquiryBoardVO inquiryBoardVO;
	
	@RequestMapping(value="/owner/productMain.do", method = RequestMethod.GET)
	public ModelAndView ownerProductMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		session.setAttribute("side_menuType", "owner_page");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
	
	
//�궗�뾽�옄 �긽�뭹愿�由� 由ъ뒪�듃
	@Override
	@RequestMapping(value= "/owner/ownerProductList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ownerProductList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menuType", "owner_page");
	
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		String owner_name = memberVO.getOwner_name();
		System.out.println("회사이름"+ owner_name);

		String viewName = (String)request.getAttribute("viewName");
		List<ProductVO> ownerProductList = ownerProductService.ownerProductList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("ownerProductList", ownerProductList);
		return mav;
	}




	@Override 
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
		String reg_com_name = memberVO.getOwner_name();
		newProductMap.put("reg_com_name", reg_com_name);//사업자 회사명
		newProductMap.put("reg_id", reg_id);//�젣�뭹 �벑濡앹옄 id �엯�젰
		newProductMap.put("join_type", join_type); //�젣�뭹 �벑濡앹옄媛� 愿�由ъ옄�벑湲됱씤吏� �궗�뾽�옄 �벑湲됱씤吏� �엯�젰
		
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
			message += " alert('새로운 상품등록 요청했습니다.');";
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
			message += " alert('요청실패');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/owner/ownerProductList.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	 @Override
	 @RequestMapping(value = "/owner/deleteProduct.do", method = RequestMethod.GET)
	 public ModelAndView deleteProduct(@RequestParam("productId") int productId, HttpServletRequest request, 
			 HttpServletResponse response) throws Exception { request.setCharacterEncoding("utf-8"); 
			 System.out.println("productId" + productId);
			 ownerProductService.removeproduct(productId); 
			 ModelAndView mav = new ModelAndView("redirect:/owner/ownerProductList.do");
				return mav;	 	
	}
		
	 	/* 수정한 사업자 상품 정보를 띄어주는 */
//	   @RequestMapping(value="/owner/ownerupdateproduct.do"
//	   ,method={RequestMethod.GET,RequestMethod.POST}) 
//	   public ModelAndView ownerupdateproduct(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception {
//	   String viewName=(String)request.getAttribute("viewName"); 
//	   ModelAndView mav = new ModelAndView(viewName); 
//	   Map goodsMap= ownerProductService.productDetail(productId);
//	   mav.addObject("goodsMap",goodsMap); 
//	   return mav; 
//	   }
	  
	   
	   
		/* 사업자 상품 수정 정보 불러오는 */
		@Override
		@RequestMapping(value="/owner/ownerupdateproduct.do", method = RequestMethod.GET)
		public ModelAndView ownerupdateproduct(int productId, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			Map producteditInfo = new HashMap<>();
			producteditInfo = ownerProductService.productEditService(productId);
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.addObject("producteditInfo", producteditInfo);
			mav.setViewName(viewName);
			return mav;
		}
	 
		
		/* 사업자 상품문의 관리(미완) */
		@Override
		@RequestMapping(value="/owner/ownerinquirylist.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView ownerinquirylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			session.setAttribute("side_menuType", "owner_page");
			String viewName = (String) request.getAttribute("viewName");
			List ownerinquirylist = ownerProductService.listArticles();
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("ownerinquirylist", ownerinquirylist);
			return mav;
		}
		
		
		
//		@RequestMapping(value="/owner/addOwnerInquiry.do", method = {RequestMethod.POST,RequestMethod.GET})
//		public ModelAndView addOwnerInquiry(Map<String, String> articleMap, HttpServletRequest request,
//				HttpServletResponse response) throws Exception {
//		
//			String viewName = (String)request.getAttribute("viewName");
//			System.out.println(viewName); 
//			
//			ownerProductService.addNewArticle(articleMap);
//			
//			ModelAndView mav = new ModelAndView();
//			mav.setViewName("redirect:/owner/ownerinquirylist.do"); //add
//			return mav;
//		}
		
		
		
			@Override 
			@RequestMapping(value="/owner/viewArticle.do", method = RequestMethod.GET)
			public ModelAndView viewArticle(@RequestParam("articleNO")int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			inquiryBoardVO = ownerProductService.viewArticle(articleNO);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("inquiryBoardVO", inquiryBoardVO);
			return mav;
		}
			
			@Override 
			@RequestMapping(value="/owner/memviewArticle.do", method = RequestMethod.GET)
			public ModelAndView memviewArticle(@RequestParam("articleNO")int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String viewName = (String)request.getAttribute("viewName");
//			HttpSession session = request.getSession();
//			session.setAttribute("ownerinquiry", inquiryBoardVO);
//			
//			InquiryBoardVO inquiryboardVO = (InquiryBoardVO)session.getAttribute("ownerinquiry");
//			
//			String parentNO = inquiryboardVO.getParentNO();
			
			inquiryBoardVO = ownerProductService.viewArticle(articleNO);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("inquiryBoardVO", inquiryBoardVO);
			return mav;
		}
			
			@Override 
			@RequestMapping(value="/owner/addReply.do", method = {RequestMethod.POST,RequestMethod.GET})
			public ModelAndView addReply(Map<String, String> replyMap, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
			
				String viewName = (String)request.getAttribute("viewName");
				System.out.println(viewName); 
				
				ownerProductService.addReplyArticle(replyMap);
				
				ModelAndView mav = new ModelAndView();
				mav.setViewName("redirect:/owner/ownerinquirylist.do"); 
				return mav;
			}	
			
			
			
			@Override 
			@RequestMapping(value="/owner/memberreply.do",method = RequestMethod.GET)
			public ModelAndView memberreply(HttpServletRequest request, HttpServletResponse response)throws Exception{
				String viewName = (String) request.getAttribute("viewName");
	
				String parentNO = request.getParameter("parentNO");
				
				System.out.println(parentNO);

				ModelAndView mav = new ModelAndView();
				mav.setViewName(viewName);
				mav.addObject("parentNO",parentNO);
				return mav;
			}
			
			@Override 
			@RequestMapping(value="/owner/removeArticle.do", method = RequestMethod.GET)
			public ModelAndView removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
				System.out.println("asfasfafsafasfasfafasfsafasfafasfas");
			ownerProductService.removeArticle(articleNO);
			ModelAndView mav = new ModelAndView("redirect:/owner/ownerinquirylist.do");
			return mav;
		}
	
			@Override
			@RequestMapping(value="/owner/updateArticle.do", method = RequestMethod.GET)
			public ModelAndView updateArticle(Map<String, String> articleMap, HttpServletRequest request, HttpServletResponse response)
					throws Exception {		
				int result = 0;
				result = ownerProductService.modArticle(articleMap);
				ModelAndView mav = new ModelAndView("redirect:/owner/ownerinquirylist.do");
				return mav;

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


	//�뤌�씠�룞
	@RequestMapping(value="/owner/*Form.do",method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();	
		/* session.setAttribute("ownerinquiry", inquiryBoardVO); */
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");	
		/*
		 * InquiryBoardVO inquiryboardVO =	
		 * (InquiryBoardVO)session.getAttribute("ownerinquiry");
		 * 
		 * String parentNO = inquiryboardVO.getParentNO();
		 */
		String parentNO = request.getParameter("parentNO");
		String id = memberVO.getId();
		System.out.println("작성자"+ id);
		System.out.println(parentNO);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}



	//사업자 상품 수정
	@Override
	@ResponseBody
	@RequestMapping(value="/owner/modfiyImgInfo.do", method = RequestMethod.POST)
	public void modImgInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
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
		int imgId=0;
		
		try {
			imageFileList =upload(multipartRequest);
			System.out.println("아:"+imageFileList.size());
			
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(ProductImgVO productImgVO : imageFileList) {
					productId = Integer.parseInt((String)productMap.get("productId"));
					imgId = Integer.parseInt((String)productMap.get("imgId"));
					productImgVO.setProductId(productId);
					productImgVO.setImgId(imgId);
					productImgVO.setReg_id(reg_id);
				}
				String cateCode = (String) productMap.get("cateCode");
				String originalFileName = (String)productMap.get("original_img");
				System.out.println("아:"+originalFileName);
			    ownerProductService.modifyProductImage(imageFileList);
				for(ProductImgVO  productImgVO:imageFileList) {
					imageFileName = productImgVO.getFileName();
					System.out.println(imageFileName);
					File srcFile = new File(PRODUCT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(PRODUCT_IMAGE_REPO+"\\"+cateCode+"\\"+productId);
					
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
				File delFile = new File(PRODUCT_IMAGE_REPO+"\\"+cateCode+"\\"+productId+"\\"+originalFileName);
				delFile.delete();
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




	@Override
	
	@RequestMapping(value="/owner/delImgInfo.do", method = RequestMethod.POST)
	public void delProductImg(String productId, String imgId, String fileName, String cateCode,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ownerProductService.delProductImage(imgId);
		try {
			File delFile = new File(PRODUCT_IMAGE_REPO+"\\"+cateCode+"\\"+productId+"\\"+fileName);
			delFile.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}




	@Override
	@ResponseBody
	@RequestMapping(value="/owner/modProductInfo.do", method = RequestMethod.POST)
	public String modProductInfo(ProductVO productVO, HttpServletRequest request, HttpServletResponse response)
			throws DataAccessException {
		ownerProductService.modProductInfo(productVO);
		return "상품이 수정되었습니다.";
	}


}
