//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#include <System.IOUtils.hpp>
#include <FMX.DialogService.hpp>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"

TAudioRecPlayForm *AudioRecPlayForm;
//---------------------------------------------------------------------------
String __fastcall GetAudioFileName(const String AFileName)
{
#if defined(__ANDROID__)
	return IncludeTrailingPathDelimiter(System::Ioutils::TPath::GetTempPath()) + AFileName;
#else
	#if defined(TARGET_OS_IPHONE) || defined(TARGET_IPHONE_SIMULATOR)
	return IncludeTrailingPathDelimiter(System::Ioutils::TPath::GetDocumentsPath()) + AFileName;
	#else
	return System::Ioutils::TPath::Combine(System::Ioutils::TPath::GetTempPath(), AFileName);
	#endif
#endif
}
//---------------------------------------------------------------------------
__fastcall TAudioRecPlayForm::TAudioRecPlayForm(TComponent *Owner) : TForm(Owner),
#if defined(__ANDROID__) || defined(TARGET_OS_IPHONE) || defined(TARGET_IPHONE_SIMULATOR)
	AUDIO_FILENAME("test.caf")
#else
	AUDIO_FILENAME("test.wav")
#endif
{
	FFileName = GetAudioFileName(AUDIO_FILENAME);

	FMicrophone = TCaptureDeviceManager::Current->DefaultAudioCaptureDevice;
	FMicrophone->FileName = FFileName;
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::MicrophonePermissionRequest(TObject *Sender, const String Message, const bool AccessGranted)
{
	if (AccessGranted)
	{
		FMicrophone->StartCapture();
	}
	else
	{
		TDialogService::ShowMessage("Cannot record audio without the relevant permission being granted");
	}
}
//---------------------------------------------------------------------------
bool __fastcall TAudioRecPlayForm::IsMicrophoneRecording()
{
	return FMicrophone->State == TCaptureDeviceState::Capturing;
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::ActionListUpdate(TBasicAction *Action, bool &Handled)
{
	imgOn->Visible = IsMicrophoneRecording();

	actStartRecording->Enabled = !IsMicrophoneRecording();
	actStopRecording->Enabled = IsMicrophoneRecording();
	actStop->Enabled = (MediaPlayer->Media != NULL) && (MediaPlayer->State == TMediaState::Playing);
	actPlay->Enabled = FileExists(FFileName) && (MediaPlayer->State != TMediaState::Playing);
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::actPlayExecute(TObject *Sender)
{
	if (IsMicrophoneRecording())
	{
		actStopRecording->Execute();
	}

	MediaPlayer->FileName = FFileName;
	MediaPlayer->Play();
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::actStopExecute(TObject *Sender)
{
	MediaPlayer->Stop();
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::actStartRecordingExecute(TObject *Sender)
{
	actStop->Execute();

	// and attempt to record to 'test.caf' file
	FMicrophone->RequestPermission();
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::actStopRecordingExecute(TObject *Sender)
{
	// stop capturing audio from the microphone
	if (IsMicrophoneRecording())
    {
		FMicrophone->StopCapture();
	}
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::imgOffClick(TObject *Sender)
{
	actStartRecordingExecute(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TAudioRecPlayForm::imgOnClick(TObject *Sender)
{
	actStopRecordingExecute(Sender);
}
//---------------------------------------------------------------------------
