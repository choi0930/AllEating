package com.spring.alleating.owner.product.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.owner.product.dao.OwnerProductDAO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Service("ownerProductService")

public class OwnerProductServiceImpl implements OwnerProductService {


	@Autowired
	private OwnerProductDAO ownerProductDAO;
	
	@Override
	public int addNewProduct(Map productInfo) throws Exception{
		String discount = (String) productInfo.get("discount");
		String _productDiscount = (String) productInfo.get("productDiscount");
		String _productPrice = (String) productInfo.get("productPrice");
		//상품 정보 등록
		if(discount!=null) { //할인상품 일때
			int productDiscountPercentage = Integer.parseInt(_productDiscount);
			int productPrice = Integer.parseInt(_productPrice); 
			
			double productDiscountFactor = productDiscountPercentage / 100.0; // 나눗셈 결과를 실수로 얻기 위해 100.0으로 나눔
			int productRound = (int) (productPrice * (1 - productDiscountFactor)); // 할인율을 올바르게 적용하여 할인 가격 계산
			int lastDigit = productRound % 10; // product의 숫자의 마지막 자릿수 추출
			int productSalesPrice = productRound + ( 10 - lastDigit); //다음 10의 배수로 올림
			
			
			
			
			productInfo.put("productSalesPrice",productSalesPrice);
		}else {//할인 상품이 아닐때
			productInfo.put("productSalesPrice", 0);
			productInfo.put("productDiscount", 0);
		}
		productInfo.put("deliveryType","normal"); //일반배송
		productInfo.put("deliveryPrice", 3000);
		
		ownerProductDAO.insertNewProduct(productInfo);
		String _productId = (String) productInfo.get("productId");
			int productId = Integer.parseInt(_productId);
			
		//이미지파일 이름 및 정보 DB에 등록
		ArrayList<ProductImgVO>	imageFileList = (ArrayList)productInfo.get("imageFileList");
		for(ProductImgVO productImgVO : imageFileList) {
			productImgVO.setProductId(productId);
			ownerProductDAO.insertProductImageFile(productImgVO);
		}
		
		return productId;
	}
	
	/*
	 * @Override public int removeproduct(int productId) throws DataAccessException
	 * { return OwnerProductDAO }
	 */
	
	
	
	/*
	 * @Override public Map productDetail(int productId) throws Exception { Map
	 * productMap = new HashMap(); ProductVO
	 * productVO=ownerProductDAO.selectProductDetail(productId); List imageFileList
	 * =ownerProductDAO.selectProductImageFileList(productId);
	 * productMap.put("product", productVO); productMap.put("imageFileList",
	 * imageFileList); return productMap; }
	 * 
	 * @Override public List productImageFile(int productId) throws Exception{ List
	 * imageList =ownerProductDAO.selectProductImageFileList(productId); return
	 * imageList; }
	 */





	@Override
	public List<ProductVO> ownerProductList() throws Exception {
		List<ProductVO> ownerProductList = ownerProductDAO.selectAllOwnerProductList();
		return ownerProductList;
	}


	

	/*
	 * @Override public int addProduct(Map productMap) throws Exception {
	 * 
	 * double num = Math.random(); int productId = (int)(num * 899999);
	 * 
	 * 
	 * ownerProductDAO.insertProduct(productMap);
	 * 
	 * 
	 * return productId; }
	 */
	
	




		
	}



	

