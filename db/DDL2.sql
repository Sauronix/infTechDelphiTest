/***********************************/
/*              Triggers           */
/***********************************/

CREATE TRIGGER TR_CLIENTS_BI FOR T_CLIENTS
ACTIVE BEFORE INSERT POSITION 0
AS

begin
     if (NEW.ID is null) then NEW.ID = GEN_ID(GE_CLIENTS, 1);

end
 ^ 

CREATE TRIGGER TR_OPERATIONS_AD FOR T_OPERATIONS
ACTIVE AFTER DELETE POSITION 0
AS

begin
 UPDATE T_CLIENTS SET CLIENT_BALANCE=CLIENT_BALANCE-OLD.SUM_OPER
 where ID=OLD.ID_CLIENT;

end
 ^ 

CREATE TRIGGER TR_OPERATIONS_AI FOR T_OPERATIONS
ACTIVE AFTER INSERT POSITION 0
AS

begin
UPDATE T_CLIENTS C SET C.CLIENT_BALANCE=C.CLIENT_BALANCE+NEW.SUM_OPER WHERE C.ID=NEW.ID_CLIENT;

end
 ^ 

CREATE TRIGGER TR_OPERATIONS_AU FOR T_OPERATIONS
ACTIVE AFTER UPDATE POSITION 0
AS

begin
UPDATE T_CLIENTS SET CLIENT_BALANCE=CLIENT_BALANCE-OLD.SUM_OPER
WHERE ID=OLD.ID_CLIENT;

UPDATE T_CLIENTS SET CLIENT_BALANCE=CLIENT_BALANCE+NEW.SUM_OPER
WHERE ID=NEW.ID_CLIENT;

end
 ^ 

CREATE TRIGGER TR_OPERATIONS_BI FOR T_OPERATIONS
ACTIVE BEFORE INSERT POSITION 0
AS

begin
 if (NEW.ID is null) then NEW.ID = GEN_ID(GE_OPERATIONS, 1);

end
 ^ 

COMMIT WORK^