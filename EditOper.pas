unit EditOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, DateUtils;

type
  TfmEditOper = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    dtDateOper: TDateTimePicker;
    dbeSUMM: TDBEdit;
    eClient: TEdit;
    btnChooseClient: TButton;
    lblClient: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnChooseClientClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtDateOperChange(Sender: TObject);
  private
    { Private declarations }
  public
    OldSum:Double;
    { Public declarations }
  end;

var
  fmEditOper: TfmEditOper;

implementation

uses Main, Clients;

{$R *.dfm}

procedure TfmEditOper.btnChooseClientClick(Sender: TObject);
begin
 fmClients:=TfmClients.Create(self);
 fmClients.sprMode:=true;
 fmClients.pnButtons.Visible:=true;
 if fmClients.ShowModal=mrOk then
  begin
   fmMain.qOpersID_CLIENT.AsInteger:=fmClients.qClientsID.AsInteger;
   eClient.Text:=fmClients.qClientsCLIENT_NAME.AsString;
  end;
end;

procedure TfmEditOper.btnOkClick(Sender: TObject);
 var SumOper:Double;
begin
 if fmMain.qOpersID_CLIENT.AsInteger>0 then
  begin
   if (fmMain.GetBalance(fmMain.qOpersID_CLIENT.AsInteger, dtDateOper.DateTime)-OldSum+fmMain.qOpersSUM_OPER.AsFloat)<0 then
    ShowMessage('Недостаточно средств на дату операции ')
     else if (fmMain.GetBalance(fmMain.qOpersID_CLIENT.AsInteger, Date())-OldSum+fmMain.qOpersSUM_OPER.AsFloat)<0 then
    ShowMessage('Недостаточно средств на текущую дату')
   else ModalResult:=mrOk;
  end else ShowMessage('Выберите клиента для проведения операции');

end;

procedure TfmEditOper.dtDateOperChange(Sender: TObject);
begin
   fmMain.qOpersDATE_OPER.AsDateTime:=dtDateOper.DateTime;
end;

procedure TfmEditOper.FormCreate(Sender: TObject);
begin
 OldSum:=0;
 dtDateOper.MaxDate:=Date();
end;

end.
