--------------------------------------------------------
--  File created - Wednesday-December-18-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ADOPTER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ROAA"."ADOPTER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GENERAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ROAA"."GENERAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADOPTER
--------------------------------------------------------

  CREATE TABLE "ROAA"."ADOPTER" 
   (	"ADOPTER_ID" NUMBER, 
	"NAME" VARCHAR2(100), 
	"PHONE_NUMBER" VARCHAR2(15), 
	"EMAIL" VARCHAR2(100), 
	"ADDRESS" VARCHAR2(255), 
	"STATUS" VARCHAR2(10)
   ) ;
 

--------------------------------------------------------
--  DDL for Table CHILD
--------------------------------------------------------

  CREATE TABLE "ROAA"."CHILD" 
   (	"CHILD_ID" NUMBER, 
	"NAME" VARCHAR2(100), 
	"GENDER" CHAR(1), 
	"ADMISSION_DATE" DATE, 
	"BIRTH_DATE" DATE, 
	"STAFF_ID" NUMBER, 
	"ADOPTER_ID" NUMBER, 
	"ROOM_ID" NUMBER
   ) ;
 

--------------------------------------------------------
--  DDL for Table STAFF
--------------------------------------------------------

  CREATE TABLE "ROAA"."STAFF" 
   (	"STAFF_ID" NUMBER, 
	"NAME" VARCHAR2(100), 
	"POSITION" VARCHAR2(50), 
	"EMAIL" VARCHAR2(100), 
	"PHONE_NUMBER" VARCHAR2(15), 
	"HIRE_DATE" DATE
   ) ;
 

--------------------------------------------------------
--  DDL for Table CHILD_GUARDIAN
--------------------------------------------------------

  CREATE TABLE "ROAA"."CHILD_GUARDIAN" 
   (	"CHILD_ID" NUMBER(*,0), 
	"GUARDIAN_ID" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table GUARDIAN
--------------------------------------------------------

  CREATE TABLE "ROAA"."GUARDIAN" 
   (	"GUARDIAN_ID" NUMBER, 
	"NAME" VARCHAR2(100), 
	"PHONE_NUMBER" VARCHAR2(15), 
	"EMAIL" VARCHAR2(100), 
	"ADDRESS" VARCHAR2(255), 
	"RELATIONSHIP" VARCHAR2(50)
   ) ;
 

--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------

  CREATE TABLE "ROAA"."ROOM" 
   (	"ROOM_ID" NUMBER, 
	"ROOM_NUMBER" VARCHAR2(10), 
	"WING" VARCHAR2(50), 
	"FLOOR" NUMBER, 
	"CAPACITY" NUMBER, 
	"OCCUPANCY" NUMBER DEFAULT 0
   ) ;
  

--------------------------------------------------------
--  DDL for Table MEDICAL_RECORD
--------------------------------------------------------

  CREATE TABLE "ROAA"."MEDICAL_RECORD" 
   (	"RECORD_ID" NUMBER, 
	"CHILD_ID" NUMBER, 
	"RECORD_DATE" DATE, 
	"DIAGNOSIS" VARCHAR2(255), 
	"TREATMENT" VARCHAR2(255)
   ) ;

--------------------------------------------------------
--  DDL for Table DONOR_STAFF
--------------------------------------------------------

  CREATE TABLE "ROAA"."DONOR_STAFF" 
   (	"DONOR_ID" NUMBER, 
	"STAFF_ID" NUMBER, 
	"DONATION_DATE" DATE, 
	"DONATION_AMOUNT" NUMBER
   ) ;

CREATE TABLE "ROAA"."DONOR" (
  "DONOR_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "PHONE_NUMBER" VARCHAR2(15),
  "EMAIL" VARCHAR2(100)
);
-----------------------------------
ALTER TABLE
  "ROAA"."DONOR"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "ROAA"."DONOR"
ADD
  PRIMARY KEY ("DONOR_ID") ENABLE;
--------------------------------------------

ALTER TABLE
  "ROAA"."DONOR_STAFF"
MODIFY
  ("DONATION_DATE" NOT NULL ENABLE);

ALTER TABLE
  "ROAA"."DONOR_STAFF"
ADD
  CHECK (donation_amount > 0) ENABLE;

ALTER TABLE
  "ROAA"."DONOR_STAFF"
ADD
  PRIMARY KEY ("DONOR_ID", "STAFF_ID") ENABLE;

--------------------------------------------
  ALTER TABLE
  "ROAA"."DONOR_STAFF"
ADD
  FOREIGN KEY ("STAFF_ID") REFERENCES "ROAA"."STAFF" ("STAFF_ID") ON DELETE
SET
  NULL ENABLE;

ALTER TABLE
  "ROAA"."DONOR_STAFF"
ADD
  FOREIGN KEY ("DONOR_ID") REFERENCES "ROAA"."DONOR" ("DONOR_ID") ON DELETE
SET
  NULL ENABLE;

---------------------------------------------------
--   DATA FOR TABLE STAFF
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.STAFF
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (1,'Rania Samer','Doctor','rania1@gmail.com','+201245678922',to_timestamp('11-DEC-10 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (21,'Ali Gamal','Manager','ali.gamal@gmail.com','+201556789012',to_timestamp('01-JAN-22 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (22,'Mona Ibrahim','Nurse','mona.ibrahim@gmail.com','+201667890123',to_timestamp('15-MAR-21 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (23,'Hassan Farid','Teacher','hassan.farid@gmail.com','+201778901234',to_timestamp('20-SEP-20 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (24,'Salma Ezz','Cleaner','salma.ezz@gmail.com','+201889012345',to_timestamp('10-DEC-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ROAA.STAFF (STAFF_ID,NAME,POSITION,EMAIL,PHONE_NUMBER,HIRE_DATE) values (25,'Tarek Mostafa','Cook','tarek.mostafa@gmail.com','+201990123456',to_timestamp('25-JUL-21 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE STAFF
---------------------------------------------------


INSERT INTO "ROAA"."GUARDIAN" ("GUARDIAN_ID", "NAME", "PHONE_NUMBER", "EMAIL", "ADDRESS", "RELATIONSHIP") 
VALUES (21, 'Hassan Mohamed', '+201901234567', 'hassan.mohamed@gmail.com', 'Cairo, Egypt', 'Uncle');

INSERT INTO "ROAA"."GUARDIAN" ("GUARDIAN_ID", "NAME", "PHONE_NUMBER", "EMAIL", "ADDRESS", "RELATIONSHIP") 
VALUES (22, 'Aya Saeed', '+201912345678', 'aya.saeed@yahoo.com', 'Giza, Egypt', 'Aunt');

INSERT INTO "ROAA"."GUARDIAN" ("GUARDIAN_ID", "NAME", "PHONE_NUMBER", "EMAIL", "ADDRESS", "RELATIONSHIP") 
VALUES (23, 'Adel Farouk', '+201923456789', 'adel.farouk@hotmail.com', 'Alexandria, Egypt', 'Grandfather');

INSERT INTO "ROAA"."GUARDIAN" ("GUARDIAN_ID", "NAME", "PHONE_NUMBER", "EMAIL", "ADDRESS", "RELATIONSHIP") 
VALUES (24, 'Laila Yassin', '+201934567890', 'laila.yassin@gmail.com', 'Aswan, Egypt', 'Grandmother');

INSERT INTO "ROAA"."GUARDIAN" ("GUARDIAN_ID", "NAME", "PHONE_NUMBER", "EMAIL", "ADDRESS", "RELATIONSHIP") 
VALUES (25, 'Youssef Tamer', '+201945678901', 'youssef.tamer@gmail.com', 'Mansoura, Egypt', 'Brother');

---------------------------------------------------
--   DATA FOR TABLE ADOPTER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.ADOPTER
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (1,'ROAA Mohamed','+202345678921','ROAA@example.com','shebin elkowm','Pending');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (3,'Ahmed Othman','+201036512542','ahmed@gmail.com','Cairo','Pending');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (2,'Shahd Ahmed','+201212345678','shahd@gmail.com','Alex','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (4,'Mohamed Ragab','+201231402356','mohamed@gmail.com','Menofia','Pending');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (5,'Eman Deyab','+208123456134','eman@example.com','Sadat','Rejected');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (21,'Ahmed Hassan','+201001234567','ahmed.hassan@gmail.com','Cairo, Egypt','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (22,'Fatma Saeed','+201112345678','fatma.saeed@yahoo.com','Giza, Egypt','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (23,'Mohamed Adel','+201223456789','mohamed.adel@hotmail.com','Alexandria, Egypt','Rejected');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (24,'Sara Youssef','+201334567890','sara.youssef@gmail.com','Aswan, Egypt','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (25,'Khaled Ibrahim','+201445678901','khaled.ibrahim@gmail.com','Mansoura, Egypt','Pending');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (30,'Haneen Salem','+201145678913','haneen@eample.com','Cairo','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (31,'Sherif Ayman','+201065123875','sherif@exmple.com','Mansoura','Pending');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (265,'sasd','dasd','adsd','asdads','Accepted');
Insert into ROAA.ADOPTER (ADOPTER_ID,NAME,PHONE_NUMBER,EMAIL,ADDRESS,STATUS) values (94,'Nada Adel','+20123457689','nadaa@gmail.com','Mansoura','Accepted');

---------------------------------------------------
--   END DATA FOR TABLE ADOPTER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CHILD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.CHILD
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (1,'Samy Samir','M',to_timestamp('11-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('11-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,1,1);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (21,'Omar Ali','M',to_timestamp('10-JAN-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('15-JUN-20 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),21,21,21);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (4,'Shrouk Lotfy','F',to_timestamp('11-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('11-DEC-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,1,1);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (22,'Mariam Nabil','F',to_timestamp('20-FEB-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-SEP-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),22,22,22);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (23,'Youssef Ahmed','M',to_timestamp('15-MAR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('10-MAY-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),23,23,23);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (24,'Hana Khaled','F',to_timestamp('01-APR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('25-FEB-21 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),24,24,24);
Insert into ROAA.CHILD (CHILD_ID,NAME,GENDER,ADMISSION_DATE,BIRTH_DATE,STAFF_ID,ADOPTER_ID,ROOM_ID) values (25,'Amira Tarek','F',to_timestamp('18-MAY-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-NOV-20 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),25,25,25);

---------------------------------------------------
--   END DATA FOR TABLE CHILD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CHILD_GUARDIAN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.CHILD_GUARDIAN
Insert into ROAA.CHILD_GUARDIAN (CHILD_ID,GUARDIAN_ID) values (21,21);
Insert into ROAA.CHILD_GUARDIAN (CHILD_ID,GUARDIAN_ID) values (22,22);
Insert into ROAA.CHILD_GUARDIAN (CHILD_ID,GUARDIAN_ID) values (23,23);
Insert into ROAA.CHILD_GUARDIAN (CHILD_ID,GUARDIAN_ID) values (24,24);
Insert into ROAA.CHILD_GUARDIAN (CHILD_ID,GUARDIAN_ID) values (25,25);

---------------------------------------------------
--   END DATA FOR TABLE CHILD_GUARDIAN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DONOR_STAFF
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.DONOR_STAFF
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (1,1,to_timestamp('11-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),5000);
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (21,21,to_timestamp('10-JAN-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),500);
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (22,22,to_timestamp('18-FEB-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),300);
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (23,23,to_timestamp('22-MAR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),700);
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (24,24,to_timestamp('05-APR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),450);
Insert into ROAA.DONOR_STAFF (DONOR_ID,STAFF_ID,DONATION_DATE,DONATION_AMOUNT) values (25,25,to_timestamp('30-MAY-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),600);

---------------------------------------------------
--   END DATA FOR TABLE DONOR_STAFF
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.ROOM
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (1,'A102','East',2,3,2);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (3,'D405','South',2,5,2);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (22,'B201','West',2,4,2);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (21,'A101','East',1,5,3);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (23,'C301','North',3,6,5);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (24,'D401','South',4,3,1);
Insert into ROAA.ROOM (ROOM_ID,ROOM_NUMBER,WING,FLOOR,CAPACITY,OCCUPANCY) values (25,'E501','Central',5,8,7);

---------------------------------------------------
--   END DATA FOR TABLE ROOM
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MEDICAL_RECORD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.MEDICAL_RECORD
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (1,1,to_timestamp('17-DEC-24 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'headache','Panadol');
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (2,22,to_timestamp('25-FEB-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Cold and cough','Cough syrup and vitamin C');
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (3,23,to_timestamp('20-MAR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Stomach ache','Antacids and dietary changes');
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (4,24,to_timestamp('05-APR-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Rashes','Topical creams');
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (5,25,to_timestamp('25-MAY-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Headache','Pain relievers and rest');
Insert into ROAA.MEDICAL_RECORD (RECORD_ID,CHILD_ID,RECORD_DATE,DIAGNOSIS,TREATMENT) values (6,21,to_timestamp('15-JAN-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Mild fever','Rest and hydration');

---------------------------------------------------
--   END DATA FOR TABLE MEDICAL_RECORD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DONOR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROAA.DONOR
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (1,'Nada Mohamed','+201234567356','nada1@gmail.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (21,'Ali Ahmed','+201234567890','ali.ahmed@gmail.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (2,'Sameh Ahmed','+201226513552','sameh@gmail.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (22,'Mona Samy','+201345678901','mona.samy@yahoo.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (23,'Hassan Khaled','+201456789012','hassan.khaled@hotmail.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (24,'Layla Tarek','+201567890123','layla.tarek@gmail.com');
Insert into ROAA.DONOR (DONOR_ID,NAME,PHONE_NUMBER,EMAIL) values (25,'Tamer Farouk','+201678901234','tamer.farouk@yahoo.com');

---------------------------------------------------
--   END DATA FOR TABLE DONOR
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table ADOPTER
--------------------------------------------------------

  ALTER TABLE "ROAA"."ADOPTER" ADD CONSTRAINT "CHK_STATUS" CHECK (status IN ('Accepted', 'Rejected', 'Pending')) ENABLE;
 
  ALTER TABLE "ROAA"."ADOPTER" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."ADOPTER" ADD PRIMARY KEY ("ADOPTER_ID") ENABLE;
  

--------------------------------------------------------
--  Constraints for Table CHILD
--------------------------------------------------------

  ALTER TABLE "ROAA"."CHILD" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."CHILD" MODIFY ("ADMISSION_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."CHILD" MODIFY ("BIRTH_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."CHILD" ADD CHECK (gender IN ('M', 'F')) ENABLE;
 
  ALTER TABLE "ROAA"."CHILD" ADD PRIMARY KEY ("CHILD_ID") ENABLE;
 

--------------------------------------------------------
--  Constraints for Table STAFF
--------------------------------------------------------

  ALTER TABLE "ROAA"."STAFF" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."STAFF" MODIFY ("HIRE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."STAFF" ADD PRIMARY KEY ("STAFF_ID") ENABLE;
 

--------------------------------------------------------
--  Constraints for Table CHILD_GUARDIAN
--------------------------------------------------------

  ALTER TABLE "ROAA"."CHILD_GUARDIAN" ADD PRIMARY KEY ("CHILD_ID", "GUARDIAN_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table GUARDIAN
--------------------------------------------------------

  ALTER TABLE "ROAA"."GUARDIAN" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."GUARDIAN" ADD PRIMARY KEY ("GUARDIAN_ID") ENABLE;
  

--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "ROAA"."ROOM" ADD CONSTRAINT "CHECK_OCCUPANCY" CHECK (occupancy >= 0 AND occupancy <= capacity) ENABLE;
 
  ALTER TABLE "ROAA"."ROOM" MODIFY ("ROOM_NUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."ROOM" ADD CHECK (capacity > 0) ENABLE;
 
  ALTER TABLE "ROAA"."ROOM" ADD PRIMARY KEY ("ROOM_ID") ENABLE;
 

--------------------------------------------------------
--  Constraints for Table MEDICAL_RECORD
--------------------------------------------------------

  ALTER TABLE "ROAA"."MEDICAL_RECORD" MODIFY ("CHILD_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."MEDICAL_RECORD" MODIFY ("RECORD_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."MEDICAL_RECORD" ADD PRIMARY KEY ("RECORD_ID") ENABLE;
 

--------------------------------------------------------
--  Constraints for Table DONOR_STAFF
--------------------------------------------------------

  ALTER TABLE "ROAA"."DONOR_STAFF" MODIFY ("DONATION_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "ROAA"."DONOR_STAFF" ADD CHECK (donation_amount > 0) ENABLE;
 
  ALTER TABLE "ROAA"."DONOR_STAFF" ADD PRIMARY KEY ("DONOR_ID", "STAFF_ID") ENABLE;
 


 

--------------------------------------------------------
--  Ref Constraints for Table CHILD
--------------------------------------------------------

  ALTER TABLE "ROAA"."CHILD" ADD FOREIGN KEY ("STAFF_ID")
	  REFERENCES "ROAA"."STAFF" ("STAFF_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ROAA"."CHILD" ADD FOREIGN KEY ("ADOPTER_ID")
	  REFERENCES "ROAA"."ADOPTER" ("ADOPTER_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ROAA"."CHILD" ADD FOREIGN KEY ("ROOM_ID")
	  REFERENCES "ROAA"."ROOM" ("ROOM_ID") ON DELETE CASCADE ENABLE;
 

 

--------------------------------------------------------
--  Ref Constraints for Table CHILD_GUARDIAN
--------------------------------------------------------

  ALTER TABLE "ROAA"."CHILD_GUARDIAN" ADD FOREIGN KEY ("CHILD_ID")
	  REFERENCES "ROAA"."CHILD" ("CHILD_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ROAA"."CHILD_GUARDIAN" ADD FOREIGN KEY ("GUARDIAN_ID")
	  REFERENCES "ROAA"."GUARDIAN" ("GUARDIAN_ID") ON DELETE CASCADE ENABLE;

  
--------------------------------------------------------
--  Ref Constraints for Table MEDICAL_RECORD
--------------------------------------------------------

  ALTER TABLE "ROAA"."MEDICAL_RECORD" ADD FOREIGN KEY ("CHILD_ID")
	  REFERENCES "ROAA"."CHILD" ("CHILD_ID") ON DELETE CASCADE ENABLE;
 

--------------------------------------------------------
--  Ref Constraints for Table DONOR_STAFF
--------------------------------------------------------

  ALTER TABLE "ROAA"."DONOR_STAFF" ADD FOREIGN KEY ("STAFF_ID")
	  REFERENCES "ROAA"."STAFF" ("STAFF_ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ROAA"."DONOR_STAFF" ADD FOREIGN KEY ("DONOR_ID")
	  REFERENCES "ROAA"."DONOR" ("DONOR_ID") ON DELETE SET NULL ENABLE;


--------------------------------------------------------
--  DDL for View CHILD_GUARDIAN_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ROAA"."CHILD_GUARDIAN_DETAILS_VIEW" ("CHILD_ID", "CHILD_NAME", "GUARDIAN_ID", "GUARDIAN_NAME", "RELATIONSHIP", "PHONE_NUMBER", "EMAIL", "ADDRESS") AS 
  SELECT 
    c.child_id, 
    c.name AS child_name, 
    g.guardian_id,
    g.name AS guardian_name, 
    g.relationship, 
    g.phone_number,
    g.email,
    g.address
FROM 
    Child c
JOIN 
    Child_Guardian cg ON c.child_id = cg.child_id
JOIN 
    Guardian g ON cg.guardian_id = g.guardian_id
ORDER BY 
    c.child_id, g.relationship;
--------------------------------------------------------
--  DDL for View ADOPTER_CHILD_MEDICAL_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ROAA"."ADOPTER_CHILD_MEDICAL_VIEW" ("ADOPTER_ID", "ADOPTER_NAME", "CHILD_ID", "CHILD_NAME", "GENDER", "ADMISSION_DATE", "BIRTH_DATE", "RECORD_DATE", "DIAGNOSIS", "TREATMENT") AS 
  SELECT 
    a.adopter_id, 
    a.name AS adopter_name,
    c.child_id, 
    c.name AS child_name,
    c.gender,
    c.admission_date,
    c.birth_date,
    m.record_date,
    m.diagnosis,
    m.treatment
FROM 
    Adopter a
JOIN 
    Child c ON a.adopter_id = c.adopter_id
LEFT JOIN 
    Medical_Record m ON c.child_id = m.child_id
WHERE 
    m.record_date = (SELECT MAX(record_date) FROM Medical_Record WHERE child_id = c.child_id)
ORDER BY 
    a.adopter_id, c.child_id;
--------------------------------------------------------
--  DDL for View ADOPTER_STATUS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ROAA"."ADOPTER_STATUS_VIEW" ("ADOPTER_ID", "NAME", "STATUS") AS 
  SELECT adopter_id, name, status
FROM Adopter;
--------------------------------------------------------
--  DDL for View ROOM_OCCUPANCY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ROAA"."ROOM_OCCUPANCY_VIEW" ("ROOM_ID", "ROOM_NUMBER", "OCCUPANCY", "CAPACITY") AS 
  SELECT room_id, room_number, occupancy, capacity
FROM Room;


