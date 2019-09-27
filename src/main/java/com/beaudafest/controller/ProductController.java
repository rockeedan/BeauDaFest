package com.beaudafest.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.service.CouponService;

import oracle.sql.DATE;

@Controller
@RequestMapping("/owner")
public class ProductController {

	@Autowired
	private CouponService service;

	@GetMapping("/manage")
	public String showManage() {
		return "shop/couponManage";
	}

	@PostMapping("/addCoupon")
	public String addCoupon(CouponVO vo, MultipartFile[] uploadCoupon) { // 쿠폰 등록

		String dbUploadedFiles = ""; //db에 넣어줄 값
		String uploadFolder = "C:\\beaudafest"; //업로드될 폴더 
		
		//폴더 만들기 -------------
		File uploadPath = new File(uploadFolder, getFolder());
		System.out.println("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}//make yyyy/MM/dd폴더 
		
		for (MultipartFile multipartFile : uploadCoupon) {
			System.out.println("---------------------------");
			System.out.println("Upload File Name: " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("only file name: " + uploadFileName);
			
			UUID uuid = UUID.randomUUID(); 
						
			uploadFileName = uuid.toString()+"_"+uploadFileName; //이름중복값 방지
			dbUploadedFiles += uploadFileName + "|"; //db 구분자 생성 
 			
			File saveFile = new File(uploadPath, uploadFileName); //저장 

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setDesignPhoto(dbUploadedFiles);

		}
		System.out.println(vo);
		service.addCoupon(vo);
		

		return "redirect:/owner/manage";
	}

	private String getFolder() { //폴더만들어주기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();	
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
}
