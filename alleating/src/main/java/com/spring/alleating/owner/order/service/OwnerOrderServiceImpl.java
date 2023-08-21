package com.spring.alleating.owner.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alleating.order.vo.OrderVO;
import com.spring.alleating.owner.order.dao.OwnerOrderDAO;





@Service("ownerService")
public class OwnerOrderServiceImpl implements OwnerOrderService {

	
	@Autowired
	private OwnerOrderDAO ownerOrderDAO;
	
	@Override
	public List<OrderVO> ownerOrderList() throws Exception {
		
			List<OrderVO> ownerOrderList = ownerOrderDAO.selectAllOwnerOrderList();
			return ownerOrderList;
		}


	}
	

