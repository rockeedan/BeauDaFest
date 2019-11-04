
--샵디자인

DROP TABLE shopDesign
	CASCADE CONSTRAINTS;
	
	
CREATE TABLE shopDesign (
	designId	NUMBER	NOT NULL,			-- 디자인 아이디 
	shopNum		NUMBER	NOT NULL,			-- 샵 번호  
	designName	VARCHAR2(100) NOT NULL,		-- 디자인 이름  
	designType VARCHAR2(50) NOT NULL,		-- 디자인 형태  
	designOption VARCHAR2(100)  NOT NULL,	-- 상품 구분  
	designPrice NUMBER  NOT NULL,			-- 디자인 가격  
	designTime  NUMBER  NOT NULL,			-- 시술 시간  
	designPhoto  VARCHAR2(500)  NOT NULL	-- 디자인 사진 
);

ALTER TABLE shopDesign	ADD CONSTRAINT shopDesign PRIMARY KEY(designId);
ALTER TABLE shopDesign ADD CONSTRAINT FK_shopInfo_TO_shopDesign
FOREIGN KEY (shopNum) REFERENCES shopInfo(shopNum);

drop sequence designDesign_seq;
drop sequence designOption_seq;


--네일디자인시퀀스 (nd1, nd2..... )
drop sequence nailDesign_seq;
create sequence nailDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
--네일옵션 시퀀스 (no1, no2..... )
drop sequence nailOption_seq;
create sequence nailOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
--페디디자인시퀀스 (pd1, pd2..... )
drop sequence pediDesign_seq;
create sequence pediDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;	     

       
--페디옵션시퀀스 (po1, po2..... )
drop sequence pediOption_seq;
create sequence pediOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;	     
  
--속눈썹디자인시퀀스 (ld1, ld2..... )
drop sequence lashDesign_seq;
create sequence lashDesign_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
       
       
--속눈썹디자인시퀀스 (lo1, lo2..... )
drop sequence lashOption_seq;
create sequence lashOption_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
--옵션X
insert into shopDesign values(1, 1111, '원컬러 젤네일', '네일', 'ND', 50000, 60, '사진1'); --샵1111 디자인1 
insert into shopDesign values(2, 1111, '포인트 젤네일', '네일', 'ND', 62000, 90, '사진2'); --샵1111 디자인2 
insert into shopDesign values(3, 2222, '원컬러 젤네일', '네일', 'ND', 30000, 60, '사진3'); --샵2222 디자인3 
insert into shopDesign values(4, 2222, '글리터 젤네일', '네일', 'ND', 80000, 90, '사진4'); --샵2222 디자인4

--옵션
insert into shopDesign values(7, 1111, '타샵 off', '네일', 'NO', 10000, 30, '사진5' ); --샵1111 디자인7 
insert into shopDesign values(8, 1111, '자샵 off', '네일', 'NO', 10000, 30, '사진6' ); --샵1111 디자인8
insert into shopDesign values(9, 2222, '타샵 off', '네일', 'NO', 20000, 30, '사진7' ); --샵2222 디자인9
insert into shopDesign values(10, 2222, '자샵 off', '네일', 'NO', 0, 30, '사진8');   --샵22222 디자인10

select * from SHOPDESIGN;
delete from SHOPDESIGN;