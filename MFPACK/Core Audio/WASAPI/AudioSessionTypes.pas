// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: AudioSessionTypes.pas
// Kind: Pascal Unit
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later.  
//              Type definitions used by the audio session manager RPC/COM interfaces. 
// 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony
// EditDate: updt 240512a
//
// Remarks:
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: -
// =============================================================================
// Source: audiosessiontypes.h
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

unit AudioSessionTypes;

	{$MINENUMSIZE 4}
	{$WEAKPACKAGEUNIT}

interface

uses
	Windows;

//-------------------------------------------------------------------------
// Description: AudioClient share mode
//                                   
//     AUDCLNT_SHAREMODE_SHARED -    The device will be opened in shared mode and use the 
//                                   WAS format.
//     AUDCLNT_SHAREMODE_EXCLUSIVE - The device will be opened in exclusive mode and use the 
//                                   application specified format.
//
type
	{$EXTERNALSYM _AUDCLNT_SHAREMODE}
  _AUDCLNT_SHAREMODE = (
		AUDCLNT_SHAREMODE_SHARED,
		AUDCLNT_SHAREMODE_EXCLUSIVE
  );
	{$EXTERNALSYM AUDCLNT_SHAREMODE}
	AUDCLNT_SHAREMODE = _AUDCLNT_SHAREMODE;

//-------------------------------------------------------------------------
// Description: AudioClient stream flags
//
// Can be a combination of AUDCLNT_STREAMFLAGS and AUDCLNT_SYSFXFLAGS:
//
// AUDCLNT_STREAMFLAGS (this group of flags uses the high word,
// w/exception of high-bit which is reserved, 0x7FFF0000):
//
//                                  
//     AUDCLNT_STREAMFLAGS_CROSSPROCESS - Audio policy control for this stream will be shared with 
//                                        with other process sessions that use the same audio session 
//                                        GUID.
//     AUDCLNT_STREAMFLAGS_LOOPBACK -     Initializes a renderer endpoint for a loopback audio application. 
//                                        In this mode, a capture stream will be opened on the specified 
//                                        renderer endpoint. Shared mode and a renderer endpoint is required.
//                                        Otherwise the IAudioClient::Initialize call will fail. If the 
//                                        initialize is successful, a capture stream will be available 
//                                        from the IAudioClient object.
//
//     AUDCLNT_STREAMFLAGS_EVENTCALLBACK - An exclusive mode client will supply an event handle that will be
//                                         signaled when an IRP completes (or a waveRT buffer completes) telling
//                                         it to fill the next buffer
//
//     AUDCLNT_STREAMFLAGS_NOPERSIST -     Session state will not be persisted
//
//     AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED -       Session expires when there are no streams and no owning
//                                                    session controls.
//
//     AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE -            Don't show volume control in the Volume Mixer.
//
//     AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED - Don't show volume control in the Volume Mixer after the
//                                                    session expires.
//
// AUDCLNT_SYSFXFLAGS (these flags use low word 0x0000FFFF):
//
//     none defined currently
//
const
	AUDCLNT_STREAMFLAGS_CROSSPROCESS    					= $00010000;
	AUDCLNT_STREAMFLAGS_LOOPBACK       	 					= $00020000;
	AUDCLNT_STREAMFLAGS_EVENTCALLBACK   					= $00040000;
	AUDCLNT_STREAMFLAGS_NOPERSIST      	 					= $00080000;
	AUDCLNT_STREAMFLAGS_RATEADJUST      					= $00100000;
	AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED				= $10000000;
	AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE   					= $20000000;
	AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED	= $40000000;

//-------------------------------------------------------------------------
// Description: AudioSession State.
//
//      AudioSessionStateInactive - The session has no active audio streams.
//      AudioSessionStateActive - The session has active audio streams.
//      AudioSessionStateExpired - The session is dormant.
type

	{$EXTERNALSYM _AudioSessionState}
	_AudioSessionState          = (
		AudioSessionStateInactive = 0,
		AudioSessionStateActive   = 1,
    AudioSessionStateExpired  = 2
  );
  {$EXTERNALSYM AudioSessionState}
  AudioSessionState = _AudioSessionState;

implementation

end.
