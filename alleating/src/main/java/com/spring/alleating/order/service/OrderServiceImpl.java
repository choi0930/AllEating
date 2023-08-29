package com.spring.alleating.order.service;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.dao.CouponDAO;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.order.dao.OrderDAO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.point.dao.PointDAO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.dao.ProductDAO;
import com.spring.alleating.product.vo.ProductImgVO;

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
	
	   public static String orderNum() {
		   	String orderDate=null;
			String orderYear=null;
			String orderMonth=null;
			String orderDay=null;
			int num = ThreadLocalRandom.current().nextInt(1000, 10000);
			String snum=Integer.toString(num);
		   DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			//현재 년도 int-> String으로
			orderYear   = Integer.toString(cal.get(Calendar.YEAR));
			//Calender.MONTH는 0~11이 반환되므로 현재 월을 알기위해 +1  DecimalFormat으로 빈자리에 0을 채움 7 -> 07 
			orderMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			//현재 날짜 구함 DecimalFormat으로 빈자리에 0을 채움 7 -> 07
			orderDay   = df.format(cal.get(Calendar.DATE) + 1);
			// 예시: 2023-07-17 endDate에는 현재 년월일이 설정됨
			orderDate = orderYear + orderMonth + orderDay;
			
			String orderId = orderDate+snum;
			
			
			return orderId;
    }
	   
	@Override
	public Map userInfoToPay(Map info) throws DataAccessException {
		MemberVO memberVO = (MemberVO) info.get("memberVO");
		List<AllEatingOrderDetailVO> allEatingOrderDetailes = (List<AllEatingOrderDetailVO>) info.get("allEating");
		String id = memberVO.getId();
		UserPointVO userPointVO = pointDAO.selectUserPoint(id);
		List<UserCouponVO> couponList =couponDAO.selectUserCoupon(id);
		int productPrice =0;
		int totalPrice = 0;
		int deliveryPrice = 0;
		for(AllEatingOrderDetailVO vo: allEatingOrderDetailes) {
			int price = vo.getProductPrice();
			int qty = vo.getProductQty();
			productPrice = price*qty;
			totalPrice+=productPrice;
		
		}
		
			deliveryPrice = 3000;
		
		Map userInfo = new HashMap();
		userInfo.put("deliveryPrice", deliveryPrice);
		userInfo.put("totalPrice", totalPrice);
		userInfo.put("memberVO", memberVO);
		userInfo.put("userPointVO", userPointVO);
		userInfo.put("couponList", couponList);
		return userInfo;
	}



	@Override
	public String pay(Map order) throws DataAccessException {
		String orderId = orderNum();
		MemberVO memberVO = (MemberVO) order.get("memberVO");
		String id = memberVO.getId();
		Map orderInfo = (Map) order.get("userOrder");
		orderInfo.put("orderId", orderId);
		orderInfo.put("id",id);
		
		orderDAO.insertOrderProduct(orderInfo);
		
		List<AllEatingOrderDetailVO> orderDetailes = (List<AllEatingOrderDetailVO>) order.get("allEating");
		for(AllEatingOrderDetailVO vo: orderDetailes) {
			vo.setOrderId(orderId);
			orderDAO.insertOrderDetail(vo);
		}
		
		
		
		
		return orderId;
	}

	@Override
	public Map selectOrderNum(String orderId) throws DataAccessException {
		AllEatingOrderVO payCompleteVO = orderDAO.selectOrderNum(orderId);
		
		Map payCompleteInfo = new HashMap();
		payCompleteInfo.put("payCompleteVO", payCompleteVO);
		return payCompleteInfo;
	}

	@Override
	public List selectOrderHistory(Map fffInfo) throws DataAccessException {
		 
		
		Map gggInfo = new HashMap();
		List<AllEatingOrderVO> orderHistoryVO = orderDAO.selectOrderHistory(fffInfo);
		System.out.println(orderHistoryVO.size() + "맵 사이즈 나오닝");
		/* orderHistoryInfo.put("orderHistyoryVO", orderHistoryVO); */
		/* return orderHistoryInfo; */
		return orderHistoryVO;
	}

	@Override
	public Map OrderHistoryDetail(String orderId) throws DataAccessException {
		
		AllEatingOrderVO orderDetailVO = orderDAO.OrderHistoryDetail(orderId);
		
		
		
		Map orderDetailInfo = new HashMap();
		Map deliveryInfo = new HashMap();
		
		deliveryInfo.put("deliveryType", "reserve");
		deliveryInfo.put("orderId", orderId);
		List<AllEatingOrderDetailVO> reserveList = orderDAO.OrderHistoryProduct(deliveryInfo);
		
		deliveryInfo.put("deliveryType", "normal");
		List<AllEatingOrderDetailVO> normalList = orderDAO.OrderHistoryProduct(deliveryInfo);
		
		
		
		orderDetailInfo.put("orderDetailVO", orderDetailVO);
		orderDetailInfo.put("reserveList", reserveList);
		orderDetailInfo.put("normalList", normalList);
		System.out.println(reserveList.size() + "ㅇ러ㅣ쟏러ㅐㅈ댜ㅓ랮댜ㅓㄹ");
		System.out.println(normalList.size() + "ㄹㅈㄷㄹㅈㄷ람조리젿ㄹ");
		return orderDetailInfo;
	}

	
	@Override
	public Map selectUserReview(String id) throws DataAccessException {
		  Map userReviewInfo = new HashMap();
		
			/* Map _userReviewInfo = new HashMap(); */
		List<AllEatingOrderDetailVO> reviewList = orderDAO.selectUserReview(id);
		
		
		/* userReviewInfo.put("id", id); */
		userReviewInfo.put("reviewList", reviewList);
		
		return userReviewInfo;
	}

	
	
}
