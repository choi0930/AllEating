package com.spring.alleating.admin.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.order.vo.AllEatingOrderVO;

@Mapper
@Repository("adminOrderDAO")
public interface AdminOrderDAO {
	public List<AllEatingOrderVO> selectAdminOrder()throws DataAccessException;
	public int adminOrderCount()throws DataAccessException;
}
