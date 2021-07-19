DROP DATABASE IF EXISTS SP;

CREATE DATABASE SP;

CONNECT SP;

CREATE TABLE USERS (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(60) NOT NULL,
	password varchar(60) NOT NULL,
    first_name varchar(60),
    middle_name varchar(60),
    last_name varchar(60),
    role_id int,
    status varchar(2),
    PRIMARY KEY (id),
    UNIQUE KEY (email)
);

CREATE TABLE COMPANY (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(60) NOT NULL,
    address varchar(60) NOT NULL,
    description varchar(255) NOT NULL,
    email varchar(60) NOT NULL,
	website varchar(255) NOT NULL,
	status varchar(2),
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);


CREATE TABLE JOB (
    id int NOT NULL AUTO_INCREMENT,
    company_id int not null,
    name varchar(60) NOT NULL,
    description varchar(1000) NOT NULL,
    skills varchar(250) ,
    posteddate DATE,
    lastdate DATE,
	status varchar(2),
    PRIMARY KEY (id),
    CONSTRAINT fk_company FOREIGN KEY (company_id)  
  REFERENCES COMPANY(ID)  
);


CREATE TABLE EDUCATION_DETAILS (
    id int NOT NULL AUTO_INCREMENT,
    user_id int not null,

    ssc_perc FLOAT DEFAULT 0.0,
	
    hsc_perc FLOAT DEFAULT 0.0,
	hsc_type VARCHAR(50),
    
	grad_perc FLOAT DEFAULT 0.0,
    grad_type VARCHAR(50),
	
    ssc_school VARCHAR(200),
	
    hsc_college VARCHAR(200),
	
    grad_college VARCHAR(200),
	
    skills VARCHAR(200),
	
    status VARCHAR(2),
    PRIMARY KEY (id),
    CONSTRAINT fk_user FOREIGN KEY (user_id)  
  	REFERENCES USERS(ID) ,
  	UNIQUE KEY (user_id)
);



CREATE TABLE JOB_APPLICATION (
    id int NOT NULL AUTO_INCREMENT,
    job_id int not null,
    user_id int not null,
    application_date DATE,
    application_status varchar(50),
    status varchar(2),
    PRIMARY KEY (id),
    CONSTRAINT fk_job_id FOREIGN KEY (job_id)  
  	REFERENCES JOB(ID),
  	CONSTRAINT fk_users_id_job FOREIGN KEY (user_id)  
  	REFERENCES USERS(ID),
  	UNIQUE KEY (job_id,user_id)
);