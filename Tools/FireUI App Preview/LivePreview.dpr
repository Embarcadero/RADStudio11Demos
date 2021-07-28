program LivePreview;

uses
  System.StartUpCopy,
  FMX.Forms,
  Consts in 'Consts.pas',
  KeepAwakeUnit in 'KeepAwakeUnit.pas',
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  PreviewFormUnit in 'PreviewFormUnit.pas' {PreviewForm},
  Regs in 'Regs.pas',
  StreamingUnit in 'StreamingUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'FireUI App Preview';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
