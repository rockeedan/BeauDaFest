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
	rsvnTime	NUMBER	NOT NULL			-- 시술 시간
	
);




ALTER TABLE reservation	ADD CONSTRAINT reservation PRIMARY KEY(rsvnNum);

ALTER TABLE reservation ADD CONSTRAINT FK_memberList_TO_reservation
FOREIGN KEY (memberId) REFERENCES memberList(memberId);

ALTER TABLE reservation ADD CONSTRAINT FK_shopInfo_TO_reservation
FOREIGN KEY (shopNum) REFERENCES shopInfo(shopNum);

--ALTER TABLE reservation ADD CONSTRAINT FK_shopDesign_TO_reservation
--FOREIGN KEY (designId) REFERENCES shopDesign(designId);


create sequence reservation_seq
       start with 1
       increment by 1
       nocycle
       nocache;	


--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);


--예약
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime)
values(1, 'gosolb', 1111, 1, sysdate, TO_DATE('2019-10-10 15:20','YYYY-MM-DD HH24:MI'), 2);

insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime)
values(2, 'gildong', 1111, 1, sysdate, TO_DATE('2019-10-10 17:20','YYYY-MM-DD HH24:MI'), 1);


insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime)
values(3, 'lime', 2222, 1, sysdate, TO_DATE('2019-10-10 13:00','YYYY-MM-DD HH24:MI'), 2);


insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime)
values(4, 'gosolb', 2222, 1, sysdate, TO_DATE('2019-10-10 15:00','YYYY-MM-DD HH24:MI'), 3);


--rsvnTime : 60,90,120

select * from memberList;
select * from reservation order by rsvnnum;

delete from reservation;



-- 1. # 2. 예약자명  3. 예약날짜  4. 시술명(디자인명) 5. 옵션 6. 합계


