unit CodeEditorPaintText.Main;

interface

procedure Register;

implementation

uses
  System.Types, System.SysUtils, Winapi.Windows, System.IOUtils, System.Generics.Collections,
  ToolsAPI, ToolsAPI.Editor, Vcl.Graphics, Vcl.Controls, Vcl.GraphUtil, System.StrUtils;

type
  TIDEWizard = class(TNotifierObject, IOTAWizard)
  private
    FEditorEventsNotifier: Integer;
    procedure PaintText(const Rect: TRect; const ColNum: SmallInt; const Text: string;
      const SyntaxCode: TOTASyntaxCode; const Hilight, BeforeEvent: Boolean;
      var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext);
  protected
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
  end;

procedure Register;
begin
  RegisterPackageWizard(TIDEWizard.Create);
end;

{ TIDEWizard }

constructor TIDEWizard.Create;
begin
  inherited;
  var LNotifier := TCodeEditorNotifier.Create;

  var LEditorServices: INTACodeEditorServices;
  if Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) then
    FEditorEventsNotifier := LEditorServices.AddEditorEventsNotifier(LNotifier)
  else
    FEditorEventsNotifier := -1;
  LNotifier.OnEditorPaintText := PaintText;
end;

destructor TIDEWizard.Destroy;
begin
  var LEditorServices: INTACodeEditorServices;
  if Supports(BorlandIDEServices, INTACodeEditorServices, LEditorServices) and
    (FEditorEventsNotifier <> -1) and Assigned(LEditorServices) then
    LEditorServices.RemoveEditorEventsNotifier(FEditorEventsNotifier);
  inherited;
end;

procedure TIDEWizard.Execute;
begin
end;

function TIDEWizard.GetIDString: string;
begin
  Result := '[D9BBDF1A-F6CE-4483-8E5A-DBCB34E34030]';
end;

function TIDEWizard.GetName: string;
begin
  Result := 'CodeEditor.PaintText.Demo';
end;

function TIDEWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TIDEWizard.PaintText(const Rect: TRect; const ColNum: SmallInt;
  const Text: string; const SyntaxCode: TOTASyntaxCode; const Hilight,
  BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
  const Context: INTACodeEditorPaintContext);
begin
  // Paint string using lime color
  if BeforeEvent and (SyntaxCode = atString) then
    Context.Canvas.Font.Color := clLime
  else
  // Replace IDE drawing, reverse reserved words.
  if BeforeEvent and (SyntaxCode = atReservedWord) then
  begin
    Context.Canvas.Brush.Color := TColor($64b5e8);
    Context.Canvas.FillRect(Rect);
    Context.Canvas.Font.Color := clBlack;
    Context.Canvas.TextOut(Rect.Left, Rect.Top, ReverseString(Text));
    AllowDefaultPainting := False;
  end;
end;

{ TCodeEditorNotifier }

function TCodeEditorNotifier.AllowedEvents: TCodeEditorEvents;
begin
  Result := [cevPaintTextEvents];
end;

end.
