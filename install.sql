create user 'dojo'@'localhost' identified by 'somepass';
create database dojocontacts;
grant all privileges on dojocontacts.* to 'dojo'@'localhost' with grant option;

use dojocontacts;

create table groups(
	id 				int(11) auto_increment primary key,
	name 			varchar(100) not null
) engine=INNODB;

create table contacts(
	id 				int(11) auto_increment primary key,
	group_id		int(11) not null,
	first_name		varchar(100) not null,
	last_name		varchar(100) not null,
	email_address	varchar(255) not null,
	home_phone		varchar(100),
	work_phone		varchar(100),
	mobile_phone	varchar(100),
	twitter			varchar(255),
	facebook		varchar(255),
	linkedin		varchar(255),
	foreign key(group_id) references groups(id) on delete cascade
) engine=INNODB;

insert into groups(name)
values('Family');

insert into groups(name)
values('Friends');

insert into groups(name)
values('Colleagues');

insert into groups(name)
values('Others');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(3, 'Joe', 'Lennon', 'joe@joelennon.ie', '(555) 123-4567', '(555) 456-1237', 'joelennon', 'joelennon', 'joelennon');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(1, 'Mary', 'Murphy', 'mary@example.com', '(555) 234-5678', '(555) 567-2348', 'mmurphy', 'marym', 'mary.murphy');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(2, 'Tom', 'Smith', 'tsmith@example.com', '(555) 345-6789', '(555) 678-3459', 'tom.smith', 'tsmith', 'smithtom');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(4, 'John', 'Cameron', 'jc@example.com', '(555) 456-7890', '(555) 789-4560', 'jcameron', 'john.cameron', 'johnc');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(4, 'Ann', 'Dunne', 'anndunne@example.com', '(555) 567-8901', '(555) 890-5671', 'ann.dunne', 'adunne', 'dunneann');

insert into contacts(group_id, first_name, last_name, email_address, home_phone, work_phone, twitter, facebook, linkedin)
values(1, 'James', 'Murphy', 'james@example.com', '(555) 678-9012', '(555) 901-6782', 'jmurphy', 'jamesmurphy', 'james.murphy');