package com.game.utill.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



@Controller
public class FileUtill {
	
	
	public String fileUploadMethod(HttpServletRequest request) throws IOException {
		
		String realFileName="";

		MultipartHttpServletRequest M=(MultipartHttpServletRequest)request;
		Iterator<String> fileNames = M.getFileNames();
		File file=null;
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();

			MultipartFile mFile =  M.getFile(fileName);
			
			
			realFileName=UUID.randomUUID().toString()+mFile.getOriginalFilename();
			
			file =new File(request.getRealPath("WEB-INF/upload/" +realFileName));
			
			if(mFile.getSize()!=0) {
				
				file.createNewFile();
				mFile.transferTo(file);
							
			}
			else {
				realFileName="";
			}
			
		}
		
		return realFileName;
	}
	
	public String fileUpdateMethod(HttpServletRequest request, String requestFileName ) throws IOException {
		

		String realFileName="";


		MultipartHttpServletRequest M=(MultipartHttpServletRequest)request;
		Iterator<String> fileNames = M.getFileNames();
		
		File file=null;
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();
			
			MultipartFile mFile =  M.getFile(fileName);
			
			


			if(!mFile.getOriginalFilename().equals(requestFileName) && !mFile.getOriginalFilename().equals("")) {
				File fileDelete = new File(request.getRealPath("WEB-INF/upload/" +requestFileName));
				
				if(fileDelete.exists()) {
					fileDelete.delete();
				}
				realFileName=UUID.randomUUID().toString()+mFile.getOriginalFilename();
				
				file =new File(request.getRealPath("WEB-INF/upload/" +realFileName));
				file.createNewFile();
				mFile.transferTo(file);
			}
			
			else if (mFile.getOriginalFilename().equals(requestFileName) && !mFile.getOriginalFilename().equals("") ) {
				
				File fileDelete = new File(request.getRealPath("WEB-INF/upload/" +requestFileName));
				
				if(fileDelete.exists()) {
					fileDelete.delete();
				}
				
				realFileName=requestFileName;
				
				file =new File(request.getRealPath("WEB-INF/upload/" +realFileName));
				file.createNewFile();
				mFile.transferTo(file);
			}
			
			else if ( mFile.getOriginalFilename().equals("")) {
				realFileName=requestFileName;
			}
			

			
		}
		
			
		return realFileName;
	}
	
	public void fileDeleteMethod(HttpServletRequest request, String requestFileName) throws IOException {
		
		File fileDelete = new File(request.getRealPath("WEB-INF/upload/" +requestFileName));
		
		if(fileDelete.exists()) {
			fileDelete.delete();
		}
	}
	
	
	@RequestMapping("/fileDownload")
	public void getFile( HttpServletRequest request,HttpServletResponse response,@RequestParam String filename) throws Exception {
	     
	 
	    File file = new File(request.getRealPath("WEB-INF/upload/" +filename));
	 
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
	            
	            downName = URLEncoder.encode(filename,"UTF-8").replaceAll("\\+", "%20");
	            
	        }else{
	            
	            downName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	            
	        }
	        
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	            
	            servletOutputStream.write(b, 0, data);
	            
	        }
	 
	        servletOutputStream.flush();//출력
	        
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
	 
	}

}
