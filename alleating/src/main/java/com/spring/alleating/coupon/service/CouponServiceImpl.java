package com.spring.alleating.coupon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.dao.CouponDAO;
import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
@Service("couponService")
public class CouponServiceImpl implements CouponService{
	
	@Autowired
	private CouponDAO couponDAO;
	
	@Override
	public List<CouponVO> allcouponList() throws DataAccessException {
		List<CouponVO> couponList = couponDAO.selectAllCouponList();
		return couponList;
	}
	
	
	@Override
	public Map payCouponList(Map dataMap) throws DataAccessException {
		Map<String, String> couponInfo = new HashMap<>();															/////////////최현진은무엇인가??
		
		String id = (String) dataMap.get("id");
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) dataMap.get("alleatingOrderDetailes");
		
		couponInfo.put("id",id);
		for(AllEatingOrderDetailVO vo: allEatingOrderDetailes) {
			String cateCode = vo.getCateCode();
			String coupon_range = cateCode.substring(0,3);
			/////////////최현진은무엇인가??
			couponInfo.put("coupon_range", coupon_range);
			List<CouponVO>couponList = couponDAO.selectPayToCoupon(couponInfo);
			
			vo.setCouponList(couponList);
		}
		/////////////최현진은무엇인가??															/////////////최현진은무엇인가??
		Map<String, List<AllEatingOrderDetailVO>> resMap = new HashMap<>();
		resMap.put("allEatingOrderDetailes", allEatingOrderDetailes);
		
		return resMap;
	}															/////////////최현진은무엇인가??

}
