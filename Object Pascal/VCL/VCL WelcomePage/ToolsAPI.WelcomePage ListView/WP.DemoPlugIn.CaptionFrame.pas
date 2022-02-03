//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.DemoPlugIn.CaptionFrame;

interface

uses
  Vcl.Dialogs, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.WinXCtrls, WP.DemoPlugin.Model, ToolsAPI.WelcomePage, ToolsAPI, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TDemoPlugInCaptionFrame = class(TFrame)
    lbCaption: TLabel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    ilTitleFrame: TVirtualImageList;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    [weak] FModel: INTAWelcomePagePluginModel;
    procedure SetModel(const Value: INTAWelcomePagePluginModel);
  protected
    procedure PaintWindow(DC: HDC); override;
  public
    { Public declarations }
    property Model: INTAWelcomePagePluginModel read FModel write SetModel;
  end;

implementation

{$R *.dfm}

uses
  WP.DemoPlugIn.Resources;

procedure TDemoPlugInCaptionFrame.btn1Click(Sender: TObject);
begin
  ShowMessage('btn1Click');
end;

procedure TDemoPlugInCaptionFrame.btn2Click(Sender: TObject);
begin
  ShowMessage('btn2Click');
end;

procedure TDemoPlugInCaptionFrame.PaintWindow(DC: HDC);
const
  cCaptionOpacity = 64;
var
  LCanvas: TCanvas;
  LColor: TColor;
begin
  inherited;
  LCanvas := TCanvas.Create;
  try
    LCanvas.Handle := DC;
    if Assigned(BorlandIDEServices) then
      LColor := (BorlandIDEServices as IOTAIDEThemingServices).StyleServices.GetSystemColor(Color)
    else
      LColor := clNone;
    (WelcomePagePluginService as INTAWelcomePageBackgroundService).PaintBackgroundTo(LCanvas, Self, LColor, cCaptionOpacity);
  finally
    LCanvas.Handle := 0;
    FreeAndNil(LCanvas);
  end;
end;

procedure TDemoPlugInCaptionFrame.SetModel(const Value: INTAWelcomePagePluginModel);
begin
  FModel := Value;
end;

end.
