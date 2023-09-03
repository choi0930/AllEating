package com.spring.alleating.owner.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.owner.order.dao.OwnerOrderDAO;
import com.spring.alleating.product.dao.ProductDAO;
import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.product.vo.ProductVO;





@Service("ownerService")
public class OwnerOrderServiceImpl implements OwnerOrderService {

	
	@Autowired
	private OwnerOrderDAO ownerOrderDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private AllEatingOrderDetailVO allEatingOrderDetailVO;
	
	
	@Override
	public List listOwnerOrder() throws DataAccessException {
		List ownerorderList = null;
		ownerorderList = ownerOrderDAO.selectAllOwnerOrderList();
		return ownerorderList;
	}


	@Override
	public Map OnwerOrderHistoryDetail(String orderId) throws DataAccessException {
		AllEatingOrderVO OwnerorderDetailVO = ownerOrderDAO.OwnerOrderHistoryDetail(orderId);
		
		Map OwnerorderDetailInfo = new HashMap();
		Map OwnerdeliveryInfo = new HashMap();
		
		OwnerdeliveryInfo.put("deliveryType", "reserve");
		OwnerdeliveryInfo.put("orderId", orderId);
		List<AllEatingOrderDetailVO> OwnerreserveList = ownerOrderDAO.OwnerOrderHistoryProduct(OwnerdeliveryInfo);
		
		OwnerdeliveryInfo.put("deliveryType", "normal");
		List<AllEatingOrderDetailVO> OwnernormalList = ownerOrderDAO.OwnerOrderHistoryProduct(OwnerdeliveryInfo);
			
		OwnerorderDetailInfo.put("OwnerorderDetailVO", OwnerorderDetailVO);
		OwnerorderDetailInfo.put("OwnerreserveList", OwnerreserveList);
		OwnerorderDetailInfo.put("OwnernormalList", OwnernormalList);
		return OwnerorderDetailInfo;
	}


//	@Override
//	public Map odService(int odService) throws Exception {
//		AllEatingOrderDetailVO aodVO = ownerOrderDAO.updateownerdelivery(null);
//		
//		return null;
//	}


	@Override
	public void updateOwnerDelivery(Map odinfo) throws DataAccessException {
		 ownerOrderDAO.updateownerdelivery(odinfo);
	}
	
	
//	@Override
//	public List<AllEatingOrderVO> ownerOrderList() throws Exception {
//		
//			List<AllEatingOrderVO> ownerOrderList = ownerOrderDAO.selectAllOwnerOrderList();
//			return ownerOrderList;
	


	}
	

