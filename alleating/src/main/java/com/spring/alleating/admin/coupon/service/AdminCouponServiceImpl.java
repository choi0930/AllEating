package com.spring.alleating.admin.coupon.service;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.coupon.dao.AdminCouponDAO;
import com.spring.alleating.coupon.vo.CouponVO;

@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService {
	
	@Autowired
	private AdminCouponDAO adminCouponDAO;
	
	/*관리자 페이지 쿠폰 리스트 가져옴*/
	@Override
	public Map couponList(Map couponMap) throws DataAccessException {
		
		return null;
	}
	/*관리자 페이지 쿠폰 추가*/
	@Override
	public int addCoupon(CouponVO couponVO) throws DataAccessException {
		 String couponId= getRandomCouponId();
		 couponVO.setCouponId(couponId);
		int result = adminCouponDAO.insertCouponInfo(couponVO);
		return result;
	}
	
	/* 쿠폰 수정을 위한 쿠폰id로 정보 불러오기 */	
	@Override
	public CouponVO couponFindByCouponId(String couponId) throws DataAccessException {
		CouponVO couponVO = adminCouponDAO.selectByCouponId(couponId);
		return couponVO;
	}
	
	/*관리자 페이지 쿠폰 정보 삭제 처리*/
	@Override
	public int delCouponInfo(Map couponInfo) throws DataAccessException {
		return adminCouponDAO.delCouponInfo(couponInfo);
	}
	/*관리자 페이지 쿠폰 정보 수정*/
	@Override
	public int modfiyCouponInfo(CouponVO couponVO) throws DataAccessException {
		return adminCouponDAO.modfiyCouponInfo(couponVO);
	}

	public static String getRandomCouponId() {
		  //실행시 ???개 쿠폰 생성
		  int couponSize = 1;
		  String couponnum = "";
		  final char[] possibleCharacters =
		    {'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F',
		     'G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V',
		     'W','X','Y','Z'};
		  
		  final int possibleCharacterCount = possibleCharacters.length;
		  String[] arr = new String[couponSize];
		  Random rnd = new Random();
		  int currentIndex = 0;
		  int i = 0;
		  while (currentIndex < couponSize) {
		   StringBuffer buf = new StringBuffer(16);
		   //i는 8자리의 랜덤값을 의미
		   for (i= 8; i > 0; i--) {
		    buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		   }
		   couponnum = buf.toString();
		   System.out.println("couponnum==>"+couponnum);   
		   arr[currentIndex] = couponnum;
		   currentIndex++;
		  }
		  
		  return couponnum;
		 }
	
	
}
