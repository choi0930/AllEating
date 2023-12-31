package com.spring.alleating.servicecenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.alleating.product.vo.ProductImgVO;
import com.spring.alleating.servicecenter.dao.ServiceCenterDAO;
import com.spring.alleating.servicecenter.vo.BoardVO;
import com.spring.alleating.servicecenter.vo.InquiryBoardVO;

@Service("serviceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	@Autowired
	private InquiryBoardVO inquiryBoardVO;
	
	/* 공지사항 목록 가져오기 */
	@Override
	public Map<String, Object> boardList(Map<String, Object> dataMap) throws DataAccessException {
		List<BoardVO>boardList =  serviceCenterDAO.boardList(dataMap);
		int result = serviceCenterDAO.boardTotalCount();
		
		Map boardMap = new HashMap<>();
		boardMap.put("boardList", boardList);
		boardMap.put("total", result);
		return boardMap;
	}

	/* 공지사항 상세 페이지 */
	@Override
	public BoardVO boardDetail(String articleNO) throws DataAccessException {
		BoardVO boardVO = serviceCenterDAO.boardDetail(articleNO);
		return boardVO;
	}
	
	
	//상품 문의 목록
	@Override

	public Map selectProductQnA() throws DataAccessException {
		Map QnAInfo = new HashMap<>();
		
		List<InquiryBoardVO> QnAList = serviceCenterDAO.productQnAList(QnAInfo);
		QnAInfo.put("QnAList", QnAList);
		return QnAInfo;
	}

	@Override
	public int insertQnA(Map QnAMap) throws DataAccessException {
		return serviceCenterDAO.insertQnA(QnAMap);
	}
	
	@Override
	public InquiryBoardVO memberviewArticle(int articleNO) throws Exception {
		InquiryBoardVO inquiryVO = serviceCenterDAO.memberselectArticle(articleNO);
		return inquiryVO;
	}

	@Override
	public void memberremoveArticle(int articleNO) throws Exception {
		serviceCenterDAO.memberdeleteArticle(articleNO);
	}
	

	@Override
	public void membermodArticle(Map articleMap) throws Exception {
		serviceCenterDAO.memberupdateArticle(articleMap);
	}

	/*
	 * public List selectProductQnA(Map _productQnAInfo) throws DataAccessException
	 * { List<InquiryBoardVO> inqueryBoardVO =
	 * serviceCenterDAO.selectProductQnA(_productQnAInfo); return inqueryBoardVO;
	 * 
	 * }
	 */




	
	
	
	
}
