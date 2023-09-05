package com.spring.alleating.point.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.point.vo.UserPointVO;
@Mapper
@Repository("pointDAO")
public interface PointDAO {
	public UserPointVO selectUserPoint(String id)throws DataAccessException;
	/*회원가입 기념 충전*/
	public void insertJoinUserPoint (Map userInfo)throws DataAccessException;
	/*회원가입 기념 충전되는 포인트 내역*/
	public void insertJoinUserPointHistory(Map pointInfo)throws DataAccessException;
}
