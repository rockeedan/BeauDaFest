package com.beaudafest.domain;

public class MemberVO {
	private String memberId;
	private String memberPass;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private Integer memberStatus;

	public MemberVO() {
		
	}

	public MemberVO(String memberId, String memberPass, String memberName, String memberEmail, String memberPhone,
			Integer memberStatus) {
		super();
		this.memberId = memberId;
		this.memberPass = memberPass;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberStatus = memberStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPass() {
		return memberPass;
	}

	public void setMemberPass(String memberPass) {
		this.memberPass = memberPass;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public Integer getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(Integer memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPass=" + memberPass + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberStatus=" + memberStatus
				+ "]";
	}

}
