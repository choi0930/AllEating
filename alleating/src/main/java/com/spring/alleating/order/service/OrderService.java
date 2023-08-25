package com.spring.alleating.order.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.product.vo.ProductVO;

public interface OrderService {
	/*결제에 필요한 유저 적립금 쿠폰 조회*/
	public Map userInfoToPay(Map info)throws DataAccessException;
	
	public String pay(Map userOrder)throws DataAccessException;
}
