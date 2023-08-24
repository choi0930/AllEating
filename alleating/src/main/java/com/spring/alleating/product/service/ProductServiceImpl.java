package com.spring.alleating.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.dao.ProductDAO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public Map selectUserProductDetail(int productId) throws DataAccessException {
		
		
		
		ProductVO userProductVO =  productDAO.selectUserProductDetail(productId);
		List<ProductImgVO> userProductImglist =  productDAO.selectUserProductDetailImage(productId);
		
		String reg_id = userProductVO.getReg_id();
		MemberVO userVO = productDAO.selectUserByRegId(reg_id);
		
		/*
		 * String cateCode = userProductVO.getCateCode(); 
		 * ProductVO productCategory =
		 * productDAO.selectUserBycateCode(cateCode);
		 */
		
		
		Map userProductInfo = new HashMap();
		userProductInfo.put("userProductVO",userProductVO);
		userProductInfo.put("userProductImglist", userProductImglist);
		userProductInfo.put("userVO", userVO);
		/* userProductInfo.put("productCategory", productCategory); */
	
		
		return userProductInfo;
		
		
	}

	@Override
	public Map selectnewProductDetail(Map newproductid) throws DataAccessException {
		Map newproductInfo = new HashMap();
		newproductid.put("productStatus", "newProduct");
		List<ProductVO> newproduct = productDAO.selectnewProductDetail(newproductid);
		return newproductid;
	}
	
	

	public List selectCateProduct(Map bbbInfo) throws DataAccessException {
		
		Map cccInfo = new HashMap();
		/*
		 * Map aaaInfo = new HashMap();
		 * 
		 * aaaInfo.put("cateCode", "smallCateList"); List<ProductVO> aaaList =
		 * productDAO.selectCateProduct(aaaInfo);
		 */
		
		/*
		 * bbbInfo.put("aaaList", aaaList); List<ProductVO> bbbList =
		 * productDAO.selectCateProduct(bbbInfo);
		 */
		
		//bbbInfo.put("cateCode", "smallCateList");
		List<ProductVO> cateCode = productDAO.selectCateProduct(bbbInfo);
		//System.out.println(cateCode.size() + "리스트 값 출력");
		
		
		/*
		 * cccInfo.put("aaaList", aaaList); cccInfo.put("bbbList", bbbList);
		 */
		
		//cccInfo.put("cateCode", cateCode);
		
		return  cateCode;
	}
	

}
