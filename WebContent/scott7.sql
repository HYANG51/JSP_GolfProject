create table teacher_board(
    teacher_code char(3) primary key not null,
    teacher_name varchar2(15),
    class_name varchar2(20),
    class_price number(8),
    teacher_regist_date varchar2(8));
    
create sequence teacher_board_seq;

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('100','���ʱ�','�ʱ޹�','100000','20220101');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('200','���߱�','�߱޹�','200000','20220102');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('300','�ڰ��','��޹�','300000','20220103');

insert into teacher_board (teacher_code, teacher_name, class_name, class_price, teacher_regist_date) 
values ('400','����ȭ','��ȭ��','400000','20220104');

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
values ('10001', 'ȫ�浿', '01011112222', '����� ������', '�Ϲ�');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('10002', '�����', '01022223333', '������ �д籸', '�Ϲ�');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('10003', '�Ӳ���', '01033334444', '������ ������', '�Ϲ�');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('20001', '������', '01044445555', '�λ�� ����', 'VIP');

insert into tbl_member (C_NO, C_NAME, PHONE, ADDRESS, GRADE)
values ('20002', '�̸���', '01055556666', '�뱸�� �ϱ�', 'VIP');

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
VALUES ('202203', '10001', '���ﺻ��', '100000', '100');
INSERT INTO TBL_CLASS
VALUES ('202203', '10002', '�����п�', '100000', '100');
INSERT INTO TBL_CLASS
VALUES ('202203', '10003', '�����п�', '200000', '200');
INSERT INTO TBL_CLASS
VALUES ('202203', '20001', '�λ�п�', '150000', '300');
INSERT INTO TBL_CLASS
VALUES ('202203', '20002', '�뱸�п�', '200000', '400');
COMMIT;

ALTER TABLE TBL_CLASS ADD PRIMARY KEY(REGIST_MONTH, C_NO);

select * from tbl_class;

select teacher_code, teacher_name, class_name , TO_CHAR(class_price, 'L999,999') as class_price,
SUBSTR(teacher_regist_date, 1, 4)||'��'||SUBSTR(teacher_regist_date, 5, 2)||'��'||SUBSTR(teacher_regist_date, 7, 2)||'��' AS teacher_regist_date
FROM golf_board;

select * from tbl_class;

delete from tbl_class where regist_month != '202203';

select SUBSTR(regist_month, 1, 4)||'��'||SUBSTR(regist_month, 5, 2)||'��' as regist_month, c.c_no, 
m.c_name, 
case c.teacher_code when '100' then '�ʱ޹�' when '200' then '�߱޹�' when '300' then '��޹�' when '400' then '��ȭ��' end as teacher_code, 
c.class_area, TO_CHAR(c.tuition, 'L999,999') as tuition, m.grade from tbl_class c, tbl_member m where c.c_no = m.c_no;

SELECT T.TEACHER_CODE, CLASS_NAME, TEACHER_NAME, TUITION FROM TEACHER_BOARD T, 
(SELECT TEACHER_CODE, SUM(TUITION) AS TUITION FROM TBL_CLASS GROUP BY TEACHER_CODE) 
C WHERE T.TEACHER_CODE = C.TEACHER_CODE;