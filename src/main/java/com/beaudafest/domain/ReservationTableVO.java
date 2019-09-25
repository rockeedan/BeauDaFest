package com.beaudafest.domain;

import java.util.Date;

public class ReservationTableVO {
	private int shopNum;
	private String addDate;
	private String startTime;
	private Date startTimeDate;
	private String endTime;
	private Date endTimeDate;
	private int arranged;
	
	public Date getStartTimeDate() {
		return startTimeDate;
	}
	public void setStartTimeDate(Date startTimeDate) {
		this.startTimeDate = startTimeDate;
	}
	public Date getEndTimeDate() {
		return endTimeDate;
	}
	public void setEndTimeDate(Date endTimeDate) {
		this.endTimeDate = endTimeDate;
	}
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
