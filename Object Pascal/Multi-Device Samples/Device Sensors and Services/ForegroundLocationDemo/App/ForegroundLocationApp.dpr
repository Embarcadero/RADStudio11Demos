program ForegroundLocationApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ServiceUnit in '..\Service\ServiceUnit.pas' {LocationTrackingModule: TAndroidService},
  AppUnit in 'AppUnit.pas' {LocationTrackingForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLocationTrackingForm, LocationForm);
  Application.Run;

end.
