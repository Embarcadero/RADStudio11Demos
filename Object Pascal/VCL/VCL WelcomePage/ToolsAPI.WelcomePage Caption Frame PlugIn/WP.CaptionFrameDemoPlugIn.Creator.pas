//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.CaptionFrameDemoPlugIn.Creator;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, Vcl.Graphics,
  ToolsAPI.WelcomePage, WP.CaptionFrameDemoPlugin.Constants;

type
  TWPDemoPlugInCreator = class(TInterfacedObject, INTAWelcomePagePlugin,
    INTAWelcomePageContentPluginCreator)
  private
    FWPPluginView: TFrame;
    FIconIndex: Integer;
    { INTAWelcomePageContentPluginCreator }
    function GetView: TFrame;
    function GetIconIndex: Integer;
    procedure SetIconIndex(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    class procedure PlugInStartup;
    class procedure PlugInFinish;
    { INTAWelcomePagePlugin }
    function GetPluginID: string;
    function GetPluginName: string;
    function GetPluginVisible: boolean;
    { INTAWelcomePageContentPluginCreator }
    function CreateView: TFrame;
    procedure DestroyView;
    function GetIcon: TGraphicArray;
  end;

procedure Register;

implementation

uses
  WP.CaptionFrameDemoPlugIn.View;

procedure Register;
begin
  TWPDemoPlugInCreator.PlugInStartup;
end;

{ TWPDemoPlugInCreator }

function TWPDemoPlugInCreator.GetPluginID: string;
begin
  Result := sPluginID;
end;

function TWPDemoPlugInCreator.GetPluginName: string;
begin
  Result := sPluginName;
end;

function TWPDemoPlugInCreator.GetPluginVisible: boolean;
begin
  Result := True;
end;

constructor TWPDemoPlugInCreator.Create;
begin
  FIconIndex := -1;
end;

destructor TWPDemoPlugInCreator.Destroy;
begin
  DestroyView;
  inherited;
end;

function TWPDemoPlugInCreator.CreateView: TFrame;
var
  LPluginView: INTAWelcomePageCaptionFrame;
  LFrame: TMainFrame;
begin
  if not Assigned(FWPPluginView) then
    FWPPluginView := WelcomePagePluginService.CreateCaptionFrame(sPluginID,
    sPluginName, nil);

  if Supports(FWPPluginView, INTAWelcomePageCaptionFrame, LPluginView) then
  begin
    LFrame := TMainFrame.Create(FWPPluginView);
    LPluginView.SetClientFrame(LFrame);
  end;
  Result := FWPPluginView;
end;

procedure TWPDemoPlugInCreator.DestroyView;
begin
  FreeAndNil(FWPPluginView);
end;

function TWPDemoPlugInCreator.GetIcon: TGraphicArray;
begin
  Result := [];
end;

function TWPDemoPlugInCreator.GetIconIndex: Integer;
begin
  Result := FIconIndex;
end;

procedure TWPDemoPlugInCreator.SetIconIndex(const Value: Integer);
begin
  FIconIndex := Value;
end;

function TWPDemoPlugInCreator.GetView: TFrame;
begin
  Result := FWPPluginView;
end;

class procedure TWPDemoPlugInCreator.PlugInStartup;
begin
  WelcomePagePluginService.RegisterPluginCreator(TWPDemoPlugInCreator.Create);
end;

class procedure TWPDemoPlugInCreator.PlugInFinish;
begin
  if Assigned(WelcomePagePluginService) then
    WelcomePagePluginService.UnRegisterPlugin(sPluginID);
end;

initialization

finalization
  TWPDemoPlugInCreator.PlugInFinish;

end.
