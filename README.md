# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)



06/12



1. 청원 관리자만 답글 달 수 있게

2. 후보자등록시 이미지 파일 1개만 올라가게끔

3. 클래스 관련 VO

4. 클래스 관련 테이블구조 변경

--클래스 정보<br>
DROP TABLE JL3B_CLASS_INFO;<br>
CREATE TABLE JL3B_CLASS_INFO(<br>
    CLASS_INFO_NO NUMBER(7) PRIMARY KEY,<br>
    TEACHER_NO NUMBER(7),<br>
    CLASS_INFO_PR VARCHAR2(500) NOT NULL<br>
);<br>
DROP SEQUENCE JL3B_CLASS_INFO_SEQ;<br>
CREATE SEQUENCE JL3B_CLASS_INFO_SEQ;<br>
<br>

--클래스 후기<br>
DROP TABLE JL3B_CLASS_REVIEW;<br>
CREATE TABLE JL3B_CLASS_REVIEW(<br>
    REVIEW_NO NUMBER(7) PRIMARY KEY,<br>
    DAYCLASS_NO NUMBER(7),<br>
    RESI_NO NUMBER(7),<br>
    REVIEW_COMMENT VARCHAR2(1000) NOT NULL,<br>
    REVIEW_WDATE DATE<br>
);<br>
DROP SEQUENCE JL3B_CLASS_REVIEW_SEQ;<br>
CREATE SEQUENCE JL3B_CLASS_REVIEW_SEQ;<br>
<br>

-- 원데이클래스<br>
DROP TABLE JL3B_DAYCLASS;<br>
CREATE TABLE JL3B_DAYCLASS(<br>
    DAYCLASS_NO NUMBER(7) PRIMARY KEY,<br>
    TEACHER_NO NUMBER(7) NOT NULL,<br>
    HORSEHEAD_SORT  VARCHAR2(10) NOT NULL,<br>
    DAYCLASS_TITLE VARCHAR2(30) NOT NULL,<br>
    DAYCLASS_CONTENT VARCHAR2(1000) NOT NULL,<br>
    DAYCLASS_SEAT NUMBER(2) NOT NULL,<br>
    DAYCLASS_RDATE DATE,<br>
    DAYCLASS_STARTDATE DATE,<br>
    DAYCLASS_ENDDATE DATE,<br>
    DAYCLASS_STATUS VARCHAR2(15)<br>
);<br>
DROP SEQUENCE  JL3B_DAYCLASS_seq;<br>
CREATE SEQUENCE  JL3B_DAYCLASS_seq;<br>
<br>

-- 클래스 예약<br>
DROP TABLE JL3B_CLASS_BOOKING;<br>
CREATE TABLE  JL3B_CLASS_BOOKING(<br>
    BOOKING_NO NUMBER(7) PRIMARY KEY,<br>
    RESI_NO NUMBER(7) NOT NULL,<br>
    DAYCLASS_NO NUMBER(7) NOT NULL<br>
);<br>
DROP SEQUENCE JL3B_CLASS_BOOKING_SEQ;<br>
CREATE SEQUENCE JL3B_CLASS_BOOKING_SEQ;<br>
