package com.beaudafest.domain;

import java.util.Date;

public class ReservationVO {
	
	
	private Integer rsvnNum;
	private String memberId;
	private Integer shopNum;
	private Integer designId;
	private Date bookingDate;
	private Date rsvnDate;
	private Integer rsvnTime;
	private Integer designId2;
	private Integer rsvnstatus;
	private String rsvnName;
	private String rsvnPhone;
	
	
	
	
	public String getRsvnName() {
		return rsvnName;
	}




	public void setRsvnName(String rsvnName) {
		this.rsvnName = rsvnName;
	}




	public String getRsvnPhone() {
		return rsvnPhone;
	}




	public void setRsvnPhone(String rsvnPhone) {
		this.rsvnPhone = rsvnPhone;
	}




	public Integer getDesignId2() {
		return designId2;
	}




	public void setDesignId2(Integer designId2) {
		this.designId2 = designId2;
	}




	public Integer getRsvnstatus() {
		return rsvnstatus;
	}




	public void setRsvnstatus(Integer rsvnstatus) {
		this.rsvnstatus = rsvnstatus;
	}




	public ReservationVO() {
		super();
	}




	public ReservationVO(Integer rsvnNum, String memberId, Integer shopNum, Integer designId, Date bookingDate,
			Date rsvnDate, Integer rsvnTime) {
		super();
		this.rsvnNum = rsvnNum;
		this.memberId = memberId;
		this.shopNum = shopNum;
		this.designId = designId;
		this.bookingDate = bookingDate;
		this.rsvnDate = rsvnDate;
		this.rsvnTime = rsvnTime;
	}




	public Integer getRsvnNum() {
		return rsvnNum;
	}




	public void setRsvnNum(Integer rsvnNum) {
		this.rsvnNum = rsvnNum;
	}




	public String getMemberId() {
		return memberId;
	}




	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}




	public Integer getShopNum() {
		return shopNum;
	}




	public void setShopNum(Integer shopNum) {
		this.shopNum = shopNum;
	}




	public Integer getDesignId() {
		return designId;
	}




	public void setDesignId(Integer designId) {
		this.designId = designId;
	}




	public Date getBookingDate() {
		return bookingDate;
	}




	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}




	public Date getRsvnDate() {
		return rsvnDate;
	}




	public void setRsvnDate(Date rsvnDate) {
		this.rsvnDate = rsvnDate;
	}




	public Integer getRsvnTime() {
		return rsvnTime;
	}




	public void setRsvnTime(Integer rsvnTime) {
		this.rsvnTime = rsvnTime;
	}
	
	
	
	
	

}
