program PGAdt;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form64};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm64, Form64);
  Application.Run;
end.
