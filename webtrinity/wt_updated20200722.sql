drop database if exists wt;

create database if not exists wt;

use wt;

drop table if exists user;

create table if not exists user
(	
	id varchar(30) not null primary key comment '아이디',
	pw varchar(50) not null comment '비밀번호',
	jdate datetime not null default now() comment '가입일',
	photo varchar(255) not null default 'profile.png' comment '프로필 사진'
) comment '사용자 정보';

drop table if exists board;

create table if not exists board
(	
	bdno int not null primary key auto_increment comment '게시물 번호',
	id varchar(30) not null comment '아이디',
	foreign key(id) references user(id),
	title varchar(200) not null comment '제목',
	contents text not null comment '내용',
	wdate datetime not null default now() comment '최초 작성일',
	mdate datetime comment '수정일',
	type varchar(2) not null comment '분류 - hs : HTML STUDY, hq : HTML Q&A, cs : CSS STUDY, cq : CSS Q&A, js : JAVASCRIPT STUDY, hq : JAVASCRIPT Q&A',
	hit int not null default 0 comment '조회수',
	bdlike int not null default 0 comment '추천수'
) comment '게시물 정보';

drop table if exists reply;

create table if not exists reply
(
	reno int not null primary key auto_increment comment '댓글 번호',
	bdno int not null comment '게시물 번호',	
	foreign key(bdno) references board(bdno),
	id varchar(30) not null comment '댓글 작성자 아이디',	
	recont text not null comment '댓글 내용',
	rewdate datetime not null comment '댓글 작성일'	
) comment '댓글 정보';


--데이터를 삭제하려고 할 때 
--foreign key로 묶여 있기 때문에 아래와 같은 오류가 뜹니다.

ERROR 1451: 1451: Cannot delete or update a parent row: a foreign key constraint fails (`wt`.`reply`, CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`bdno`) REFERENCES `board` (`bdno`))
SQL Statement:
DELETE FROM `wt`.`board` WHERE (`bdno` = '120')

--이 경우 set foreign_key_checks = 0;으로 foreign key 속성을 잠시 해제하고
--쿼리문을 실행한 다음 set foreign_key_checks = 1;로 
--foreign key 속성을 원래대로 되돌려 주면 됩니다.

--예시 
set foreign_key_checks = 0;

DELETE FROM `wt`.`board` WHERE (`bdno` = '120');

set foreign_key_checks = 1;


--참고 주소 : https://m.blog.naver.com/bomyzzang/220323683038






















