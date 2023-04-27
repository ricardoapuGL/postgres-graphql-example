create table product(
    id smallserial primary key,
    name varchar(127) not null,
    description varchar(127) not null,
    img1 varchar(255) not null,
    img2 varchar(255) null,
    img3 varchar(255) null,
    img4 varchar(255) null,
    link1 varchar(255) null,
    link2 varchar(255) null,
    price NUMERIC(4, 2) not null default 0.00,
    stock smallint not null default -1,
    created_at timestamp not null,
    updated_at timestamp not null
);

create table account(
    id serial primary key,
    email varchar(255) not null,
    created_at timestamp not null,
    updated_at timestamp not null
);