/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 리뷰 */
CREATE TABLE review (
	reviewNum NUMBER NOT NULL, /* 리뷰번호 */
	memberId VARCHAR2(200) NOT NULL, /* 멤버아이디 */
	shopNum NUMBER NOT NULL, /* 샵넘버 */
	rsvnNum NUMBER, /* 예약번호 */
	reviewScore NUMBER, /* 리뷰평점 */
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
		
drop  sequence review_seq;
create sequence review_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
delete from REVIEW;

--샵2 디자인3번(60분) + 옵션9번(30분)       
insert into review values(review_seq.nextval, 'gosolb', 1, 1, 5, '예뻐요', 0, review_seq.currval, sysdate);
insert into review values(review_seq.nextval, 'gildong', 1, 3, 1, '별로', 0, review_seq.currval, sysdate);
insert into review(reviewNum, memberId, shopNum, reviewComment, reviewDepth, reviewGroup, reviewDate) 
values(3, 'juwon', 1, 'Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, sysdate); --샵1111 디자인1
insert into review(reviewNum, memberId, shopNum, reviewComment, reviewDepth, reviewGroup, reviewDate) 
values(4, 'juwon', 1, '2Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, sysdate); --샵1111 디자인1
update review set reviewComment='Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages'
where memberId='gosolb';
update review set reviewComment='Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
where memberId='gildong';

select * from review;


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
		
		
select reviewNum, memberId, shopNum, reviewComment, reviewDepth, reviewGroup, memberName, shopName
from(select reviewNum, memberId, shopNum, reviewComment, reviewDepth, reviewGroup, memberName
	from review join MEMBERLIST
	using(memberId)
	where shopNum=1 and reviewDepth=1) join shopInfo
using (shopNum, memberId)




select reviewNum, memberId, shopNum, reviewComment, reviewDepth, reviewGroup, memberName, reviewDate, shopName
from review join (select memberName,memberId, shopNum, shopName
				  from memberList join shopInfo
				  using (memberId)
				  where shopNum=1)
using(memberId, shopNum)
where reviewDepth=1