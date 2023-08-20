package com.spring.alleating.admin.product.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.product.dao.AdminProductDAO;
import com.spring.alleating.product.vo.ProductImgVO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductDAO adminProductDAO;
	
	@Override
	public Map selectAllProduct(Map info) throws DataAccessException {
		
		return null;
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
	
	
}
