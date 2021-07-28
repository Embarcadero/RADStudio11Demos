//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MainForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls, WideStrings, DbxDatasnap, DB, SqlExpr, DBXCommon, IPPeerClient;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    DsConnection: TSQLConnection;
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  TransformStream,
  CopyPrsr,
  clientproxy,
  DBXJson,
  StrUtils,
  System.Generics.Collections,
  System.JSON,
  DSUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LStream: TStream;
  LResultStream: TStream;
  LReader: TStreamReader;
  LClient: ClientProxy.TServerMethodsClient;
  LCallBack: TDBXCallback;
  LStopAfter: Integer;
  LCount: Integer;
begin
  DSConnection.Open;
  try
    LClient := TServerMethodsClient.Create(DSConnection.DBXConnection, False);
    try
      LStream := TStringStream.Create(Memo1.Lines.Text);
      try
        LCallback := TDSCallbackWithMethod.Create(
          function(const Args: TJSONValue): TJSONValue
          const
            LComma: array[Boolean] of string = ('', ', ');
          var
            LJSONObject: TJSONObject;
            I: Integer;
            LJSONPair: TJSONPair;
            LMessage: string;
          begin
            LJSONObject := TJSONObject(Args);
            for I := 0 to LJSONObject.Count - 1 do
            begin
              LJSONPair := LJSONObject.Pairs[I];
              LMessage := LMessage +
                Format('%s: "%s"%s', [LJSONPair.JSONString.Value, LJSONPair.JsonValue.Value, LComma[I<LJSONObject.Count-1]]);
            end;
            ListBox1.Items.Add(LMessage);
            ListBox1.Update;
            Inc(LCount);
            if LCount = LStopAfter then
              Result := TJSONFalse.Create // Cancel
            else
              Result := TJSONTrue.Create;
          end
          );
        ListBox1.Items.Clear;
        LCount := 0;
        LStopAfter := StrToInt(Edit1.Text);
        LResultStream := LClient.ReverseWordsInStream(LCallback, LStream);
        try
          LReader := TStreamReader.Create(LResultStream);
          try
            Memo1.Text := LReader.ReadToEnd;
            ShowMessage(Format('Count: %d', [LCount]));
          finally
            LReader.Free;
          end;
        finally
          LResultStream.Free;
        end;
      finally
        LStream.Free;
      end;
    finally
      LClient.Free;
    end;
  finally
    DSConnection.Close;
  end;
end;

end.
