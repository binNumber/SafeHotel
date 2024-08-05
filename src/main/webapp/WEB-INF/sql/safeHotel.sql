--유저 정보 테이블
CREATE TABLE USER_INFO(
 user_code NUMBER(10) NOT NULL PRIMARY KEY,
 user_type VARCHAR(3) NOT NULL,
 user_id VARCHAR2(20) NOT NULL,
 user_pw VARCHAR2(20) NOT NULL,
 user_nickname VARCHAR2(50) NOT NULL,
 user_name VARCHAR2(20) NOT NULL,
 user_rsd_reg_num VARCHAR2(14) NOT NULL,
 user_phone_num VARCHAR2(15) NOT NULL,
 user_email VARCHAR2(30) NOT NULL,
 user_addr VARCHAR2(100) NOT NULL,
 user_reg_dt DATE NOT NULL,
 user_status VARCHAR(1) NOT NULL
);

SELECT * FROM USER_INFO;

--사업자 정보 테이블
CREATE TABLE BUSINESS (
 bsns_code VARCHAR2(12) NOT NULL PRIMARY KEY,
 user_code NUMBER(10) NOT NULL,
 bsns_owner_name VARCHAR2(20) NOT NULL
);

SELECT * FROM BUSINESS;

--숙소 정보 테이블
CREATE TABLE ACCOMMODATION (
 acm_code NUMBER(10) NOT NULL PRIMARY KEY,
 acm_type VARCHAR(3) NOT NULL,
 acm_type_name VARCHAR2(20) NOT NULL,
 acm_name VARCHAR2(50) NOT NULL,
 bsns_code VARCHAR2(12) NOT NULL,
 acm_tel VARCHAR2(15) NOT NULL,
 acm_addr VARCHAR2(100) NOT NULL,
 acm_reg_dt DATE NOT NULL,
 acm_status VARCHAR(1) NOT NULL
);

SELECT * FROM ACCOMMODATION;

--숙소 상세정보
CREATE TABLE ACCOMMODATION_DETAILS (
 acm_code NUMBER(10) NOT NULL PRIMARY KEY,
 acm_dtl_introduction VARCHAR2(4000),
 acm_dtl_notice VARCHAR2(4000),
 acm_dtl_info VARCHAR2(4000),
 acm_dtl_usage_guide VARCHAR2(4000),
 acm_dtl_add_personnel VARCHAR2(4000),
 acm_dtl_room_info VARCHAR2(4000),
 acm_dtl_faciliteis VARCHAR2(4000),
 acm_dtl_parking VARCHAR2(4000),
 acm_dtl_transport VARCHAR2(4000),
 acm_dtl_benefit VARCHAR2(4000),
 acm_dtl_surrounding_info VARCHAR2(4000),
 acm_dtl_guide VARCHAR2(4000), 
 acm_dtl_policy VARCHAR2(4000) NOT NULL,
 acm_dtl_etc VARCHAR2(4000)
);

DROP TABLE ACCOMMODATION_DETAILS;

SELECT * FROM ACCOMMODATION_DETAILS;

DELETE FROM ACCOMMODATION_DETAILS;

--객실 정보
CREATE TABLE ROOM (
 room_code NUMBER(10) NOT NULL PRIMARY KEY,
 acm_code NUMBER(10) NOT NULL,
 room_name VARCHAR2(50) NOT NULL,
 room_type VARCHAR2(30),
 total_rooms NUMBER(2) NOT NULL,
 room_capacity NUMBER(2) NOT NULL,
 room_max_capacity NUMBER(2) NOT NULL,
 room_weekday_price NUMBER(10) NOT NULL,
 room_weekend_price NUMBER(10) NOT NULL,
 peak_season_weekday_price NUMBER(10),
 peak_season_weekend_price NUMBER(10),
 room_info VARCHAR2(1000) NOT NULL,
 room_amenities VARCHAR2(1000),
 room_status VARCHAR2(1) NOT NULL
);

DROP TABLE ROOM;

SELECT * FROM ROOM;

--숙소 사진 정보 테이블
CREATE TABLE ACCOMMODATION_IMG (
 acc_img_code NUMBER(10) NOT NULL PRIMARY KEY,
 acm_code NUMBER(10) NOT NULL,
 room_code NUMBER(10),
 acc_img_origin_name VARCHAR2(258) NOT NULL,
 acc_img_save_name VARCHAR2(258) NOT NULL,
 acc_img_extension VARCHAR2(10) NOT NULL,
 acc_img_url VARCHAR2(258) NOT NULL
);

DROP TABLE ACCOMMODATION_IMG;

SELECT * FROM ACCOMMODATION_IMG;

COMMIT;