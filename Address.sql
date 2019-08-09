--------------------------------------------------------
--  File created - Friday-August-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADDRESS
--------------------------------------------------------

  CREATE TABLE "HR"."ADDRESS" 
   (	"ADDID" NUMBER(10,0), 
	"LOCALITY" VARCHAR2(20 BYTE), 
	"CITY" VARCHAR2(20 BYTE), 
	"PINCODE" NUMBER(6,0), 
	"STATE" VARCHAR2(20 BYTE), 
	"COUNTRY" VARCHAR2(20 BYTE), 
	"USERID" NUMBER(20,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.ADDRESS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ADDRESS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."ADDRESS_PK" ON "HR"."ADDRESS" ("ADDID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ADDRESS
--------------------------------------------------------

  ALTER TABLE "HR"."ADDRESS" ADD CONSTRAINT "ADDRESS_PK" PRIMARY KEY ("ADDID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."ADDRESS" MODIFY ("ADDID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ADDRESS
--------------------------------------------------------

  ALTER TABLE "HR"."ADDRESS" ADD CONSTRAINT "ADDRESS_FK" FOREIGN KEY ("USERID")
	  REFERENCES "HR"."USERINFO" ("USERID") ENABLE;
