package com.beaudafest.domain;

public class ReservationTableVO {
	private int shopNum;
	private String addDate;
	private String startTime;
	private String endTime;
	private int arranged;
	
	public int getShopNum() {
		return shopNum;
	}
	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}
	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getArranged() {
		return arranged;
	}
	public void setArranged(int arranged) {
		this.arranged = arranged;
	}
}
