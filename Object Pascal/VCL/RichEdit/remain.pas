unit remain;

interface

uses
  System.SysUtils, Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.ClipBrd,
  Vcl.ToolWin, Vcl.ActnList, System.Actions, System.ImageList, Vcl.ImgList, Vcl.StdActns, Vcl.ExtActns;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FilePrintItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    RichEditMenu: TMenuItem;
    RichEditTransparentItem: TMenuItem;
    RichEditWordWrapItem: TMenuItem;
    RichEditBoldItem: TMenuItem;
    RichEditItalicItem: TMenuItem;
    RichEditUnderlineItem: TMenuItem;
    RichEditStrikeoutItem: TMenuItem;
    RichEditAlignLeftItem: TMenuItem;
    RichEditAlignCenterItem: TMenuItem;
    RichEditAlignRightItem: TMenuItem;
    RichEditBulletsItem: TMenuItem;
    RichEditSuperscriptItem: TMenuItem;
    RichEditSubscriptItem: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    HelpAboutItem: TMenuItem;
    Ruler: TPanel;
    FontDialog: TFontDialog;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    miEditFont: TMenuItem;
    Editor: TRichEdit;
    StatusBar: TStatusBar;
    StandardToolBar: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    ActionList: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TFileOpen;
    FileSaveCmd: TAction;
    FilePrintCmd: TPrintDlg;
    FileExitCmd: TFileExit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Bevel1: TBevel;
    EditCutCmd: TEditCut;
    EditCopyCmd: TEditCopy;
    EditPasteCmd: TEditPaste;
    EditUndoCmd: TEditUndo;
    EditFontCmd: TFontEdit;
    FileSaveAsCmd: TFileSaveAs;
    FormatRichEditBoldCmd: TRichEditBold;
    FormatRichEditItalicCmd: TRichEditItalic;
    FormatRichEditUnderlineCmd: TRichEditUnderline;
    FormatRichEditStrikeOutCmd: TRichEditStrikeOut;
    FormatRichEditBulletsCmd: TRichEditBullets;
    FormatRichEditAlignLeftCmd: TRichEditAlignLeft;
    FormatRichEditAlignRightCmd: TRichEditAlignRight;
    FormatRichEditAlignCenterCmd: TRichEditAlignCenter;
    SuperscriptCmd: TAction;
    SubscriptCmd: TAction;
    StrikeoutButton: TToolButton;
    ToolButton20: TToolButton;
    FGColorBox: TColorBox;
    BGColorBox: TColorBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SupersciptButton: TToolButton;
    SubscriptButton: TToolButton;
    ToolButton6: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SelectionChange(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpenAccept(Sender: TObject);
    procedure FileOpenBeforeExecute(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrintAccept(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure SelectFontBeforeExecute(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichEditChange(Sender: TObject);
    procedure RichEditTransparentItemClick(Sender: TObject);
    procedure EditorLinkClick(Sender: TCustomRichEdit; const URL: string; Button: TMouseButton);
    procedure EditorClick(Sender: TObject);
    procedure FGColorBoxChange(Sender: TObject);
    procedure BGColorBoxChange(Sender: TObject);
    procedure SuperscriptCmdExecute(Sender: TObject);
    procedure SuperscriptCmdUpdate(Sender: TObject);
    procedure SubscriptCmdExecute(Sender: TObject);
    procedure SubscriptCmdUpdate(Sender: TObject);
    procedure RichEditWordWrapItemClick(Sender: TObject);
  private
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

uses REAbout, RichEdit, Winapi.ShellAPI, System.UITypes, System.IOUtils;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';
  sScrollPos = 'Scroll Pos: (%d, %d)';
  sOpenLink = 'Open link: %s ?';

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.dfm}

{ Event Handlers }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  FileOpenCmd.Dialog.InitialDir := ExtractFilePath(ParamStr(0));
  FileSaveAsCmd.Dialog.InitialDir := FileOpenCmd.Dialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;
  SelectionChange(Self);

  CurrText.Name := string(DefFontData.Name);
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
  RichEditTransparentItem.Checked := Editor.Transparent;
  RichEditWordWrapItem.Checked := Editor.ScrollBars = ssVertical;
  Editor.ShowURLHint := True; // TODO remove this when we set it in the DFM
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  Editor.SetFocus;
  { Check if we should load a file from the command line, assuming the default file is not available }
  if TFile.Exists('overview.rtf') then
    PerformFileOpen('overview.rtf')
  else if TFile.Exists('..\..\overview.rtf') then
    PerformFileOpen('..\..\overview.rtf')
  else if (ParamCount > 0) and TFile.Exists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SelectionChange(Sender);
  Editor.Invalidate;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
end;

procedure TMainForm.SelectionChange(Sender: TObject);
begin
  try
    FUpdating := True;
    FirstInd.Left := Trunc(Editor.Paragraph.FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((Editor.Paragraph.LeftIndent+Editor.Paragraph.FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((Editor.Paragraph.RightIndent+GutterWid)*RulerAdj);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    FGColorBox.Selected := Editor.SelAttributes.Color;
    BGColorBox.Selected := Editor.SelAttributes.BackColor;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;

procedure TMainForm.FGColorBoxChange(Sender: TObject);
begin
  Editor.SelAttributes.Color := FGColorBox.Selected;
end;

function TMainForm.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;

procedure TMainForm.EditorClick(Sender: TObject);
begin
  UpdateCursorPos;
end;

procedure TMainForm.EditorLinkClick(Sender: TCustomRichEdit; const URL: string; Button: TMouseButton);
begin
  if (Button = mbLeft) and
     (MessageDlg(Format(sOpenLink, [URL]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL)
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TMainForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TMainForm.SetFileName(const FileName: String);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TMainForm.BGColorBoxChange(Sender: TObject);
begin
  Editor.SelAttributes.BackColor := BGColorBox.Selected;
end;

procedure TMainForm.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Editor.Modified then Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),
    mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: FileSave(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TMainForm.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end;

procedure TMainForm.SubscriptCmdExecute(Sender: TObject);
begin
  Editor.SelAttributes.Subscript := sstSubscript;
end;

procedure TMainForm.SubscriptCmdUpdate(Sender: TObject);
begin
  (Sender as TAction).Checked := Editor.SelAttributes.Subscript = sstSubscript;
end;

procedure TMainForm.SuperscriptCmdExecute(Sender: TObject);
begin
  Editor.SelAttributes.Subscript := sstSuperscript;
end;

procedure TMainForm.SuperscriptCmdUpdate(Sender: TObject);
begin
  (Sender as TAction).Checked := Editor.SelAttributes.Subscript = sstSuperscript;
end;

procedure TMainForm.FileNew(Sender: TObject);
begin
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TMainForm.PerformFileOpen(const AFileName: string);
begin
  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TMainForm.FileOpenAccept(Sender: TObject);
begin
  PerformFileOpen(FileOpenCmd.Dialog.FileName);
  Editor.ReadOnly := ofReadOnly in FileOpenCmd.Dialog.Options;
end;

procedure TMainForm.FileOpenBeforeExecute(Sender: TObject);
begin
  CheckFileSave;
end;

procedure TMainForm.FileSave(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    Editor.Lines.SaveToFile(FFileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.FileSaveAs(Sender: TObject);
begin
  if FileExists(FileSaveAsCmd.Dialog.FileName) then
    if MessageDlg(Format(sOverWrite, [FileSaveAsCmd.Dialog.FileName]), mtConfirmation, mbYesNoCancel, 0) <> idYes then
      Exit;
  Editor.Lines.SaveToFile(FileSaveAsCmd.Dialog.FileName);
  SetFileName(FileSaveAsCmd.Dialog.FileName);
  Editor.Modified := False;
  SetModified(False);
end;

procedure TMainForm.FilePrintAccept(Sender: TObject);
begin
  Editor.Print(FFileName);
end;

procedure TMainForm.HelpAbout(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.SelectFont(Sender: TObject);
begin
  CurrText.Assign(FontDialog.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TMainForm.SelectFontBeforeExecute(Sender: TObject);
begin
  FontDialog.Font.Assign(Editor.SelAttributes);
end;

procedure TMainForm.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left*2);
end;

procedure TMainForm.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TMainForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

{ Ruler Indent Dragging }

procedure TMainForm.RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TMainForm.RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TMainForm.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TMainForm.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent;
  SelectionChange(Sender);
end;

procedure TMainForm.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  SelectionChange(Sender);
end;

procedure TMainForm.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
  StatusBar.Panels[1].Text := Format(sScrollPos, [Editor.ScrollPosition.X, Editor.ScrollPosition.Y]);
end;

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TMainForm.RichEditChange(Sender: TObject);
begin
  SetModified(Editor.Modified);
  UpdateCursorPos;
end;

procedure TMainForm.RichEditTransparentItemClick(Sender: TObject);
begin
  RichEditTransparentItem.Checked := not RichEditTransparentItem.Checked;
  Editor.Transparent := RichEditTransparentItem.Checked;
end;

procedure TMainForm.RichEditWordWrapItemClick(Sender: TObject);
begin
  RichEditWordWrapItem.Checked := not RichEditWordWrapItem.Checked;
  if RichEditWordWrapItem.Checked then
    Editor.ScrollBars := ssVertical
  else
    Editor.ScrollBars := ssBoth;
end;

procedure TMainForm.SetModified(Value: Boolean);
begin
  if Value then
    StatusBar.Panels[2].Text := sModified
  else
    StatusBar.Panels[2].Text := '';
end;

end.
