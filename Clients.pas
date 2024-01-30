unit Clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ActnList, ToolWin, ComCtrls, ExtCtrls, StdCtrls,
  Grids, DBGrids, Menus;

type
  TfmClients = class(TForm)
    qClients: TIBDataSet;
    DsClients: TDataSource;
    ToolBar1: TToolBar;
    ActionList: TActionList;
    acAddClient: TAction;
    acEditClient: TAction;
    acDeleteClient: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    DBGrid1: TDBGrid;
    acRefresh: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    qClientsCLIENT_INN: TFloatField;
    qClientsID: TIntegerField;
    qClientsCLIENT_NAME: TIBStringField;
    qClientsCLIENT_BALANCE: TFloatField;
    pmClients: TPopupMenu;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    acBalance: TAction;
    procedure acRefreshExecute(Sender: TObject);
    procedure acAddClientExecute(Sender: TObject);
    procedure acEditClientExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure acDeleteClientExecute(Sender: TObject);
    procedure acBalanceExecute(Sender: TObject);
  private
    { Private declarations }
  public
    sprMode:boolean;
    { Public declarations }
  end;

var
  fmClients: TfmClients;

implementation

uses Main, EditClients, Balance;

{$R *.dfm}

procedure TfmClients.acAddClientExecute(Sender: TObject);
begin
 qClients.Insert;
 qClientsCLIENT_BALANCE.AsFloat:=0;
 fmEditClients:=TfmEditClients.Create(self);

     if fmEditClients.ShowModal=mrOk then
      begin
       if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
       try
         qClients.Post;
       except
         qClients.Cancel;
       end;
        qClients.Refresh;
       fmMain.IBTransaction.CommitRetaining;
      end
       else qClients.Cancel;

end;

procedure TfmClients.acBalanceExecute(Sender: TObject);
begin
 fmBalance:=TfmBalance.Create(self);
 fmBalance.qBalance.ParamByName('ID_CLIENT').AsInteger:=qClientsID.AsInteger;
 fmBalance.eClient.Text:=qClientsCLIENT_NAME.AsString;
 fmBalance.ShowModal;
 fmBalance.Free;
end;

procedure TfmClients.acDeleteClientExecute(Sender: TObject);
begin
  if MessageDlg('Удалить выделенного клиента?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
    if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
     qClients.Delete;
    fmMain.IBTransaction.CommitRetaining;
  end;
end;

procedure TfmClients.acEditClientExecute(Sender: TObject);
begin
 qClients.Edit;
 fmEditClients:=TfmEditClients.Create(self);
 if fmEditClients.ShowModal=mrOk then
  begin
   if not fmMain.IBTransaction.InTransaction then fmMain.IBTransaction.StartTransaction;
    qClients.Post;
    qClients.Refresh;
   fmMain.IBTransaction.CommitRetaining;
  end
   else qClients.Cancel;
end;

procedure TfmClients.acRefreshExecute(Sender: TObject);
begin
 qClients.Close;
 qClients.Open;
end;

procedure TfmClients.DBGrid1DblClick(Sender: TObject);
begin
 if sprMode then
    ModalResult:=mrOk
  else acEditClient.Execute;

end;

procedure TfmClients.FormCreate(Sender: TObject);
begin
 qClients.Open;
 sprMode:=false;
end;

end.
