--------------------------------------------------------
--  File created - Friday-August-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMI
--------------------------------------------------------

  CREATE TABLE "HR"."EMI" 
   (	"EMIID" NUMBER(20,0), 
	"INSTALLMENTAMT" NUMBER(20,0), 
	"DUEDATE" DATE, 
	"PAYMENTDATE" DATE, 
	"PAYMENTID" NUMBER(20,0), 
	"TID" NUMBER(20,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.EMI
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index EMI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMI_PK" ON "HR"."EMI" ("EMIID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table EMI
--------------------------------------------------------

  ALTER TABLE "HR"."EMI" ADD CONSTRAINT "EMI_PK" PRIMARY KEY ("EMIID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMI" MODIFY ("EMIID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table EMI
--------------------------------------------------------

  ALTER TABLE "HR"."EMI" ADD CONSTRAINT "EMI_FK" FOREIGN KEY ("TID")
	  REFERENCES "HR"."TRANSACTION" ("TID") ENABLE;
 
  ALTER TABLE "HR"."EMI" ADD CONSTRAINT "EMI_FK1" FOREIGN KEY ("PAYMENTID")
	  REFERENCES "HR"."PAYMENT" ("PAYMENTIID") ENABLE;
