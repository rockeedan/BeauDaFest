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
	reviewGroup NUMBER NOT NULL /* 리뷰그룹 */
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
		
drop sequence review_seq;
create sequence review_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
       
--샵2 디자인3번(60분) + 옵션9번(30분)       
insert into review values(1, 'lime', 2, 3, 5, '예뻐요', 0, 1); --샵1111 디자인1

select * from review


select reviewNum, memberId, shopNum, reviewScore, reviewComment, reviewDepth, reviewGroup, designName, memberName,rsvnNum
from (select reviewNum, memberId, shopNum, reviewScore, reviewComment, reviewDepth, reviewGroup, designName, rsvnNum
		from review join (select rsvnNum, designName
						  from reservation join shopDesign 
		                  using (designId)) 
		using (rsvnNum)) join MEMBERLIST
using(memberId)
where shopNum=2



select sum(reviewScore)/count(reviewScore) scoreAvg
		from review where shopNum=2
		
		
select count(*) from review
		where rsvnNum=3 and (select bookingDate from reservation where rsvnNum=3)<sysdate