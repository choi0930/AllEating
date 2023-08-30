package com.spring.alleating.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;



@Mapper
@Repository("orderDAO")
public interface OrderDAO {
	public void insertOrderProduct(Map userOrder)throws DataAccessException;
	public void insertOrderDetail(AllEatingOrderDetailVO vo)throws DataAccessException;
	public AllEatingOrderVO selectOrderNum(String orderId)throws DataAccessException; //주문 완료 확인 창 
	public List<AllEatingOrderVO> selectOrderHistory (Map dddInfo) throws DataAccessException; //주문 내역
	
	public AllEatingOrderVO OrderHistoryDetail (String orderId) throws DataAccessException; //주문 내역 상세 중 정보들
	public List<AllEatingOrderDetailVO> OrderHistoryProduct (Map deliveryInfo) throws DataAccessException; //주문 내역 상세 중 상품 정보들
	
	public  List<AllEatingOrderDetailVO> selectUserReview (String id) throws DataAccessException; //상품 후기 조회
	
	/* 기본 배송지 주소 가져오기 */
	public DeliveryAddressVO selectDefaultAddress(String id)throws DataAccessException;
	/* 배송지 주소 목록 가져오기 */
	public List<DeliveryAddressVO> selectAddress(String id)throws DataAccessException;
}
