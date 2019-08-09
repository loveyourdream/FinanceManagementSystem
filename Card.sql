--------------------------------------------------------
--  File created - Friday-August-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CARD
--------------------------------------------------------

  CREATE TABLE "HR"."CARD" 
   (	"CID" NUMBER, 
	"LIMIT" NUMBER(20,0), 
	"VALIDITY" DATE, 
	"CARDNO" NUMBER(20,0), 
	"JOININGFEE" VARCHAR2(20 BYTE), 
	"CARDTYPE" VARCHAR2(20 BYTE), 
	"ACTIVATE" NUMBER(20,0), 
	"USERID" NUMBER(20,0), 
	"JSTATUS" NUMBER(1,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.CARD
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."CARD_PK" ON "HR"."CARD" ("CID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CARD
--------------------------------------------------------

  ALTER TABLE "HR"."CARD" ADD CONSTRAINT "CARD_PK" PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."CARD" MODIFY ("CID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CARD
--------------------------------------------------------

  ALTER TABLE "HR"."CARD" ADD CONSTRAINT "CARD_FK" FOREIGN KEY ("USERID")
	  REFERENCES "HR"."USERINFO" ("USERID") ENABLE;
