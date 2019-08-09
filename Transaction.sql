--------------------------------------------------------
--  File created - Friday-August-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRANSACTION
--------------------------------------------------------

  CREATE TABLE "HR"."TRANSACTION" 
   (	"TID" NUMBER(20,0), 
	"TDATE" DATE, 
	"PID" NUMBER(20,0), 
	"CARDID" NUMBER(20,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.TRANSACTION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index TRANSACTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TRANSACTION_PK" ON "HR"."TRANSACTION" ("TID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "HR"."TRANSACTION" MODIFY ("TID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."TRANSACTION" ADD CONSTRAINT "TRANSACTION_PK" PRIMARY KEY ("TID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "HR"."TRANSACTION" ADD CONSTRAINT "TRANSACTION_FK" FOREIGN KEY ("PID")
	  REFERENCES "HR"."PRODUCT" ("PID") ENABLE;
 
  ALTER TABLE "HR"."TRANSACTION" ADD CONSTRAINT "TRANSACTION_FK1" FOREIGN KEY ("CARDID")
	  REFERENCES "HR"."CARD" ("CID") ENABLE;
