package com.beaudafest.controller;

import java.io.File;
import java.io.IOException;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.service.CouponService;

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
	public String addCoupon(CouponVO vo, MultipartFile[] uploadCoupon) {
		
		String uploadedFiles = "";
		String uploadFolder = "C:\\beaudafest";
		for(MultipartFile multipartFile: uploadCoupon) {
			System.out.println("---------------------------");
			System.out.println("Upload File Name: " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("only file name: " + uploadFileName);
			uploadedFiles += uploadFileName + "|";
			File saveFile = new File(uploadFolder, uploadFileName);
		
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setDesignPhoto(uploadedFiles);
			
		}
		 service.addCoupon(vo); 
		 System.out.println(vo);
		 
		return "redirect:/owner/manage";
	}

	
}
