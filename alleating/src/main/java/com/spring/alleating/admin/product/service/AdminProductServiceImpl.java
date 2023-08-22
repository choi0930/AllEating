package com.spring.alleating.admin.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.product.dao.AdminProductDAO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductDAO adminProductDAO;
	
	@Override
	public Map selectAllProduct(Map dataMap) throws DataAccessException {
		Map productMap = new HashMap<>();
		
		String join_type = "admin";
		dataMap.put("join_type", join_type);
		List<ProductVO> productAdminProductList = adminProductDAO.selectProduct(dataMap);
		int total = adminProductDAO.selectTotalProduct(join_type);
		
		join_type = "owner";
		dataMap.put("join_type", join_type);
		List<ProductVO> ownerProductList  = adminProductDAO.selectProduct(dataMap);
		int total2 = adminProductDAO.selectTotalProduct(join_type);
		
		List<MemberVO>ownerNameList = new ArrayList<MemberVO>();
		for(ProductVO vo : ownerProductList) {
			String reg_id = vo.getReg_id();
			MemberVO memberVO = adminProductDAO.selectMemberByRegId(reg_id);
			ownerNameList.add(memberVO);
		}
		
		productMap.put("productAdminProductList", productAdminProductList);
		productMap.put("total", total);
		productMap.put("ownerProductList", ownerProductList);
		productMap.put("total2", total2);
		productMap.put("ownerNameList", ownerNameList);
		return productMap;
	}

	
	
	@Override
	public Map selectAdminProduct(Map dataMap) throws DataAccessException {
		Map productMap = new HashMap<>();
		String join_type = "admin";
		dataMap.put("join_type", join_type);
		
		List<ProductVO> productAdminProductList = adminProductDAO.selectProduct(dataMap);
		int total = adminProductDAO.selectTotalProduct(join_type);
		
		productMap.put("productAdminProductList", productAdminProductList);
		productMap.put("total", total);
		return productMap;
	}



	@Override
	public int addProduct(Map productInfo) throws DataAccessException {
		String discount = (String) productInfo.get("discount");
		String _productDiscount = (String) productInfo.get("productDiscount");
		String _productPrice = (String) productInfo.get("productPrice");
		//상품 정보 등록
		if(discount!=null) { //할인상품 일때
			int productDiscountPercentage = Integer.parseInt(_productDiscount);
			int productPrice = Integer.parseInt(_productPrice); 
			
			double productDiscountFactor = productDiscountPercentage / 100.0; // 나눗셈 결과를 실수로 얻기 위해 100.0으로 나눔
			int productSalesPrice = (int) (productPrice * (1 - productDiscountFactor)); // 할인율을 올바르게 적용하여 할인 가격 계산
			
			productInfo.put("productSalesPrice",productSalesPrice);
		}else {//할인 상품이 아닐때
			productInfo.put("productSalesPrice", 0);
			productInfo.put("productDiscount", 0);
		}
		productInfo.put("deliveryType","reserve"); //예약배송
		
		productInfo.put("deliveryPrice", 3000);
		productInfo.put("productStatus","sale");
		adminProductDAO.insertNewProduct(productInfo);
		String _productId = (String) productInfo.get("productId");
			int productId = Integer.parseInt(_productId);
			
		//이미지파일 이름 및 정보 DB에 등록
		ArrayList<ProductImgVO>	imageFileList = (ArrayList)productInfo.get("imageFileList");
		for(ProductImgVO productImgVO : imageFileList) {
			productImgVO.setProductId(productId);
			adminProductDAO.insertProductImageFile(productImgVO);
		}
		
		return productId;
	}

	@Override
	public Map selectProductDetail(String productId) throws DataAccessException {
		ProductVO vo =  adminProductDAO.selectProductDetail(productId);
		List<ProductImgVO> list =  adminProductDAO.selectProductDetailImage(productId);
		String reg_id = vo.getReg_id();
		MemberVO vo3 = adminProductDAO.selectMemberByRegId(reg_id);
		Map productInfo = new HashMap();
		
		productInfo.put("productVO", vo);
		productInfo.put("productImgList", list);
		System.out.println(list.size());
		productInfo.put("memberVO", vo3);
		
		return productInfo;
	}
	
	
}
