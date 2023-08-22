package com.spring.alleating.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.alleating.cart.vo.CartVO;

@Mapper
@Repository("cartDAO")
public interface CartDAO {
	public List<CartVO> selectMyCartList(String id)throws DataAccessException;
	public void insertProductInCart(CartVO cartVO)throws DataAccessException;
	public int selectMaxCartId()throws DataAccessException;
	public String selectCountInCart(CartVO cartVO)throws DataAccessException;
	public void updateCartQTY(CartVO cartVO)throws DataAccessException; 
	public void removeCart(int cartId)throws DataAccessException;
}
