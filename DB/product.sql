CREATE SEQUENCE SEQ_PRODUCT;

CREATE TABLE TBL_PRODUCT(
	PRODUCT_NUMBER NUMBER CONSTRAINT PK_PRODUCT PRIMARY KEY NOT NULL,
	PRODUCT_NAME VARCHAR2(100),
	PRODUCT_CATEGORY VARCHAR2(100),
	PRODUCT_PRICE NUMBER,
	PRODUCT_STOCK NUMBER,
	PRODUCT_MANUFACTURE_DATE DATE,
	PRODUCT_EXPIRATION_DATE DATE,
	PRODUCT_ONELINE_INFORMATION VARCHAR2(100),
	PRODUCT_INFORMATION VARCHAR2(1000),
	PRODUCT_THUMBNAIL_NAME VARCHAR2(100) DEFAULT '썸네일이미지',
	PRODUCT_MAIN_IMAGE_NAME VARCHAR2(100) DEFAULT '본문이미지',
	PRODUCT_REGIST_DATE DATE DEFAULT SYSDATE,
	PRODUCT_MODIFY_DATE DATE DEFAULT SYSDATE,
	PRODUCT_SALE_PERCENT NUMBER,
	PRODUCT_VIEW_COUNT NUMBER,
	PRODUCT_TODAY_SALE DATE,
	PRODUCT_OPEN_HOURS DATE,
	PRODUCT_SALE_PRICE NUMBER DEFAULT PRODUCT_PRICE * (1-PRODUCT_SALE_PERCENT/100),
	MEMBER_NUMBER NUMBER,
	CONSTRAINT FK_PRODUCT FOREIGN KEY(MEMBER_NUMBER)
	REFERENCES TBL_MEMBER(MEMBER_NUMBER)
);

DROP TABLE TBL_PRODUCT;

SELECT * FROM TBL_PRODUCT;
SELECT * FROM TBL_MEMBER;

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_CATEGORY, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_MANUFACTURE_DATE, PRODUCT_EXPIRATION_DATE, PRODUCT_ONELINE_INFORMATION, PRODUCT_INFORMATION, PRODUCT_SALE_PERCENT, PRODUCT_TODAY_SALE, PRODUCT_OPEN_HOURS, MEMBER_NUMBER) 
VALUES(SEQ_PRODUCT.NEXTVAL, '토마토','채소','3000','10','20221124', '20221210', '신선한 채소에요','유기농으로 재배되어 안심하고 먹을 수 있어요','10','20221201', to_date('20221202 23:00', 'yyyymmdd hh24:mi'), 3);

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_CATEGORY, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_MANUFACTURE_DATE, PRODUCT_EXPIRATION_DATE, PRODUCT_ONELINE_INFORMATION, PRODUCT_INFORMATION, PRODUCT_SALE_PERCENT, PRODUCT_TODAY_SALE, PRODUCT_OPEN_HOURS, MEMBER_NUMBER) 
VALUES(SEQ_PRODUCT.NEXTVAL, '당근','채소','2000','10','20221125', '20221210', '신선한 채소에요','유기농으로 재배되어 안심하고 먹을 수 있어요','50','20221201', to_date('20221202 23:00', 'yyyymmdd hh24:mi'), 2);

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_CATEGORY, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_MANUFACTURE_DATE, PRODUCT_EXPIRATION_DATE, PRODUCT_ONELINE_INFORMATION, PRODUCT_INFORMATION, PRODUCT_SALE_PERCENT, PRODUCT_TODAY_SALE, PRODUCT_OPEN_HOURS, MEMBER_NUMBER) 
VALUES(SEQ_PRODUCT.NEXTVAL, '아아','생수.음료.우유.커피','1700','10','20221124', '20221205', '아아시원해요','머신으로 내려마시는것 만큼 맛있어요','30','20221201', to_date('20221202 23:00', 'yyyymmdd hh24:mi'), 5);

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_CATEGORY, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_MANUFACTURE_DATE, PRODUCT_EXPIRATION_DATE, PRODUCT_ONELINE_INFORMATION, PRODUCT_INFORMATION, PRODUCT_SALE_PERCENT, PRODUCT_TODAY_SALE, PRODUCT_OPEN_HOURS, MEMBER_NUMBER) 
VALUES(SEQ_PRODUCT.NEXTVAL, '요거트','생수.음료.우유.커피','5000','10','20221128', '20221207', '꾸덕해요','목이 막힐 정도로 꾸덕한 요거트 여기있습니다!','60','20221201', to_date('20221202 23:00', 'yyyymmdd hh24:mi'), 5);

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_CATEGORY, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_MANUFACTURE_DATE, PRODUCT_EXPIRATION_DATE, PRODUCT_ONELINE_INFORMATION, PRODUCT_INFORMATION, PRODUCT_SALE_PERCENT, PRODUCT_TODAY_SALE, PRODUCT_OPEN_HOURS, MEMBER_NUMBER) 
VALUES(SEQ_PRODUCT.NEXTVAL, '물','생수.음료.우유.커피','6000','10','20221124', '20231110', '지하 암반수','물 맛이 다릅니다. 드셔보시면 알게 되실거에요','20','20221201', to_date('20221202 23:00', 'yyyymmdd hh24:mi'), 5);

UPDATE TBL_PRODUCT
SET PRODUCT_SALE_PRICE = PRODUCT_PRICE * (1 - PRODUCT_SALE_PERCENT/100);

UPDATE TBL_PRODUCT 
SET PRODUCT_VIEW_COUNT = 5
WHERE PRODUCT_VIEW_COUNT IS NULL



SELECT PRODUCT_NUMBER, PRODUCT_SALE_PRICE  FROM TBL_PRODUCT
ORDER BY PRODUCT_REGIST_DATE DESC;

DELETE FROM TBL_PRODUCT
WHERE PRODUCT_NUMBER= 1;

ALTER TABLE TBL_PRODUCT ADD PRODUCT_SALE_PRICE NUMBER;
UPDATE TBL_PRODUCT 
SET PRODUCT_SALE_PRICE = PRODUCT_PRICE * (1-PRODUCT_SALE_PERCENT/100);

ALTER TABLE TBL_PRODUCT DROP COLUMN PRODUCT_SALE_PRICE;

TRUCATE (PRODUCT_OPEN_HOURS,'HH24:MM');

SELECT TO_CHAR(PRODUCT_REGIST_DATE, 'PMHH:MI') TIME24 FROM TBL_PRODUCT;

--	ORDER_DETAIL_NUMBER,
--	CONSTRAINT FK_PRODUCT_ORDER_DETAIL FOREIGN KEY(ORDER_DETAIL_NUMBER) 
--	REFERENCES TBL_ORDER_DETAIL(ORDER_DETAIL_NUMBER)

ALTER TABLE TBL_PRODUCT ADD PRODUCT_COL_NUM NUMBER;

        
        
        
        
        
        
        
        
        
        
        
        
        
        