unit Clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet;

type
  TfmClients = class(TForm)
    qClients: TIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClients: TfmClients;

implementation

{$R *.dfm}

end.
