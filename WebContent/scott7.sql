create table teacher_board(
    teacher_code char(3) primary key not null,
    teacher_name varchar2(15),
    class_name varchar2(20),
    class_price number(8),
    teacher_regist_date varchar2(8));
    
create sequence teacher_board_seq;

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('100','이초급','초급반','100000','20220101');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('200','이중급','중급반','200000','20220102');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('300','박고급','고급반','300000','20220103');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('400','정심화','심화반','400000','20220104');

select * from teacher_board;

commit;

CREATE TABLE TBL_MEMBER(
    C_NO CHAR(5) NOT NULL,
    C_NAME VARCHAR2(15),
    PHONE VARCHAR2(11),
    ADDRESS VARCHAR2(50),
    GRADE VARCHAR2(6)
);

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('10001', '홍길동', '01011112222', '서울시 강남구', '일반');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('10002', '장발장', '01022223333', '성남시 분당구', '일반');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

ALTER TABLE TBL_MEMBER ADD PRIMARY KEY(C_NO);

select * from tbl_member;

commit;

CREATE TABLE TBL_CLASS(
    REGIST_MONTH VARCHAR2(6) NOT NULL,
    C_NO CHAR(5) NOT NULL,
    CLASS_AREA VARCHAR2(15),
    TUITION NUMBER(8),
    TEACHER_CODE CHAR(3)
);

INSERT INTO TBL_CLASS
VALUES ('202203', '10001', '서울본원', '100000', '100');
INSERT INTO TBL_CLASS
VALUES ('202203', '10002', '성남분원', '100000', '100');
INSERT INTO TBL_CLASS
VALUES ('202203', '10003', '대전분원', '200000', '200');
INSERT INTO TBL_CLASS
VALUES ('202203', '20001', '부산분원', '150000', '300');
INSERT INTO TBL_CLASS
VALUES ('202203', '20002', '대구분원', '200000', '400');
COMMIT;

ALTER TABLE TBL_CLASS ADD PRIMARY KEY(REGIST_MONTH, C_NO);

select * from tbl_class;

select teacher_code, teacher_name, class_name , TO_CHAR(class_price, 'L999,999') as class_price,
SUBSTR(teacher_regist_date, 1, 4)||'년'||SUBSTR(teacher_regist_date, 5, 2)||'월'||SUBSTR(teacher_regist_date, 7, 2)||'일' AS teacher_regist_date
FROM golf_board;

select * from tbl_class;

delete from tbl_class where regist_month != '202203';

select SUBSTR(regist_month, 1, 4)||'년'||SUBSTR(regist_month, 5, 2)||'월' as regist_month, c.c_no, 
m.c_name, 
case c.teacher_code when '100' then '초급반' when '200' then '중급반' when '300' then '고급반' when '400' then '심화반' end as teacher_code, 
c.class_area, TO_CHAR(c.tuition, 'L999,999') as tuition, m.grade from tbl_class c, tbl_member m where c.c_no = m.c_no;

SELECT T.TEACHER_CODE, CLASS_NAME, TEACHER_NAME, TUITION FROM TEACHER_BOARD T, 
(SELECT TEACHER_CODE, SUM(TUITION) AS TUITION FROM TBL_CLASS GROUP BY TEACHER_CODE) 
C WHERE T.TEACHER_CODE = C.TEACHER_CODE;