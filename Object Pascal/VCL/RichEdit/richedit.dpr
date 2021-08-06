program richeditdemo;

uses
  Forms,
  reabout in 'reabout.pas' {AboutBox},
  remain in 'remain.pas' {MainForm};

{$R richedit.RES}

begin
  Application.Initialize;
  Application.Title := 'Rich Edit Control Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
