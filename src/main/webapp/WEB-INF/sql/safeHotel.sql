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

SELECT * FROM user_info;

INSERT INTO USER_REVIEW (
    review_code,
    rsvt_code,
    user_code,
    acm_code,
    room_code,
    rating,
    review_text,
    review_date,
    reply_exists,
    report_status,
    report_reason
) VALUES (
    11,
    1,
    1,
    1,
    1,
    1,
    'DB확인및처리용',
    SYSDATE,
    '1',
    '1',
    '신고사유 없음'
);

COMMIT;

SELECT * FROM USER_INFO;

COMMIT;

SELECT * FROM reservation;

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
    acm_status VARCHAR(1) NOT NULL,
    acm_reg_site NUMBER(1) NOT NULL
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
WHERE acc_img_save_name LIKE '%대표%'
AND acm_code = 1;

COMMIT;

--숙소 예약 관리 테이블
CREATE TABLE RESERVATION(
    rsvt_code VARCHAR2(18) NOT NULL PRIMARY KEY,
    acm_code NUMBER(10) NOT NULL,
    room_code NUMBER(10) NOT NULL,
    rsvt_chek_in_date DATE NOT NULL,
    rsvt_chek_out_date DATE NOT NULL,
    rsvt_pament_date DATE NOT NULL,
    rsvt_room_amount NUMBER(10) NOT NULL,
    rsvt_discount NUMBER(3),
    rsvt_payment_info VARCHAR2(50) NOT NULL,
    rsvt_payment_amount NUMBER(10) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    rsvt_guest_name VARCHAR2(100) NOT NULL,
    rsvt_guest_tel VARCHAR2(15) NOT NULL,
    rsvt_status NUMBER(1) NOT NULL,
    rsvt_review_status VARCHAR2(1) NOT NULL
);

SELECT * FROM reservation;

UPDATE reservation
SET rsvt_status = 1
WHERE rsvt_code = '20240814-00007';

COMMIT;

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI'), TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI'), TO_DATE('20240620 23:11', 'YYYYMMDD HH24:MI'), 110000, 0, '신용/체크카드 결제', 220000, 1, '이진수', '010-1234-5678', 3, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240620 23:30', 'YYYYMMDD HH24:MI'), 110000, 0, '신용/체크카드 결제', 220000, 1, '이진수', '010-1234-5678', 3, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240719 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240721 15:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240625 11:53', 'YYYYMMDD HH24:MI'), 110000, 0, '신용/체크카드 결제', 220000, 1, '이진수', '010-1234-5678', 2, 1);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 11, 41, (TO_DATE('20240802 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240803 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240701 21:36', 'YYYYMMDD HH24:MI'), 600000, 0, '신용/체크카드 결제', 600000, 1, '이진수', '010-1234-5678', 2, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 18, 78, (TO_DATE('20240830 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240831 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240712 15:44', 'YYYYMMDD HH24:MI'), 75000, 0, '신용/체크카드 결제', 75000, 1, '이진수', '010-1234-5678', 1, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 24, 109, (TO_DATE('20240920 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240922 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240803 17:28', 'YYYYMMDD HH24:MI'), 30000, 0, '신용/체크카드 결제', 60000, 1, '이진수', '010-1234-5678', 1, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 1, 1, (TO_DATE('20241020 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20241023 12:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240813 00:31', 'YYYYMMDD HH24:MI'), 80000, 0, '신용/체크카드 결제', 240000, 1, '이진수', '010-1234-5678', 0, 0);

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
    rsvt_code VARCHAR2(18) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    acm_code NUMBER(10) NOT NULL,
    room_code NUMBER(10) NOT NULL,
    rating NUMBER(1) NOT NULL,
    review_text VARCHAR2(2000) NOT NULL,
    review_date DATE NOT NULL,
    reply_exists VARCHAR2(1) NOT NULL,
    report_status VARCHAR2(1) NOT NULL,
    report_reason VARCHAR2(500)
);

SELECT * FROM user_review;

delete
from user_review;


DELETE FROM user_review
WHERE review_code = 12;

COMMIT;

INSERT INTO user_review
VALUES (1, '20240822-00044', 1, 5, 16, 5, '지하철역에서 가까운 위치라서 접근성이 너무 좋았어요!!
대신 숙소 주변에 편의점이 없어서ㅠ 내부 매점을 이용해야하긴하지만, 역근처 편의점에서 필요한것들 사오면 됐어요
화장실에 비데가 있어서 좋았고, 침구 컨디션도 상당히 좋아서 꿀잠 잤습니다 ㅎㅎ
그리고 객실 창문으로 산이 보이는데, 아침에 일어나서 커튼을 열고 앉아서 멍때리기도 했습니다 뷰가 참 좋았어요~%%주차공간도 꽤 넉넉해서 불편한 점이 없었습니다!!
직원분들도 친절하셔서 아주 만족스럽게 이용하고 왔네요~', SYSDATE, '1', '0', '');

--유저 리뷰 이미지 관리 테이블
CREATE TABLE REVIEW_IMG(
    review_img_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    review_img_origin_name VARCHAR2(258) NOT NULL,
    review_img_save_name VARCHAR2(258) NOT NULL,
    review_img_extension VARCHAR2(10) NOT NULL,
    review_img_url VARCHAR2(258) NOT NULL
);

SELECT * FROM REVIEW_IMG;

delete
from review_img;

INSERT INTO review_img
VALUES (1, 1, '23c8698bdf3b48909dbd2aef57d28dfa_w420_h420', '23c8698bdf3b48909dbd2aef57d28dfa_w420_h420', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (2, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h420', '9df5f89dad3541e39437293616f0c5c5_w420_h420', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (3, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4202', '9df5f89dad3541e39437293616f0c5c5_w420_h4202', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (4, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4203', '9df5f89dad3541e39437293616f0c5c5_w420_h4203', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (5, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4204', '9df5f89dad3541e39437293616f0c5c5_w420_h4204', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (6, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4205', '9df5f89dad3541e39437293616f0c5c5_w420_h4205', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (7, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4206', '9df5f89dad3541e39437293616f0c5c5_w420_h4206', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (8, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4207', '9df5f89dad3541e39437293616f0c5c5_w420_h4207', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');

INSERT INTO review_img
VALUES (9, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h4208', '9df5f89dad3541e39437293616f0c5c5_w420_h4208', '.jpg', '/fileStorage/image/review_img/1/20240822-00044');


COMMIT;

--이용자 리뷰에 대한 사업자 답글 관리 테이블
CREATE TABLE BUSINESS_REPLY(
    reply_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    reply_text VARCHAR2(2000) NOT NULL,
    reply_date DATE NOT NULL
);

SELECT * FROM BUSINESS_REPLY;

INSERT INTO BUSINESS_REPLY
VALUES (1, 1, 1, 'jinsoo1053님 안녕하세요! 리뷰 감사합니다~! 언제나 찾아오고 싶은 장소가 되게끔 항상 노력하겠습니다^^', SYSDATE);

COMMIT;

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
    hospital_spot VARCHAR2(100),
    hospital_type VARCHAR2(35) NOT NULL,
    hospital_cptrvn VARCHAR2(500) NOT NULL,
    hospital_sigungu VARCHAR2(500) NOT NULL,
    hospital_rdnmadr VARCHAR2(500) NOT NULL,
    hospital_buld_no VARCHAR2(500),
    hospital_map_x VARCHAR2(15) NOT NULL,
    hospital_map_y VARCHAR2(15) NOT NULL
);

SELECT * FROM HOSPITAL;

COMMIT;