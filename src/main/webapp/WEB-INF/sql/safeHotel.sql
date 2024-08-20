--���� ���� ���̺�
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

SELECT * FROM USER_INFO;

COMMIT;

SELECT * FROM reservation;

--����� ���� ���̺�
CREATE TABLE BUSINESS (
    bsns_code VARCHAR2(12) NOT NULL PRIMARY KEY,
    user_code NUMBER(10) NOT NULL,
    bsns_owner_name VARCHAR2(20) NOT NULL
);

SELECT * FROM BUSINESS;

--���� ���� ���̺�
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

--���� ������
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

--���� ����
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

--���� ���� ���� ���̺�
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
WHERE acc_img_save_name LIKE '%��ǥ%'
AND acm_code = 1;

COMMIT;

--���� ���� ���� ���̺�
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
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI'), TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI'), TO_DATE('20240620 23:11', 'YYYYMMDD HH24:MI'), 110000, 0, '�ſ�/üũī�� ����', 220000, 1, '������', '010-1234-5678', 3, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240712 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240714 15:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240620 23:30', 'YYYYMMDD HH24:MI'), 110000, 0, '�ſ�/üũī�� ����', 220000, 1, '������', '010-1234-5678', 3, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 5, 16, (TO_DATE('20240719 21:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240721 15:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240625 11:53', 'YYYYMMDD HH24:MI'), 110000, 0, '�ſ�/üũī�� ����', 220000, 1, '������', '010-1234-5678', 2, 1);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 11, 41, (TO_DATE('20240802 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240803 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240701 21:36', 'YYYYMMDD HH24:MI'), 600000, 0, '�ſ�/üũī�� ����', 600000, 1, '������', '010-1234-5678', 2, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 18, 78, (TO_DATE('20240830 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240831 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240712 15:44', 'YYYYMMDD HH24:MI'), 75000, 0, '�ſ�/üũī�� ����', 75000, 1, '������', '010-1234-5678', 1, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 24, 109, (TO_DATE('20240920 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20240922 11:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240803 17:28', 'YYYYMMDD HH24:MI'), 30000, 0, '�ſ�/üũī�� ����', 60000, 1, '������', '010-1234-5678', 1, 0);

INSERT INTO reservation
VALUES(TO_CHAR(SYSDATE, 'YYYYMMDD')||'-'||LPAD(rsvt_code_sq.NEXTVAL, 5, '0'), 1, 1, (TO_DATE('20241020 15:00', 'YYYYMMDD HH24:MI')), (TO_DATE('20241023 12:00', 'YYYYMMDD HH24:MI')), TO_DATE('20240813 00:31', 'YYYYMMDD HH24:MI'), 80000, 0, '�ſ�/üũī�� ����', 240000, 1, '������', '010-1234-5678', 0, 0);

COMMIT;

CREATE SEQUENCE rsvt_code_sq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 99999
CYCLE
CACHE 20;

DROP SEQUENCE rsvt_code_sq;


--���� ���� ���̺�
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

COMMIT;

INSERT INTO user_review
VALUES (1, '20240814-00003', 1, 5, 16, 5, '����ö������ ����� ��ġ�� ���ټ��� �ʹ� ���Ҿ��!!
��� ���� �ֺ��� �������� ����� ���� ������ �̿��ؾ��ϱ�������, ����ó ���������� �ʿ��Ѱ͵� ����� �ƾ��
ȭ��ǿ� �񵥰� �־ ���Ұ�, ħ�� ����ǵ� ����� ���Ƽ� ���� ����ϴ� ����
�׸��� ���� â������ ���� ���̴µ�, ��ħ�� �Ͼ�� Ŀư�� ���� �ɾƼ� �۶����⵵ �߽��ϴ� �䰡 �� ���Ҿ��~%%���������� �� �˳��ؼ� ������ ���� �������ϴ�!!
�����е鵵 ģ���ϼż� ���� ���������� �̿��ϰ� �Գ׿�~', SYSDATE, '1', '0', '');

--���� ���� �̹��� ���� ���̺�
CREATE TABLE REVIEW_IMG(
    review_img_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    review_img_origin_name VARCHAR2(258) NOT NULL,
    review_img_save_name VARCHAR2(258) NOT NULL,
    review_img_extension VARCHAR2(10) NOT NULL,
    review_img_url VARCHAR2(258) NOT NULL
);

SELECT * FROM REVIEW_IMG;

INSERT INTO review_img
VALUES (1, 1, '23c8698bdf3b48909dbd2aef57d28dfa_w420_h420', '23c8698bdf3b48909dbd2aef57d28dfa_w420_h420', '.jpg', '/review_img/1/20240814-00003');

INSERT INTO review_img
VALUES (2, 1, '9df5f89dad3541e39437293616f0c5c5_w420_h420', '9df5f89dad3541e39437293616f0c5c5_w420_h420', '.jpg', '/review_img/1/20240814-00003');

COMMIT;

--�̿��� ���信 ���� ����� ��� ���� ���̺�
CREATE TABLE BUSINESS_REPLY(
    reply_code NUMBER(10) NOT NULL PRIMARY KEY,
    review_code NUMBER(10) NOT NULL,
    user_code NUMBER(10) NOT NULL,
    reply_text VARCHAR2(2000) NOT NULL,
    reply_date DATE NOT NULL
);

SELECT * FROM BUSINESS_REPLY;

INSERT INTO BUSINESS_REPLY
VALUES (1, 1, 1, 'jinsoo1053�� �ȳ��ϼ���! ���� �����մϴ�~! ������ ã�ƿ��� ���� ��Ұ� �ǰԲ� �׻� ����ϰڽ��ϴ�^^', SYSDATE);

COMMIT;

--���� ������ ��ġ ���� ����
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

--���� ���� ��ġ ���� ����
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