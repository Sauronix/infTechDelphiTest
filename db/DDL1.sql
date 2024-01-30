/***********************************/
/*              Tables             */
/***********************************/

/* Table: T_CLIENTS  */
CREATE TABLE T_CLIENTS (
       ID INTEGER NOT NULL,
       CLIENT_NAME VARCHAR(250) CHARACTER SET WIN1251,
       CLIENT_BALANCE NUMERIC(15,2) DEFAULT 0 NOT NULL,
       CLIENT_INN NUMERIC(15,2) NOT NULL,
      CONSTRAINT T_CLIENTS_PK PRIMARY KEY (ID)
)^


/* Table: T_OPERATIONS  */
CREATE TABLE T_OPERATIONS (
       ID INTEGER NOT NULL,
       ID_CLIENT INTEGER NOT NULL,
       SUM_OPER NUMERIC(15,2) NOT NULL,
       DATE_OPER DATE NOT NULL,
      CONSTRAINT T_OPERATIONS_PK PRIMARY KEY (ID)
)^

/*---------------------------*/
/*  Foreign Key Definitions  */
/*---------------------------*/
ALTER TABLE T_OPERATIONS ADD CONSTRAINT FK_OPERATIONS_CLIENTS FOREIGN KEY (ID_CLIENT) REFERENCES T_CLIENTS(ID)^

/*  Check Constraints  */
/***********************************/
/*             Generators          */
/***********************************/

CREATE GENERATOR GE_CLIENTS^
CREATE GENERATOR GE_OPERATIONS^

SET GENERATOR GE_CLIENTS TO 0^
SET GENERATOR GE_OPERATIONS TO 0^

COMMIT WORK^