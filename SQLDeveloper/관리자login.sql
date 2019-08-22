drop table admin cascade constraints;
create table admin(
userid varchar2(50) not null,
passwd varchar2(50) not null,
name varchar2(50) not null,
email varchar2(100),
join_date date default sysdate,
primary key(userid)
);

insert into admin(userid, passwd, name) values ('admin', '1234','관리자');

select*from admin;
commit;


set product_name='사과2' , price='1300', description='이것은 사과입니다.', picture_url='2.jpg'
where product_id='31'