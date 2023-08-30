package com.spring.alleating.owner.order.dao;

import java.util.List;

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
	
	public AllEatingOrderDetailVO selectAllOwnerOrderDetailList(String orderId) throws DataAccessException;
	public AllEatingOrderVO selectAllOwnerOrderList(String orderId) throws DataAccessException;
}
