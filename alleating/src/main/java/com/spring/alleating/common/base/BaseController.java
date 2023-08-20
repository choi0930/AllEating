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
				productImgVO.setFileType(fileName);
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName=mFile.getOriginalFilename();
				productImgVO.setFileName(originalFileName);
				fileList.add(productImgVO);
				
				File file = new File(PRODUCT_IMAGE_REPO_PATH +"\\"+ fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(! file.exists()){ //��λ� ������ �������� ���� ���
						if(file.getParentFile().mkdirs()){ //��ο� �ش��ϴ� ���丮���� ����
								file.createNewFile(); //���� ���� ����
						}
					}
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
				}
			}
			return fileList;
		}
		
}
