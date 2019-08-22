--사용자 테이블
create table tbl_user(
userid varchar2(50) not null, --아이디
upw varchar2(50) not null, --비번
uname varchar2(50) not null,
upoint number default 0, --포인트
primary key(userid)
);

--메시지 테이블
create table tbl_message(
mid number not null, --메시지일련번호
targetid varchar2(50) not null, --받는 사람 아아디
sender varchar2(50) not null, --보낸 사람 아아디
message varchar2(4000) not null,
opendate date, --열람 시간
senddate date default sysdate, --보낸 시간
primary key(mid)
);

--메시지 일련번호를 관리할 시퀸스 객체
create sequence message_seq
start with 1 --1부터 시작
increment by 1; --1씩 증가

--시퀸스.nextval => 다음번호
select message_seq.nextval from dual; -- 시퀸스 nextval의 번호 1이 출력

insert into tbl_user(userid, upw, uname) values('user00', 'user00', 'kim');
insert into tbl_user(userid, upw, uname) values('user01', 'user01', 'park');
insert into tbl_user(userid, upw, uname) values('user02', 'user02', 'hong');

--select * from tbl_user; -- tbl_user table 출력

--user02가 user00에게 메시지 전송
insert into tbl_message (mid, targetid, sender, message) values
(message_seq.nextval, 'user00', 'user02', '안녕');
select * from tbl_message;

--user02에게 포인트 10 추가
update tbl_user set upoint=upoint+10 where userid='user02';
select * from tbl_user;

--user01이 메시지  목록
select * from tbl_message where targetid='user01';

--메시지를 읽으면 열람시간 저장
update tbl_message set opendate=sysdate where mid=22;
select * from tbl_message;

--메시지를 읽으면 포인트 5 추가
update tbl_user set upoint=upoint+5 where userid='user00';
select*from tbl_user;

delete from tbl_message; --메시지 테이블 삭제
update tbl_user set upoint=0;
commit;