// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: Media Foundation interfaces - MMStream.pas
// Kind: Pascal Unit
// Release date: 11-07-2012
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later.
//
// Intiator(s): Tony (maXcomX), Peter (OzShips)
//
// LastEdited by: Tony
// EditDate: updt 080712a
//
// Remarks:   Delphi : The IUnknown entries of functions should be casted like this:
//            IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: Overall Check
// =============================================================================
// Source: mmstream.h
//
// Microsoft Windows Media Foundation
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

unit MMStream;

  {$MINENUMSIZE 4}
  {$WEAKPACKAGEUNIT}

interface

uses
  Windows, ComObj, Unknwn, ActiveX;


const
  IID_IMultiMediaStream                : TGUID = '{B502D1BC-9A57-11d0-8FDE-00C04FD9189D}';
  IID_IMediaStream                     : TGUID = '{B502D1BD-9A57-11d0-8FDE-00C04FD9189D}';
  IID_IStreamSample                    : TGUID = '{B502D1BE-9A57-11d0-8FDE-00C04FD9189D}';

type

{$EXTERNALSYM MS_ERROR_CODE}
function MS_ERROR_CODE(x: Cardinal): Cardinal;
begin
  Result:= MAKE_HRESULT(1, FACILITY_ITF, x + $400);
end;

{$EXTERNALSYM MS_SUCCESS_CODE}
function MS_SUCCESS_CODE(x: Cardinal): Cardinal;
begin
  Result:= MAKE_HRESULT(0, FACILITY_ITF, x);
end;


  {$EXTERNALSYM MS_S_PENDING}
  MS_S_PENDING                        = MS_SUCCESS_CODE(1);
  {$EXTERNALSYM MS_S_NOUPDATE}
  MS_S_NOUPDATE                       = MS_SUCCESS_CODE(2);
  {$EXTERNALSYM MS_S_ENDOFSTREAM}
  MS_S_ENDOFSTREAM                    = MS_SUCCESS_CODE(3);
  {$EXTERNALSYM MS_E_SAMPLEALLOC}
  MS_E_SAMPLEALLOC                    = MS_ERROR_CODE(1);
  {$EXTERNALSYM MS_E_PURPOSEID}
  MS_E_PURPOSEID                      = MS_ERROR_CODE(2);
  {$EXTERNALSYM MS_E_NOSTREAM}
  MS_E_NOSTREAM                       = MS_ERROR_CODE(3);
  {$EXTERNALSYM MS_E_NOSEEKING}
  MS_E_NOSEEKING                      = MS_ERROR_CODE(4);
  {$EXTERNALSYM MS_E_INCOMPATIBLE}
  MS_E_INCOMPATIBLE                   = MS_ERROR_CODE(5);
  {$EXTERNALSYM MS_E_BUSY}
  MS_E_BUSY                           = MS_ERROR_CODE(6);
  {$EXTERNALSYM MS_E_NOTINIT}
  MS_E_NOTINIT                        = MS_ERROR_CODE(7);
  {$EXTERNALSYM MS_E_SOURCEALREADYDEFINED}
  MS_E_SOURCEALREADYDEFINED           = MS_ERROR_CODE(8);
  {$EXTERNALSYM MS_E_INVALIDSTREAMTYPE}
  MS_E_INVALIDSTREAMTYPE              = MS_ERROR_CODE(9);
  {$EXTERNALSYM MS_E_NOTRUNNING}
  MS_E_NOTRUNNING                     = MS_ERROR_CODE(10);

const
  MSPID_PrimaryVideo                   : TGuid = '{A35FF56A-9FDA-11d0-8FDF-00C04FD9189D}';
  MSPID_PrimaryAudio                   : TGuid = '{A35FF56B-9FDA-11d0-8FDF-00C04FD9189D}';

type

  //#if(_WIN32_WINNT < 0x0400)
  //typedef void ( __stdcall *PAPCFUNC )(
  //    DWORD_PTR dwParam);
  //#endif

  PStreamTime = ^TStreamTime;
  {$EXTERNALSYM STREAM_TIME}
  STREAM_TIME = LONGLONG;
  TStreamTime = LONGLONG;

  PMspid = ^TMspid;
  {$EXTERNALSYM MSPID}
  MSPID = TGUID;
  TMspid = TGUID;

  PRefmspid = ^TRefmspid;
  {$EXTERNALSYM REFMSPID}
  REFMSPID = REFGUID;
  TRefmspid = REFGUID;


  PStreamType = ^TStreamType;
  cwSTREAM_TYPE = (
    STREAMTYPE_READ      = 0,
    STREAMTYPE_WRITE     = 1,
    STREAMTYPE_TRANSFORM = 2
  );
  {$EXTERNALSYM STREAM_TYPE}
  STREAM_TYPE = cwSTREAM_TYPE;
  TStreamType = cwSTREAM_TYPE;


  PStreamState = ^TStreamState;
  cwSTREAMSTATE_STOP = (
    STREAMSTATE_STOP = 0,
    STREAMSTATE_RUN  = 1
  );
  {$EXTERNALSYM STREAM_STATE}
  STREAM_STATE = cwSTREAMSTATE_STOP;
  TStreamState = cwSTREAMSTATE_STOP;

  PCompletionStatusFlags = ^TCompletionStatusFlags;
  cwCOMPLETION_STATUS_FLAGS = (
    COMPSTAT_NOUPDATEOK = $1,
    COMPSTAT_WAIT       = $2,
    COMPSTAT_ABORT      = $4
  );
  COMPLETION_STATUS_FLAGS = cwCOMPLETION_STATUS_FLAGS;
  TCompletionStatusFlags  = cwCOMPLETION_STATUS_FLAGS;


  cwMMSSF = (
    MMSSF_HASCLOCK	    = $1,
	  MMSSF_SUPPORTSEEK	  = $2,
	  MMSSF_ASYNCHRONOUS	= $4
    );
  MMSSF = cwMMSSF;

  cwSSUPDATE = (
    SSUPDATE_ASYNC	    = $1,
	  SSUPDATE_CONTINUOUS	= $2
    );
  SSUPDATE = cwSSUPDATE;


type

  //Forward Interface Declarations
  {$EXTERNALSYM IMultiMediaStream}
  IMultiMediaStream = interface;
  {$EXTERNALSYM IMediaStream}
  IMediaStream = interface;
  {$EXTERNALSYM IStreamSample}
  IStreamSample = interface;


  // INTERFACES ////////////////////////////////////////////////////////////////


  //Interface IMultiMediaStream
  IMultiMediaStream = interface(IUnknown)
  ['{B502D1BC-9A57-11d0-8FDE-00C04FD9189D}']
    function GetInformation(out pdwFlags: DWORD; out pStreamType: STREAM_TYPE): HResult; stdcall;
    function GetMediaStream(const idPurpose: REFMSPID; out pMediaStream: PIMediaStream): HResult; stdcall;
    function EnumMediaStreams(const Index: Longint; out ppMediaStream: PIMediaStream): HResult; stdcall;
    function GetState(out pCurrentState: STREAM_STATE ): HResult; stdcall;
    function SetState(const NewState: STREAM_STATE): HResult; stdcall;
    function GetTime(out pCurrentTime: STREAM_TIME): HResult; stdcall;
    function GetDuration(pDuration: STREAM_TIME): HResult; stdcall;
    function Seek(const SeekTime: STREAM_TIME): HResult; stdcall;
    function GetEndOfStreamEventHandle(out phEOS: THandle): HResult; stdcall;
  end;

  //Interface IMediaStream
  IMediaStream = interface(IUnknown)
  ['{B502D1BD-9A57-11d0-8FDE-00C04FD9189D}']
    function GetMultiMediaStream(out var ppMultiMediaStream: PIMultiMediaStream ): HResult; stdcall;
    function GetInformation(out pPurposeId: MSPID; out pType: STREAM_TYPE): HResult; stdcall;
    function SetSameFormat(const pStreamThatHasDesiredFormat: IMediaStream; const dwFlags: DWORD): HResult; stdcall;
    function AllocateSample(const dwFlags: DWORD; out ppSample: PIStreamSample): HResult; stdcall;
    function CreateSharedSample(const pExistingSample: IStreamSample; const dwFlags: DWORD; out ppNewSample: PIStreamSample): HResult; stdcall;
    function SendEndOfStream(const dwFlags: DWORD): HResult; stdcall;
  end;

  //Interface IStreamSample
  IMediaStream = interface(IUnknown)
  ['{B502D1BE-9A57-11d0-8FDE-00C04FD9189D}']
    function GetMediaStream(const ppMediaStream: PIMediaStream): HResult; winapi;
    function GetSampleTimes(out pStartTime: STREAM_TIME; out var pEndTime: STREAM_TIME; out pCurrentTime: STREAM_TIME): HResult; winapi;
    function SetSampleTimes(const pStartTime: STREAM_TIME; const pEndTime: STREAM_TIME): HResult; winapi;
    function Update(const dwFlags: DWORD; const hEvent: HANDLE; const pfnAPC: PAPCFUNC; const dwAPCData: DWORD_PTR): HResult; winapi;
    function CompletionStatus(const dwFlags: DWORD; const dwMilliseconds: DWORD): HResult; winapi;
  end;



// Additional Prototypes for ALL interfaces

// end of Additional Prototypes


implementation

end.
