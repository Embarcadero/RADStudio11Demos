//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.CaptionFrameDemoPlugIn.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TMainFrame = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbDeviceName: TLabel;
    lbProcesor: TLabel;
    lbOSVersion: TLabel;
    lbMemory: TLabel;
  private
    { Private declarations }
  public
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  ToolsAPI;

{$R *.dfm}

constructor TMainFrame.Create(AOwner: TComponent);
var
  MS: TMemoryStatusEx;
  LThemingServices: IOTAIDEThemingServices;
begin
  inherited;
  if Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices) and
    LThemingServices.IDEThemingEnabled then
  begin
    Panel1.StyleElements := Panel1.StyleElements - [seClient];
    Panel1.ParentBackground := False;
    Panel1.Color := LThemingServices.StyleServices.GetSystemColor(clWindow);
  end;
  lbDeviceName.Caption := GetEnvironmentVariable('COMPUTERNAME');
  lbProcesor.Caption := GetEnvironmentVariable('PROCESSOR_IDENTIFIER');
  lbOSVersion.Caption := TOSVersion.ToString();
  MS.dwLength := SizeOf(MS);
  GlobalMemoryStatusEx(MS);
  lbMemory.Caption := 'Memory Available to Windows: %s';
  lbMemory.Caption := Format(lbMemory.Caption, [Format(
    FormatFloat('#,###,###" %s"', MS.ullTotalPhys / 1024), ['KB'])]);
end;

end.
