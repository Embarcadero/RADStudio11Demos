program ForegroundLocationService;

uses
  System.Android.ServiceApplication,
  ServiceUnit in 'ServiceUnit.pas' {LocationTrackingModule: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLocationTrackingModule, LocationModule);
  Application.Run;

end.
