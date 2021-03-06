package com.beaudafest.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.service.CouponService;

import oracle.sql.DATE;

@Controller
@RequestMapping("/*")
public class ProductController {

	@Autowired
	private CouponService service;

	@GetMapping("/manage")
	public String showManage(HttpServletRequest request) {
		
		List<CouponVO> list = service.showCoupon(1);
		request.setAttribute("couponList", list);
		List<String> photoList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			photoList.add(list.get(i).getDesignPhoto().split("\\|")[0]);
		}
		request.setAttribute("photoList", photoList);
		
		return "shop/couponManage";
	}

	@PostMapping("/addCoupon")
	public String addCoupon(CouponVO vo, MultipartFile[] uploadCoupon, HttpServletRequest request) { // 쿠폰 등록

		String dbUploadedFiles = ""; //db에 넣어줄 값
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/couponPhoto"); //업로드될 폴더 
		
		String addDate = getFolder();
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
			dbUploadedFiles +=addDate+"/"+uploadFileName + "|"; //db 구분자 생성 
			
 			
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
		

		return "redirect:/manage";
	}
	
	@PostMapping("designDetail")
	public @ResponseBody CouponVO designDetail(int designId, HttpSession session) {
		
		CouponVO vo = service.designDetail(designId);
		session.setAttribute("designDetail", vo);
	
		return vo;
		
	}
	@PostMapping("designUpdate")
	public String designUpdate(CouponVO vo) {
			
		service.designUpdate(vo);
		return "redirect:/manage";
	}
	@PostMapping("designDelete")
	public String designDelete (int designId) {
		service.designDelete(designId);
		return "redirect:/manage";
	}

	private String getFolder() { //폴더만들어주기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		Date date = new Date();	
		String str = sdf.format(date);
		
		return str.replace("/", File.separator);
	}
	
}
