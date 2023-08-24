package com.spring.alleating.point.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.point.vo.UserPointVO;
@Mapper
@Repository("pointDAO")
public interface PointDAO {
	public UserPointVO selectUserPoint(String id)throws DataAccessException;
}
