package com.spring.alleating.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.order.vo.AllEatingOrderVO;

@Mapper
@Repository("adminOrderDAO")
public interface AdminOrderDAO {
	/*관리자페이지: 사업자 주문정보 불러오기*/
	public List<AllEatingOrderVO> selectAdminOrder()throws DataAccessException;
	/*관리자페이지: 사업자 주문정보 총 개수 불러오기*/
	public int adminOrderCount()throws DataAccessException;
	/*관리자페이지: 사업자 주문정보 불러오기*/
	public List<AllEatingOrderVO> selectOwnerOrder(Map dataMap)throws DataAccessException;
	/*관리자페이지: 사업자 주문정보 총 개수 불러오기*/
	public int ownerOrderCount()throws DataAccessException;
}
