drop table FDEmployees;
drop type FDPerson;

create type FDPerson as (
  name varchar(20),
  birthday date,
  salary numeric(10,2)
);

create table FDEmployees (
  id integer primary key,
  person FDPerson,
  spouse FDPerson
);

insert into FDEmployees values (1, ROW('John', date '1980-10-05', 30000), ROW('Mary', date '1982-7-15', 20000));
insert into FDEmployees values (2, ROW('Peter', date '1991-3-08', 40000), ROW('Anna', date '1990-6-22', 50000));
