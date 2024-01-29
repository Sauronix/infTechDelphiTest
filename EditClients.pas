unit EditClients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TfmEditClients = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    dbeINN: TDBEdit;
    dbeName: TDBEdit;
    lblInn: TLabel;
    lblName: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditClients: TfmEditClients;

implementation

uses Clients;

{$R *.dfm}

end.
