SET SCHEMA market;

create sequence products_numerator;

create table products(
  id int DEFAULT NEXTVAL(products_numerator) not null,
  shop_id int foreign key references shops("id"),
  name varchar(30),
  description varchar(500),
  cost real,
  "count" int,
  newcolumn int,
  CONSTRAINT pk_products PRIMARY KEY (id)
);

exec native POSTGRESQL before --{{
drop view if exists products_shops;
--}};

exec native POSTGRESQL after --{{
create or replace view products_shops as select distinct shop_id from market.products;
--}};