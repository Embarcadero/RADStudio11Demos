unit PreviewFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Math.Vectors, System.Tether.Manager, System.Tether.AppProfile,
  IPPeerServer,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Layouts, FMX.ListBox, FMX.Colors, FMX.ListView, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.TabControl, FMX.ComboTrackBar, FMX.ComboEdit,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.TreeView, FMX.Calendar,
  FMX.Types3D, FMX.Controls3D, FMX.Objects3D, FMX.Layers3D, FMX.Viewport3D,
  FMX.MultiView;

type
  TPreviewForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Clear;
  end;

implementation

{$R *.fmx}

{ TPreviewForm }

procedure TPreviewForm.Clear;
var
  n: Integer;
  LComponent: TComponent;
begin
  for n := ComponentCount - 1 downto 0 do
  begin
    LComponent := Components[n];
    RemoveComponent(LComponent);
    LComponent.DisposeOf;
  end;
end;

procedure TPreviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caHide;
end;

end.
