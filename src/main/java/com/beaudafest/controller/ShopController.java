package com.beaudafest.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/shopSignUp")
	public String shopJoinPage(HttpSession session) { //샵 등록
		System.out.println(session.getAttribute("memberId"));
		return "shop/shopRegister";
	}
	
	//샵 등록
	@PostMapping("/shopSignUp")
	public String shopJoin(HttpSession session,MultipartFile[] uploadFile,ShopVO vo) { //샵 등록
		String uploadFolder = "C:\\beaudafest";
		String addDate= getFolder();//혹시 그 사이에 날짜 바뀔까봐..
		
		File uploadPath = new File(uploadFolder, addDate);
		
		String shopPhoto="";//db저장용 변수
		
		if(uploadPath.exists()==false) {//오늘 날짜 폴더가 없으면
			uploadPath.mkdirs(); //오늘 날짜 폴더 만들기
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE용 경로
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("onlyFileName : "+uploadFileName);
			
			//중복 방지 UUID
			UUID uuid = UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			System.out.println(uploadFileName);
			//'날짜/파일이름' 으로 DB에 저장
			shopPhoto+=((addDate+"\\"+uploadFileName)+"|");
			
			//폴더에 이미지 추가
			File savefile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(savefile);
				//DB에 저장할때
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}
		vo.setShopPhoto(shopPhoto);
		vo.setMemberId((String) session.getAttribute("memberId"));
		System.out.println(vo.toString());//출력
		int result = shopService.shopJoin(vo);
		//session.removeAttribute("memberId");
		return "redirect:/"; //샵 등록 후 페이지 이동 --> 메인으로..?
	}
	
	//샵 정보 수정 페이지로 이동
	@GetMapping("/modifyShop")
	public String modifyShopPage(ShopVO vo) {
		return "/수정페이지";
	}
	
	//샵 정보 수정
	@PostMapping("/modifyShop")
	public String modifyShop(ShopVO vo) {
		vo = new ShopVO(1111, "hana3", "하나샵", "02-1111-1111", "일산동구", "10:00", "20:00", "금", "11111.jpg", "샵소개", 1, "취소정책");
		shopService.modifyShopInfo(vo);
		return "/";
	}
	
	//샵 삭제
	@PostMapping("/deleteShop")
	public String deleteShop(Integer shopNum) {
		//shopNum = 3333;
		shopService.deleteShop(shopNum);
		return "/";
	}
	
	//샵 조회
	@PostMapping("/shop/findShop")
	public String findShop(ShopVO vo) {
		vo.setMemberId("hana1");
		vo.setShopNum(1111);
		List<ShopVO> list = new ArrayList<>();
		list = shopService.findShop(vo);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return "/"; //조회페이지
	}
	
	private String getFolder() {//오늘 날짜의 경로를 문자열로 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
}
