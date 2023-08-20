-- 경기정보
CREATE TABLE tgame(
	game_num NUMBER,
	grade_num NUMBER,
	game_date VARCHAR2(30) NOT NULL,
	game_time VARCHAR2(20) NOT NULL,
	game_team VARCHAR2(15) NOT NULL,
	game_state NUMBER(1) DEFAULT 0 NOT NULL,	-- 0:예매대기, 1:예매가능, 2:매진, 3:경기취소
	game_week NUMBER(1) NOT NULL,
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
	seat_quantity NUMBER(5) NOT NULL,
	CONSTRAINT seat_pk PRIMARY KEY (seat_num),
	CONSTRAINT seat_fk FOREIGN KEY (grade_num) REFERENCES grade (grade_num)
);

-- 좌석상태
CREATE TABLE seat_status(
	status_num NUMBER NOT NULL,
	seat_num NUMBER NOT NULL,
	grade_num NUMBER NOT NULL,
	seat_info VARCHAR2(30) NOT NULL,
	game_num NUMBER(30),
	seat_auth NUMBER(20) NOT NULL,	-- 1:예매완료, 2:예매불가
	CONSTRAINT seat_status_fk FOREIGN KEY (seat_num) REFERENCES seat (seat_num),
	CONSTRAINT seat_status_fk2 FOREIGN KEY (grade_num) REFERENCES grade (grade_num)
);

-- 선택정보확인(장바구니개념)
CREATE TABLE ticket_check(
	check_num NUMBER NOT NULL,
	seat_num NUMBER NOT NULL,
	seat_info VARCHAR2(10) NOT NULL,
	game_num NUMBER NOT NULL,
	mem_num NUMBER NOT NULL,
	CONSTRAINT ticket_check_fk FOREIGN KEY (seat_num) REFERENCES seat (seat_num)
);

-- 티켓
CREATE TABLE ticket(
	ticket_num VARCHAR2(20),
    mem_num NUMBER NOT NULL,
    game_num NUMBER NOT NULL,
    status_num NUMBER NOT NULL,
    title VARCHAR2(100) NOT NULL,	-- 경기 제목
	ticket_date DATE DEFAULT SYSDATE NOT NULL,	-- 티켓 구매 날짜
	ticket_quantity NUMBER(1) NOT NULL,	-- 구매 수량
	ticket_modify DATE,
	total_price NUMBER(9) NOT NULL,
	pg varchar2(30) not null,
	pay_method varchar2(30) not null,
	CONSTRAINT ticket_pk PRIMARY KEY (ticket_num),
	CONSTRAINT ticket_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num),
	CONSTRAINT ticket_fk2 FOREIGN KEY (game_num) REFERENCES tgame (game_num)
);

-- sequence
CREATE SEQUENCE tgame_seq;
CREATE SEQUENCE grade_seq;
CREATE SEQUENCE seat_seq;
CREATE SEQUENCE seat_status_seq;
CREATE SEQUENCE ticket_check_seq;
