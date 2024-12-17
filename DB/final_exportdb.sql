--------------------------------------------------------
--  File created - Saturday-December-14-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ADOPTER_SEQ
--------------------------------------------------------
CREATE SEQUENCE "SYS"."ADOPTER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE NOORDER NOCYCLE;

--------------------------------------------------------
--  DDL for Table ADOPTER
--------------------------------------------------------
CREATE TABLE "SYS"."ADOPTER" (
  "ADOPTER_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "PHONE_NUMBER" VARCHAR2(15),
  "EMAIL" VARCHAR2(100),
  "ADDRESS" VARCHAR2(255),
  "STATUS" VARCHAR2(10)
);

--------------------------------------------------------
--  DDL for Table CHILD
--------------------------------------------------------
CREATE TABLE "SYS"."CHILD" (
  "CHILD_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "GENDER" CHAR(1),
  "ADMISSION_DATE" DATE,
  "BIRTH_DATE" DATE,
  "STAFF_ID" NUMBER,
  "ADOPTER_ID" NUMBER,
  "ROOM_ID" NUMBER
);

--------------------------------------------------------
--  DDL for Table STAFF
--------------------------------------------------------
CREATE TABLE "SYS"."STAFF" (
  "STAFF_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "POSITION" VARCHAR2(50),
  "EMAIL" VARCHAR2(100),
  "PHONE_NUMBER" VARCHAR2(15),
  "HIRE_DATE" DATE
);

--------------------------------------------------------
--  DDL for Table CHILD_GUARDIAN
--------------------------------------------------------
CREATE TABLE "SYS"."CHILD_GUARDIAN" (
  "CHILD_ID" NUMBER(*, 0),
  "GUARDIAN_ID" NUMBER(*, 0)
);

--------------------------------------------------------
--  DDL for Table DONOR
--------------------------------------------------------
CREATE TABLE "SYS"."DONOR" (
  "DONOR_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "PHONE_NUMBER" VARCHAR2(15),
  "EMAIL" VARCHAR2(100)
);

--------------------------------------------------------
--  DDL for Table GUARDIAN
--------------------------------------------------------
CREATE TABLE "SYS"."GUARDIAN" (
  "GUARDIAN_ID" NUMBER,
  "NAME" VARCHAR2(100),
  "PHONE_NUMBER" VARCHAR2(15),
  "EMAIL" VARCHAR2(100),
  "ADDRESS" VARCHAR2(255),
  "RELATIONSHIP" VARCHAR2(50)
);

--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------
CREATE TABLE "SYS"."ROOM" (
  "ROOM_ID" NUMBER,
  "ROOM_NUMBER" VARCHAR2(10),
  "WING" VARCHAR2(50),
  "FLOOR" NUMBER,
  "CAPACITY" NUMBER,
  "OCCUPANCY" NUMBER DEFAULT 0
);

--------------------------------------------------------
--  DDL for Table MEDICAL_RECORD
--------------------------------------------------------
CREATE TABLE "SYS"."MEDICAL_RECORD" (
  "RECORD_ID" NUMBER,
  "CHILD_ID" NUMBER,
  "RECORD_DATE" DATE,
  "DIAGNOSIS" VARCHAR2(255),
  "TREATMENT" VARCHAR2(255)
);

--------------------------------------------------------
--  DDL for Table DONOR_STAFF
--------------------------------------------------------
CREATE TABLE "SYS"."DONOR_STAFF" (
  "DONOR_ID" NUMBER,
  "STAFF_ID" NUMBER,
  "DONATION_DATE" DATE,
  "DONATION_AMOUNT" NUMBER
);

--------------------------------------------------------
--  Constraints for Table ADOPTER
--------------------------------------------------------
ALTER TABLE
  "SYS"."ADOPTER"
ADD
  CONSTRAINT "CHK_STATUS" CHECK (status IN ('Accepted', 'Rejected', 'Pending')) ENABLE;

ALTER TABLE
  "SYS"."ADOPTER"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."ADOPTER"
ADD
  PRIMARY KEY ("ADOPTER_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table CHILD
--------------------------------------------------------
ALTER TABLE
  "SYS"."CHILD"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."CHILD"
MODIFY
  ("ADMISSION_DATE" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."CHILD"
MODIFY
  ("BIRTH_DATE" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."CHILD"
ADD
  CHECK (gender IN ('M', 'F')) ENABLE;

ALTER TABLE
  "SYS"."CHILD"
ADD
  PRIMARY KEY ("CHILD_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table STAFF
--------------------------------------------------------
ALTER TABLE
  "SYS"."STAFF"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."STAFF"
MODIFY
  ("HIRE_DATE" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."STAFF"
ADD
  PRIMARY KEY ("STAFF_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table CHILD_GUARDIAN
--------------------------------------------------------
ALTER TABLE
  "SYS"."CHILD_GUARDIAN"
ADD
  PRIMARY KEY ("CHILD_ID", "GUARDIAN_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table DONOR
--------------------------------------------------------
ALTER TABLE
  "SYS"."DONOR"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."DONOR"
ADD
  PRIMARY KEY ("DONOR_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table GUARDIAN
--------------------------------------------------------
ALTER TABLE
  "SYS"."GUARDIAN"
MODIFY
  ("NAME" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."GUARDIAN"
ADD
  PRIMARY KEY ("GUARDIAN_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------
ALTER TABLE
  "SYS"."ROOM"
ADD
  CONSTRAINT "CHECK_OCCUPANCY" CHECK (
    occupancy >= 0
    AND occupancy <= capacity
  ) ENABLE;

ALTER TABLE
  "SYS"."ROOM"
MODIFY
  ("ROOM_NUMBER" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."ROOM"
ADD
  CHECK (capacity > 0) ENABLE;

ALTER TABLE
  "SYS"."ROOM"
ADD
  PRIMARY KEY ("ROOM_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table MEDICAL_RECORD
--------------------------------------------------------
ALTER TABLE
  "SYS"."MEDICAL_RECORD"
MODIFY
  ("CHILD_ID" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."MEDICAL_RECORD"
MODIFY
  ("RECORD_DATE" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."MEDICAL_RECORD"
ADD
  PRIMARY KEY ("RECORD_ID") ENABLE;

--------------------------------------------------------
--  Constraints for Table DONOR_STAFF
--------------------------------------------------------
ALTER TABLE
  "SYS"."DONOR_STAFF"
MODIFY
  ("DONATION_DATE" NOT NULL ENABLE);

ALTER TABLE
  "SYS"."DONOR_STAFF"
ADD
  CHECK (donation_amount > 0) ENABLE;

ALTER TABLE
  "SYS"."DONOR_STAFF"
ADD
  PRIMARY KEY ("DONOR_ID", "STAFF_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table CHILD
--------------------------------------------------------
ALTER TABLE
  "SYS"."CHILD"
ADD
  FOREIGN KEY ("STAFF_ID") REFERENCES "SYS"."STAFF" ("STAFF_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE
  "SYS"."CHILD"
ADD
  FOREIGN KEY ("ADOPTER_ID") REFERENCES "SYS"."ADOPTER" ("ADOPTER_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE
  "SYS"."CHILD"
ADD
  FOREIGN KEY ("ROOM_ID") REFERENCES "SYS"."ROOM" ("ROOM_ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table CHILD_GUARDIAN
--------------------------------------------------------
ALTER TABLE
  "SYS"."CHILD_GUARDIAN"
ADD
  FOREIGN KEY ("CHILD_ID") REFERENCES "SYS"."CHILD" ("CHILD_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE
  "SYS"."CHILD_GUARDIAN"
ADD
  FOREIGN KEY ("GUARDIAN_ID") REFERENCES "SYS"."GUARDIAN" ("GUARDIAN_ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table MEDICAL_RECORD
--------------------------------------------------------
ALTER TABLE
  "SYS"."MEDICAL_RECORD"
ADD
  FOREIGN KEY ("CHILD_ID") REFERENCES "SYS"."CHILD" ("CHILD_ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table DONOR_STAFF
--------------------------------------------------------
ALTER TABLE
  "SYS"."DONOR_STAFF"
ADD
  FOREIGN KEY ("STAFF_ID") REFERENCES "SYS"."STAFF" ("STAFF_ID") ON DELETE
SET
  NULL ENABLE;

ALTER TABLE
  "SYS"."DONOR_STAFF"
ADD
  FOREIGN KEY ("DONOR_ID") REFERENCES "SYS"."DONOR" ("DONOR_ID") ON DELETE
SET
  NULL ENABLE;

--------------------------------------------------------
--  DDL for View CHILD_GUARDIAN_DETAILS_VIEW
--------------------------------------------------------
CREATE
OR REPLACE VIEW "SYS"."CHILD_GUARDIAN_DETAILS_VIEW" (
  "CHILD_ID",
  "CHILD_NAME",
  "GUARDIAN_ID",
  "GUARDIAN_NAME",
  "RELATIONSHIP",
  "PHONE_NUMBER",
  "EMAIL",
  "ADDRESS"
) AS
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
  JOIN Child_Guardian cg ON c.child_id = cg.child_id
  JOIN Guardian g ON cg.guardian_id = g.guardian_id
ORDER BY
  c.child_id,
  g.relationship;

--------------------------------------------------------
--  DDL for View ADOPTER_CHILD_MEDICAL_VIEW
--------------------------------------------------------
CREATE
OR REPLACE VIEW "SYS"."ADOPTER_CHILD_MEDICAL_VIEW" (
  "ADOPTER_ID",
  "ADOPTER_NAME",
  "CHILD_ID",
  "CHILD_NAME",
  "GENDER",
  "ADMISSION_DATE",
  "BIRTH_DATE",
  "RECORD_DATE",
  "DIAGNOSIS",
  "TREATMENT"
) AS
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
  JOIN Child c ON a.adopter_id = c.adopter_id
  LEFT JOIN Medical_Record m ON c.child_id = m.child_id
WHERE
  m.record_date = (
    SELECT
      MAX(record_date)
    FROM
      Medical_Record
    WHERE
      child_id = c.child_id
  )
ORDER BY
  a.adopter_id,
  c.child_id;

--------------------------------------------------------
--  DDL for View ADOPTER_STATUS_VIEW
--------------------------------------------------------
CREATE
OR REPLACE VIEW "SYS"."ADOPTER_STATUS_VIEW" ("ADOPTER_ID", "NAME", "STATUS") AS
SELECT
  adopter_id,
  name,
  status
FROM
  Adopter;
--------------------------------------------------------
--  DDL for View ROOM_OCCUPANCY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SYS"."ROOM_OCCUPANCY_VIEW" ("ROOM_ID", "ROOM_NUMBER", "OCCUPANCY", "CAPACITY") AS 
  SELECT room_id, room_number, occupancy, capacity
FROM Room;