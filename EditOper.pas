unit EditOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls;

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
    procedure dtDateOperChange(Sender: TObject);
  private
    { Private declarations }
  public
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

procedure TfmEditOper.dtDateOperChange(Sender: TObject);
begin
 fmMain.qOpersDATE_OPER.AsDateTime:=dtDateOper.DateTime;
end;

end.
