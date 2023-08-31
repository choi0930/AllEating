package com.spring.alleating.owner.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;



@Mapper
@Repository("ownerOrderDAO")
public interface OwnerOrderDAO {
//	public List<AllEatingOrderVO> selectAllOwnerOrderList() throws Exception;
	public List selectAllOwnerOrderList() throws DataAccessException;
	
//	public AllEatingOrderDetailVO selectAllOwnerOrderDetailList(String orderId) throws DataAccessException;
//	public AllEatingOrderVO selectAllOwnerOrderList(String orderId) throws DataAccessException;
	
	public AllEatingOrderVO OwnerOrderHistoryDetail (String orderId) throws DataAccessException; //주문 내역 상세 중 정보들
	public List<AllEatingOrderDetailVO> OwnerOrderHistoryProduct (Map deliveryInfo) throws DataAccessException; //주문 내역 상세 중 상품 정보들
	
	
}
