package com.spring.alleating.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
		private static String PRODUCT_IMAGE_REPO = "C:\\alleating\\product_image_repo";
		private static String REVIEW_IMAGE_REPO = "C:\\alleating\\review_image_repo";
		                                      
		                                           
		@RequestMapping("/download.do")
		protected void download(@RequestParam("fileName") String fileName, @RequestParam("productId") String productId, @RequestParam("cateCode") String cateCode, HttpServletResponse response) throws Exception{
		
		
		OutputStream out = response.getOutputStream();
		
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName );
		
		fileName = URLDecoder.decode(fileName,"UTF-8");
		 
		String downFile = PRODUCT_IMAGE_REPO + "\\" +cateCode+"\\"+productId+"\\" + fileName;
		File file = new File(downFile);
		
		
		FileInputStream in = new FileInputStream(file);
		System.out.println(file);
		byte[] buffer = new byte [1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if(count == -1) //
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();

	}
		@RequestMapping("/download2.do")
		protected void download2(@RequestParam("fileName") String fileName, @RequestParam("articleNO") int articleNO,  HttpServletResponse response) throws Exception{
		
		
		OutputStream out = response.getOutputStream();
		
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName );
		
		fileName = URLDecoder.decode(fileName,"UTF-8");
		 
		String downFile = REVIEW_IMAGE_REPO + "\\" +articleNO+"\\" + fileName;
		File file = new File(downFile);
		
		
		FileInputStream in = new FileInputStream(file);
		System.out.println(file);
		byte[] buffer = new byte [1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if(count == -1) //
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();

	}
	}
