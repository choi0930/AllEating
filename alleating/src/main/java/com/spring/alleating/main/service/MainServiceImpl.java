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
public Map selectMainProductDetail(String productId) throws DataAccessException {
	ProductVO mainDetailVO =  mainDAO.selectMainProductDetail(productId);
	List<ProductImgVO> mainDetailList =  mainDAO.selectMainProductDetailImage(productId);
	/*String reg_id = vo.getReg_id();*/
	
	Map mainDetailInfo = new HashMap();
	
	mainDetailInfo.put("productVO", mainDetailVO);
	mainDetailInfo.put("productImgList", mainDetailList);
	System.out.println(mainDetailList.size());
	
	
	return mainDetailInfo;
}
}
