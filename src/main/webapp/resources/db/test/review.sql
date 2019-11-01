/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 리뷰 */
CREATE TABLE review (
	reviewNum NUMBER NOT NULL, /* 리뷰번호 */
	memberId VARCHAR2(200) NOT NULL, /* 멤버아이디 */
	shopNum NUMBER NOT NULL, /* 샵넘버 */
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
		
drop sequence review_seq;
create sequence review_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
       