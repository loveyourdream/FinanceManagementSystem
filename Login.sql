--------------------------------------------------------
--  File created - Friday-August-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LOGIN
--------------------------------------------------------

  CREATE TABLE "HR"."LOGIN" 
   (	"USERNAME" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"USERID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.LOGIN
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index LOGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LOGIN_PK" ON "HR"."LOGIN" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table LOGIN
--------------------------------------------------------

  ALTER TABLE "HR"."LOGIN" ADD CONSTRAINT "LOGIN_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."LOGIN" MODIFY ("USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."LOGIN" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."LOGIN" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table LOGIN
--------------------------------------------------------

  ALTER TABLE "HR"."LOGIN" ADD CONSTRAINT "LOGIN_FK" FOREIGN KEY ("USERID")
	  REFERENCES "HR"."USERINFO" ("USERID") ENABLE;
