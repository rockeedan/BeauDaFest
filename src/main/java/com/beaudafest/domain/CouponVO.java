package com.beaudafest.domain;

public class CouponVO {
	
	
	
	private int shopNum;
	private String designName;
	private String designType;
	private String designOption;
	private int designPrice;
	private int designTime;
	private String designPhoto;
	
	public CouponVO() {
		
	}
	
	

	public CouponVO(int shopNum, String designName, String designType, String designOption, int designPrice,
			int designTime, String designPhoto) {
		
		this.shopNum = shopNum;
		this.designName = designName;
		this.designType = designType;
		this.designOption = designOption;
		this.designPrice = designPrice;
		this.designTime = designTime;
		this.designPhoto = designPhoto;
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



	@Override
	public String toString() {
		return "CouponVO [shopNum=" + shopNum + ", designName=" + designName + ", designType=" + designType
				+ ", designOption=" + designOption + ", designPrice=" + designPrice + ", designTime=" + designTime
				+ ", designPhoto=" + designPhoto + "]";
	}
	
	
	
	
}
