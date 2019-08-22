drop table cart cascade constraints;
create table cart(
cart_id number not null primary key,--��ٱ��� �ڵ�(�Ϸù�ȣ)
userid varchar2(50) not null,--���̵�
product_id number not null,--��ǰ�ڵ�
amount number default 0--����
);
select * from product;

insert into cart values(1, 'Lee',1,10);
insert into cart values(2, 'kim',2,20);
insert into cart values(3, 'jeong',3,20); -- �Ʒ� �������ǿ� ���� ���� �߻�(ȸ���� �ƴϸ� ��� �ȵ�)
rollback;
--foreign key ����
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
