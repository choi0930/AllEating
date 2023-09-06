package com.spring.alleating.common.base;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.alleating.product.vo.ProductImgVO;


	public abstract class BaseController  {
		private static final String PRODUCT_IMAGE_REPO_PATH = "C:\\alleating\\product_image_repo";
		
		protected List<ProductImgVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			List<ProductImgVO> fileList= new ArrayList<ProductImgVO>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasNext()){
				ProductImgVO productImgVO =new ProductImgVO();
				String fileName = fileNames.next();
				productImgVO.setFileType(fileName);
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName=mFile.getOriginalFilename();
				productImgVO.setFileName(originalFileName);
				fileList.add(productImgVO);
				
				File file = new File(PRODUCT_IMAGE_REPO_PATH +"\\"+ fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(! file.exists()){ 
						if(file.getParentFile().mkdirs()){ 
								file.createNewFile();
						}
					}
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); 
				}
			}
			return fileList;
		}
		protected Map calcSearchPeriod(String fixedSearchPeriod){
			String beginDate=null;
			String endDate=null;
			String endYear=null;
			String endMonth=null;
			String endDay=null;
			String beginYear=null;
			String beginMonth=null;
			String beginDay=null;
			//10진수, 값이 없는 자리는 0으로 채움 ex) 7-> 07
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			//현재 년도 int-> String으로
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			//Calender.MONTH는 0~11이 반환되므로 현재 월을 알기위해 +1  DecimalFormat으로 빈자리에 0을 채움 7 -> 07 
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			//현재 날짜 구함 DecimalFormat으로 빈자리에 0을 채움 7 -> 07

			endDay   = df.format(cal.get(Calendar.DATE));

			// 예시: 2023-07-17 endDate에는 현재 년월일이 설정됨
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			//첫 실행시에는 fixdSearchPeriod가 null이므로 4개월치 만 검색됨
			if(fixedSearchPeriod == null) {
				cal.add(cal.MONTH,-4);
			}else if(fixedSearchPeriod.equals("coupon")) {
				//현재 년도의 날짜 +3일 쿠폰 디폴트 날짜 값
				cal.add(Calendar.DAY_OF_YEAR, +3);
			}else if(fixedSearchPeriod.equals("one_week")) {
				//현재 년도의 날짜 -7일 
				cal.add(Calendar.DAY_OF_YEAR, -7);
			}else if(fixedSearchPeriod.equals("two_week")) {
				//현재 년도의 날짜 -14일
				cal.add(Calendar.DAY_OF_YEAR, -14);
			}else if(fixedSearchPeriod.equals("one_month")) {
				//현재 년도의 월 -1
				cal.add(cal.MONTH,-1);
			}else if(fixedSearchPeriod.equals("two_month")) {
				//현재 년도의 월 -2
				cal.add(cal.MONTH,-2);
			}else if(fixedSearchPeriod.equals("three_month")) {
				//현재 년도의 월 -3
				cal.add(cal.MONTH,-3);
			}else if(fixedSearchPeriod.equals("four_month")) {
				//현재 년도의 월 -4
				cal.add(cal.MONTH,-4);
			}
			//현재 년도
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			//위에서 설정한 월 or 날짜
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			//예시 2023-06-17 
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
			//,을 구분자로 검색일 시작 날짜와 끝날짜를 반환
			Map dateMap = new HashMap();
			dateMap.put("beginDate", beginDate);
			dateMap.put("endDate", endDate);
			return dateMap;
		}
		
		protected Map calcCouponDate() {
			String beginDate=null;
			String endDate=null;
			String endYear=null;
			String endMonth=null;
			String endDay=null;
			String beginYear=null;
			String beginMonth=null;
			String beginDay=null;
			
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			//현재 년도 int-> String으로
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			//Calender.MONTH는 0~11이 반환되므로 현재 월을 알기위해 +1  DecimalFormat으로 빈자리에 0을 채움 7 -> 07 
			beginMonth  = df.format(cal.get(Calendar.MONTH)+1);
			//현재 날짜 구함 DecimalFormat으로 빈자리에 0을 채움 7 -> 07
			beginDay   = df.format(cal.get(Calendar.DATE));
			// 예시: 2023-07-17 endDate에는 현재 년월일이 설정됨
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
			cal.add(Calendar.DAY_OF_YEAR, +3);
			
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			Map<String, String> dateMap = new HashMap();
			dateMap.put("beginDate", beginDate);
			dateMap.put("endDate", endDate);
			return dateMap;
		}
		
		protected String cateCodePull(String cateCode) {
			
			return null;
			
		}
		
}
