package com.beaudafest.domain;

public class CouponVO {
	
	
	private String shopName;
	private String shopIntro;
	private int shopNum;
	private int designId;
	private String designName;
	private String designType;
	private String designOption;
	private int designPrice;
	private int designTime;
	private String designPhoto;
	
	public CouponVO() {
		
	}
	
	


	public CouponVO(String shopName, String shopIntro, int shopNum, int designId, String designName, String designType,
			String designOption, int designPrice, int designTime, String designPhoto) {
		super();
		this.shopName = shopName;
		this.shopIntro = shopIntro;
		this.shopNum = shopNum;
		this.designId = designId;
		this.designName = designName;
		this.designType = designType;
		this.designOption = designOption;
		this.designPrice = designPrice;
		this.designTime = designTime;
		this.designPhoto = designPhoto;
	}




	public String getShopName() {
		return shopName;
	}




	public void setShopName(String shopName) {
		this.shopName = shopName;
	}




	public String getShopIntro() {
		return shopIntro;
	}




	public void setShopIntro(String shopIntro) {
		this.shopIntro = shopIntro;
	}




	public int getShopNum() {
		return shopNum;
	}

	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}

	public String getDesignName() {
		return designName;
	}

	public void setDesignName(String designName) {
		this.designName = designName;
	}

	public String getDesignType() {
		return designType;
	}

	public void setDesignType(String designType) {
		this.designType = designType;
	}

	public String getDesignOption() {
		return designOption;
	}

	public void setDesignOption(String designOption) {
		this.designOption = designOption;
	}

	public int getDesignPrice() {
		return designPrice;
	}

	public void setDesignPrice(int designPrice) {
		this.designPrice = designPrice;
	}

	public int getDesignTime() {
		return designTime;
	}

	public void setDesignTime(int designTime) {
		this.designTime = designTime;
	}

	public String getDesignPhoto() {
		return designPhoto;
	}

	public void setDesignPhoto(String designPhoto) {
		this.designPhoto = designPhoto;
	}

	

	public int getDesignId() {
		return designId;
	}



	public void setDesignId(int designId) {
		this.designId = designId;
	}



	@Override
	public String toString() {
		return "CouponVO [shopNum=" + shopNum + ", designId=" + designId + ", designName=" + designName
				+ ", designType=" + designType + ", designOption=" + designOption + ", designPrice=" + designPrice
				+ ", designTime=" + designTime + ", designPhoto=" + designPhoto + "]";
	}



	
	
	
	
	
}
