// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: AudioPolicy.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.2
// Description: Requires Windows Vista or later. 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony
// EditDate: updt 010512a
//
//----------------------------------------------------------------------------
// Changes
//----------------------------------------------------------------------------
// Date
// ---------- ------------------ ---------------------------------------------
// 2012/12/19 Tony  (maXcomX)    modified some interfaces (Reported by eric.c.fortier, Oct 5, 2012)
//----------------------------------------------------------------------------
// Remarks:  Until now some WASAPI functions are implemented.
//           Future releases will be moved to the appropiate WASAPI header translations.
//
//           Delphi : The IUnknown entries of functions should be casted like this:
//                    IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: Compiler directives
// =============================================================================
// Source: audiopolicy.h
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

unit AudioPolicy;

interface

uses
	Windows, ComObj, PropSys
//* project units
, AudioClient
, AudioSessionTypes
;

const
  IID_IAudioSessionEvents               : TGUID = '{24918ACC-64B3-37C1-8CA9-74A66E9957A8}';
  IID_IAudioSessionControl              : TGUID = '{F4B1A599-7266-4319-A8CA-E70ACB11E8CD}';  // >= Vista
  IID_IAudioSessionControl2             : TGUID = '{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}';  // >= Windows 7
  IID_IAudioSessionManager              : TGUID = '{BFA971F1-4D5E-40BB-935E-967039BFBEE4}';  // >= Vista
  IID_IAudioSessionNotification         : TGUID = '{641DD20B-4D41-49CC-ABA3-174B9477BB08}';
  IID_IAudioSessionEnumerator           : TGUID = '{E2F5BB11-0570-40CA-ACDD-3AA01277DEE8}';
  IID_IAudioSessionManager2             : TGUID = '{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}';  // >= Windows 7


type
	// local
	_tagAudioSessionDisconnectReason        = (
    DisconnectReasonDeviceRemoval         = 0,
		DisconnectReasonServerShutdown        = (DisconnectReasonDeviceRemoval  + 1),
		DisconnectReasonFormatChanged         = (DisconnectReasonServerShutdown  + 1),
    DisconnectReasonSessionLogoff         = (DisconnectReasonFormatChanged  + 1),
		DisconnectReasonSessionDisconnected   = (DisconnectReasonSessionLogoff  + 1),
		DisconnectReasonExclusiveModeOverride = (DisconnectReasonSessionDisconnected  + 1)
  );
	{$EXTERNALSYM AudioSessionDisconnectReason}
	AudioSessionDisconnectReason = _tagAudioSessionDisconnectReason;


type
  //Forward Declarations

  {$EXTERNALSYM IAudioSessionEvents}
  IAudioSessionEvents = interface;
  {$EXTERNALSYM IAudioSessionControl}
  IAudioSessionControl = interface;     // >=Vista
  {$EXTERNALSYM IAudioSessionControl2}
  IAudioSessionControl2 = interface;    // >= Windows 7
  {$EXTERNALSYM IAudioSessionManager}
  IAudioSessionManager = interface;     // >=Vista
	{$EXTERNALSYM IAudioVolumeDuckNotification}
	IAudioVolumeDuckNotification = interface;
	{$EXTERNALSYM PIAudioVolumeDuckNotification}
	PIAudioVolumeDuckNotification = ^IAudioVolumeDuckNotification;
	{$EXTERNALSYM IAudioSessionNotification}
	IAudioSessionNotification = interface;
  {$EXTERNALSYM IAudioSessionEnumerator}
  IAudioSessionEnumerator = interface;
  {$EXTERNALSYM IAudioSessionManager2}
	IAudioSessionManager2 = interface;    // >= Windows 7


	//Interface IAudioSessionEvents
	IAudioSessionEvents = interface(IUnknown)
  ['{24918ACC-64B3-37C1-8CA9-74A66E9957A8}']
		function OnDisplayNameChanged(NewDisplayName: LPCWSTR; EventContext: PGuid): HResult; stdcall;
		function OnIconPathChanged(NewIconPath: LPCWSTR; EventContext: PGuid): HResult; stdcall;
		function OnSimpleVolumeChanged(NewVolume: Single; NewMute: LongBool; EventContext: PGuid): HResult; stdcall;
		function OnChannelVolumeChanged(ChannelCount: uint; NewChannelArray: PSingle; ChangedChannel: uint;
																    EventContext: PGuid): HResult; stdcall;
		function OnGroupingParamChanged(NewGroupingParam, EventContext: PGuid): HResult; stdcall;
		function OnStateChanged(NewState: AudioSessionState): HResult; stdcall;
		function OnSessionDisconnected(DisconnectReason: AudioSessionDisconnectReason): HResult; stdcall;
	end;

	//Interface IAudioSessionControl >= Vista
	IAudioSessionControl = interface(IUnknown)
	['{F4B1A599-7266-4319-A8CA-E70ACB11E8CD}']
		function GetState(out pRetVal: UINT): HResult; stdcall;
		function GetDisplayName(out pRetVal: LPWSTR): HResult; stdcall; // pRetVal must be freed by CoTaskMemFree
		function SetDisplayName(Value: LPCWSTR; EventContext: pGuid): HResult; stdcall;
		function GetIconPath(out pRetVal: LPWSTR): HResult; stdcall;    // pRetVal must be freed by CoTaskMemFree
		function SetIconPath(Value: LPCWSTR; EventContext: pGuid): HResult; stdcall;
		function GetGroupingParam(pRetVal: PGuid): HResult; stdcall;
		function SetGroupingParam(OverrideValue, EventContext: PGuid): HResult; stdcall;
		function RegisterAudioSessionNotification(const NewNotifications: IAudioSessionEvents): HResult; stdcall;
		function UnregisterAudioSessionNotification(const NewNotifications: IAudioSessionEvents): HResult; stdcall;
	end;

	//Interface IAudioVolumeDuckNotification >= Windows 7
	IAudioVolumeDuckNotification = interface(IUnknown)
	['{C3B284D4-6D39-4359-B3CF-B56DDB3BB39C}']
		function OnVolumeDuckNotification(const sessionID: LPCWSTR; const countCommunicationSessions: UINT32): HResult; stdcall;
		function OnVolumeUnduckNotification(const sessionID: LPCWSTR): HResult; stdcall;
	end;

	//Interface IAudioSessionControl2 >= Windows 7
	IAudioSessionControl2 = interface(IAudioSessionControl)
  ['{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}']
    function GetSessionIdentifier(out pRetVal: LPWSTR): Hresult; stdcall;
    function GetSessionInstanceIdentifier(out pRetVal: LPWSTR): Hresult; stdcall;
    function GetProcessId(out pRetVal: DWord): Hresult; stdcall;
    function IsSystemSoundsSession(): Hresult; stdcall;   //indicates whether the session is a system sounds session.
                                                          //S_OK = The session is a system sounds session.
                                                          //S_FALSE = The session is not a system sounds session.
    function SetDuckingPreference(const optOut: Boolean): Hresult; stdcall; //A BOOL variable that enables or disables system auto-ducking.
  end;


  //Interface IAudioSessionManager
  IAudioSessionManager = interface(IUnknown)
  ['{BFA971F1-4D5E-40BB-935E-967039BFBEE4}']
		function GetAudioSessionControl(AudioSessionGuid: PGuid; StreamFlag: UINT; out SessionControl: IAudioSessionControl): HResult; stdcall;
		function GetSimpleAudioVolume(AudioSessionGuid: PGuid; StreamFlag: UINT; out AudioVolume: ISimpleAudioVolume): HResult; stdcall;
	end;


  //Interface IAudioSessionNotification
	IAudioSessionNotification = interface(IUnknown)
  ['{641DD20B-4D41-49CC-ABA3-174B9477BB08}']
    function OnSessionCreated(const NewSession: IAudioSessionControl): HResult; stdcall;
  end;


  //Interface IAudioSessionEnumerator
  IAudioSessionEnumerator = interface(IUnknown)
  ['{E2F5BB11-0570-40CA-ACDD-3AA01277DEE8}']
    function GetCount(out SessionCount: integer): HResult; stdcall;
    function GetSession(const SessionCount: integer; out Session: IAudioSessionControl): HResult; stdcall;
  end;


  //Interface IAudioSessionManager2 >= Windows 7
  IAudioSessionManager2 = interface(IAudioSessionManager)
  ['{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}']
    function GetSessionEnumerator(out SessionEnum: IAudioSessionEnumerator): HResult; stdcall;
    function RegisterSessionNotification(SessionNotification: IAudioSessionNotification): HResult; stdcall;
    function UnregisterSessionNotification(SessionNotification: IAudioSessionNotification): HResult; stdcall;
    function RegisterDuckNotification(const sessionID: LPCWSTR; const duckNotification: IAudioVolumeDuckNotification): HResult; stdcall;
    function UnregisterDuckNotification(const duckNotification: IAudioVolumeDuckNotification): HResult; stdcall;
  end;

// Additional Prototypes for ALL interfaces
//
// End of Additional Prototypes

implementation

end.


