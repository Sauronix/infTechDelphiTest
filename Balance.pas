unit Balance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, Grids, DBGrids, IBCustomDataSet, ComCtrls;

type
  TfmBalance = class(TForm)
    Panel1: TPanel;
    eClient: TEdit;
    btnChooseClient: TButton;
    lblClient: TLabel;
    lblClent: TLabel;
    dtOper: TDateTimePicker;
    btnBalance: TButton;
    qBalance: TIBDataSet;
    DBGrid1: TDBGrid;
    dsBalance: TDataSource;
    qBalanceDESCR: TIBStringField;
    qBalanceDATE_OPER: TDateTimeField;
    qBalancePRIHOD: TFloatField;
    qBalanceRASHOD: TFloatField;
    qBalanceBALANCE: TFloatField;
    procedure btnBalanceClick(Sender: TObject);
    procedure btnChooseClientClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBalance: TfmBalance;

implementation

uses Main, Clients;

{$R *.dfm}

procedure TfmBalance.btnBalanceClick(Sender: TObject);
begin
 if qBalance.Active then qBalance.Close;
  qBalance.ParamByName('DT_OPER').AsDateTime:=dtOper.DateTime;
   if qBalance.ParamByName('ID_CLIENT').AsInteger>0 then
     qBalance.Open
      else ShowMessage('Выберите клиента из справочника');

end;

procedure TfmBalance.btnChooseClientClick(Sender: TObject);
begin
 fmClients:=TfmClients.Create(self);
 fmClients.sprMode:=true;
 fmClients.pnButtons.Visible:=true;
 if fmClients.ShowModal=mrOk then
  begin
   qBalance.ParamByName('ID_CLIENT').AsInteger:=fmClients.qClientsID.AsInteger;
   eClient.Text:=fmClients.qClientsCLIENT_NAME.AsString;
  end;
end;

end.
