unit StreamingUnit;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections;

type
  TNewUnknownComponentEvent = procedure(const AClassName: string; var AComponent: TComponent) of object;
  TUnknownClassEvent = procedure(const AClassName: string; out AComponentClass: TComponentClass) of object;

  TPreviewReader = class(TReader)
  private
    FOnNewUnknownComponent: TNewUnknownComponentEvent;
    FOnUnknownClass: TUnknownClassEvent;
    FClassName: string;
    procedure FindCompClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
    procedure DoCreateComponent(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
    procedure DoError(Reader: TReader; const Message: string; var Handled: Boolean);
    procedure SetOnUnknownClass(const Value: TUnknownClassEvent);
    procedure SetOnNewUnknownComponent(const Value: TNewUnknownComponentEvent);
  protected
    function FindMethodInstance(Root: TComponent; const MethodName: string): TMethod; override;
  public
    property OnNewUnknownComponent: TNewUnknownComponentEvent read FOnNewUnknownComponent write SetOnNewUnknownComponent;
    property OnUnknownClass: TUnknownClassEvent read FOnUnknownClass write SetOnUnknownClass;
    constructor Create(Stream: TStream; BufSize: Integer);
  end;

implementation

{ TPreviewReader }

constructor TPreviewReader.Create(Stream: TStream; BufSize: Integer);
begin
  inherited Create(Stream, BufSize);

  FClassName := string.Empty;
  FOnUnknownClass := nil;
  FOnNewUnknownComponent := nil;
  OnFindComponentClass := FindCompClass;
  OnCreateComponent := DoCreateComponent;
  OnError := DoError;
end;

procedure TPreviewReader.DoError(Reader: TReader; const Message: string; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TPreviewReader.FindCompClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
begin
  if (ComponentClass = nil) and Assigned(FOnUnknownClass) then
  begin
    FOnUnknownClass(ClassName, ComponentClass);
    FClassName := ClassName;
  end;
end;

procedure TPreviewReader.DoCreateComponent(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
begin
  if Assigned(FOnNewUnknownComponent) and not FClassName.IsEmpty then
  begin
    FOnNewUnknownComponent(FClassName, Component);
    FClassName := string.Empty;
  end;
end;

function TPreviewReader.FindMethodInstance(Root: TComponent; const MethodName: string): TMethod;
begin
  Result.Data := nil;
  Result.Code := nil;
end;

procedure TPreviewReader.SetOnNewUnknownComponent(const Value: TNewUnknownComponentEvent);
begin
  FOnNewUnknownComponent := Value;
end;

procedure TPreviewReader.SetOnUnknownClass(const Value: TUnknownClassEvent);
begin
  FOnUnknownClass := Value;
end;

end.
