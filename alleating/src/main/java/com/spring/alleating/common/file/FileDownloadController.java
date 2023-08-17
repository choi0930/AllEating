package com.spring.alleating.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
		private static String STUDENT_IMAGE_REPO = "C:\\alleating\\product_image";
		                                      
		                                           
		@RequestMapping("/download.do")
		protected void download(@RequestParam("img_type") String img_type, @RequestParam("product_id") String product_id, HttpServletResponse response) throws Exception{
		
			
			OutputStream out = response.getOutputStream();
		String downFile = STUDENT_IMAGE_REPO + "\\" +product_id+"\\" + img_type;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + img_type );
		FileInputStream in = new FileInputStream(file);
		System.out.println(file);
		byte[] buffer = new byte [1024 * 8];
		while (true) {
			int count = in.read(buffer); //버퍼에 읽어들인 문자 개수
			if(count == -1) //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();

	}
	}
