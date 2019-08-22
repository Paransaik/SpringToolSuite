create table memo(
idx number not null primary key,
writer varchar2(50) not null,
memo varchar2(200) not null,
post_date date default sysdate
);

insert into memo(idx, writer, memo) values(1,'kim','메모1');
insert into memo(idx, writer, memo) values(2,'pack','메모2');

select *      from memo;
commit;