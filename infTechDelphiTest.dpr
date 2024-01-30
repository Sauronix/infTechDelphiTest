program infTechDelphiTest;

uses
  Forms,
  Main in 'Main.pas' {fmMain},
  Clients in 'Clients.pas' {fmClients},
  EditOper in 'EditOper.pas' {fmEditOper},
  EditClients in 'EditClients.pas' {fmEditClients},
  Balance in 'Balance.pas' {fmBalance};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
