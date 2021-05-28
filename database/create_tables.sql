DROP DATABASE IF EXISTS Trolling;
CREATE DATABASE IF NOT EXISTS Trolling;

DROP USER IF EXISTS 'trolling'@'localhost';
CREATE USER 'trolling'@'localhost' IDENTIFIED BY 'trolling';

GRANT ALL PRIVILEGES on Trolling.* to 'trolling'@'localhost';
FLUSH PRIVILEGES;

USE Trolling;

create table roles (
  id int primary key auto_increment,
  name varchar(32)			not null
);

create table users (
  id int primary key auto_increment,
  usingKickscooter bool default false not null,
  roleId int				not null,
  foreign key (roleId) references roles(id)
);

create table states (
  id int primary key auto_increment,
  stateName varchar(32)			not null
);

create table kickscooters (
  id 								int primary key auto_increment,
  kickscooterName varchar(32)		not null,
  stateId int 						default 1 not null,
  foreign key(stateId) references states(id)
);

create table rents (
  id int primary key auto_increment,
  userId int 			not null,
  kickscooterId int 	not null,
  rentDate date 		not null,
  returnDate date,
  currentlyRented int default 1 not null,
  foreign key(userId) references users(id),
  foreign key(kickscooterId) references kickscooters(id)
);

INSERT INTO states (stateName) 
VALUES ("available"),("rented");
insert into roles (name) values ('user');
insert into roles (name) values ('admin');
insert into users(usingKickscooter,roleId) values (0,2);

insert into kickscooters(kickscooterName, stateId) values ('Kickscooter A1464', 1);
insert into kickscooters(kickscooterName, stateId) values ('Kickscooter AR6543', 1);
insert into kickscooters(kickscooterName, stateId) values ('Kickscooter GR6566', 1);
insert into kickscooters(kickscooterName, stateId) values ('Kickscooter H473', 1);