//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.DemoPlugIn.Model;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, Vcl.ImageCollection,
  ToolsAPI.WelcomePage;

type
  /// <summary>
  ///   The structure of a single item
  /// </summary>
  TPlugInItemData = class(TInterfacedObject, INTAWelcomePageModelItemData,
    INTAWelcomePageModelItemAdditionalData)
  private
    FTitle: string;
    FDescription: string;
    FImageIndex: Integer;
    FIsFavorite: Boolean;
    FAdditionalImageIndex: Integer;
    { IModelItemData }
    function GetTitle: string;
    procedure SetTitle(const Value: string);
    function GetDescription: string;
    procedure SetDescription(const Value: string);
    function GetImageIndex: Integer;
    procedure SetImageIndex(const Value: Integer);
    { IModelItemAdditionalData }
    function GetAdditionalImageIndex: Integer;
    procedure SetAdditionalImageIndex(const Value: Integer);
  protected
    constructor Create(const APluginInfo: INTAWelcomePagePlugin);
  public
    property Title: string read GetTitle write SetTitle;
    property Description: string read GetDescription write SetDescription;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;
    property AdditionalImageIndex: Integer read GetAdditionalImageIndex write SetAdditionalImageIndex;
    property IsFavorite: Boolean read FIsFavorite;
  end;

  /// <summary>
  ///   The Model class of the Welcome Page Demo Plugin implementing core logic.
  /// </summary>
  TPlugInDemoModel = class(TInterfacedObject, INTAWelcomePagePluginModel)
  private
    FFavorites: TDictionary<string, Boolean>;
    FData: IInterfaceList;
    FFavoriteImageIndex: Integer;
    FUnFavoriteImageIndex: Integer;
    FStatusMessage: string;
    [weak] FOnLoadFinished: TProc;
    procedure UpdateImages;
    procedure UpdateFavoriteImage(Index: Integer);
    // Favorites
    function GetFavorite(Index: Integer): Boolean;
    procedure SetFavorite(Index: Integer; Value: Boolean);
    // Plugins info
    function GetPlugInItemData(Index: Integer): TPlugInItemData;
    function AddPlugInItemData(const APlugInInfo: INTAWelcomePagePlugin): Integer;
    function IndexOf(const APlugInID: string): Integer;
    { INTAWelcomePagePluginModel }
    function GetData: IInterfaceList;
    function GetImageCollection: TImageCollection;
    function GetIsDataLoaded: Boolean;
    function GetStatusMessage: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ItemDblClick(Sender: TObject; AItemIndex: Integer);
    procedure ItemAdditionalClick(Sender: TObject; AItemIndex: Integer);
    { INTAWelcomePagePluginModel }
    procedure SetOnLoadingFinished(AProc: TProc);
    procedure LoadData;
    procedure RefreshData;
    procedure StopLoading;
    property IsFavorite[AIndex: Integer]: Boolean read GetFavorite write SetFavorite;
    property PlugInItemData[AIndex: Integer]: TPlugInItemData read GetPlugInItemData;
    procedure ShowInfo(AIndex: Integer);
  end;

function DemoPlugInModel: TPlugInDemoModel;

implementation

uses
  WP.DemoPlugIn.Resources, WP.DemoPlugin.Constants, System.StrUtils, Vcl.Dialogs;

function DemoPlugInModel: TPlugInDemoModel;
begin
  Result := TPlugInDemoModel.Create;
end;

{ TPlugInItemData }

constructor TPlugInItemData.Create(const APluginInfo: INTAWelcomePagePlugin);
begin
  inherited Create;
  FTitle := APluginInfo.PluginID;
  FDescription := APluginInfo.PluginName;
  if StartsText('Embarcadero.', APluginInfo.PluginID) then
    FImageIndex := DemoPlugInResources.ImageCollection1.GetIndexByName(sEmbPlugInIcon)
  else
    FImageIndex := DemoPlugInResources.ImageCollection1.GetIndexByName(sUserPlugInIcon);
end;

function TPlugInItemData.GetTitle: string;
begin
  Result := FTitle;
end;

procedure TPlugInItemData.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

function TPlugInItemData.GetDescription: string;
begin
  Result := FDescription;
end;

procedure TPlugInItemData.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

function TPlugInItemData.GetImageIndex: Integer;
begin
  Result := FImageIndex;
end;

procedure TPlugInItemData.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
end;

function TPlugInItemData.GetAdditionalImageIndex: Integer;
begin
  Result := FAdditionalImageIndex;
end;

procedure TPlugInItemData.SetAdditionalImageIndex(const Value: Integer);
begin
  FAdditionalImageIndex := Value;
end;

{ TPlugInDemoModel }

constructor TPlugInDemoModel.Create;
begin
  FFavorites := TDictionary<string, Boolean>.Create;
  FData := TInterfaceList.Create;
  FFavoriteImageIndex := -1;
  FUnFavoriteImageIndex := -1;
  UpdateImages;
  LoadData;
end;

destructor TPlugInDemoModel.Destroy;
begin
  FFavorites.Free;
  if Assigned(FData) then
    FData.Clear;
  FData := nil;
  inherited;
end;

procedure TPlugInDemoModel.UpdateImages;
begin
  FFavoriteImageIndex := DemoPlugInResources.ImageCollection1.GetIndexByName(sFavoriteIconName);
  FUnFavoriteImageIndex := DemoPlugInResources.ImageCollection1.GetIndexByName(sUnfavoriteIconName);
end;

procedure TPlugInDemoModel.UpdateFavoriteImage(Index: Integer);
var
  LItem: TPlugInItemData;
begin
  LItem := PlugInItemData[Index];
  if IsFavorite[Index] then
  begin
    LItem.FIsFavorite := True;
    LItem.AdditionalImageIndex := FFavoriteImageIndex
  end
  else
  begin
    LItem.FIsFavorite := False;
    LItem.AdditionalImageIndex := FUnFavoriteImageIndex;
  end;
end;

function TPlugInDemoModel.GetFavorite(Index: Integer): Boolean;
var
  LItem: TPlugInItemData;
begin
  LItem := PlugInItemData[Index];
  if FFavorites.ContainsKey(LItem.Title) then
   Result := FFavorites[LItem.Title]
  else
    Result := False;
end;

procedure TPlugInDemoModel.SetFavorite(Index: Integer; Value: Boolean);
var
  LItem: TPlugInItemData;
begin
  LItem := PlugInItemData[Index];
  if Assigned(LItem) and (Value <> LItem.IsFavorite)  then
  begin
    if not FFavorites.ContainsKey(LItem.Title) then
      FFavorites.Add(LItem.Title, Value)
    else
      FFavorites[LItem.Title] := Value;
    LItem.FIsFavorite := Value;
  end;
end;

function TPlugInDemoModel.GetPlugInItemData(Index: Integer): TPlugInItemData;
begin
  if Assigned(FData) and (Index >= 0) and (Index < FData.Count) then
    Result := TPlugInItemData(FData[Index])
  else
    Result := nil;
end;

function TPlugInDemoModel.AddPlugInItemData(const APlugInInfo: INTAWelcomePagePlugin): Integer;
begin
  if not Assigned(FData) then
    Exit(-1);

  Result := IndexOf(APlugInInfo.PluginID);
  if Result = -1 then
  begin
    Result := FData.Add(TPlugInItemData.Create(APlugInInfo));
    UpdateFavoriteImage(Result);
  end;
end;

function TPlugInDemoModel.IndexOf(const APluginID: string): Integer;
begin
  if (not Assigned(FData))  then
    Exit(-1);
  for var i := 0 to Pred(FData.Count) do
  begin
    if SameText(TPlugInItemData(FData[i]).Title, APluginID) then
      Exit(i);
  end;
  Result := -1;
end;

procedure TPlugInDemoModel.ItemAdditionalClick(Sender: TObject;
  AItemIndex: Integer);
begin
  IsFavorite[AItemIndex] := not IsFavorite[AItemIndex];
  RefreshData;
end;

procedure TPlugInDemoModel.ItemDblClick(Sender: TObject; AItemIndex: Integer);
begin
  ShowInfo(AItemIndex);
end;

function TPlugInDemoModel.GetData: IInterfaceList;
begin
  Result := FData;
end;

function TPlugInDemoModel.GetImageCollection: TImageCollection;
begin
  Result := DemoPlugInResources.ImageCollection1;
end;

function TPlugInDemoModel.GetIsDataLoaded: Boolean;
begin
  Result := FStatusMessage.IsEmpty;
end;

function TPlugInDemoModel.GetStatusMessage: string;
begin
  Result := FStatusMessage;
end;

procedure TPlugInDemoModel.SetOnLoadingFinished(AProc: TProc);
begin
  FOnLoadFinished := AProc;
end;

procedure TPlugInDemoModel.ShowInfo(AIndex: Integer);
begin
  ShowMessage(TPlugInItemData(FData[AIndex]).Description);
end;

procedure TPlugInDemoModel.LoadData;
var
  LIndex, i: Integer;
begin
  FData.Clear;
  try
     for i := 0 to WelcomePagePluginService.PluginCount - 1 do
     begin
       LIndex := AddPlugInItemData(WelcomePagePluginService.Plugins[i]);
       UpdateFavoriteImage(LIndex);
     end;

    if Assigned(FOnLoadFinished) then
      FOnLoadFinished;
  except
    on E: Exception do
    begin
      FStatusMessage := E.Message;
      if Assigned(FOnLoadFinished) then
        FOnLoadFinished
      else
        raise;
    end;
  end;
end;

procedure TPlugInDemoModel.RefreshData;
begin
  FStatusMessage := '';
  LoadData;
end;

procedure TPlugInDemoModel.StopLoading;
begin
  // Do nothing
end;

end.
