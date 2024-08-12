--유저 정보 테이블
CREATE TABLE USER_INFO(
    user_code NUMBER(10) NOT NULL,
    user_type VARCHAR(3) NOT NULL,
    user_email VARCHAR2(30) NOT NULL,
    user_pw VARCHAR2(20) NOT NULL,
    user_nickname VARCHAR2(50) NOT NULL,
    user_name VARCHAR2(20) NOT NULL,
    user_rsd_reg_num VARCHAR2(14) NOT NULL,
    user_phone_num VARCHAR2(15) NOT NULL,
    user_postal_code VARCHAR2(5) NOT NULL,
    user_addr_line VARCHAR2(100),
    user_addr VARCHAR2(100) NOT NULL,
    user_reg_dt DATE NOT NULL,
    user_status VARCHAR(1) NOT NULL,
    PRIMARY KEY (user_code, user_email, user_rsd_reg_num)
);

DROP TABLE user_info;

SELECT * FROM USER_INFO;

COMMIT;


DELETE
--SELECT *
FROM user_info
WHERE user_code=36;


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

SELECT * FROM ACCOMMODATION_DETAILS;

--객실 정보
CREATE TABLE ROOM (
    room_code NUMBER(10) NOT NULL PRIMARY KEY,
    acm_code NUMBER(10) NOT NULL,
    room_name VARCHAR2(50) NOT NULL,
    room_type VARCHAR2(30),
    total_rooms NUMBER(2) NOT NULL,
    check_in_time DATE NOT NULL,
    check_out_time DATE NOT NULL,
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

SELECT * FROM ROOM;

DROP TABLE ROOM;

COMMIT;

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

SELECT * FROM ACCOMMODATION_IMG;

SELECT * FROM ACCOMMODATION_IMG
WHERE acc_img_save_name LIKE '%대표%';

SELECT *
FROM ACCOMMODATION_IMG
WHERE acm_code = 5;

COMMIT;

--숙소 예약 관리 테이블
CREATE TABLE RESERVATION(
    rsvt_code VARCHAR2(18) NOT NULL PRIMARY KEY,
    acm_code NUMBER(10) NOT NULL,
    room_code NUMBER(10) NOT NULL,
    rsvt_chek_in_date DATE NOT NULL,
    rsvt_chek_out_date DATE NOT NULL,
    rsvt_discount NUMBER(3),
    rsvt_payment_info VARCHAR2(50) NOT NULL,
    rsvt_payment_amount NUMBER(10) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    rsvt_guest_name VARCHAR2(100) NOT NULL,
    rsvt_guest_tel VARCHAR2(15) NOT NULL,
    rsvt_status NUMBER(1) NOT NULL
);

Drop table reservation;

SELECT * FROM RESERVATION;

SELECT rv.rsvt_code rsvt_code, rv.acm_code acm_code, rv.room_code room_code,
        TO_CHAR(rv.rsvt_chek_in_date, 'YYYY/MM/DD') check_in_date, TO_CHAR(rv.rsvt_chek_out_date, 'YYYY/MM/DD') check_out_date,
        (TRUNC(rv.rsvt_chek_out_date) - TRUNC(rv.rsvt_chek_in_date)) AS total_night,
        (TRUNC(rv.rsvt_chek_out_date) - TRUNC(rv.rsvt_chek_in_date) + 1) AS total_days,
        rv.rsvt_discount rsvt_discount, rv.rsvt_payment_info rsvt_payment_info, rv.rsvt_payment_amount rsvt_payment_amount,
        rv.user_code user_code, rv.rsvt_guest_name guest_name, rv.rsvt_guest_tel guest_tel,
        rv.rsvt_status rsvt_status, acm.acm_name acm_nmae, r.room_name || ' ' || r.room_type AS room_name,
        img.acc_img_code img_code, img.acc_img_origin_name img_origin_name,
        img.acc_img_save_name img_save_name, img.acc_img_extension img_extension, img.acc_img_url img_url
FROM RESERVATION rv
INNER JOIN ACCOMMODATION acm
ON rv.acm_code = acm.acm_code
INNER JOIN ROOM r
ON rv.room_code = r.room_code
INNER JOIN ACCOMMODATION_IMG img
ON rv.acm_code = img.acm_code
WHERE rv.user_code = 1
AND rv.rsvt_status != 0
AND img.acc_img_origin_name LIKE '%대표%';

SELECT *
FROM RESERVATION rv
INNER JOIN ACCOMMODATION acm
ON rv.acm_code = acm.acm_code
INNER JOIN ROOM r
ON rv.room_code = r.room_code
INNER JOIN ACCOMMODATION_IMG img
ON rv.acm_code = img.acm_code
WHERE rv.user_code = 1
AND rv.rsvt_status != 0
AND img.acc_img_origin_name LIKE '%대표%';

UPDATE reservation
SET rsvt_status = 1
WHERE rsvt_code = '20240809-00005';

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 220000, 1, '이진수', '010-1234-5678', 3);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 220000, 1, '이진수', '010-1234-5678', 3);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240719 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240721 15:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 220000, 1, '이진수', '010-1234-5678', 2);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 11, 41, (TO_DATE('20240802 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240803 11:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 600000, 1, '이진수', '010-1234-5678', 2);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 18, 78, (TO_DATE('20240830 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240831 11:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 75000, 1, '이진수', '010-1234-5678', 1);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 24, 109, (TO_DATE('20240920 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240922 11:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 60000, 1, '이진수', '010-1234-5678', 1);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 1, 1, (TO_DATE('20241020 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20241023 12:00', 'YYYYMMDD HH24:MI')), '', '신용카드 결제', 180000, 1, '이진수', '010-1234-5678', 0);

COMMIT;

CREATE SEQUENCE rsvt_code_sq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 99999
CYCLE
CACHE 20;

DROP SEQUENCE rsvt_code_sq;


--유저 리뷰 테이블
CREATE TABLE USER_REVIEW(
    review_code NUMBER(10) NOT NULL PRIMARY KEY,
    user_code NUMBER(10) NOT NULL,
    acm_code NUMBER(10) NOT NULL,
    room_code NUMBER(10) NOT NULL,
    rating NUMBER(1) NOT NULL,
    review_text VARCHAR2(2000) NOT NULL,
    review_date DATE NOT NULL,
    reply_exists VARCHAR2(1) NOT NULL
);

DROP TABLE user_review;

SELECT * FROM USER_REVIEW;


--유저 리뷰 이미지 관리 테이블
CREATE TABLE REVIEW_IMG(
    review_img_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    review_img_origin_name VARCHAR2(258) NOT NULL,
    review_img_save_name VARCHAR2(258) NOT NULL,
    review_img_extension VARCHAR2(3) NOT NULL,
    review_img_url VARCHAR2(258) NOT NULL
);

SELECT * FROM REVIEW_IMG;


--이용자 리뷰에 대한 사업자 답글 관리 테이블
CREATE TABLE BUSINESS_REPLY(
    reply_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    reply_text VARCHAR2(2000) NOT NULL,
    reply_date DATE NOT NULL
);

SELECT * FROM BUSINESS_REPLY;


--전국 경찰서 위치 정보 관리
CREATE TABLE POLICE_STATION(
    plc_code NUMBER(10) NOT NULL PRIMARY KEY,
    plc_provincial_office VARCHAR2(20) NOT NULL,
    plc_station VARCHAR2(20) NOT NULL,
    plc_name VARCHAR2(30) NOT NULL,
    plc_type VARCHAR2(15) NOT NULL,
    plc_addr VARCHAR2(500) NOT NULL,
    plc_tel VARCHAR2(15) NOT NULL
);

SELECT * FROM POLICE_STATION;


--전국 병원 위치 정보 관리
CREATE TABLE HOSPITAL(
    hospital_code NUMBER(10) NOT NULL PRIMARY KEY,
    hospital_name VARCHAR2(100) NOT NULL,
    hospital_type VARCHAR2(35) NOT NULL,
    hospital_addr VARCHAR2(500) NOT NULL,
    hospital_map_x VARCHAR2(15) NOT NULL,
    hospital_map_y VARCHAR2(15) NOT NULL
);

SELECT * FROM HOSPITAL;

COMMIT;