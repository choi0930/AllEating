package com.spring.alleating.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;



@Mapper
@Repository("orderDAO")
public interface OrderDAO {
	public void insertOrderProduct(Map userOrder)throws DataAccessException;
	public void insertOrderDetail(AllEatingOrderDetailVO vo)throws DataAccessException;
	
	public AllEatingOrderVO selectOrderHistory(int orderId)throws DataAccessException;
}
