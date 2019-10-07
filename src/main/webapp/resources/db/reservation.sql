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
       
select * from reservation order by rsvnnum;

delete from reservation;


