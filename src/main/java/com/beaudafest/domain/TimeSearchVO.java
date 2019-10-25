package com.beaudafest.domain;

import java.util.Date;

public class TimeSearchVO {
	private String searchTime;
	private String shopAddr;
	
	public TimeSearchVO() {
		
	}
	
	public String getSearchTime() {
		return searchTime;
	}
	
	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}
	
	public String getShopAddr() {
		return shopAddr;
	}
	
	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}
	
	public TimeSearchVO(String searchTime, String shopAddr) {
		super();
		this.searchTime = searchTime;
		this.shopAddr = shopAddr;
	}

	@Override
	public String toString() {
		return "TimeScheduleVO [searchTime=" + searchTime + ", shopAddr=" + shopAddr + "]";
	}
}
