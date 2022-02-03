//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.DemoPlugIn.Creator;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, Vcl.Graphics,
  ToolsAPI.WelcomePage, WP.DemoPlugin.Constants;

type
  TWPDemoPlugInCreator = class(TInterfacedObject, INTAWelcomePagePlugin,
    INTAWelcomePageContentPluginCreator)
  private
    FWPPluginView: TFrame;
    FIconIndex: Integer;
    FModel: INTAWelcomePagePluginModel;
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
  WP.DemoPlugin.CaptionFrame, WP.DemoPlugin.Model;

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
  FModel := DemoPlugInModel;
  FIconIndex := -1;
end;

destructor TWPDemoPlugInCreator.Destroy;
begin
  DestroyView;
  inherited;
end;

function TWPDemoPlugInCreator.CreateView: TFrame;
var
  LPluginView: INTAWelcomePageDataPluginListView;
  LCaptionFrame: TDemoPlugInCaptionFrame;
begin
  if not Assigned(FWPPluginView) then
    FWPPluginView := WelcomePagePluginService.CreateListViewFrame(sPluginID, sPluginName, vmListButton, FModel);
  Result := FWPPluginView;
  if Supports(FWPPluginView, INTAWelcomePageDataPluginListView, LPluginView) then
  begin
    LPluginView.ItemHeight := TWelcomePageMetrics.ListView.MediumItemHeight;
    LCaptionFrame := TDemoPlugInCaptionFrame.Create(nil);
    LCaptionFrame.Model := FModel;
    LPluginView.SetCaptionFrame(LCaptionFrame);
    LPluginView.SetOnItemDblClick(TPlugInDemoModel(FModel).ItemDblClick);
    LPluginView.SetOnItemAdditionalClick(TPlugInDemoModel(FModel).ItemAdditionalClick);
  end;
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
