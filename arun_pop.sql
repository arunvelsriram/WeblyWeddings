select * from t_user;
insert into t_user(u_name,u_email,u_password) values('Chirag Shah','chiragshah99999@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Arunvel Shriram','arunvel@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Abhishek','abc@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Aishwarya','def@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Akshaya','ghi@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Goutham','lmn@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Karthik','opq@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Kannan','rst@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Ashwin','uvw@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Aashique','xyz@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Kavi','cba@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Anand','fed@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Ashok','kji@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Babu','nml@gmail.com','chirag');
insert into t_user(u_name,u_email,u_password) values('Karishma','qpo@gmail.com','chirag');
select * from t_user;

select * from t_wedding;
insert into t_wedding(w_name,w_brideid,w_bridegroomid,w_datetime,w_venue) values('ChiragKarishma',1,15,'2014-12-12 08:08:08','Chennai');
insert into t_wedding(w_name,w_brideid,w_bridegroomid,w_datetime,w_venue) values('ArunvelAishwarya',2,4,'2013-01-02 10:10:10','Gujrat');
insert into t_wedding(w_name,w_brideid,w_bridegroomid,w_datetime,w_venue) values('BabuAkshaya',14,5,'2014-12-12 18:28:12','Mumbai');

select * from t_wedding;


select * from t_invite;
insert into t_invite values('7','ChiragKarishma');
insert into t_invite values('8','ChiragKarishma');
insert into t_invite values('9','ChiragKarishma');
insert into t_invite values('10','ArunvelAishwarya');
insert into t_invite values('11','ArunvelAishwarya');
insert into t_invite values('12','ArunvelAishwarya');
insert into t_invite values('8','ArunvelAishwarya');
insert into t_invite values('9','ArunvelAishwarya');
insert into t_invite values('13','BabuAkshaya');
select * from t_invite;

select * from t_event;
insert into t_event(w_name,e_name,e_time,e_venue) values('ChiragKarishma','BachParty','2014-12-12 18:28:12','chennai');
insert into t_event(w_name,e_name,e_time,e_venue) values('ChiragKarishma','BachParty2','2014-11-12 18:28:12','cddghennai');
insert into t_event(w_name,e_name,e_time,e_venue) values('ChiragKarishma','BachEvent','2014-2-12 18:28:12','chvbbennai');
insert into t_event(w_name,e_name,e_time,e_venue) values('ArunvelAishwarya','BachParty','2014-09-12 08:28:12','delhi');
insert into t_event(w_name,e_name,e_time,e_venue) values('ArunvelAishwarya','asdeventchParty','2014-12-12 18:28:12','sikkim');
insert into t_event(w_name,e_name,e_time,e_venue) values('ArunvelAishwarya','eventHaldi','2013-12-12 12:28:12','chennai');
select * from t_event;

select * from t_photo;
insert into t_photo(w_name,photo_id,uploader_id) values('ChiragKarishma','photo1.jpg',7);
insert into t_photo(w_name,photo_id,uploader_id) values('ChiragKarishma','photo2.jpg',8);
insert into t_photo(w_name,photo_id,uploader_id) values('ChiragKarishma','photo3.jpg',7);
insert into t_photo(w_name,photo_id,uploader_id) values('ArunvelAishwarya','photo4.jpg',11);
insert into t_photo(w_name,photo_id,uploader_id) values('ArunvelAishwarya','photo5.jpg',12);
insert into t_photo(w_name,photo_id,uploader_id) values('ArunvelAishwarya','photo6.jpg',12);
select * from t_photo;

select * from t_photolike;
-- insert into t_photolike(photo_id,u_id) values('photo1.jpg','9');
-- insert into t_photolike(photo_id,u_id) values('photo2.jpg','8');
-- insert into t_photolike(photo_id,u_id) values('photo3.jpg','8');
-- insert into t_photolike(photo_id,u_id) values('photo1.jpg','7');
-- insert into t_photolike(photo_id,u_id) values('photo4.jpg','12');
-- insert into t_photolike(photo_id,u_id) values('photo5.jpg','9'); 
-- insert into t_photolike(photo_id,u_id) values('photo5.jpg','10');
-- insert into t_photolike(photo_id,u_id) values('photo6.jpg','11');
-- insert into t_photolike(photo_id,u_id) values('photo6.jpg','9');
select * from t_photolike;

select * from t_photocomment;
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo1.jpg','2014-12-12 08:12:14','7','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo2.jpg','2014-12-12 09:12:14','8','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo1.jpg','2014-12-12 18:12:14','7','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo2.jpg','2014-12-12 08:32:14','7','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo5.jpg','2014-12-12 08:15:14','10','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo6.jpg','2014-12-12 08:18:14','12','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo6.jpg','2014-12-12 08:10:14','12','nyc!');
insert into t_photocomment(photo_id,comment_datetime,u_id,comment_desc) values('photo6.jpg','2014-12-12 08:11:14','12','nyc!');
select * from t_photocomment;


select * from t_invite;