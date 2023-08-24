package com.spring.alleating.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.dao.CouponDAO;
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
	public ProductVO oneProductOrder(Map orderMap) throws DataAccessException {
		Map resultMap = new HashMap();
		OrderVO vo = (OrderVO) orderMap.get("orderVO");
		MemberVO vo2 = (MemberVO) orderMap.get("memberVO");
		int productId = vo.getProductId();
		String id = vo2.getId();
		
		UserPointVO userPointVO = pointDAO.selectUserPoint(id);
		UserCouponVO userCouponVO = couponDAO.selectUserCoupon(id);
		
		ProductVO productVO = productDAO.selectUserProductDetail(productId);
		List<ProductVO> myOrderProductList = new ArrayList();
		myOrderProductList.add(productVO);
		
		resultMap.put("myOrderProductList", myOrderProductList);
		resultMap.put("userPointVO", userPointVO);
		resultMap.put("userCouponVO", userCouponVO);
		resultMap.put("memberVO", vo2);
		resultMap.put("OrderVO", vo2);

		return productVO;
	}
	
	
}
