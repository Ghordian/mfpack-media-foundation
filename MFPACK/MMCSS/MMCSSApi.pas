unit MMCSSApi;

interface

uses WinType;

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

  { }
  { AvRt Priorities }
  { }

type
	{$EXTERNALSYM AVRT_PRIORITY}
  _AVRT_PRIORITY = (
    AVRT_PRIORITY_LOW      = -1,
    AVRT_PRIORITY_NORMAL   = (AVRT_PRIORITY_LOW + 1),
    AVRT_PRIORITY_HIGH     = (AVRT_PRIORITY_NORMAL + 1),
    AVRT_PRIORITY_CRITICAL = (AVRT_PRIORITY_HIGH + 1)
  );

  AVRT_PRIORITY = _AVRT_PRIORITY;
  PAVRT_PRIORITY = ^_AVRT_PRIORITY;

  { }
  {  Infinite timeout for a thread order group. }
  { }
  const THREAD_ORDER_GROUP_INFINITE_TIMEOUT : int64 = (-1);

  { }
  { Define API decoration for direct importing of DLL references. }
  { }

//* 0001
//AVRTAPI
//BOOL
//WINAPI
//AvQuerySystemResponsiveness (
//    __in HANDLE AvrtHandle,
//    __out PULONG SystemResponsivenessValue
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681961(v=vs.85).aspx
function AvQuerySystemResponsiveness(AvrtHandle: HANDLE; var SystemResponsivenessValue: ULONG): BOOL; stdcall;

//* 0002
//AVRTAPI
//BOOL
//WINAPI
//AvRevertMmThreadCharacteristics (
//    __in HANDLE AvrtHandle
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681961(v=vs.85).aspx
function AvRevertMmThreadCharacteristics(AvrtHandle: HANDLE): BOOL; stdcall;

//* 0003
//AVRTAPI
//BOOL
//WINAPI
//AvRtCreateThreadOrderingGroup (
//    __out PHANDLE Context,
//    __in PLARGE_INTEGER Period,
//    __inout GUID *ThreadOrderingGuid,
//    __in_opt PLARGE_INTEGER Timeout
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681962(v=vs.85).aspx
function AvRtCreateThreadOrderingGroup(out Context: HANDLE; Period: PLARGE_INTEGER; var ThreadOrderingGuid: PGUID; Timeout: PLARGE_INTEGER): BOOL; stdcall;

//* 0004
//AVRTAPI
//BOOL
//WINAPI
//AvRtCreateThreadOrderingGroupExA (
//    __out PHANDLE Context,
//    __in PLARGE_INTEGER Period,
//    __inout GUID *ThreadOrderingGuid,
//    __in_opt PLARGE_INTEGER Timeout,
//    __in LPCSTR TaskName
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681963(v=vs.85).aspx
function AvRtCreateThreadOrderingGroupExA(out Context: HANDLE; Period: PLARGE_INTEGER; var ThreadOrderingGuid: PGUID; Timeout: PLARGE_INTEGER; TaskName : PAnsiChar ): BOOL; stdcall;
//* 0005
//AVRTAPI
//BOOL
//WINAPI
//AvRtCreateThreadOrderingGroupExW (
//    __out PHANDLE Context,
//    __in PLARGE_INTEGER Period,
//    __inout GUID *ThreadOrderingGuid,
//    __in_opt PLARGE_INTEGER Timeout,
//    __in LPCWSTR TaskName
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681963(v=vs.85).aspx
function AvRtCreateThreadOrderingGroupExW(out Context: HANDLE; Period: PLARGE_INTEGER; var ThreadOrderingGuid: PGUID; Timeout: PLARGE_INTEGER; TaskName : PWideChar ): BOOL; stdcall;

//* 0006
//AVRTAPI
//BOOL
//WINAPI
//AvRtDeleteThreadOrderingGroup (
//    __in HANDLE Context
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681964(v=vs.85).aspx
function AvRtDeleteThreadOrderingGroup(Context: HANDLE): BOOL; stdcall;

//* 0007
//AVRTAPI
//BOOL
//WINAPI
//AvRtJoinThreadOrderingGroup (
//    __out PHANDLE Context,
//    __in GUID *ThreadOrderingGuid,
//    __in BOOL Before
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681966(v=vs.85).aspx
function AvRtJoinThreadOrderingGroup(var Context: HANDLE; ThreadOrderingGuid: PGUID; Before: BOOL): BOOL; stdcall;

//* 0008
//AVRTAPI
//BOOL
//WINAPI
//AvRtLeaveThreadOrderingGroup (
//    __in HANDLE Context
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681969(v=vs.85).aspx
function AvRtLeaveThreadOrderingGroup(Context: HANDLE): BOOL; stdcall;

//* 0009
//AVRTAPI
//BOOL
//WINAPI
//AvRtWaitOnThreadOrderingGroup (
//    __in HANDLE Context
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681971(v=vs.85).aspx
function AvRtWaitOnThreadOrderingGroup(Context: HANDLE): BOOL; stdcall;

//* 0010
//AVRTAPI
//HANDLE
//WINAPI
//AvSetMmMaxThreadCharacteristicsA (
//    __in LPCSTR FirstTask,
//    __in LPCSTR SecondTask,
//    __inout LPDWORD TaskIndex
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681973(v=vs.85).aspx
function AvSetMmMaxThreadCharacteristicsA (FirstTask : PAnsiChar; SecondTask : PAnsiChar; var TaskIndex : DWORD ) : HANDLE; stdcall;
//* 0011
//AVRTAPI
//HANDLE
//WINAPI
//AvSetMmMaxThreadCharacteristicsW (
//    __in LPCWSTR FirstTask,
//    __in LPCWSTR SecondTask,
//    __inout LPDWORD TaskIndex
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681973(v=vs.85).aspx
function AvSetMmMaxThreadCharacteristicsW (FirstTask : PWideChar; SecondTask : PWideChar; var TaskIndex : DWORD ) : HANDLE; stdcall;

//* 0012
//AVRTAPI
//HANDLE
//WINAPI
//AvSetMmThreadCharacteristicsA (
//    __in LPCSTR TaskName,
//    __inout LPDWORD TaskIndex
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681974(v=vs.85).aspx
function AvSetMmThreadCharacteristicsA (TaskName : PAnsiChar; var TaskIndex: DWORD): HANDLE; stdcall;
//* 0013
//AVRTAPI
//HANDLE
//WINAPI
//AvSetMmThreadCharacteristicsW (
//    __in LPCWSTR TaskName,
//    __inout LPDWORD TaskIndex
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681974(v=vs.85).aspx
function AvSetMmThreadCharacteristicsW (TaskName : PWideChar; var TaskIndex: DWORD): HANDLE; stdcall;

//* 0014
//AVRTAPI
//BOOL
//WINAPI
//AvSetMmThreadPriority (
//    __in HANDLE AvrtHandle,
//    __in AVRT_PRIORITY Priority
//    );
// https://msdn.microsoft.com/en-us/library/windows/desktop/ms681975(v=vs.85).aspx
function AvSetMmThreadPriority(AvrtHandle: HANDLE; Priority: AVRT_PRIORITY): BOOL; stdcall;

implementation

const
  MMCSSApiModuleName = 'avrt.dll';

//* 0001
function AvQuerySystemResponsiveness; external MMCSSApiModuleName name 'AvQuerySystemResponsiveness';
//* 0002
function AvRevertMmThreadCharacteristics; external MMCSSApiModuleName name 'AvRevertMmThreadCharacteristics';
//* 0003
function AvRtCreateThreadOrderingGroup; external MMCSSApiModuleName name 'AvRtCreateThreadOrderingGroup';
//* 0004
function AvRtCreateThreadOrderingGroupExA; external MMCSSApiModuleName name 'AvRtCreateThreadOrderingGroupExA';
//* 0005
function AvRtCreateThreadOrderingGroupExW; external MMCSSApiModuleName name 'AvRtCreateThreadOrderingGroupExW';
//* 0006
function AvRtDeleteThreadOrderingGroup; external MMCSSApiModuleName name 'AvRtDeleteThreadOrderingGroup';
//* 0007
function AvRtJoinThreadOrderingGroup; external MMCSSApiModuleName name 'AvRtJoinThreadOrderingGroup';
//* 0008
function AvRtLeaveThreadOrderingGroup; external MMCSSApiModuleName name 'AvRtLeaveThreadOrderingGroup';
//* 0009
function AvRtWaitOnThreadOrderingGroup; external MMCSSApiModuleName name 'AvRtWaitOnThreadOrderingGroup';
//* 0010
function AvSetMmMaxThreadCharacteristicsA; external MMCSSApiModuleName name 'AvSetMmMaxThreadCharacteristicsA';
//* 0011
function AvSetMmMaxThreadCharacteristicsW; external MMCSSApiModuleName name 'AvSetMmMaxThreadCharacteristicsW';
//* 0012
function AvSetMmThreadCharacteristicsA; external MMCSSApiModuleName name 'AvSetMmThreadCharacteristicsA';
//* 0013
function AvSetMmThreadCharacteristicsW; external MMCSSApiModuleName name 'AvSetMmThreadCharacteristicsW';
//* 0014
function AvSetMmThreadPriority; external MMCSSApiModuleName name 'AvSetMmThreadPriority';

end.
