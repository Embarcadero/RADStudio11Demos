unit CodeEditorPaintGutter.Main;

interface

procedure Register;

implementation

uses
  System.Types, System.SysUtils, Winapi.Windows, System.IOUtils, System.Generics.Collections,
  ToolsAPI, ToolsAPI.Editor, Vcl.Graphics, Vcl.Controls, Vcl.GraphUtil;

type
  TIDEWizard = class(TNotifierObject, IOTAWizard)
  private
    FEditorEventsNotifier: Integer;
    procedure PaintGutter(const Rect: TRect; const Stage: TPaintGutterStage;
      const BeforeEvent: Boolean; var AllowDefaultPainting: Boolean;
      const Context: INTACodeEditorPaintContext);
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
    function AllowedGutterStages: TPaintGutterStages; override;
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
  LNotifier.OnEditorPaintGutter := PaintGutter;
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
  Result := '[36816092-8DC9-4D42-ABEA-67092A9966C6]';
end;

function TIDEWizard.GetName: string;
begin
  Result := 'CodeEditor.PaintGutter.Demo';
end;

function TIDEWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TIDEWizard.PaintGutter(const Rect: TRect;
  const Stage: TPaintGutterStage; const BeforeEvent: Boolean;
  var AllowDefaultPainting: Boolean; const Context: INTACodeEditorPaintContext);
const
  cColors: Array [Boolean] of TColor = (clLime, clRed);
begin
  // replace colors for gutter line numbers.
  if BeforeEvent and (Stage = pgsLineNumber) then
    Context.Canvas.Font.Color := cColors[Odd(Context.EditorLineNum)];
end;

{ TCodeEditorNotifier }

function TCodeEditorNotifier.AllowedEvents: TCodeEditorEvents;
begin
  Result := [cevPaintGutterEvents];
end;

function TCodeEditorNotifier.AllowedGutterStages: TPaintGutterStages;
begin
  Result := [pgsLineNumber];
end;

end.

