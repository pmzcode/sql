
CREATE TABLE "workers" (
	"id" number,
	"name" varchar2(45),
	"surname" varchar2(45),
	"birth_date" DATE,
	"birth_place" varchar2(45),
	"passport" varchar2(45),
	"address" varchar2(45),
	"registration_address" varchar2(45),
	constraint WORKERS_PK PRIMARY KEY ("id"))
CREATE sequence "WORKERS_SEQ"

CREATE OR REPLACE trigger "BI_WORKERS"
  before insert on "workers"
  for each row
begin
  select "WORKERS_SEQ".nextval into :NEW."id" from dual;
end;


CREATE TABLE "educations" (
	"id" number,
	"worker_id" number,
	"university" varchar2(45),
	"speciality" varchar2(45),
	"expiration_date" DATE,
	constraint EDUCATIONS_PK PRIMARY KEY ("id"))
  
CREATE sequence "EDUCATIONS_SEQ"

CREATE trigger "BI_EDUCATIONS"
  before insert on "educations"
  for each row
begin
  select "EDUCATIONS_SEQ".nextval into :NEW."id" from dual;
end;



CREATE TABLE "contracts" (
	"id" number,
	"hire_date" DATE,
	"expiration_date" DATE,
	"salary" number,
	"travel_ability" varchar2(45),
	constraint CONTRACTS_PK PRIMARY KEY ("id"))
  
CREATE sequence "CONTRACTS_SEQ"

CREATE trigger "BI_CONTRACTS"
  before insert on "contracts"
  for each row
begin
  select "CONTRACTS_SEQ".nextval into :NEW."id" from dual;
end;


CREATE TABLE "posts" (
	"id" int,
	"name" varchar2(45),
	"subordinates" varchar2(45),
	"contract_id" number,
	constraint POSTS_PK PRIMARY KEY ("id"))
  
CREATE sequence "POSTS_SEQ"

CREATE trigger "BI_POSTS"
  before insert on "posts"
  for each row
begin
  select "POSTS_SEQ".nextval into :NEW."id" from dual;
end;


CREATE TABLE "departments" (
	"id" number,
	"name" varchar2(45),
	"chief" varchar2(45),
	"phone_number" varchar2(45),
	"address" varchar2(45),
	"contract_id" number,
	constraint DEPARTMENTS_PK PRIMARY KEY ("id"))
  
CREATE sequence "DEPARTMENTS_SEQ"

CREATE trigger "BI_DEPARTMENTS"
  before insert on "departments"
  for each row
begin
  select "DEPARTMENTS_SEQ".nextval into :NEW."id" from dual;
end;


ALTER TABLE "educations" ADD CONSTRAINT "educations_fk0" FOREIGN KEY ("worker_id") REFERENCES "workers"("id");

ALTER TABLE "contracts" ADD CONSTRAINT "contracts_fk0" FOREIGN KEY ("id") REFERENCES "workers"("id");

ALTER TABLE "posts" ADD CONSTRAINT "posts_fk0" FOREIGN KEY ("contract_id") REFERENCES "contracts"("id");

ALTER TABLE "departments" ADD CONSTRAINT "departments_fk0" FOREIGN KEY ("contract_id") REFERENCES "contracts"("id");