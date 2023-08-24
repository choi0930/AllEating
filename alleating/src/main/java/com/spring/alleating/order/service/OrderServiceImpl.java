package com.spring.alleating.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.dao.CouponDAO;
import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.dao.OrderDAO;
import com.spring.alleating.order.vo.OrderVO;
import com.spring.alleating.point.dao.PointDAO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.dao.ProductDAO;
import com.spring.alleating.product.vo.ProductVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private PointDAO pointDAO;
	
	@Autowired
	private CouponDAO couponDAO;
	


	@Override
	public Map userInfoToPay(MemberVO memberVO) throws DataAccessException {
		String id = memberVO.getId();
		UserPointVO userPointVO = pointDAO.selectUserPoint(id);
		List<UserCouponVO> couponList =couponDAO.selectUserCoupon(id);
		Map userInfo = new HashMap();
		userInfo.put("memberVO", memberVO);
		userInfo.put("userPointVO", userPointVO);
		userInfo.put("couponList", couponList);
		return userInfo;
	}
	
	
}
