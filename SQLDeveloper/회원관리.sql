drop table cart cascade constraints;
create table cart(
cart_id number not null primary key,--장바구니 코드(일련번호)
userid varchar2(50) not null,--아이디
product_id number not null,--상품코드
amount number default 0--수량
);
select * from product;

insert into cart values(1, 'Lee',1,10);
insert into cart values(2, 'kim',2,20);
insert into cart values(3, 'jeong',3,20); -- 아래 제약조건에 의해 오류 발생(회원이 아니면 등록 안됨)
rollback;
--foreign key 설정
alter table cart add constraint cart_userid_fk
foreign key(userid) references member(userid);
select * from cart;

select name, product_name, price, amount, price * amount money
from member m,product p, cart c
where m.userid=c.userid and p.product_id=c.product_id;

rollback;


create sequence seq_cart
start with 1
increment by 1;

select * from cart;
