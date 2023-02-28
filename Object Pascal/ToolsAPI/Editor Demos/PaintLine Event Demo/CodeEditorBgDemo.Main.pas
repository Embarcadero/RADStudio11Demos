unit CodeEditorBgDemo.Main;

interface

procedure Register;

implementation

uses
  System.Types, System.SysUtils, Winapi.Windows, System.IOUtils, System.Generics.Collections,
  ToolsAPI, ToolsAPI.Editor, Vcl.Graphics, Vcl.Controls, Vcl.GraphUtil;

type
  TIDEWizard = class(TNotifierObject, IOTAWizard, INTAIDEThemingServicesNotifier)
  private
    FBackgroundColor: TColor;
    FBackground: TWICImage;
    FBackgroundBuffer: TDictionary<TWinControl, TBitmap>;
    FEditorEventsNotifier, FStyleServicesNotifier: Integer;
    procedure PaintLine(const Rect: TRect; const Stage: TPaintLineStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
    procedure EditorResized(const Editor: TWinControl);
    function UpdateBackgroundBuffer(const AControl: TWinControl): TBitmap;
    function CalculateBackgroundRect(const AControl: TWinControl): TRect;
    procedure LoadBackgroundFromSettings;
  protected
    { INTAIDEThemingServicesNotifier }
    procedure ChangedTheme;
    procedure ChangingTheme;
  public
    constructor Create;
    destructor Destroy; override;
    function GetIDString: string;
    procedure Execute;
    function GetName: string;
    function GetState: TWizardState;
  end;

  TCodeEditorNotifier = class(TNTACodeEditorNotifier)
  protected
    function AllowedEvents: TCodeEditorEvents; override;
    function AllowedLineStages: TPaintLineStages; override;
    function UIOptions: TCodeEditorUIOptions; override;
  end;

procedure Register;
begin
  RegisterPackageWizard(TIDEWizard.Create);
end;

{ TIDEWizard }

procedure TIDEWizard.ChangedTheme;
begin
  var LEditorServices: INTACodeEditorServices;
  if not Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) then
    Exit;
  var LEditors := LEditorServices.GetKnownEditors;
  try
    for var I := 0 to LEditors.Count - 1  do
    begin
      UpdateBackgroundBuffer(LEditors[I]);
      LEditorServices.InvalidateEditor(LEditors[I]);
    end;
  finally
    LEditors.Free;
  end;
end;

procedure TIDEWizard.ChangingTheme;
begin

end;

constructor TIDEWizard.Create;
//var
//  LThemingServices: IOTAIDEThemingServices;
begin
  inherited;
  FStyleServicesNotifier := -1;
//  if Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices) and
//    LThemingServices.IDEThemingEnabled then
//    FStyleServicesNotifier := LThemingServices.AddNotifier(Self);
  var LNotifier := TCodeEditorNotifier.Create;
  FBackgroundBuffer := TDictionary<TWinControl, TBitmap>.Create;
  LoadBackgroundFromSettings;
  var LEditorServices: INTACodeEditorServices;
  if Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) then
  begin
    FEditorEventsNotifier := LEditorServices.AddEditorEventsNotifier(LNotifier);
    FBackgroundColor := LEditorServices.Options.BackgroundColor[atWhiteSpace];
  end
  else
  begin
    FEditorEventsNotifier := -1;
    FBackgroundColor := clNone;
  end;

  LNotifier.OnEditorPaintLine := PaintLine;
  LNotifier.OnEditorResized := EditorResized;
end;

destructor TIDEWizard.Destroy;
var
  LThemingServices: IOTAIDEThemingServices;
begin
  if (FStyleServicesNotifier <> -1) and (Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices)) then
    LThemingServices.RemoveNotifier(FStyleServicesNotifier);
  var LEditorServices: INTACodeEditorServices;
  if Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) and
    (FEditorEventsNotifier <> -1) and Assigned(LEditorServices) then
    LEditorServices.RemoveEditorEventsNotifier(FEditorEventsNotifier);
  for var LBitmap in FBackgroundBuffer.Values do
    LBitmap.Free;
  FreeAndNil(FBackgroundBuffer);
  FreeAndNil(FBackground);
  inherited;
end;

procedure TIDEWizard.EditorResized(const Editor: TWinControl);
begin
  if Editor <> nil then
    UpdateBackgroundBuffer(Editor);
end;

procedure TIDEWizard.Execute;
begin
end;

function TIDEWizard.GetIDString: string;
begin
  Result := '[D9BBDF1A-F6CE-4483-8E5A-DBCB34E34011]';
end;

function TIDEWizard.GetName: string;
begin
  Result := 'CodeEditor.Background.Demo';
end;

function TIDEWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TIDEWizard.PaintLine(const Rect: TRect; const Stage: TPaintLineStage;
  const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
  const Context: INTACodeEditorPaintContext);
begin
  if BeforeEvent and (Stage = plsBackground) then
  begin
    var LColor: TColor := Context.Canvas.Brush.Color;
    var LBitmap: TBitmap;
    if not FBackgroundBuffer.TryGetValue(Context.EditControl, LBitmap) then
      LBitmap := UpdateBackgroundBuffer(Context.EditControl);

    BitBlt(Context.Canvas.Handle, Rect.Left, Rect.Top, Rect.Width, Rect.Height,
      LBitmap.Canvas.Handle, Rect.Left, Rect.Top, SRCCOPY);

    // Different background colour is for a selection, or current line highlight, etc
    if LColor <> FBackgroundColor then
      FillRectAlpha(Context.Canvas, Rect, LColor, 96);

    AllowDefaultPainting := False;
  end;
end;

function TIDEWizard.UpdateBackgroundBuffer(const AControl: TWinControl): TBitmap;
var
  LRect: TRect;
  LScaled: TWICImage;
  LThemingServices: IOTAIDEThemingServices;
begin
  if not Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices) then
    Exit;

  if FBackgroundBuffer.TryGetValue(AControl, Result) then
  begin
    FreeAndNil(Result);
    FBackgroundBuffer.Remove(AControl);
  end;

  if Assigned(AControl) and Assigned(FBackground) then
  begin
    LRect := CalculateBackgroundRect(AControl);
    if (LRect.Width > 0) and (LRect.Height > 0) then
    begin
      Result := TBitmap.Create(AControl.Width, AControl.Height);
      FBackgroundBuffer.Add(AControl, Result);
      var LEditorServices: INTACodeEditorServices;
      if Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) then
        FBackgroundColor := LEditorServices.Options.BackgroundColor[atWhiteSpace];
      Result.Canvas.Brush.Color := FBackgroundColor;
      Result.Canvas.FillRect(Rect(0, 0, Result.Width, Result.Height));
      LScaled := FBackground.CreateScaledCopy(LRect.Width, LRect.Height, wipmHighQualityCubic);
      try
        Result.Canvas.Draw(LRect.Left, LRect.Top, LScaled);
        FillRectAlpha(Result.Canvas, Rect(0, 0, Result.Width, Result.Height),
          FBackgroundColor, 128);
      finally
        LScaled.Free;
      end;
    end;
  end;
end;

function GetDesktopWallPaper: string;
begin
  SetLength(Result, MAX_PATH);
  SystemParametersInfoW(SPI_GETDESKWALLPAPER, MAX_PATH, PWideChar(Result), 0);
  var LIndex := Result.IndexOf(#0);
  if (LIndex >= 0) then
    SetLength(Result, LIndex);
end;

procedure TIDEWizard.LoadBackgroundFromSettings;
begin
  FBackground := TWICImage.Create;
  var LFileName := GetDesktopWallPaper();//'C:\dev\Demo\images\background.jpg';
  if not LFileName.IsEmpty and TFile.Exists(LFileName) then
    FBackground.LoadFromFile(LFileName);
end;

function TIDEWizard.CalculateBackgroundRect(const AControl: TWinControl): TRect;
var
  WX, HX: Double;
  LLeft, LTop, LWidth, LHeight: Integer;
begin
  if Assigned(AControl) and Assigned(FBackground) and
   (FBackground.Width > 0) and (FBackground.Height > 0)  then
  begin
    WX := AControl.Width / FBackground.Width;
    HX := AControl.Height / FBackground.Height;
    if WX < HX then
      WX := HX;
    // Make proportional stretched
    LWidth := Round(WX * FBackground.Width);
    LHeight := Round(WX * FBackground.Height);
    // Make centered
    LLeft := (AControl.Width - LWidth) div 2;
    LTop := (AControl.Height - LHeight) div 2;
    Result := Rect(LLeft, LTop, LLeft + LWidth, LTop + LHeight);
  end
  else
    Result := TRect.Empty;
end;

{ TCodeEditorNotifier }

function TCodeEditorNotifier.AllowedEvents: TCodeEditorEvents;
begin
  Result := [cevPaintLineEvents, cevWindowEvents];
end;

function TCodeEditorNotifier.AllowedLineStages: TPaintLineStages;
begin
  Result := [plsBackground];
end;

function TCodeEditorNotifier.UIOptions: TCodeEditorUIOptions;
begin
  Result := [ceoDisableScrollDC];
end;

end.
