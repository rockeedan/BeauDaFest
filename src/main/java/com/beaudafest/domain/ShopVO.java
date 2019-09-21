package com.beaudafest.domain;

public class ShopVO {
	private Integer shopNum;
	private String memberId;
	private String shopName;
	private String shopPhone;
	private String shopAddr;
	private String shopOpen;
	private String shopClose;
	private String shopOff;
	private String shopPhoto;
	private String shopIntro;
	private Integer shopParking;
	private String shopPolicy;

	public ShopVO() {
		// TODO Auto-generated constructor stub
	}

	public ShopVO(Integer shopNum, String memberId, String shopName, String shopPhone, String shopAddr, String shopOpen,
			String shopClose, String shopOff, String shopPhoto, String shopIntro, Integer shopParking,
			String shopPolicy) {
		super();
		this.shopNum = shopNum;
		this.memberId = memberId;
		this.shopName = shopName;
		this.shopPhone = shopPhone;
		this.shopAddr = shopAddr;
		this.shopOpen = shopOpen;
		this.shopClose = shopClose;
		this.shopOff = shopOff;
		this.shopPhoto = shopPhoto;
		this.shopIntro = shopIntro;
		this.shopParking = shopParking;
		this.shopPolicy = shopPolicy;
	}

	public Integer getShopNum() {
		return shopNum;
	}

	public void setShopNum(Integer shopNum) {
		this.shopNum = shopNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopPhone() {
		return shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getShopAddr() {
		return shopAddr;
	}

	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}

	public String getShopOpen() {
		return shopOpen;
	}

	public void setShopOpen(String shopOpen) {
		this.shopOpen = shopOpen;
	}

	public String getShopClose() {
		return shopClose;
	}

	public void setShopClose(String shopClose) {
		this.shopClose = shopClose;
	}

	public String getShopOff() {
		return shopOff;
	}

	public void setShopOff(String shopOff) {
		this.shopOff = shopOff;
	}

	public String getShopPhoto() {
		return shopPhoto;
	}

	public void setShopPhoto(String shopPhoto) {
		this.shopPhoto = shopPhoto;
	}

	public String getShopIntro() {
		return shopIntro;
	}

	public void setShopInfo(String shopIntro) {
		this.shopIntro = shopIntro;
	}

	public Integer getShopParking() {
		return shopParking;
	}

	public void setShopParking(Integer shopParking) {
		this.shopParking = shopParking;
	}

	public String getShopPolicy() {
		return shopPolicy;
	}

	public void setShopPolicy(String shopPolicy) {
		this.shopPolicy = shopPolicy;
	}

	@Override
	public String toString() {
		return "ShopVO [shopNum=" + shopNum + ", memberId=" + memberId + ", shopName=" + shopName + ", shopPhone="
				+ shopPhone + ", shopAddr=" + shopAddr + ", shopOpen=" + shopOpen + ", shopClose=" + shopClose
				+ ", shopOff=" + shopOff + ", shopPhoto=" + shopPhoto + ", shopIntro=" + shopIntro + ", shopParking="
				+ shopParking + ", shopPolicy=" + shopPolicy + "]";
	}

	
}
