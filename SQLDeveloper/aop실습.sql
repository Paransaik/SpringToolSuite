--����� ���̺�
create table tbl_user(
userid varchar2(50) not null, --���̵�
upw varchar2(50) not null, --���
uname varchar2(50) not null,
upoint number default 0, --����Ʈ
primary key(userid)
);

--�޽��� ���̺�
create table tbl_message(
mid number not null, --�޽����Ϸù�ȣ
targetid varchar2(50) not null, --�޴� ��� �ƾƵ�
sender varchar2(50) not null, --���� ��� �ƾƵ�
message varchar2(4000) not null,
opendate date, --���� �ð�
senddate date default sysdate, --���� �ð�
primary key(mid)
);

--�޽��� �Ϸù�ȣ�� ������ ������ ��ü
create sequence message_seq
start with 1 --1���� ����
increment by 1; --1�� ����

--������.nextval => ������ȣ
select message_seq.nextval from dual; -- ������ nextval�� ��ȣ 1�� ���

insert into tbl_user(userid, upw, uname) values('user00', 'user00', 'kim');
insert into tbl_user(userid, upw, uname) values('user01', 'user01', 'park');
insert into tbl_user(userid, upw, uname) values('user02', 'user02', 'hong');

--select * from tbl_user; -- tbl_user table ���

--user02�� user00���� �޽��� ����
insert into tbl_message (mid, targetid, sender, message) values
(message_seq.nextval, 'user00', 'user02', '�ȳ�');
select * from tbl_message;

--user02���� ����Ʈ 10 �߰�
update tbl_user set upoint=upoint+10 where userid='user02';
select * from tbl_user;

--user01�� �޽���  ���
select * from tbl_message where targetid='user01';

--�޽����� ������ �����ð� ����
update tbl_message set opendate=sysdate where mid=22;
select * from tbl_message;

--�޽����� ������ ����Ʈ 5 �߰�
update tbl_user set upoint=upoint+5 where userid='user00';
select*from tbl_user;

delete from tbl_message; --�޽��� ���̺� ����
update tbl_user set upoint=0;
commit;