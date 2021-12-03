CREATE TABLE IF NOT EXISTS accounts
(
    id    bigserial not null
        constraint accounts_table_pk primary key,

    email VARCHAR(50)
);
