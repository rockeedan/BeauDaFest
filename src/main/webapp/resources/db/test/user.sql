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
		


--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);

--오너회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('juwon','주원','1234qwer','juwon@gmail.com','010-5555-6666',1);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('yoosin','유신','1234qwer','yoosin@gmail.com','010-1111-2222',1);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gamchan','감찬','1234qwer','gamchan@gmail.com','010-3333-4444',1);


select * from memberlist;