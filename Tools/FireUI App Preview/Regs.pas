unit Regs;

interface

uses
  System.Classes, FMX.Controls, FMX.ImgList;

implementation

initialization

  // Register here any component that is not previously registered by the framework

  RegisterClass(FMX.ImgList.TImageList);
  RegisterClass(FMX.Controls.TStyleBook);

end.
