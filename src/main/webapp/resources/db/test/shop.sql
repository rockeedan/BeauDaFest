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

		
select * from shopInfo;

--delete from shopInfo

--select * from SHOPDESIGN;

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','주원샵','02-1111-1111','서울시|서초구|서초동|12번지','10:00','18:00', '월,화','2019/10/14/uuid_2019846505481.png','주원샵입니다.',1,'취소정책');

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'yoosin','유신샵','02-3333-3333','서울시|강남구|강남동|11번지','10:00','18:00', '목,금','2019/10/14/uuid_cute.jpg','유신샵입니다.',1,'취소정책');

insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'gamchan','감찬샵','02-2222-2222','서울시|마포구|마포동|13번지','10:00','18:00', '토,일,월', '2019/10/14/uuid_2019846722751.jpg','감찬샵입니다.',0,'취소정책');


select * from shopInfo;
select * from memberList;

--샵추가
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, 
shopOpen, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','주원샵2','02-1111-1111','서울시 서초구 방배동',
'11:00','18:00','2019/10/14/2019846505481.png','4샵정보',1,'취소정책');
