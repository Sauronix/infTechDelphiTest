unit Clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ActnList, ToolWin, ComCtrls, ExtCtrls, StdCtrls,
  Grids, DBGrids;

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
    procedure acRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClients: TfmClients;

implementation

uses Main;

{$R *.dfm}

procedure TfmClients.acRefreshExecute(Sender: TObject);
begin
 qClients.Refresh;
end;

end.
