drop table shopInfo;
drop table timeSchedule;
drop table monthSchedule;

﻿/* 샵정보 */
CREATE TABLE shopInfo (
	shopNum NUMBER NOT NULL, /* 샵넘버 */
	userId VARCHAR2(200), /* 유저아이디 */
	shopName VARCHAR2(100) NOT NULL, /* 샵이름 */
	shopPhone VARCHAR2(30) NOT NULL, /* 샵연락처 */
	shopAddr VARCHAR2(300) NOT NULL, /* 샵주소 */
	shopOpenTime VARCHAR2(30) NOT NULL, /* 샵오픈시간 */
	shopCloseTime VARCHAR2(30) NOT NULL, /* 샵클로즈시간 */
	shopOff VARCHAR2(300) NOT NULL, /* 샵휴일 */
	shopPhoto VARCHAR2(500) NOT NULL, /* 샵사진 */
	shopIntro VARCHAR2(1500) NOT NULL, /* 샵소개 */
	shopParking NUMBER, /* 주차유무 */
	shopPolicy VARCHAR2(500) NOT NULL /* 취소정책 */
);


/* 예약가능시간 */
CREATE TABLE timeSchedule (
	shopNum NUMBER, /* 샵넘버 */
	addDate DATE, /* 예약가능날짜추가 */
	startTime DATE NOT NULL, /* 예약가능시간시작 */
	endTime DATE NOT NULL, /* 예약마감시간 */
	arranged NUMBER NOT NULL /* 예약여부 */
);

/* 예약가능날짜 */
CREATE TABLE monthSchedule (
	addDate DATE NOT NULL, /* 예약가능날짜추가 */
	shopNum NUMBER /* 샵넘버 */
);


select * from monthSchedule

/*샵추가*/
(shopNum, userId, shopName,shopPhone,shopAddr,shopOpenTime,shopCloseTime,shopOff,shopPhoto,shopIntro,shopParking,shopPolicy)
insert into shopInfo (shopNum, userId, shopName,shopPhone,shopAddr,shopOpenTime,shopCloseTime,shopOff,shopPhoto,shopIntro,shopParking,shopPolicy)
values(1,'jsooshi','샵이름','325-0134','강남구 서초로 12길17','10:00','17:00','월요일','사진.jpg','안녕하세요 잘부탁드려요',0,'취소는 안돼요')
/* 예약가능날짜 */
(addDate, shopNum)
insert into monthSchedule (addDate, shopNum)
values (sysdate,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+1,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+2,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+3,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+4,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+5,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+6,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+7,1);
insert into monthSchedule (addDate, shopNum)
values (sysdate+8,1);


/* 예약가능시간 */
select to_char(startTime,'HH24:MI') startTime,to_char(endTime,'HH24:MI') endTime, arranged from timeSchedule order by startTime
select to_char(startTime,'HH24:MI') startTime,to_char(endTime,'HH24:MI') endTime, arranged from timeSchedule
where startTime >= to_date('2019/09/21 14:10','YYYY/MM/DD HH24:MI')
order by startTime

select '예약가능' as title, '/beaudafest/reservation/test' as url,to_char(startTime,'YYYY/MM/DD HH24:MI:SS') as "start",to_char(endTime,'YYYY/MM/DD HH24:MI:SS') as "end"
		from timeSchedule

select '예약가능' as title, '/beaudafest/reservation/test' as url,to_char(startTime,'YYYY/MM/DD HH24:MI:SS') as "start",to_char(endTime,'YYYY/MM/DD HH24:MI:SS') as "end"
		from timeSchedule

select * from timeSchedule where startTime=to_date('10:30','HH:MI');
delete timeSchedule where endTime=to_date('11:30','HH:MI');
delete timeSchedule;

select addDate, to_char(startTime,'YYYY/MM/DD HH24:MI') startTime,to_char(endTime,'YYYY/MM/DD HH24:MI') endTime, arranged
			from timeSchedule
			where shopNum=1 and
			addDate BETWEEN TO_DATE('2019/09/22', 'YYYY/MM/DD') AND TO_DATE('2019/09/28', 'YYYY/MM/DD')
			order by startTime
			
update timeSchedule set arranged=0 where addDate=TO_DATE('2019/09/24', 'YYYY/MM/DD')

(shopNum,addDate,startTime,endTime,arranged)
insert into timeSchedule (shopNum,addDate,startTime,endTime,arranged)
values (1,sysdate,to_date('21/9/19 17:00','DD/MM/RR HH24:MI'),to_date('21/9/19 17:30','DD/MM/RR HH24:MI'),1)
insert into timeSchedule (shopNum,addDate,startTime,endTime,arranged)
values (1,sysdate,to_date('10:30','HH:MI'),to_date('11:00','HH:MI'),1)
insert into timeSchedule (shopNum,addDate,startTime,endTime,arranged)
values (1,sysdate,to_date('11:00','HH:MI'),to_date('11:30','HH:MI'),1)
insert into timeSchedule (shopNum,addDate,startTime,endTime,arranged)
values (1,sysdate,to_date(('11'+':00'),'HH:MI'),to_date('11:30','HH:MI'),1)

