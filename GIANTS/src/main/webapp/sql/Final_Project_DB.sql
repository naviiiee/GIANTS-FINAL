--2023-07-28 ���� 2��
--������Ʈ ������
--�� ���̺� 34��


----------------------------------------------------------------------------------������ YHJ
--ȸ�� ���� ���̺�
create table MEMBER(
	mem_num number,
	mem_id varchar2(12) unique NOT null,
	mem_nickname varchar2(30),
	mem_auth number(1),
	constraint MEMBER_PK primary key (mem_num)
);

--ȸ�� �� ���� ���̺�
create table MEMBER_DETAIL(
	mem_num number,
	mem_auid varchar2(36) NOT null,
	mem_name varchar2(30) NOT null,
	mem_passwd varchar2(35) NOT null,
	mem_public varchar2(6) NOT null,
	mem_phone varchar2(15) NOT null,
	mem_email varchar2(50) NOT null,
	mem_zipcode varchar2(90) NOT null,
	mem_address1 varchar2(90) NOT null,
	mem_address2 varchar2(90) NOT null,
	mem_photo blob,
	mem_photoname varchar2(100),
	mem_regdate date default sysdate  NOT null,
	mem_modifydate date,
	mem_point number NOT null,
	constraint MEMBER_DETAIL_pk primary key (mem_num),
	constraint MEMBER_DETAIL_fk foreign key (mem_num) references MEMBER(mem_num)
);


--��� �� ���� ���̺�
create table COMPANY_DETAIL(
	comp_num varchar2(40) NOT null,
	comp_owner varchar2(30) NOT null,
	mem_num number NOT null,
	comp_name varchar2(90) NOT null,
	comp_passwd varchar2(35) NOT null,
	comp_phone varchar2(15) NOT null,
	comp_email varchar2(50) NOT null,
	comp_zipcode varchar2(15) NOT null,
	comp_address1 varchar2(90) NOT null,
	comp_address2 varchar2(90) NOT null,
	comp_photo blob,
	comp_photoname varchar2(100),
	comp_regdate date default sysdate NOT null,
	comp_modifydate date,
	comp_content varchar2(2000),
	constraint COMPANY_DETAIL_pk primary key (comp_num),
	constraint COMPANY_DETAIL_fk foreign key (mem_num) references MEMBER(mem_num)
);


--���� ���� ���̺�
create table MEMBER_CERT(
	mem_email varchar2(50) NOT null,
	mem_authkey number
);

------------------------------������
create sequence COMPANY_DETAIL_seq;
create sequence MEMBER_DETAIL_seq;


----------------------------------------------------------------------------------������ LHJ
--Ŀ�´�Ƽ
CREATE TABLE commu(
 commu_num number not null,
 commu_title varchar2(90) not null,
 commu_content clob not null,
 commu_date date default SYSDATE not null,
 commu_modifydate date,
 commu_hit number(8),
 commu_ip varchar(15),
 mem_num number not null,
 constraint commu_pk primary key (commu_num),
 constraint commu_fk foreign key (mem_num) references member(mem_num)
);



--Ŀ�´�Ƽ ���ƿ�
CREATE TABLE commu_like(
 commu_like_num number not null,
 commu_num number not null,
 mem_num number not null,
 constraint commu_like_pk primary key (commu_like_num),
 constraint commu_like_fk1 foreign key (commu_num) references commu(commu_num),
 constraint commu_like_fk2 foreign key (mem_num) references member(mem_num)
);



--Ŀ�´�Ƽ �Ⱦ��
CREATE TABLE commu_dislike(
 commu_dislike_num number not null,
 commu_num number not null,
 mem_num number not null,
 constraint commu_dislike_pk primary key (commu_dislike_num),
 constraint commu_dislike_fk1 foreign key (commu_num) references commu(commu_num),
 constraint commu_dislike_fk2 foreign key (mem_num) references member(mem_num)
);



--Ŀ�´�Ƽ �Ű�
CREATE TABLE commu_report(
 repo_num number not null,
 repo_date date default SYSDATE not null,
 repo_ip varchar2(15) not null,
 repo_content clob not null,
 repo_category number not null,
 commu_num number not null,
 mem_num number not null,
 constraint commu_report_pk primary key (repo_num),
 constraint commu_report_fk1 foreign key (commu_num) references commu(commu_num),
 constraint commu_report_fk2 foreign key (mem_num) references member(mem_num)
);



--Ŀ�´�Ƽ ���
CREATE TABLE commu_reply(
 re_num number not null,
 re_content clob not null,
 re_ip varchar2(15) not null,
 re_date date default SYSDATE not null,
 re_modifydate date,
 commu_num number not null,
 mem_num number not null,
 constraint commu_reply_pk primary key (re_num),
 constraint commu_reply_fk1 foreign key (commu_num) references commu(commu_num),
 constraint commu_reply_fk2 foreign key (mem_num) references member(mem_num)
);

--Ŀ�´�Ƽ ��� �Ű�
CREATE TABLE COMMU_REPLY_REPORT	(
 re_repo_num number not null,
 re_repo_date date default SYSDATE not null,
 re_repo_ip varchar2(15) not null,
 re_repo_content clob not null,
 re_repo_category number(1) not null,
 re_num number not null,
 mem_num number not null,
 constraint commu_reply_report_pk primary key (re_repo_num),
 constraint commu_reply_report_fk1 foreign key (re_num) references commu_reply(re_num),
 constraint commu_reply_report_fk2 foreign key (mem_num) references member(mem_num)
);

--���� �Ұ�
CREATE TABLE player(
 player_num number not null,
 player_name varchar2(30) not null,
 player_position varchar2(15) not null,
 player_photo varchar2(150) not null,
 player_birthday date not null,
 plyaer_height number(15) not null,
 player_weight number(15) not null,
 player_toway varchar2(30) not null,
 player_join varchar2(30) not null,
 player_manager clob not null,
 constraint player_num primary key (player_num)
);


------------------------------������
CREATE SEQUENCE commu_reply_report_seq;
CREATE SEQUENCE commu_seq;
CREATE SEQUENCE commu_like_seq;
CREATE SEQUENCE commu_dislike_seq;
CREATE SEQUENCE commu_report_seq;
CREATE SEQUENCE commu_reply_seq;
CREATE SEQUENCE player_seq; 



----------------------------------------------------------------------------------��μ� KMS

--�߰�ŷ�
CREATE TABLE TRADING(
 trade_num number not null,
 trade_title varchar2(60) not null,
 trade_content clob not null,
 trade_price number(9) not null,
 trade_hit number(8) default 0 not null,
 trade_date date default SYSDATE not null,
 trade_modifydate date,
 trade_status number(1) not null,
 trade_photo1 varchar2(300) not null,
 trade_photo2 varchar2(300) not null,
 trade_ip varchar2(15) not null,
 mem_num number not null,
 bk_num number not null,
 constraint TRADING_PK primary key (trade_num),
 constraint TRADING_FK foreign key (mem_num) references MEMBER(mem_num)
);



--�ϸ�ũ
CREATE TABLE BOOKMARK(
 mark_num number not null,
 trade_num number not null,
 mem_num number not null,
 constraint BOOKMARK_PK primary key (mark_num),
 constraint BOOKMARK_FK1 foreign key (trade_num) references TRADING(trade_num),
 constraint BOOKMARK_FK2 foreign key (mem_num) references MEMBER(mem_num)
);



--ä�ù�
CREATE TABLE CHATROOM(
 chatroom_num number not null,
 trade_num number not null,
 seller_num number not null,
 buyer_num number not null,
 constraint CHATROOM_PK primary key (chatroom_num),
 constraint CHATROOM_FK1 foreign key (trade_num) references TRADING(trade_num),
 constraint CHATROOM_FK2 foreign key (seller_num) references MEMBER(mem_num),
 constraint CHATROOM_FK3 foreign key (buyer_num) references MEMBER(mem_num)
);



--ä�� �� 
CREATE TABLE CHAT(
 chat_num number not null,
 chatroom_num number not null,
 mem_num number not null,
 message varchar2(900) not null,
 reg_date date default SYSDATE not null,
 read_check number(1) not null,
 constraint CHAT_PK primary key (chat_num),
 constraint CHAT_FK1 foreign key (chatroom_num) references CHATROOM(chatroom_num),
 constraint CHAT_FK2 foreign key (mem_num) references MEMBER(mem_num)
);


------------------------------������
CREATE SEQUENCE trading_seq;
CREATE SEQUENCE bookmark_seq;
CREATE SEQUENCE chatroom_seq;
CREATE SEQUENCE chat_seq;

----------------------------------------------------------------------------------�ǿ��� KOY
-- ��ǰ����
create table goods(
   goods_num number,
   goods_name varchar2(600) not null,
   goods_category number(1) not null, -- 1:������/2:����/3:��������/4:��Ÿ
   goods_quantity number(2) not null,
   goods_price number(9) not null,
   goods_disc number(3) default 0 not null,
   goods_dprice number(9) not null, -- ��ǰ���� * (1-������)
   goods_content clob not null,
   goods_photo blob not null,
   goods_photoname varchar2(100) not null,
   goods_regdate date default sysdate not null,
   goods_mdate date,
   goods_status number(1) default 2 not null, -- 1:��ǥ��, 2:ǥ��
   constraint goods_pk primary key (goods_num) 
);



-- ��ǰ�ɼ�
create table goods_option(
   opt_num number,
   goods_num number not null,
   goods_size number(1) not null, -- 1:85/2:90/3:95/4:100/5:105/6:110
   goods_stock number(9) not null, 
   constraint goods_opt_pk primary key (opt_num),
   constraint goods_opt_fk1 foreign key (goods_num) references goods (goods_num)
);



-- ��ǰ�ı�
create table goods_review(
   review_num number,
   mem_num number not null,
   goods_num number not null,
   review_score number(1) not null,
   review_content clob not null,
   review_photo blob,
   review_photoname varchar2(100),
   review_regdate date default sysdate not null,
   review_mdate date,
   constraint goods_review_pk primary key (review_num),
   constraint goods_review_fk1 foreign key (mem_num) references member (mem_num),
   constraint goods_review_fk2 foreign key (goods_num) references goods (goods_num)
);



-- ��ǰ ��
create table goods_fav(
   fav_num number,
   mem_num number not null,
   goods_num number not null,
   constraint goods_fav_pk primary key (fav_num),
   constraint goods_fav_fk1 foreign key (mem_num) references member (mem_num),
   constraint goods_fav_fk2 foreign key (goods_num) references goods (goods_num)
); 



-- ���� ����
create table news(
   news_num number,
   news_title varchar2(100) not null,
   news_content clob not null,
   news_regdate date default sysdate not null,
   news_mdate date,
   news_hit number(9) default 0 not null,
   mem_num number not null,
   constraint news_pk primary key (news_num),
   constraint news_fk1 foreign key (mem_num) references member (mem_num)
);



-- ��� ����
create table game(
   game_num number,
   game_date date,
   game_opp number(1) not null, -- 1:SSG/2:Ű��/3:LG/4:KT/5:���/6:NC/7:�Ｚ/8:�λ�/9:��ȭ
   game_hw number(1) not null, -- 1:Ȩ/2:�����
   game_location number(2) not null, -- 1:����/2:��õ/3:���/4:��ô/5:����/6:����/7:�뱸/8:����/9:â��/10:���/11:����
   game_time number(1) not null, -- 1:18��30��/2:14��/3:17��/4:18��
   game_score varchar2(60) not null,
   game_result number(1) default 4 not null, -- 1:��/2:��/3:��/4:�����/5:���
   mem_num number not null,
   constraint game_pk primary key (game_num),
   constraint game_fk1 foreign key (mem_num) references member (mem_num)
);


------------------------------������
create sequence game_seq;
create sequence goods_seq;
create sequence goods_opt_seq;
create sequence goods_review_seq;
create sequence goods_fav_seq;
create sequence news_seq;


---------------------------------------------------------------------------------- �̿��� LYJ
--�ֹ� ���̺�
create table G_ORDER(
	order_num number primary key, --�ֹ� �ĺ� ��ȣ
	mem_num number not null, --ȸ����ȣ
	goods_name varchar2(600) not null, --��ǰ�̸�
	order_payment number(1) not null, --���� ���(0:������, 1:ī��)
	order_status number(1) not null, --��ۻ���(0:�����Ϸ�, 1:����غ�, 2:�����, 3:��ۿϷ�)
	order_regdate date default SYSDATE not null, --�ֹ���¥
	order_modifydate date, --��ۻ��� ������
	order_name varchar2(30) not null, --�����ڸ�
	order_zipcode varchar2(5) not null, --�����ȣ
	order_address1 varchar2(50) not null, --�ּ�
	order_address2 varchar2(50) not null, --���ּ�
	mem_phone varchar2(15) not null, --������ ��ȭ��ȣ
	order_message varchar2(1300),  --��� �޼���
	order_total number(9) not null, --�� �ֹ� ����
	order_quantity number(9) not null, --�ֹ� ����
	merchant_uid number not null, --������ �ֹ���ȣAPI
	CONSTRAINT G_ORDER_FK1 foreign key (mem_num) references member (mem_num)
);


--�ֹ� �� ���̺�
create table G_ORDER_DETAIL(
	detail_num number primary key, --�ֹ� �� �ĺ� ��ȣ
	mem_num number not null, --ȸ����ȣ
	order_num number not null, -- �ֹ���ȣ
	order_quantity number(5) not null, --�ֹ�����
	order_point number(5) not null, --��ǰ 1�� �� �������� ����Ʈ(���� �ݾ��� 2%) 
	order_dcost number default 3000 not null, --��ۺ�
	goods_num number not null, --��ǰ �ĺ� ��ȣ
	goods_name varchar2(600) not null, --��ǰ��
	goods_price number(9) not null, --��ǰ �ݾ�
	goods_dprice number(9) not null, --���ε� ����(��ǰ����*(1-������))
	goods_total number(9) not null, --�� ��ǰ�ݾ�(���� ��ǰ �ջ� �ݾ�)
	mem_point number default 0 not null, --ȸ�� ���� ����Ʈ
	CONSTRAINT G_ORDER_DETAIL_FK2 foreign key(mem_num) references member(mem_num), 
	CONSTRAINT G_ORDER_DETAIL_FK1 foreign key(order_num) references g_order(order_num),
	CONSTRAINT G_ORDER_DETAIL_FK3 foreign key(goods_num) references goods(goods_num) 
);



--��ٱ��� ���̺�
create table G_CART(
	cart_num number primary key, --��ٱ��� �ĺ� ��ȣ
	goods_num number not null, --��ǰ �ĺ� ��ȣ
	mem_num number not null, --ȸ�� �ĺ� ��ȣ
	order_quantity number(5) not null, --�ֹ�����
	reg_date date default SYSDATE not null, --��ٱ��Ͽ� ���� ��¥
	CONSTRAINT G_CART_FK1 foreign key(goods_num) references goods(goods_num),
	CONSTRAINT G_CART_FK2 foreign key(mem_num) references member(mem_num)
);


------------------------------������
CREATE SEQUENCE G_CART_SEQ;
CREATE SEQUENCE G_ORDER_SEQ;
CREATE SEQUENCE G_ORDER_DETAIL_SEQ;


----------------------------------------------------------------------------------������ NSH
-- 경기정보
CREATE TABLE tgame(
	game_num NUMBER,
	grade_num NUMBER,
	game_date VARCHAR2(30) NOT NULL,
	game_time VARCHAR2(20) NOT NULL,
	game_team VARCHAR2(15) NOT NULL,
	game_state NUMBER(1) DEFAULT 0 NOT NULL,	-- 0:예매대기, 1:예매가능, 2:매진, 3:경기취소
	CONSTRAINT tgame_pk PRIMARY KEY (game_num),
	CONSTRAINT tgame_fk FOREIGN KEY (grade_num) REFERENCES grade (grade_num)
);

-- 좌석등급
CREATE TABLE grade(
	grade_num NUMBER,
	title VARCHAR2(30) NOT NULL,
	quantity NUMBER(5) NOT NULL,
	price_week NUMBER(9) NOT NULL,
	price_weekend NUMBER(9) NOT NULL,
	CONSTRAINT grade_pk PRIMARY KEY (grade_num)
);

-- 좌석정보
CREATE TABLE seat(
	seat_num NUMBER,
    grade_num NUMBER,
	seat_block NUMBER(3) NOT NULL,
	seat_row VARCHAR2(30) NOT NULL,
	seat_col VARCHAR2(30) NOT NULL,
	CONSTRAINT seat_pk PRIMARY KEY (seat_num),
	CONSTRAINT seat_fk FOREIGN KEY (grade_num) REFERENCES grade (grade_num)
);

-- 좌석상태
CREATE TABLE seat_status(
	status_num NUMBER,
    seat_num NUMBER,
	seat_row VARCHAR2(30) NOT NULL,
	seat_col VARCHAR2(30) NOT NULL,
	seat_date VARCHAR2(30) NOT NULL,
	seat_auth NUMBER(20) NOT NULL,	-- 1:예매완료, 2:예매불가
	CONSTRAINT seat_status_pk PRIMARY KEY (status_num),
	CONSTRAINT seat_status_fk FOREIGN KEY (seat_num) REFERENCES seat (seat_num)
);

-- 주문정보
CREATE TABLE ticket(
	ticket_num VARCHAR2(20),
    mem_num NUMBER,
    game_num NUMBER,
    seat_num NUMBER,
	ticket_date DATE DEFAULT SYSDATE NOT NULL,
	ticket_quantity NUMBER(1) NOT NULL,
	ticket_modify DATE,
	total_price NUMBER(9) NOT NULL,
	ticket_status NUMBER(1) NOT NULL,
	ticket_qrlink CLOB NOT NULL,
	pg varchar2(30) not null,
	pay_method varchar2(30) not null,
	CONSTRAINT ticket_pk PRIMARY KEY (ticket_num),
	CONSTRAINT ticket_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num),
	CONSTRAINT ticket_fk2 FOREIGN KEY (game_num) REFERENCES tgame (game_num),
	CONSTRAINT ticket_fk3 FOREIGN KEY (seat_num) REFERENCES seat (seat_num)
);

-- sequence
CREATE SEQUENCE tgame_seq;
CREATE SEQUENCE grade_seq;
CREATE SEQUENCE seat_seq;
CREATE SEQUENCE seat_status_seq;


---------------------------------------------------------------------------------- ������ OSJ

--Ǫ�� ���̺�
CREATE TABLE FOOD(
  food_num number not null,						--��ǰ��ȣ
  food_name varchar2(200) not null,				--��ǰ ��ǰ��
  food_price number(9) not null,				--��ǰ ����
  food_quantity number(9) not null,				--��ǰ ��� ����
  food_content clob,							--��ǰ �󼼼��� �ؽ�Ʈ
  food_photo1 blob not null,					--��ǰ ���� ��������
  food_photo1_name varchar2(100) not null,		--�����̹��� �̸�
  food_photo2 blob,								--��ǰ �� ��������
  food_photo2_name varchar2(100),				--���̹��� �̸�
  food_regDate date DEFAULT SYSDATE not null,	--��ǰ ���� ��ϳ�¥
  food_modifyDate date,							--��ǰ ���� ������¥
  food_status number DEFAULT 1 not null,		--��ǰ �ǸŻ��� Ȯ�ο��ο�(�⺻�� : 1)
  comp_num varchar2(40) not null,						--��ǰ �Ǹ��� ���� �ĺ� ��ȣ
  CONSTRAINT food_pk PRIMARY KEY (food_num),
  CONSTRAINT food_fk1 FOREIGN KEY (comp_num) references COMPANY_DETAIL (comp_num)
);



--��ǰ ��ٱ��� ���̺�
CREATE TABLE F_CART(
  cart_num number not null,					--��ǰ ��ٱ��� �ĺ� ��ȣ
  food_num number not null,                 --��ǰ ���� �ĺ� ��ȣ
  mem_num number not null,                  --������ �ĺ� ��ȣ
  f_cart_quantity number(9) not null,       --��ǰ ���ż���
  f_cart_price number(9) not null,          --��ǰ ��ٱ��� �� ����
  CONSTRAINT f_cart_pk PRIMARY KEY (cart_num),
  CONSTRAINT f_cart_fk1 FOREIGN KEY (food_num) references FOOD (food_num),
  CONSTRAINT f_cart_fk2 FOREIGN KEY (mem_num) references MEMBER (mem_num)
);



--��ǰ �ֹ����� ���̺�
CREATE TABLE F_ORDER(
  f_order_num varchar2(20) not null,
  food_num number not null,                 		--��ǰ ���� �ĺ� ��ȣ
  mem_num number not null,                  		--������ �ĺ� ��ȣ
  comp_num varchar2(40) not null,					--��� ���� �ĺ� ��ȣ
  f_order_regDate date DEFAULT SYSDATE not null,    --��ǰ �ֹ� ��ϳ�¥
  f_order_expireDate date not null,                 --��ǰ �ֹ� ��ȿ�Ⱓ
  f_order_status number DEFAULT 1 not null,         --QR ��� ���� Ȯ�ο�
  f_order_qrlink clob not null,                     --QR �̹��������� ��ũ �����
  pg varchar2(30) not null,                         --PG�� ���� �ڵ�
  pay_method varchar2(30) not null,                 --�������� ���� �ڵ�
  CONSTRAINT f_order_pk PRIMARY KEY (f_order_num),
  CONSTRAINT f_order_fk1 FOREIGN KEY (food_num) references FOOD (food_num),
  CONSTRAINT f_order_fk2 FOREIGN KEY (mem_num) references MEMBER (mem_num),
  CONSTRAINT f_order_fk3 FOREIGN KEY (comp_num) references COMPANY_DETAIL (comp_num)
);

--��ǰ �ֹ����� �ĺ� ��ȣ ������
--����, ��ǰ, Ƽ�� ��� �������� �����Ͽ� �����.


--��ǰ �ֹ� ������ ���̺�
CREATE TABLE F_ORDER_DETAIL(
  f_detail_num number not null,						--��ǰ �ֹ������� �ĺ� ��ȣ
  food_num number not null,                         --��ǰ ���� �ĺ� ��ȣ
  f_order_num varchar2(20) not null,                --��ǰ �ֹ����� �ĺ� ��ȣ
  order_quantity number(5) not null,                --�ֹ� ����
  food_name varchar2(200),                          --��ǰ ��ǰ��
  food_price number(9),                             --��ǰ ����
  food_total number(9),                             --���ϻ�ǰ �ջ� �ݾ�
  CONSTRAINT f_order_detail_pk PRIMARY KEY (f_detail_num),
  CONSTRAINT f_order_detail_fk1 FOREIGN KEY (food_num) references FOOD (food_num),
  CONSTRAINT f_order_detail_fk2 FOREIGN KEY (f_order_num) references F_ORDER (f_order_num)
);




--��ǰ ���� �ı� ���̺�
CREATE TABLE FOOD_REVIEW(
  review_num number not null,                         --��ǰ �ı� �ĺ���ȣ
  mem_num number not null,                            --ȸ�� �ĺ� ��ȣ
  comp_num varchar2(40) NOT null,                           --��� �ĺ� ��ȣ
  comp_score number(1) not null,                      --���� ���� �������
  review_title varchar2(100) not null,                     --ȸ���ۼ� �ı� ����
  review_content clob not null,                       --ȸ���ۼ� �ı� ����
  review_regdate date DEFAULT SYSDATE not null,       --ȸ���ı� �ۼ���(default: SYSDATE)
  review_mdate date,                                  --ȸ���ı� ������
  CONSTRAINT food_review_pk PRIMARY KEY (review_num),
  CONSTRAINT food_review_fk1 FOREIGN KEY (mem_num) references MEMBER (mem_num),
  CONSTRAINT food_review_fk2 FOREIGN KEY (comp_num) references COMPANY_DETAIL (comp_num)
);




------------------------------������
--��ǰ �ĺ� ��ȣ ������
CREATE SEQUENCE food_seq;
--��ǰ ��ٱ��� �ĺ� ��ȣ ������
CREATE SEQUENCE f_cart_seq;
--��ǰ �ֹ� ������ ������
CREATE SEQUENCE f_order_detail_seq;
--��ǰ ���� �ı� ������
CREATE SEQUENCE food_review_seq;




--���� �ֹ� ������ ��ȣ  (����, ��ǰ, Ƽ�� ���� Ȱ����)
create sequence order_seq;

----------------------------------------------------------------------------------

--���̺� ���� ����
drop table BOOKMARK cascade constraints; 
drop table CHAT cascade constraints; 
drop table CHATROOM cascade constraints; 
drop table COMMU_DISLIKE cascade constraints; 
drop table COMMU_LIKE cascade constraints; 
drop table COMMU_REPLY cascade constraints; 
drop table COMMU_REPLY_REPORT cascade constraints; 
drop table COMMU_REPORT cascade constraints; 
drop table COMMU cascade constraints; 
drop table F_CART cascade constraints; 
drop table F_ORDER cascade constraints; 
drop table F_ORDER_DETAIL cascade constraints; 
drop table FOOD_REVIEW cascade constraints; 
drop table FOOD cascade constraints; 
drop table G_CART cascade constraints; 
drop table G_ORDER cascade constraints; 
drop table G_ORDER_DETAIL cascade constraints; 
drop table GAME cascade constraints; 
drop table GOODS_FAV cascade constraints; 
drop table GOODS_REVIEW cascade constraints; 
drop table GOODS_OPTION cascade constraints; 
drop table GOODS cascade constraints; 
drop table MEMBER_CERT cascade constraints; 
drop table NEWS cascade constraints; 
drop table SEAT_STATUS cascade constraints; 
drop table SEAT cascade constraints; 
drop table GRADE cascade constraints; 
drop table TGAME cascade constraints; 
drop table TICKET cascade constraints; 
drop table TRADING cascade constraints;
drop table PLAYER cascade constraints; 
drop table COMPANY_DETAIL cascade constraints; 
drop table MEMBER_DETAIL cascade constraints; 
drop table MEMBER cascade constraints; 

--������ ���� ����

drop sequence BOOKMARK_SEQ;
drop sequence CHAT_SEQ;
drop sequence CHATROOM_SEQ;
drop sequence COMMU_DISLIKE_SEQ;
drop sequence COMMU_LIKE_SEQ;
drop sequence COMMU_REPLY_REPORT_SEQ;
drop sequence COMMU_REPLY_SEQ;
drop sequence COMMU_REPORT_SEQ;
drop sequence COMMU_SEQ;
drop sequence COMPANY_DETAIL_SEQ;
drop sequence F_CART_SEQ;
drop sequence F_ORDER_DETAIL_SEQ;
drop sequence FOOD_REVIEW_SEQ;
drop sequence FOOD_SEQ;
drop sequence G_CART_SEQ;
drop sequence G_ORDER_DETAIL_SEQ;
drop sequence G_ORDER_SEQ;
drop sequence GAME_SEQ;
drop sequence GOODS_FAV_SEQ;
drop sequence GOODS_OPT_SEQ;
drop sequence GOODS_REVIEW_SEQ;
drop sequence GOODS_SEQ;
drop sequence GRADE_SEQ;
drop sequence MEMBER_DETAIL_SEQ;
drop sequence NEWS_SEQ;
drop sequence PLAYER_SEQ;
drop sequence SEAT_SEQ;
drop sequence SEAT_STATUS_SEQ;
drop sequence TRADING_SEQ;

commit;