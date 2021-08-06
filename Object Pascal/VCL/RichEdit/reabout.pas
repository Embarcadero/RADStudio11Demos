unit reabout;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    ProgramIcon: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    PhysMem: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
var
  MS: TMemoryStatusEx;
begin
  MS.dwLength := SizeOf(TMemoryStatusEx);
  GlobalMemoryStatusEx(MS);
  PhysMem.Caption := FormatFloat('#,###" MB"', MS.ullTotalPhys shr 20);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
end;

end.
