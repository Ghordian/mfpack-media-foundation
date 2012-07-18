// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: MMDeviceApi.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.3
// Description: Requires Windows Vista or later. 
//              EndpointVolume API enables specialized 
//              clients to control and monitor the volume levels of audio 
//              endpoint devices. 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony
// EditDate: updt 010712b
//
// Remarks:  Pay close attention for supported platforms (ie Vista or Win 7/9).
//
//          Delphi : The IUnknown entries of functions should be casted like this:
//                   IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: Implement predefined helper-functions
// =============================================================================
// Source: endpointvolume.h
//
// Copyright (c) 1997-2012 Microsoft Corporation. All rights reserved
//==============================================================================
// The contents of this file are subject to the Mozilla Public
// License Version 1.1 (the "License"). you may not use this file
// except in compliance with the License. You may obtain a copy of
// the License at http://www.mozilla.org/MPL/MPL-1.1.html
//
// Software distributed under the License is distributed on an
// "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
// implied. See the License for the specific language governing
// rights and limitations under the License.
//==============================================================================

unit EndpointVolume;

interface

uses
  Windows, ComObj, DeviceTopology;

const
  IID_IAudioEndpointVolumeCallback      : TGUID = '{657804FA-D6AD-4496-8A60-352752AF4F89}';
  IID_IAudioEndpointVolume              : TGUID = '{5CDF2C82-841E-4546-9722-0CF74078229A}';
  IID_IAudioEndpointVolumeEx            : TGUID = '{66E11784-F695-4F28-A505-A7080081A78F}';
	IID_IAudioMeterInformation            : TGUID = '{C02216F6-8C67-4B5B-9D00-D008E73E0064}';


  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_VOLUME}
  ENDPOINT_HARDWARE_SUPPORT_VOLUME    = $00000001;
  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_MUTE}
  ENDPOINT_HARDWARE_SUPPORT_MUTE      = $00000002;
  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_METER}
  ENDPOINT_HARDWARE_SUPPORT_METER     = $00000004;

type
// Forward Declarations */

	PIAudioEndpointVolumeCallback = ^IAudioEndpointVolumeCallback;
  {$EXTERNALSYM IAudioEndpointVolumeCallback}
  IAudioEndpointVolumeCallback = interface;
  {$EXTERNALSYM IAudioEndpointVolume}
  IAudioEndpointVolume = interface;
  {$EXTERNALSYM IAudioEndpointVolumeEx}
  IAudioEndpointVolumeEx = interface;
  {$EXTERNALSYM IAudioMeterInformation}
  IAudioMeterInformation = interface;

  {$EXTERNALSYM AUDIO_VOLUME_NOTIFICATION_DATA}
  cwAUDIO_VOLUME_NOTIFICATION_DATA = record
    guidEventContext: TGUID;
    bMuted: BOOL;
    fMasterVolume: Single;
    nChannels: UINT;
    afChannelVolumes: array[0..0] of Single;
  end;
  AUDIO_VOLUME_NOTIFICATION_DATA = cwAUDIO_VOLUME_NOTIFICATION_DATA;
  {$EXTERNALSYM PAUDIO_VOLUME_NOTIFICATION_DATA}
  PAUDIO_VOLUME_NOTIFICATION_DATA = ^cwAUDIO_VOLUME_NOTIFICATION_DATA;

  //INTERFACES

  // interface IAudioEndpointVolumeCallback */
  IAudioEndpointVolumeCallback = interface(IUnknown)
  ['{657804FA-D6AD-4496-8A60-352752AF4F89}']
		function OnNotify(pNotify: PAUDIO_VOLUME_NOTIFICATION_DATA): HRESULT; stdcall;
	end;

  //>= Vista
  IAudioEndpointVolume = interface(IUnknown)
  ['{5CDF2C82-841E-4546-9722-0CF74078229A}']
		function RegisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;
		function UnregisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;
		function GetChannelCount(var pnChannelCount: UINT): HRESULT; stdcall;
		function SetMasterVolumeLevel(fLevelDB: Single; pguidEventContext:PGuid): HRESULT; stdcall;
		function SetMasterVolumeLevelScalar(fLevel: Single; pguidEventContext:PGuid): HRESULT; stdcall;
		function GetMasterVolumeLevel(var pfLevelDB: Single): HRESULT; stdcall;
		function GetMasterVolumeLevelScalar(var pfLevel: Single): HRESULT; stdcall;
		function SetChannelVolumeLevel(nChannel: uint; fLevelDB: Single; pguidEventContext: PGuid): HRESULT; stdcall;
		function SetChannelVolumeLevelScalar(nChannel: UINT; fLevel: Single; pguidEventContext: PGuid): HRESULT; stdcall;
		function GetChannelVolumeLevel(nChannel: UINT; fLevelDB: Single): HRESULT; stdcall;
		function GetChannelVolumeLevelScalar(nChannel: UINT; fLevel: Single): HRESULT; stdcall;
		//Original Delphi implementation : this will not work because a C++ BOOL = 4 bytes, Delphi Bool = 1 byte
		//function SetMute(bMute: bool; pguidEventContext: PGuid): HRESULT; stdcall;
		//function GetMute(var pbMute: bool): HRESULT; stdcall;
		//Improved functions  (See: CBOOL function @ Win78Mixer.pas)
		function SetMute(bMute: DWORD; pguidEventContext: PGuid): HRESULT; stdcall;
		function GetMute(var pbMute: DWORD): HRESULT; stdcall;

		function GetVolumeStepInfo(var pnStep: uint; var pnStepCount: uint): HRESULT; stdcall;
		function VolumeStepUp(pguidEventContext: PGuid): HRESULT; stdcall;
		function VolumeStepDown(pguidEventContext: PGuid): HRESULT; stdcall;
		function QueryHardwareSupport(var pdwHardwareSupportMask: uint): HRESULT; stdcall;
		function GetVolumeRange(var pflVolumeMindB: Single; var pflVolumeMaxdB: Single; var pflVolumeIncrementdB: Single): HRESULT; stdcall;
	end;

  //Interface IAudioEndpointVolumeEx >= Windows 7
  IAudioEndpointVolumeEx = interface(IUnknown)
  ['{66E11784-F695-4F28-A505-A7080081A78F}']
		function GetVolumeRangeChannel(const iChannel: UINT; out pflVolumeMinDB: Single; out pflVolumeMaxDB: Single; out pflVolumeIncrementDB: Single): HRESULT; stdcall;
	end;

  // interface IAudioMeterInformation
  IAudioMeterInformation = interface(IUnknown)
	['{C02216F6-8C67-4B5B-9D00-D008E73E0064}']
		function GetPeakValue(out pfPeak: Single): HResult; stdcall;
		function GetMeteringChannelCount(out pnChannelCount: UINT): HResult; stdcall;
		function GetChannelsPeakValues(u32ChannelCount: uint; afPeakValues: pSingle): HResult; stdcall;
		//Use this on special needs ie you want to create and use a custom software peakmeter.
		//by default: If hardware does not support a peakmeter, the system will create and use a software peakmeter automaticly.
		function QueryHardwareSupport(out pdwHardwareSupportMask: UINT): HResult; stdcall;
	end;


implementation


end.
