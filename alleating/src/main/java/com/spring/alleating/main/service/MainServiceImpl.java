package com.spring.alleating.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.main.dao.MainDAO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;

@Service("mainService")
public class MainServiceImpl implements MainService{

	@Autowired MainDAO mainDAO;
	
@Override
public Map selectMainProductDetail(Map productPeriod) throws DataAccessException {

	Map mainDetailInfo = new HashMap();
	Map differenceInfo = new HashMap();
	// 메인 할인상품 리스트
	differenceInfo.put("productStatus", "discount");
	List<ProductVO> saleList = mainDAO.selectMainProductDetail(differenceInfo);
	
	
	//메인 신상품 리스트
	productPeriod.put("productStatus", "newProduct");
	List<ProductVO> newList = mainDAO.selectMainProductDetail(productPeriod);
	

	mainDetailInfo.put("saleList", saleList);
	mainDetailInfo.put("newList", newList);

	return mainDetailInfo;
}
}
