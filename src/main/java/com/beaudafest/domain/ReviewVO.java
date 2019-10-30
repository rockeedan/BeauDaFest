package com.beaudafest.domain;

public class ReviewVO {
	private Integer reviewNum;
	private String memberId;
	private Integer shopNum;
	private Integer reviewScore;
	private String reviewComment;
	private Integer reviewDepth;
	private Integer reviewGroup;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVO(Integer reviewNum, String memberId, Integer shopNum, Integer reviewScore, String reviewComment,
			Integer reviewDepth, Integer reviewGroup) {
		super();
		this.reviewNum = reviewNum;
		this.memberId = memberId;
		this.shopNum = shopNum;
		this.reviewScore = reviewScore;
		this.reviewComment = reviewComment;
		this.reviewDepth = reviewDepth;
		this.reviewGroup = reviewGroup;
	}
	
	public Integer getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Integer reviewNum) {
		this.reviewNum = reviewNum;
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
	public Integer getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(Integer reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public Integer getReviewDepth() {
		return reviewDepth;
	}
	public void setReviewDepth(Integer reviewDepth) {
		this.reviewDepth = reviewDepth;
	}
	public Integer getReviewGroup() {
		return reviewGroup;
	}
	public void setReviewGroup(Integer reviewGroup) {
		this.reviewGroup = reviewGroup;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", memberId=" + memberId + ", shopNum=" + shopNum + ", reviewScore="
				+ reviewScore + ", reviewComment=" + reviewComment + ", reviewDepth=" + reviewDepth + ", reviewGroup="
				+ reviewGroup + "]";
	}
	
}
