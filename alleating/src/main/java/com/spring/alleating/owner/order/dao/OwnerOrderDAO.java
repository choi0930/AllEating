package com.spring.alleating.owner.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.spring.alleating.order.vo.OrderVO;




@Mapper
@Repository("ownerOrderDAO")
public interface OwnerOrderDAO {
	public List<OrderVO> selectAllOwnerOrderList() throws Exception;
}
