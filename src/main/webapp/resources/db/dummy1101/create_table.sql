/* 멤버리스트 */
DROP TABLE memberList 
	CASCADE CONSTRAINTS;

/* 멤버리스트 */
CREATE TABLE memberList (
	memberId VARCHAR2(200) NOT NULL, /* 멤버아이디 */
	memberName VARCHAR2(300) NOT NULL, /* 멤버이름 */
	memberPass VARCHAR2(100), /* 멤버비밀번호 */
	memberEmail VARCHAR2(300) NOT NULL, /* 멤버이메일 */
	memberPhone VARCHAR2(300) NOT NULL, /* 멤버연락처 */
	memberStatus NUMBER NOT NULL /* 멤버상태 */
);

ALTER TABLE memberList
	ADD
		CONSTRAINT PK_memberList
		PRIMARY KEY (
			memberId
		);


		
/* 샵정보 */
DROP TABLE shopInfo 
	CASCADE CONSTRAINTS;

/* 샵정보 */
CREATE TABLE shopInfo (
	shopNum NUMBER NOT NULL, /* 샵넘버 */
	memberId VARCHAR2(200), /* 멤버아이디 */
	shopName VARCHAR2(100) NOT NULL, /* 샵이름 */
	shopPhone VARCHAR2(30) NOT NULL, /* 샵연락처 */
	shopAddr VARCHAR2(300) NOT NULL, /* 샵주소 */
	shopOpen VARCHAR2(10) NOT NULL, /* 샵여는시간 */
	shopClose VARCHAR2(10), /* 샵닫는시간 */
	shopOff VARCHAR2(300) NOT NULL, /* 샵휴일 */
	shopPhoto VARCHAR2(500) NOT NULL, /* 샵사진 */
	shopIntro VARCHAR2(1500) NOT NULL, /* 샵소개 */
	shopParking NUMBER, /* 주차유무 */
	shopPolicy VARCHAR2(500) NOT NULL /* 취소정책 */
);

ALTER TABLE shopInfo
	ADD
		CONSTRAINT PK_shopInfo
		PRIMARY KEY (
			shopNum
		);

ALTER TABLE shopInfo
	ADD
		CONSTRAINT FK_memberList_TO_shopInfo
		FOREIGN KEY (
			memberId
		)
		REFERENCES memberList (
			memberId
		);
		

/* 예약가능날짜 */
DROP TABLE monthSchedule 
	CASCADE CONSTRAINTS;

/* 예약가능날짜 */
CREATE TABLE monthSchedule (
	addDate DATE NOT NULL, /* 예약가능날짜추가 */
	shopNum NUMBER NOT NULL /* 샵넘버 */
);

ALTER TABLE monthSchedule
	ADD
		CONSTRAINT PK_monthSchedule
		PRIMARY KEY (
			addDate,
			shopNum
		);

ALTER TABLE monthSchedule
	ADD
		CONSTRAINT FK_shopInfo_TO_monthSchedule
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);
		
/* 예약가능시간 */
DROP TABLE timeSchedule 
	CASCADE CONSTRAINTS;

/* 예약가능시간 */
CREATE TABLE timeSchedule (
	shopNum NUMBER, /* 샵넘버 */
	addDate DATE, /* 예약가능날짜추가 */
	startTime DATE NOT NULL, /* 예약가능시간시작 */
	endTime DATE NOT NULL, /* 예약마감시간 */
	arranged NUMBER NOT NULL /* 예약여부 */
);

ALTER TABLE timeSchedule
	ADD
		CONSTRAINT FK_shopInfo_TO_timeSchedule
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);

ALTER TABLE timeSchedule
	ADD
		CONSTRAINT FK_mSchedule_TO_tSchedule
		FOREIGN KEY (
			addDate,
			shopNum
		)
		REFERENCES monthSchedule (
			addDate,
			shopNum
		);
		
		
/* 샵디자인 */
DROP TABLE shopDesign 
	CASCADE CONSTRAINTS;

/* 샵디자인 */
CREATE TABLE shopDesign (
	designId NUMBER NOT NULL, /* 디자인아이디 */
	shopNum NUMBER, /* 샵넘버 */
	designName VARCHAR2(100) NOT NULL, /* 디자인이름 */
	designType VARCHAR2(50) NOT NULL, /* 디자인형태 */
	designOption VARCHAR2(100), /* 상품구분 */
	designPrice NUMBER NOT NULL, /* 디자인가격 */
	designTime NUMBER NOT NULL, /* 시술시간 */
	designPhoto VARCHAR2(500) NOT NULL /* 디자인사진 */
);

ALTER TABLE shopDesign
	ADD
		CONSTRAINT PK_shopDesign
		PRIMARY KEY (
			designId
		);

ALTER TABLE shopDesign
	ADD
		CONSTRAINT FK_shopInfo_TO_shopDesign
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);
		
/* 옵션 */
DROP TABLE addOption 
	CASCADE CONSTRAINTS;

/* 옵션 */
CREATE TABLE addOption (
	designId NUMBER, /* 디자인아이디 */
	designId2 NUMBER /* 옵션아이디 */
);

ALTER TABLE addOption
	ADD
		CONSTRAINT FK_shopDesign_TO_addOption
		FOREIGN KEY (
			designId
		)
		REFERENCES shopDesign (
			designId
		);

ALTER TABLE addOption
	ADD
		CONSTRAINT FK_shopDesign_TO_addOption2
		FOREIGN KEY (
			designId2
		)
		REFERENCES shopDesign (
			designId
		);
		

/* 예약 */
DROP TABLE reservation
	CASCADE CONSTRAINTS;

CREATE TABLE reservation (
	rsvnNum		NUMBER	NOT NULL, 			-- 예약 번호
	memberId	VARCHAR2(200)	NOT NULL, 	-- 멤버 아이디 
	shopNum		NUMBER	NOT NULL,			-- 샵 번호  
	designId	NUMBER	NOT NULL,			-- 디자인 아이디 
	bookingDate	DATE	NOT NULL,			-- 예약 날짜 
	rsvnDate	DATE	NOT NULL,			-- 시술 일시 
	rsvnTime	NUMBER	NOT NULL,			-- 시술 시간
	designId2	NUMBER,						-- 옵션 아이디
	--rsvnstatus	NUMBER						-- 예약 상태(0: 확정,1: 취소, 2: 노쇼)
);

--off없음 / off있음 (본샵) / off있음 (다른샵) off(첫오프) off(다른 지점) 

--예약상태(
ALTER TABLE reservation ADD(rsvnstatus NUMBER);
update RESERVATION set rsvnstatus = 0;

ALTER TABLE reservation	ADD CONSTRAINT reservation PRIMARY KEY(rsvnNum);

ALTER TABLE reservation ADD CONSTRAINT FK_memberList_TO_reservation
FOREIGN KEY (memberId) REFERENCES memberList(memberId);

ALTER TABLE reservation ADD CONSTRAINT FK_shopInfo_TO_reservation
FOREIGN KEY (shopNum) REFERENCES shopInfo(shopNum);

ALTER TABLE reservation ADD CONSTRAINT FK_shopDesign_TO_reservation
FOREIGN KEY (designId) REFERENCES shopDesign(designId);

ALTER TABLE reservation ADD CONSTRAINT FK_shopDesign2_TO_reservation
FOREIGN KEY (designId2) REFERENCES shopDesign(designId);
		
/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 리뷰 */
CREATE TABLE review (
	reviewNum NUMBER NOT NULL, /* 리뷰번호 */
	memberId VARCHAR2(200) NOT NULL, /* 멤버아이디 */
	shopNum NUMBER NOT NULL, /* 샵넘버 */
	rsvnNum NUMBER, /* 예약번호 */
	reviewScore NUMBER NOT NULL, /* 리뷰평점 */
	reviewComment VARCHAR2(1000) NOT NULL, /* 리뷰코멘트 */
	reviewDepth NUMBER NOT NULL, /* 리뷰깊이 */
	reviewGroup NUMBER NOT NULL, /* 리뷰그룹 */
	reviewDate DATE NOT NULL /* 리뷰작성날짜 */
);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			reviewNum
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_memberList_TO_review
		FOREIGN KEY (
			memberId
		)
		REFERENCES memberList (
			memberId
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_shopInfo_TO_review
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_reservation_TO_review
		FOREIGN KEY (
			rsvnNum
		)
		REFERENCES reservation (
			rsvnNum
		);
		
		
		

		
--sequence
drop sequence shopInfo_seq;
create sequence shopInfo_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
drop sequence shopDesign_seq;
create sequence shopDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
--네일디자인시퀀스 (nd1, nd2..... )
drop sequence nailDesign_seq;
create sequence nailDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
--네일옵션 시퀀스 (no1, no2..... )
drop sequence nailOption_seq;
create sequence nailOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
--페디디자인시퀀스 (pd1, pd2..... )
drop sequence pediDesign_seq;
create sequence pediDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
--페디옵션시퀀스 (po1, po2..... )
drop sequence pediOption_seq;
create sequence pediOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
--속눈썹디자인시퀀스 (po1, po2..... )
drop sequence lashDesign_seq;
create sequence lashDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
--속눈썹디자인시퀀스 (po1, po2..... )
drop sequence lashOption_seq;
create sequence lashOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;

--예약시퀀스
drop  sequence reservation_seq;
create sequence reservation_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
--리뷰시퀀스       
drop  sequence review_seq;
create sequence review_seq
       start with 1
       increment by 1
       nocycle
       nocache;