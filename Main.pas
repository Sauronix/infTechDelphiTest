unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, DB, IBCustomDataSet, IBDatabase, ActnList, iniFiles,
  ImgList, IBScript, StdCtrls;

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
    qOpers: TIBDataSet;
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
    procedure acCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acShowClientsExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini:TIniFile;
  end;

var
  fmMain: TfmMain;

implementation

uses Clients;

{$R *.dfm}

procedure TfmMain.acCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TfmMain.acShowClientsExecute(Sender: TObject);
begin
 fmClients:=TfmClients.Create(self);
 fmClients.ShowModal;
 fmClients.Free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
 var IBScript:TIBScript;
 dbName:string;
 CreateDBScript:TStrings;
begin
 ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\infTech.ini');
 IBDatabase.Params.Clear;

 //��� �������� ����������� � �� �����������.
 // � ����� ��� ������ ����� ������� � ������������� ���� � ini, ���� ������ ��� ����������� �� ������������.
  IBDatabase.Params.Add('user_name=SYSDBA');
  IBDatabase.Params.Add('password=masterkey');
  IBDatabase.Params.Add('lc_ctype=WIN1251');

 dbName:=ini.ReadString('MAIN','DB',ExtractFilePath(Application.ExeName)+'\db\inftechtest.gdb');
  if not FileExists(dbName) then
   begin
     IBScript:=TIBScript.Create(self);
     IBScript.Terminator:='^';
     CreateDBScript:= TStrings.Create;
     CreateDBScript.LoadFromFile(ExtractFilePath(Application.ExeName)+'\db\DBScript');

      IBScript.Script.Clear;
      IBScript.Script.Add('SET NAMES WIN1251^ CREATE DATABASE "'+dbName+'"  PAGE_SIZE 4096  DEFAULT CHARACTER SET WIN1251^');//������ ����� ����� IBDatabase.CreateDatabase;
      IBScript.Script.AddStrings(CreateDBScript);
     //IBScript.Script.
   // IBScript.Script.LoadFromFile();
     IBScript.ExecuteScript;
     IBScript.Free;
   end;
 IBDatabase.DatabaseName:=dbName;
 IBDatabase.Open;

end;

end.
