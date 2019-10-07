
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

