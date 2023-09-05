package com.spring.alleating.myPage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.coupon.vo.CouponVO;
import com.spring.alleating.coupon.vo.UserCouponVO;
import com.spring.alleating.myPage.dao.MyPageDAO;
import com.spring.alleating.myPage.vo.DeliveryAddressVO;
import com.spring.alleating.myPage.vo.WishVO;
import com.spring.alleating.point.vo.UserPointVO;
@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	
	/*마이페이지: 유저가 가지고 있는 쿠폰 개수와 포인트 가져옴*/
	@Override
	public Map getUserPointAndCouponInfo(String id) throws DataAccessException {
		int couponCount = myPageDAO.couponCount(id);
		UserPointVO userPointVO = myPageDAO.selectUserPoint(id);
		
		int point = userPointVO.getUserPoint();
		
		Map info = new HashMap<>();
		info.put("couponCount", couponCount);
		info.put("point", point);
		
		
		return info;
	}
	
	/* 마이페이지 쿠폰 등록 */
	@Override
	public int addUserCoupon(UserCouponVO userCouponVO) throws DataAccessException {
		String couponId = userCouponVO.getCouponId();
		int check = myPageDAO.findCoupon(couponId);// 관리자가 등록한 쿠폰 목록에 있는 쿠폰인지 확인
		
		int result = 0 ;
		if(check == 1) { //관리자가 등록했었던 쿠폰일시 
			int check2 = myPageDAO.findUserCoupon(userCouponVO); //이미 등록한 쿠폰인지 확인 
			
			if(check2 == 0) { //이미 등록한 쿠폰이 아닐때
				result = myPageDAO.insertUserCoupon(userCouponVO); //쿠폰 등록
				//쿠폰 등록이 성공했을때
				if(result>0) {
					//수량 줄일 쿠폰 가져오기
					CouponVO couponVO = myPageDAO.selectCoupon(couponId);
					//수량 줄이기
					int qty = couponVO.getCoupon_quantity();
					int _qty = qty-1;
					couponVO.setCoupon_quantity(_qty);
					//수량 업데이트
					myPageDAO.updateCouponQuantity(couponVO);
				}
			}else {// 이미 등록한 쿠폰일때
				result = 3; //msg="이미 등록한 쿠폰입니다."
			}
		}else { // 관리자가 등록한 쿠폰목록에 없는 쿠폰 번호 일때
			result = 2; //msg="없는 쿠폰입니다."
		}
		return result;
	}
	/*---------------------------------- 마이페이지 쿠폰 등록 끝 -------------------------------------*/
	
	/* 마이페이지 쿠폰 목록 */
	@Override
	public List<UserCouponVO> listCoupon(String id) throws DataAccessException {
		List<UserCouponVO>couponList =  myPageDAO.selectUserCoupon(id);
		return couponList;
	}
	/*---------------------------------- 마이페이지 쿠폰 목록 끝 -------------------------------------*/

	
	/* 마이페이지 배송지 관리 목록 */
	@Override
	public List<DeliveryAddressVO> listAddress(Map dataMap) throws DataAccessException {
		List<DeliveryAddressVO> adressList = myPageDAO.selectAllDeliveryAddress(dataMap);
		return adressList;
	}
	/*---------------------------------- 마이페이지 배송지 관리 목록 끝 --------------------------------*/
	
	
	/*마이페이지: 배송지 추가*/
	@Override
	public int addDeliveryAddress(DeliveryAddressVO deliveryAddressVO) throws DataAccessException {
		int result = myPageDAO.insertDeilveryAddress(deliveryAddressVO);
		return result;
	}
	/*---------------------------------- 마이페이지 배송지 추가 끝--------------------------------------*/
	
	/*마이페이지: 배송지 삭제*/
	@Override
	public int deleteAddress(DeliveryAddressVO deliveryAddressVO) throws DataAccessException {
		int result = myPageDAO.deleteDeilveryAddress(deliveryAddressVO);
		return result;
	}
	/*---------------------------------- 마이페이지 배송지 삭제 끝-------------------------------------*/
	
	/*마이페이지: 기본 배송지 변경*/
	@Override
	public int changeDefaultAddress(DeliveryAddressVO deliveryAddressVO) throws DataAccessException {
		String id = deliveryAddressVO.getId();
		//기존에 있던 기본 배송지 해재처리
		DeliveryAddressVO vo = myPageDAO.selectDefaultAddress(id); //기본배송지로 설정되어있는 값 가져오기
		Map deliveryInfo = new HashMap();
		int num = vo.getNum();
		String default_address = "n"; //기본 배송지 해재
		
		deliveryInfo.put("id", id);
		deliveryInfo.put("num", num);
		deliveryInfo.put("default_address", default_address);
		
		myPageDAO.updateDefaultAddress(deliveryInfo);
		
		//새로운 기본 배송지 설정
		num = deliveryAddressVO.getNum();
		default_address = "y";
		deliveryInfo.put("num", num);
		deliveryInfo.put("default_address", default_address);
		
		int result = myPageDAO.updateDefaultAddress(deliveryInfo);
		
		return result;
	}
	/*---------------------------------- 마이페이지 기본 배송지 변경 끝-------------------------------------*/
	
	/*마이페이지: 배송지 수정 팝업창*/
	@Override
	public DeliveryAddressVO addressInfo(Map info) throws DataAccessException {
		DeliveryAddressVO deliveryAddressVO =  myPageDAO.selectAddressByNum(info);
		return deliveryAddressVO;
	}
	/*---------------------------------- 마이페이지 배송지 수정 팝업창 끝-------------------------------------*/
	
	/*마이페이지: 배송지 수정*/
	@Override
	public int modAddress(Map info) throws DataAccessException {
		int result = myPageDAO.updateAddress(info);
		return result;
	}
	/*---------------------------------- 마이페이지 배송지 수정 끝-------------------------------------*/
	
	
//////////////////////마이페이지 찜목록////////////////


	@Override
	public List selectWishList(Map _wishMap) throws DataAccessException {
		List<WishVO> wishVO = myPageDAO.selectWishList(_wishMap);
		return wishVO;
	}

	@Override
	public int insertWish(WishVO wishVO) throws DataAccessException {
		int insertWish = myPageDAO.insertWish(wishVO);
	    return insertWish;
	}

	@Override
	public int deleteWish(WishVO wishVO) throws DataAccessException {
		int deleteWish = myPageDAO.deleteWish(wishVO);
		return deleteWish;
	}


	
////////////////////////마이페이지 - 찜목록 끝
	
	




}
