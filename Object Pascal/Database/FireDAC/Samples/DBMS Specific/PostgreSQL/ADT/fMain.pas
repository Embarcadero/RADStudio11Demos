//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm64 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    btnOpen: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    btnEdit: TButton;
    btnWrite: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form64: TForm64;

implementation

{$R *.dfm}

procedure TForm64.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
end;

procedure TForm64.btnOpenClick(Sender: TObject);
var
  LPersonField: TADTField;
  I: Integer;
begin
  FDQuery1.Open('select * from FDEmployees');
  Memo1.Lines.Clear;

  // Use '<ADT field>' name to get TADTField
  LPersonField := FDQuery1.FieldByName('person') as TADTField;
  while not FDQuery1.Eof do
  begin
    // As an example, use subfields of TADTField to access to an attribute
    for I := 0 to LPersonField.FieldCount - 1 do
      Memo1.Lines.Add(LPersonField.Fields[I].FieldName + ': ' + LPersonField.Fields[I].AsString);
    Memo1.Lines.Add('');
    FDQuery1.Next;
  end;
end;

procedure TForm64.btnEditClick(Sender: TObject);
begin
  FDQuery1.Edit;
  // As an example, use '<ADT field>.<attribute>' name to access to an attribute
  FDQuery1.FieldByName('person.salary').AsCurrency :=
    FDQuery1.FieldByName('person.salary').AsCurrency + 1000;
  FDQuery1.Post;

  // TADTField.AsString returns string '(attr1; ...; attrN)'. The property is read-only.
  // TADTField.AsVariant returns variant array, where each item is an attribute value. The property is read-write.
  Memo1.Lines.Add('Updated person info: ' + FDQuery1.FieldByName('person').AsString);
  Memo1.Lines.Add('');
end;

procedure TForm64.btnWriteClick(Sender: TObject);
begin
  // To initialize an ADT field in SQL use ROW(...) constructor
  // To update/read an individual atttribute of ADT field use <ADT field>.<attribute>
  FDConnection1.ExecSQL('insert into FDEmployees values (' +
    ':id, ROW(:pname, :pbd, :psal), ROW(:sname, :sbd, :ssal))',
    [FDQuery1.RecordCount + 1, 'a', Date(), 100, 'b', Date(), 100]);
  FDQuery1.Refresh;
end;

end.
