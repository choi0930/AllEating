package com.spring.alleating.common.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
				productImgVO.setImg_type(fileName);
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName=mFile.getOriginalFilename();
				productImgVO.setFileName(originalFileName);
				fileList.add(productImgVO);
				
				File file = new File(PRODUCT_IMAGE_REPO_PATH +"\\"+ fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
						if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
								file.createNewFile(); //이후 파일 생성
						}
					}
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
			return fileList;
		}
		
		private void deleteFile(String fileName) {
			File file =new File(PRODUCT_IMAGE_REPO_PATH+"\\"+fileName);
			try{
				file.delete();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
}
