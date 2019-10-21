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
		
drop sequence shopInfo_seq;
create sequence shopInfo_seq
       start with 1
       increment by 1
       nocycle
       nocache;	

		
--select * from shopInfo

--delete from shopInfo

--select * from SHOPDESIGN;

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','주원샵','02-1111-1111','서울시 서초구 서초동','10:00','18:00','월,화','3샵정보',1,'취소정책');

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'yoosin','유신샵','02-3333-3333','서울시 강남구 강남동','10:00','18:00','토,일','3샵정보',1,'취소정책');

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'gamchan','감찬샵','02-2222-2222','서울시 마포구 마포동','10:00','18:00','목,금','샵정보',0,'취소정책');

update shopInfo set shopPhoto='santa.jpg' where shopNum=1;

update shopInfo set shopPhoto='2019/10/14/2019846505481.png' where shopNum=1;

select * from shopInfo

