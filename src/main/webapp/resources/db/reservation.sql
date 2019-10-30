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
	designId2	NUMBER						-- 옵션 아이디 
);


 --off없음 / off있음 (본샵) / off있음 (다른샵) off(첫오프) off(다른 지점) 



ALTER TABLE reservation	ADD CONSTRAINT reservation PRIMARY KEY(rsvnNum);

ALTER TABLE reservation ADD CONSTRAINT FK_memberList_TO_reservation
FOREIGN KEY (memberId) REFERENCES memberList(memberId);

ALTER TABLE reservation ADD CONSTRAINT FK_shopInfo_TO_reservation
FOREIGN KEY (shopNum) REFERENCES shopInfo(shopNum);

ALTER TABLE reservation ADD CONSTRAINT FK_shopDesign_TO_reservation
FOREIGN KEY (designId) REFERENCES shopDesign(designId);

ALTER TABLE reservation ADD CONSTRAINT FK_shopDesign2_TO_reservation
FOREIGN KEY (designId2) REFERENCES shopDesign(designId);

drop  sequence reservation_seq
create sequence reservation_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
select * from reservation order by rsvnnum;
select * from MEMBERLIST

delete from reservation

--예약

--샵1111 디자인1번(60분) + 옵션7번(30분)
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(1, 'gosolb', 1, 1, sysdate, TO_DATE('2019-10-10 15:00','YYYY-MM-DD HH24:MI'), 90, 7);

--샵1111 디자인2번(90분)
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime)
values(2, 'gildong', 1, 2, sysdate, TO_DATE('2019-10-10 16:30','YYYY-MM-DD HH24:MI'), 90);

--샵2222 디자인3번(60분) + 옵션9번(30분)
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(3, 'lime', 2, 3, sysdate, TO_DATE('2019-10-10 13:00','YYYY-MM-DD HH24:MI'), 90, 9);

--샵2222 디자인1번(90분) + 옵션10번(30분)
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(4, 'gosolb', 2, 4, sysdate, TO_DATE('2019-10-10 14:00','YYYY-MM-DD HH24:MI'), 120, 10);


insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(5, 'gosolb', 1, 1, sysdate, TO_DATE('2019-11-10 15:00','YYYY-MM-DD HH24:MI'), 90, 7);
