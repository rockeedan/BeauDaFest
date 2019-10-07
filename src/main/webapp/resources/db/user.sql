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
		
		
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('hana1','하나','a1234','hana1@naver.com','010-1111-1111',1);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('hana2','둘','a1234','hana2@naver.com','010-2222-2222',1);
 
		
select * from memberList

delete from memberList



--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);


