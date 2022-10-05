create table teacher (
  id int4 primary key not null,
  name varchar not null,
  last_name varchar not null
);

insert into teacher (id, name, last_name) values (1,'juan','peres');
insert into teacher (id, name, last_name) values (2,'jhon','lopez');
insert into teacher (id, name, last_name) values (3,'richard','flores');
insert into teacher (id, name, last_name) values (4,'tom','cruz');
insert into teacher (id, name, last_name) values (5,'luis','yopla');
insert into teacher (id, name, last_name) values (6,'diana','ramirez');
insert into teacher (id, name, last_name) values (7,'luis miguel','cardenas');
insert into teacher (id, name, last_name) values (8,'diana maria','isis');

select * from teacher;

-- se agrega el atributo edad
ALTER TABLE teacher ADD age int;
--se actuliza la edad del usuario tom
update teacher set age = 23 where nombres='tom';

create table curse (
  id varchar(5) primary key,
  name varchar(40) not null,
  credit integer not null
);

create table nota (
  id serial primary key,
  value float not null default 0.0
);

create table student (
  code varchar(7) primary key,
  name varchar not null,
  last_name varchar not null
);

create table registration_form (
  id serial primary key,
  id_student varchar(7),
  id_course varchar(5),
  id_teacher int4,
  id_nota serial4
);

select * from curse;
select * from nota;
select * from condition;
select * from student;

insert into student (code ,name ,last_name) values (2713005,'Kevin','Caceres Lopez'),
  (2713003,'Ramon','Martinez Sulca'),
  (2713006,'Juan Carlos','Villa Campos'),
  (2713007,'Yack','Pereira Acha'),
  (2713008,'Miriam','Flores Mucha'),
  (2713009,'Marleny','Limaco Zaens');

insert into curse (id, name, credit) values ('MA120','matematica',4),
  ('LE122','lenguaje',2),
  ('CO126','contabilidad',3),
  ('EC220','economia',4),
  ('MA123','algebra',4),
  ('MA221','trigonometria',3),
  ('MA320','fisica',5);

insert into nota (value) values (5),(10),(11),(15),(14),(18),(20);
insert into condition (status_name) values ('matriculado'),('aprovado'),('desaprovado');

alter table registration_form add status_name varchar not null default 'matriculado';
insert into registration_form (status_name) values ('matriculado'),('aprovado'),('desaprovado');

alter table registration_form add constraint fk_id_student foreign key (id_student) references student(code);
alter table registration_form add constraint fk_id_curse foreign key (id_course) references curse(id);
alter table registration_form add constraint fk_id_teacher foreign key (id_teacher) references teacher(id);
alter table registration_form add constraint fk_id_nota foreign key (id_nota) references nota(id);

select * from registration_form rf ;

-----consultar y mostrar estudiante, su nombre y apellido, el curso y notas, y el nombre del profesor
select s.name, s.last_name, c.name as curses, n.value as notas, rf.status_name as status_curse, t.name as teacher
from student s inner join registration_form rf on rf.id_student=s.code
inner join curse c on rf.id_course = c.id
inner join nota n on rf.id_nota = n.id 
inner join teacher t on rf.id_teacher = t.id 
