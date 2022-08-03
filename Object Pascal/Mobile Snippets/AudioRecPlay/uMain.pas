//---------------------------------------------------------------------------

// This software is Copyright (c) 2015-2019 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Media, FMX.StdCtrls,
  FMX.Objects, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Effects, FMX.Filter.Effects;

const
{$IF DEFINED(ANDROID) OR DEFINED(IOS)}
  AUDIO_FILENAME = 'test.caf';
{$ELSE}
  AUDIO_FILENAME = 'test.wav';
{$ENDIF}

type
  TAudioRecPlayForm = class(TForm)
    btnStartRec: TButton;
    btnStopRec: TButton;
    btnStartPlay: TButton;
    btnStopPlay: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    imgOff: TImage;
    imgOn: TImage;
    MediaPlayer: TMediaPlayer;
    ActionList: TActionList;
    actStartRecording: TAction;
    actStopRecording: TAction;
    actPlay: TAction;
    actStop: TAction;
    InvertEffect1: TInvertEffect;
    InvertEffect2: TInvertEffect;

    procedure FormCreate(Sender: TObject);
    procedure actStartRecordingExecute(Sender: TObject);
    procedure actStopRecordingExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure actPlayExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure imgOnClick(Sender: TObject);
    procedure imgOffClick(Sender: TObject);
  private
    FFileName: string;
    FMicrophone: TAudioCaptureDevice;

    function IsMicrophoneRecording: Boolean;
    procedure MicrophonePermissionRequest(Sender: TObject; const &Message: string; const AccessGranted: Boolean);
  end;

var
  AudioRecPlayForm: TAudioRecPlayForm;

implementation

uses
  {$IFDEF IOS}
  iOSapi.UIKit, FMX.Helpers.iOS,
  {$ENDIF}
  System.IOUtils, FMX.DialogService;

{$R *.fmx}

{ GetAudioFileName resolves the audio file path for either platform. }

function GetAudioFileName(const AFileName: string): string;
begin
{$IFDEF ANDROID}
  Result := TPath.GetTempPath + '/' + AFileName;
{$ELSE}
  {$IFDEF IOS}
    Result := TPath.GetHomePath + '/Documents/' + AFileName;
  {$ELSE}
    Result := TPath.Combine(TPath.GetTempPath, AFileName);
  {$ENDIF}
{$ENDIF}
end;

procedure TAudioRecPlayForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  { Provide feedback on capture on/off}

  imgOn.Visible := IsMicrophoneRecording;

  { ... and enable buttons accordingly }

  actStartRecording.Enabled := not IsMicrophoneRecording;
  actStopRecording.Enabled := IsMicrophoneRecording;
  actStop.Enabled := Assigned(MediaPlayer.Media) and (MediaPlayer.State = TMediaState.Playing);
  actPlay.Enabled := FileExists(FFileName) and (MediaPlayer.State <> TMediaState.Playing);
end;

procedure TAudioRecPlayForm.actPlayExecute(Sender: TObject);
begin
  if IsMicrophoneRecording then
    actStopRecording.Execute;

  MediaPlayer.FileName := FFileName;
  MediaPlayer.Play;
end;

procedure TAudioRecPlayForm.actStartRecordingExecute(Sender: TObject);
begin
  actStop.Execute;

  { and attempt to record to 'test.caf' file }
  FMicrophone.RequestPermission;
end;

procedure TAudioRecPlayForm.MicrophonePermissionRequest(Sender: TObject; const &Message: string; const AccessGranted: Boolean);
begin
  if AccessGranted then
    FMicrophone.StartCapture
  else
    TDialogService.ShowMessage('Cannot record audio without the relevant permission being granted');
end;

procedure TAudioRecPlayForm.actStopExecute(Sender: TObject);
begin
  MediaPlayer.Stop;
end;

procedure TAudioRecPlayForm.actStopRecordingExecute(Sender: TObject);
begin
  { stop capturing audio from the microphone }
  if IsMicrophoneRecording then
    FMicrophone.StopCapture;
end;

procedure TAudioRecPlayForm.imgOffClick(Sender: TObject);
begin
  { we want the same functionality as clicking the recording button }
  actStartRecording.Execute;
end;

procedure TAudioRecPlayForm.imgOnClick(Sender: TObject);
begin
  actStopRecording.Execute;
end;

procedure TAudioRecPlayForm.FormCreate(Sender: TObject);
begin
  FFileName := GetAudioFileName(AUDIO_FILENAME);

  { get the microphone device }
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  FMicrophone.FileName := FFileName;
  FMicrophone.OnPermissionRequest := MicrophonePermissionRequest;

{$IFDEF IOS}
  if GetUserInterfaceStyle = UIUserInterfaceStyleDark then
  begin
    InvertEffect1.Enabled := True;
    InvertEffect2.Enabled := True;
  end;
{$ENDIF}
end;

function TAudioRecPlayForm.IsMicrophoneRecording: Boolean;
begin
  Result := FMicrophone.State = TCaptureDeviceState.Capturing;
end;

end.
