
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
