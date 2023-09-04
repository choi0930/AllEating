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
import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.member.vo.MemberVO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.order.dao.OrderDAO;
import com.spring.alleating.order.vo.AllEatingOrderDetailVO;
import com.spring.alleating.order.vo.AllEatingOrderVO;
import com.spring.alleating.point.dao.PointDAO;
import com.spring.alleating.point.vo.UserPointVO;
import com.spring.alleating.product.dao.ProductDAO;

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

		//포인트 가져오기
		UserPointVO userPointVO = pointDAO.selectUserPoint(id);
		//가지고 있는 쿠폰 목록 가져오기
		List<UserCouponVO> couponList =couponDAO.selectUserCoupon(id);
		//기본 배송지 주소 가져오기
		DeliveryAddressVO dliveryAddressVO = orderDAO.selectDefaultAddress(id);
		
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
		
		Map<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("dliveryAddressVO", dliveryAddressVO);
		userInfo.put("deliveryPrice", deliveryPrice);
		userInfo.put("totalPrice", totalPrice);
		userInfo.put("memberVO", memberVO);
		userInfo.put("userPointVO", userPointVO);
		userInfo.put("couponList", couponList);
		return userInfo;
	}


	/* 배송지 목록 가져오기 */
	@Override
	public List<DeliveryAddressVO> getDeliveryAddressList(String id) throws DataAccessException {
		List<DeliveryAddressVO> addressList =  orderDAO.selectAddress(id);
		return addressList;
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

	//주문 완료
	@Override
	public Map selectOrderNum(String orderId) throws DataAccessException {
		AllEatingOrderVO payCompleteVO = orderDAO.selectOrderNum(orderId);
		
		Map payCompleteInfo = new HashMap();
		payCompleteInfo.put("payCompleteVO", payCompleteVO);
		return payCompleteInfo;
	}

	
	//마이페이지 주문 내역
	@Override
	public List selectOrderHistory(Map fffInfo) throws DataAccessException {
		 
		
		Map gggInfo = new HashMap();
		List<AllEatingOrderVO> orderHistoryVO = orderDAO.selectOrderHistory(fffInfo);
		System.out.println(orderHistoryVO.size() );
		/* orderHistoryInfo.put("orderHistyoryVO", orderHistoryVO); */
		/* return orderHistoryInfo; */
		return orderHistoryVO;
	}

	
	//주문 내역 상세
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
		System.out.println(reserveList.size() );
		System.out.println(normalList.size() );
		return orderDetailInfo;
	}

	
	//작성 가능한 후기
	@Override
	public Map selectUserReview(String id) throws DataAccessException {
		  Map userReviewInfo = new HashMap();
			
		List<AllEatingOrderDetailVO> reviewList = orderDAO.selectUserReview(id);
		
		userReviewInfo.put("reviewList", reviewList);
		
		return userReviewInfo;
	}
	/*선택한 쿠폰 상품에 적용*/
	@Override
	public Map<String, Object> couponApply(Map dataMap) throws DataAccessException {
		String couponId = (String) dataMap.get("couponId");
		String _productPrice = (String) dataMap.get("productPrice");
		String productId = (String) dataMap.get("productId");
		System.out.println(couponId);
		System.out.println(_productPrice);
		System.out.println(productId);
		int productPrice = Integer.parseInt(_productPrice);
		
		CouponVO couponVO = orderDAO.selectApplyCoupon(couponId);
		int couponDiscountRate = couponVO.getCouponDiscountRate();
		
		double productDiscountFactor = couponDiscountRate / 100.0; // 나눗셈 결과를 실수로 얻기 위해 100.0으로 나눔
		int productRound = (int) (productPrice * (1 - productDiscountFactor)); // 할인율을 올바르게 적용하여 할인 가격 계산
		int lastDigit = productRound % 10; // product의 숫자의 마지막 자릿수 추출
		int productSalesPrice = productRound + ( 10 - lastDigit); //다음 10의 배수로 올림
		
		Map resMap =  new HashMap<>();
		
		resMap.put("couponId", couponId);
		resMap.put("productPrice", productSalesPrice);
		resMap.put("productId",productId);
		resMap.put("couponDiscountRate", couponDiscountRate);
		
		return resMap;
	}

	
	
}
