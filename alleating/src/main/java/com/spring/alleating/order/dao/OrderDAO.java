package com.spring.alleating.order.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.order.vo.OrderVO;

@Mapper
@Repository("orderDAO")
public interface OrderDAO {
	public void orderOneProduct(OrderVO orderVO)throws DataAccessException;
}
