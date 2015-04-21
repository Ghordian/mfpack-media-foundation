
unit avrt;
interface

{
  Automatically converted by H2Pas 1.0.0 from avrt.h
  The following command line parameters were used:
    -D
    -e
    -lavrt.dll
    -oavrt.pas
    avrt.h
}

    const
      External_library='-oavrt.pas'; {Setup as you need}

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  {++ BUILD Version: 0001    // Increment this if a change has global effects
  
  Copyright (c) Microsoft Corporation.  All rights reserved.
  
  Module Name:
  
      avrt.h
  
  Abstract:
  
      This module contains the multimedia class scheduler APIs and any public data
      structures needed to call these APIs.
  
  
  Author:
  
      Samer Arafeh (samera) 13-Jan-2005
  
  -- }
{$ifndef _AVRT_}
(** unsupported pragma#pragma option push -b -a8 -pc -A- /*P_O_Push*/*)
{$define _AVRT_}  
{$if _MSC_VER > 1000}
(** unsupported pragma#pragma once*)
{$endif}
{ C++ extern C conditionnal removed }
  { }
  { AvRt Priorities }
  { }

  type
    _AVRT_PRIORITY =  Longint;
    Const
      AVRT_PRIORITY_LOW = -(1);
      AVRT_PRIORITY_NORMAL = (-(1))+1;
      AVRT_PRIORITY_HIGH = (-(1))+2;
      AVRT_PRIORITY_CRITICAL = (-(1))+3;
;
    AVRT_PRIORITY = _AVRT_PRIORITY;
    PAVRT_PRIORITY = ^_AVRT_PRIORITY;
  { }
  {  Infinite timeout for a thread order group. }
  { }
(* error 
#define THREAD_ORDER_GROUP_INFINITE_TIMEOUT     (-1I64)
in define line 51 *)
    { }
    { Define API decoration for direct importing of DLL references. }
    { }
{$if !defined(_AVRT_)}

    const
      AVRTAPI = DECLSPEC_IMPORT;      
{$else}
{$define AVRTAPI}    
{$endif}
(* error 
WINAPI
(* error 
    __inout LPDWORD TaskIndex
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
(* error 
    __inout LPDWORD TaskIndex
 in declarator_list *)
 in declarator_list *)
{$ifdef UNICODE}

    const
      AvSetMmThreadCharacteristics = AvSetMmThreadCharacteristicsW;      
{$else}

    const
      AvSetMmThreadCharacteristics = AvSetMmThreadCharacteristicsA;      
{$endif}
    { !UNICODE }
(* error 
WINAPI
(* error 
    __in LPCSTR SecondTask,
(* error 
    __inout LPDWORD TaskIndex
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
(* error 
    __in LPCWSTR SecondTask,
(* error 
    __inout LPDWORD TaskIndex
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
{$ifdef UNICODE}

    const
      AvSetMmMaxThreadCharacteristics = AvSetMmMaxThreadCharacteristicsW;      
{$else}

    const
      AvSetMmMaxThreadCharacteristics = AvSetMmMaxThreadCharacteristicsA;      
{$endif}
    { !UNICODE }
(* error 
WINAPI
 in declarator_list *)
(* error 
WINAPI
(* error 
    __in AVRT_PRIORITY Priority
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
(* error 
    __in PLARGE_INTEGER Period,
(* error 
    __inout GUID *ThreadOrderingGuid,
(* error 
    __in_opt PLARGE_INTEGER Timeout
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
(* error 
    __in PLARGE_INTEGER Period,
(* error 
    __inout GUID *ThreadOrderingGuid,
(* error 
    __in_opt PLARGE_INTEGER Timeout,
(* error 
    __in LPCSTR TaskName
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
(* error 
    __in PLARGE_INTEGER Period,
(* error 
    __inout GUID *ThreadOrderingGuid,
(* error 
    __in_opt PLARGE_INTEGER Timeout,
(* error 
    __in LPCWSTR TaskName
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
{$ifdef UNICODE}

    const
      AvRtCreateThreadOrderingGroupEx = AvRtCreateThreadOrderingGroupExW;      
{$else}

    const
      AvRtCreateThreadOrderingGroupEx = AvRtCreateThreadOrderingGroupExA;      
{$endif}
    { !UNICODE }
(* error 
WINAPI
(* error 
    __in GUID *ThreadOrderingGuid,
(* error 
    __in BOOL Before
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
WINAPI
 in declarator_list *)
(* error 
WINAPI
 in declarator_list *)
(* error 
WINAPI
 in declarator_list *)
(* error 
WINAPI
(* error 
    __out PULONG SystemResponsivenessValue
 in declarator_list *)
 in declarator_list *)
{ C++ end of extern C conditionnal removed }
(** unsupported pragma#pragma option pop /*P_O_Pop*/*)
{$endif}
    { _AVRT_ }

implementation


end.
