unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, DB, IBCustomDataSet, IBDatabase, ActnList, iniFiles,
  ImgList, IBScript, StdCtrls, Grids, DBGrids;

type
  TfmMain = class(TForm)
    MainMenu: TMainMenu;
    pmOperations: TPopupMenu;
    ToolBar1: TToolBar;
    N1: TMenuItem;
    N2: TMenuItem;
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    ActionList: TActionList;
    ImageListNormal: TImageList;
    ImageListHot: TImageList;
    IBScript2: TIBScript;
    acClose: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    acClose1: TMenuItem;
    acAddOper: TAction;
    acDeleteOper: TAction;
    acEditOper: TAction;
    acShowClients: TAction;
    qBalance: TIBDataSet;
    acShowClients1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    dsOpers: TDataSource;
    DBGrid1: TDBGrid;
    acRefresh: TAction;
    qOpers: TIBDataSet;
    qOpersID: TIntegerField;
    qOpersDATE_OPER: TDateTimeField;
    qOpersSUM_OPER: TFloatField;
    qOpersID_CLIENT: TIntegerField;
    qOpersCLIENT_INN: TFloatField;
    qOpersCLIENT_NAME: TIBStringField;
    procedure acCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acShowClientsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acAddOperExecute(Sender: TObject);
    procedure acEditOperExecute(Sender: TObject);
    procedure acDeleteOperExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function CheckBalance(clientId:integer; Sum:double; date:TDateTime):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    ini:TIniFile;
  end;

var
  fmMain: TfmMain;

implementation

uses Clients, EditOper;

{$R *.dfm}

procedure TfmMain.acAddOperExecute(Sender: TObject);
begin
 qOpers.Insert;
 fmEditOper:=TfmEditOper.Create(self);
 if fmEditOper.ShowModal=mrOk then
  begin
    try
     if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
     qOpers.Post;
     fmMain.IBTransaction.CommitRetaining;
     qOpers.Refresh;

    except
     qOpers.Cancel;
    end;
  end;

end;

procedure TfmMain.acCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TfmMain.acDeleteOperExecute(Sender: TObject);
begin
 if MessageDlg('Удалить выделенную операцию?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
   if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
   qOpers.Delete;
   fmMain.IBTransaction.CommitRetaining;
  end;
end;

procedure TfmMain.acEditOperExecute(Sender: TObject);
begin
 qOpers.Edit;

 fmEditOper:=TfmEditOper.Create(self);
 fmEditOper.eClient.Text:=qOpersCLIENT_NAME.AsString;
 fmEditOper.dtDateOper.DateTime:=qOpersDATE_OPER.AsDateTime;
 if fmEditOper.ShowModal=mrOk then
  begin
    try
     if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
      qOpers.Post;
      fmMain.IBTransaction.CommitRetaining;
      qOpers.Refresh;
    except
     qOpers.Cancel;
    end;
  end;


end;

procedure TfmMain.acRefreshExecute(Sender: TObject);
begin
 qOpers.Close;
 qOpers.Open;
end;

procedure TfmMain.acShowClientsExecute(Sender: TObject);
begin
 fmClients:=TfmClients.Create(self);
 fmClients.ShowModal;
 fmClients.Free;
end;

function TfmMain.CheckBalance(clientId: integer; Sum: double;
  date: TDateTime): boolean;
begin
//
    if qBalance.Active then qBalance.Close;
//    qBalance.p
 begin

 end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ini.WriteString('MAIN','DB',IBDatabase.DatabaseName);
end;

procedure TfmMain.FormCreate(Sender: TObject);
 var IBScript:TIBScript;
 dbName:string;
 CreateDBScript:TStrings;
begin
 ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\infTech.ini');
 IBDatabase.Params.Clear;

 //Для скорости авторизацию к БД захардкодил.
 // В проде эти данные нужно хранить в защифрованном виде в ini, либо каждый раз запрашивать от пользователя.
  IBDatabase.Params.Add('user_name=SYSDBA');
  IBDatabase.Params.Add('password=masterkey');
  IBDatabase.Params.Add('lc_ctype=WIN1251');

 dbName:=ini.ReadString('MAIN','DB',ExtractFilePath(Application.ExeName)+'\db\inftechtest.gdb');
  if not FileExists(dbName) then

   begin
    if MessageDlg('База данных не найдена, создать новую БД?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
     begin
       IBScript:=TIBScript.Create(self);
       IBScript.Terminator:='^';
       CreateDBScript:= TStrings.Create;
       CreateDBScript.LoadFromFile(ExtractFilePath(Application.ExeName)+'\db\DBScript.sql');

       IBScript.Script.Clear;
       IBScript.Script.Add('SET NAMES WIN1251^ CREATE DATABASE "'+dbName+'"  PAGE_SIZE 4096  DEFAULT CHARACTER SET WIN1251^');//Вместо этого можно IBDatabase.CreateDatabase;
       IBScript.Script.AddStrings(CreateDBScript);
       CreateDBScript.Free;
        try
         IBScript.ExecuteScript;
        Except
         on E:Exception do
          ShowMessage('Не удалось создать БД:'+E.Message);
        end;

         IBScript.Free;
     end
      else close;

   end;
 IBDatabase.DatabaseName:=dbName;
 try
  IBDatabase.Open;
 except

   on E:Exception do
    begin
     ShowMessage('Невозможно подключиться к БД:'+E.Message);
     Application.Terminate;
    end;
 end;
 qOpers.Open;

 end;

end.
