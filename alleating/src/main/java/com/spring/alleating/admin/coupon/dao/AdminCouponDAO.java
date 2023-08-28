package com.spring.alleating.admin.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.coupon.vo.CouponVO;

@Mapper
@Repository("admincouponDAO")
public interface AdminCouponDAO {
	/* 사용가능 및 배포중인 쿠폰 목록 */
	public List<CouponVO> selectAllCoupons(Map couponInfo)throws DataAccessException;
	
	/* 사용가능 및 배포중인 쿠폰 수 */
	public int selectCouponTotal()throws DataAccessException;
	
	/* 삭제 및 만료된 쿠폰 목록 */
	public List<CouponVO> selectInvalidCoupons(Map couponInfo) throws DataAccessException;
	
	/* 삭제 및 만료된 쿠폰 수 */
	public int selectInvalidCouponTotal() throws DataAccessException;
	
	/* 쿠폰 수정을 위한 쿠폰id로 정보 불러오기 */	
	public CouponVO selectByCouponId(String couponId)throws DataAccessException;
	
	/* 쿠폰 등록 */
	public int insertCouponInfo(CouponVO couponVO)throws DataAccessException;
	
	/* 쿠폰 상태 삭제로 변경 */
	public int delCouponInfo(Map couponInfo)throws DataAccessException;
	
	/* 쿠폰 상태 변경 */
	public int modfiyCouponInfo(CouponVO couponVO)throws DataAccessException;
	
}
