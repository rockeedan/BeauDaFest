package com.beaudafest.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	ShopService shopService;

	@GetMapping("/shopSignUp")
	public String shopJoinPage(HttpSession session) { // 샵 등록
		System.out.println(session.getAttribute("memberId"));
		return "shop/shopRegister";
	}

	// 샵 등록
	@PostMapping("/shopSignUp")
	public String shopJoin(HttpSession session, MultipartFile[] uploadFile, ShopVO vo, HttpServletRequest request) { // 샵
																													 // 등록
		String uploadFolder = request.getSession().getServletContext().getRealPath("//resources//shopPhoto");

		String addDate = getFolder();// 혹시 그 사이에 날짜 바뀔까봐..

		File uploadPath = new File(uploadFolder, addDate);

		String shopPhoto = "";// db저장용 변수

		if (uploadPath.exists() == false) {// 오늘 날짜 폴더가 없으면
			uploadPath.mkdirs(); // 오늘 날짜 폴더 만들기
		}

		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE용 경로
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("onlyFileName : " + uploadFileName);

			// 중복 방지 UUID
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			System.out.println(uploadFileName);
			// '날짜/파일이름' 으로 DB에 저장
			shopPhoto += ((addDate + "/" + uploadFileName) + "|");

			// 폴더에 이미지 추가
			File savefile = new File(uploadPath, uploadFileName);

			try {
				multipartFile.transferTo(savefile);
				// DB에 저장할때
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		vo.setShopPhoto(shopPhoto);
		vo.setMemberId((String) session.getAttribute("memberId"));
		System.out.println(vo.toString());// 출력
		int result = shopService.shopJoin(vo);
		session.removeAttribute("memberId");
		return "redirect:/"; // 샵 등록 후 페이지 이동 --> 메인으로..?
	}

	// shopNum으로 shopInfo조회
	@GetMapping("/shopDetail/{shopNum}")
	public String findShopInfo(@PathVariable("shopNum") Integer shopNum, Model m) {
		m.addAttribute("shopInfo", shopService.findShopInfo(shopNum));
		
		//본인 샵일땐 return "redirect:/owner/modifyShop/"+shopNum;
		return "shopInfo/shopInfo"; // 조회 페이지
	}

	
	//////////////////////////////////////////////////////////OWNER////////////////////////////////////////////////////////
	// 한 오너의 여러 샵 리스트 조회
	@GetMapping("/owner/shopList")
	public String ownerShopList(HttpSession session, Model m) {
		System.out.println(session.getAttribute("loginId"));
		ShopVO vo = new ShopVO();
		vo.setMemberId(session.getAttribute("loginId").toString());
		m.addAttribute("ownerShopList", shopService.findOwnerShop(vo));
		return "shop/ownerShopList";
	}

	// 한 오너의 한 샵 디테일 조회
	@GetMapping("/owner/shopDetail/{shopNum}")
	public String ownerShopDetail(@PathVariable("shopNum") Integer shopNum, HttpSession session, Model m) {
		ShopVO vo = new ShopVO();
		vo.setMemberId(session.getAttribute("loginId").toString());
		vo.setShopNum(shopNum);
		m.addAttribute("ownerShopInfo", shopService.findOwnerShop(vo));
		return "shopInfo/ownerShopInfo";
	}

	// 특정 샵 정보 수정 페이지로 이동
	@GetMapping("/owner/modifyShop/{shopNum}")
	public String modifyShopPage(@PathVariable("shopNum") Integer shopNum, HttpSession session, Model m) {
		ShopVO vo = new ShopVO();
		vo.setMemberId(session.getAttribute("loginId").toString());
		vo.setShopNum(shopNum);
		m.addAttribute("shopDetail", shopService.findOwnerShop(vo));
		return "shopInfo/modifyShopInfo";
	}

	// 샵 정보 수정
	@PostMapping("/owner/modifyShop")
	public String modifyShop(HttpSession session, MultipartFile[] uploadFile, ShopVO vo, HttpServletRequest request) {
		vo.setMemberId(session.getAttribute("loginId").toString());
		
		if(uploadFile.length!=0) {
			String uploadFolder = request.getSession().getServletContext().getRealPath("//resources//shopPhoto");
			
			String addDate = getFolder();// 혹시 그 사이에 날짜 바뀔까봐..
			
			File uploadPath = new File(uploadFolder, addDate);
			
			String shopPhoto = "";// db저장용 변수
			
			if (uploadPath.exists() == false) {// 오늘 날짜 폴더가 없으면
				uploadPath.mkdirs(); // 오늘 날짜 폴더 만들기
			}
			
			for (MultipartFile multipartFile : uploadFile) {
				System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
				System.out.println("Upload File Size : " + multipartFile.getSize());
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				// IE용 경로
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				System.out.println("onlyFileName : " + uploadFileName);
				
				// 중복 방지 UUID
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				System.out.println(uploadFileName);
				// '날짜/파일이름' 으로 DB에 저장
				shopPhoto += ((addDate + "/" + uploadFileName) + "|");
				
				// 폴더에 이미지 추가
				File savefile = new File(uploadPath, uploadFileName);
				
				try {
					multipartFile.transferTo(savefile);
					// DB에 저장할때
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			vo.setShopPhoto(shopPhoto);
		}
		vo.setMemberId((String) session.getAttribute("loginId"));
		System.out.println(vo.toString());// 출력
		shopService.modifyShopInfo(vo);
		return "redirect:/owner/shopDetail/"+vo.getShopNum(); // 샵 등록 후 페이지 이동 --> 메인으로..?
	}

	// 샵 삭제
	@GetMapping("/owner/deleteShop/{shopNum}")
	public String deleteShop(@PathVariable("shopNum") Integer shopNum, HttpSession session) {
		ShopVO vo = new ShopVO();
		vo.setMemberId(session.getAttribute("loginId").toString());
		vo.setShopNum(shopNum);
		shopService.deleteShop(vo);
		System.out.println(vo.toString());
		return "redirect:/owner/shopList";
	}

	@GetMapping("/couponList/{shopNum}") //상품 리스트 보여주기 
	public String couponList(@PathVariable("shopNum") Integer shopNum, Model m) {
		
		m.addAttribute("couponList",shopService.couponList(shopNum));
		List<String> photoList = new ArrayList<String>();
		for (int i = 0; i < shopService.couponList(shopNum).size(); i++) {
			photoList.add(shopService.couponList(shopNum).get(i).getDesignPhoto().split("\\|")[0]);
		}
		m.addAttribute("photoList", photoList);
		return "shopInfo/couponList";
	}
	
	@PostMapping("/addOption/{shopNum}")
	public String addOption (@PathVariable("shopNum") Integer shopNum, CouponVO vo, Model m ) {
			
		String type = vo.getDesignOption().substring(0,1); 
		Map<String, Object> map = new HashMap<>();
		map.put("shopNum", shopNum);
		map.put("designOption", type);
		
		String [] selectedPhoto = shopService.selectedDesign(vo.getDesignId()).split("\\|"); //첫번째 이미지 추출 
		m.addAttribute("designName", vo.getDesignName()); //디자인이름 
		m.addAttribute("designPrice", vo.getDesignPrice()); //디자인가격
		m.addAttribute("designTime", vo.getDesignTime());  //디자인시간
		m.addAttribute("addOption",shopService.addOption(map)); //옵션 
		m.addAttribute("selectedPhoto", selectedPhoto[0]); //디자인사진 (첫번쨰) 
		
		return "reservation/addOption";
	}
	
	private String getFolder() {//오늘 날짜의 경로를 문자열로 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
}
