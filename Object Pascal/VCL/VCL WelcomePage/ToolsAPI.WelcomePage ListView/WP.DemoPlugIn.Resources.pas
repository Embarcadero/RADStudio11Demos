//---------------------------------------------------------------------------

// This software is Copyright (c) 2022 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit WP.DemoPlugIn.Resources;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TDemoPlugInResources = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoPlugInResources: TDemoPlugInResources;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  DemoPlugInResources := TDemoPlugInResources.Create(nil);

finalization
  FreeAndNil(DemoPlugInResources);

end.
