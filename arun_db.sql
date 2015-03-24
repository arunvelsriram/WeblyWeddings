drop database if exists weblyweddings;
create database weblyweddings;
use weblyweddings;

create table T_USER (
	u_id int auto_increment,
	u_name varchar(50),
	u_email varchar(50) unique,
	u_password varchar(12),
	primary key(u_id)
);

create table T_WEDDING (
	w_name varchar(50),
	w_brideid int,
	w_bridegroomid int,
	w_datetime datetime,
	w_venue varchar(50),
	primary key(w_name),
	foreign key(w_brideid) references T_USER(u_id),
	foreign key(w_bridegroomid) references T_USER(u_id)
);

create table T_INVITE (
	u_id int,
	w_name varchar(50),
	primary key(u_id, w_name),
	foreign key(u_id) references T_USER(u_id),
	foreign key(w_name) references T_WEDDING(w_name)
);

create table T_EVENT (
	w_name varchar(50),
	e_name varchar(100),
	e_time datetime,
	e_venue varchar(50),
	primary key(w_name, e_name),
	foreign key(w_name) references T_INVITE(w_name)
);

create table T_PHOTO (
	photo_id varchar(255),
	w_name varchar(50),
	uploader_id int,
	primary key(photo_id, w_name),
	foreign key(w_name) references T_INVITE(w_name),
	foreign key(uploader_id) references T_INVITE(u_id)
);

create table T_PHOTOLIKE (
	photo_id varchar(255),
	u_id int,
	primary key(photo_id, u_id),
	foreign key(photo_id) references T_PHOTO(photo_id),
	foreign key(u_id) references T_INVITE(u_id)
);

create table T_PHOTOCOMMENT (
	photo_id varchar(255),
	comment_datetime datetime,
	u_id int,
	comment_desc varchar(255),
	primary key(photo_id, comment_datetime),
	foreign key(photo_id) references T_PHOTO(photo_id),
	foreign key(u_id) references T_INVITE(u_id)
);