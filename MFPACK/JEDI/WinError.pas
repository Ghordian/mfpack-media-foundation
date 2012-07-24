{******************************************************************}
{                                                       	   }
{       Borland Delphi Runtime Library                  	   }
{       AccCtrl interface unit                                     }
{ 								   }
{ Portions created by Microsoft are 				   }
{ Copyright (C) 1995-1999 Microsoft Corporation. 		   }
{ All Rights Reserved. 						   }
{ 								   }
{ The original file is: winerror.h, released June 2000. 	   }
{ The original Pascal code is: WinError.pas, released Dec 2000     }
{ The initial developer of the Pascal code is Marcel van Brakel    }
{ (brakelm@bart.nl).                      			   }
{ 								   }
{ Portions created by Marcel van Brakel are			   }
{ Copyright (C) 1999 Marcel van Brakel.				   }
{ 								   }
{ Obtained through:                               	           }
{ Joint Endeavour of Delphi Innovators (Project JEDI)              }
{								   }
{ You may retrieve the latest version of this file at the Project  }
{ JEDI home page, located at http://delphi-jedi.org                }
{								   }
{ The contents of this file are used with permission, subject to   }
{ the Mozilla Public License Version 1.1 (the "License"); you may  }
{ not use this file except in compliance with the License. You may }
{ obtain a copy of the License at                                  }
{ http://www.mozilla.org/MPL/MPL-1.1.html 	                   }
{                                                                  }
{ Software distributed under the License is distributed on an 	   }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied. See the License for the specific language governing     }
{ rights and limitations under the License. 			   }
{ 								   }
{******************************************************************}

unit WinError;

{$WEAKPACKAGEUNIT}

{$HPPEMIT ''}
{$HPPEMIT '#include "WinError.h"'}
{$HPPEMIT ''}

{$I WINDEFINES.INC}

interface

uses
  WinType;

const
  APPLICATION_ERROR_MASK       = $20000000;
  {$EXTERNALSYM APPLICATION_ERROR_MASK}
  ERROR_SEVERITY_SUCCESS       = $00000000;
  {$EXTERNALSYM ERROR_SEVERITY_SUCCESS}
  ERROR_SEVERITY_INFORMATIONAL = $40000000;
  {$EXTERNALSYM ERROR_SEVERITY_INFORMATIONAL}
  ERROR_SEVERITY_WARNING       = DWORD($80000000);
  {$EXTERNALSYM ERROR_SEVERITY_WARNING}
  ERROR_SEVERITY_ERROR         = DWORD($C0000000);
  {$EXTERNALSYM ERROR_SEVERITY_ERROR}

//
//  Values are 32 bit values layed out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//

const
  FACILITY_WINDOWS     = 8;
  {$EXTERNALSYM FACILITY_WINDOWS}
  FACILITY_URT         = 19;
  {$EXTERNALSYM FACILITY_URT}
  FACILITY_STORAGE     = 3;
  {$EXTERNALSYM FACILITY_STORAGE}
  FACILITY_SSPI        = 9;
  {$EXTERNALSYM FACILITY_SSPI}
  FACILITY_SCARD       = 16;
  {$EXTERNALSYM FACILITY_SCARD}
  FACILITY_SETUPAPI    = 15;
  {$EXTERNALSYM FACILITY_SETUPAPI}
  FACILITY_SECURITY    = 9;
  {$EXTERNALSYM FACILITY_SECURITY}
  FACILITY_RPC         = 1;
  {$EXTERNALSYM FACILITY_RPC}
  FACILITY_WIN32       = 7;
  {$EXTERNALSYM FACILITY_WIN32}
  FACILITY_CONTROL     = 10;
  {$EXTERNALSYM FACILITY_CONTROL}
  FACILITY_NULL        = 0;
  {$EXTERNALSYM FACILITY_NULL}
  FACILITY_MSMQ        = 14;
  {$EXTERNALSYM FACILITY_MSMQ}
  FACILITY_MEDIASERVER = 13;
  {$EXTERNALSYM FACILITY_MEDIASERVER}
  FACILITY_INTERNET    = 12;
  {$EXTERNALSYM FACILITY_INTERNET}
  FACILITY_ITF         = 4;
  {$EXTERNALSYM FACILITY_ITF}
  FACILITY_DISPATCH    = 2;
  {$EXTERNALSYM FACILITY_DISPATCH}
  FACILITY_COMPLUS     = 17;
  {$EXTERNALSYM FACILITY_COMPLUS}
  FACILITY_CERT        = 11;
  {$EXTERNALSYM FACILITY_CERT}
  FACILITY_ACS         = 20;
  {$EXTERNALSYM FACILITY_ACS}
  FACILITY_AAF         = 18;
  {$EXTERNALSYM FACILITY_AAF}

//
// Define the severity codes
//


//
// MessageId: ERROR_SUCCESS
//
// MessageText:
//
//  The operation completed successfully.
//
  ERROR_SUCCESS = 0;
  {$EXTERNALSYM ERROR_SUCCESS}

  NO_ERROR = 0; // dderror
  {$EXTERNALSYM NO_ERROR}
  SEC_E_OK = HRESULT($00000000);
  {$EXTERNALSYM SEC_E_OK}

//
// MessageId: ERROR_INVALID_FUNCTION
//
// MessageText:
//
//  Incorrect function.
//

  ERROR_INVALID_FUNCTION = 1; // dderror
  {$EXTERNALSYM ERROR_INVALID_FUNCTION}

//
// MessageId: ERROR_FILE_NOT_FOUND
//
// MessageText:
//
//  The system cannot find the file specified.
//

  ERROR_FILE_NOT_FOUND = 2;
  {$EXTERNALSYM ERROR_FILE_NOT_FOUND}

//
// MessageId: ERROR_PATH_NOT_FOUND
//
// MessageText:
//
//  The system cannot find the path specified.
//

  ERROR_PATH_NOT_FOUND = 3;
  {$EXTERNALSYM ERROR_PATH_NOT_FOUND}

//
// MessageId: ERROR_TOO_MANY_OPEN_FILES
//
// MessageText:
//
//  The system cannot open the file.
//

  ERROR_TOO_MANY_OPEN_FILES = 4;
  {$EXTERNALSYM ERROR_TOO_MANY_OPEN_FILES}

//
// MessageId: ERROR_ACCESS_DENIED
//
// MessageText:
//
//  Access is denied.
//

  ERROR_ACCESS_DENIED = 5;
  {$EXTERNALSYM ERROR_ACCESS_DENIED}

//
// MessageId: ERROR_INVALID_HANDLE
//
// MessageText:
//
//  The handle is invalid.
//

  ERROR_INVALID_HANDLE = 6;
  {$EXTERNALSYM ERROR_INVALID_HANDLE}

//
// MessageId: ERROR_ARENA_TRASHED
//
// MessageText:
//
//  The storage control blocks were destroyed.
//

  ERROR_ARENA_TRASHED = 7;
  {$EXTERNALSYM ERROR_ARENA_TRASHED}

//
// MessageId: ERROR_NOT_ENOUGH_MEMORY
//
// MessageText:
//
//  Not enough storage is available to process this command.
//

  ERROR_NOT_ENOUGH_MEMORY = 8; // dderror
  {$EXTERNALSYM ERROR_NOT_ENOUGH_MEMORY}

//
// MessageId: ERROR_INVALID_BLOCK
//
// MessageText:
//
//  The storage control block address is invalid.
//

  ERROR_INVALID_BLOCK = 9;
  {$EXTERNALSYM ERROR_INVALID_BLOCK}

//
// MessageId: ERROR_BAD_ENVIRONMENT
//
// MessageText:
//
//  The environment is incorrect.
//

  ERROR_BAD_ENVIRONMENT = 10;
  {$EXTERNALSYM ERROR_BAD_ENVIRONMENT}

//
// MessageId: ERROR_BAD_FORMAT
//
// MessageText:
//
//  An attempt was made to load a program with an incorrect format.
//

  ERROR_BAD_FORMAT = 11;
  {$EXTERNALSYM ERROR_BAD_FORMAT}

//
// MessageId: ERROR_INVALID_ACCESS
//
// MessageText:
//
//  The access code is invalid.
//

  ERROR_INVALID_ACCESS = 12;
  {$EXTERNALSYM ERROR_INVALID_ACCESS}

//
// MessageId: ERROR_INVALID_DATA
//
// MessageText:
//
//  The data is invalid.
//

  ERROR_INVALID_DATA = 13;
  {$EXTERNALSYM ERROR_INVALID_DATA}

//
// MessageId: ERROR_OUTOFMEMORY
//
// MessageText:
//
//  Not enough storage is available to complete this operation.
//

  ERROR_OUTOFMEMORY = 14;
  {$EXTERNALSYM ERROR_OUTOFMEMORY}

//
// MessageId: ERROR_INVALID_DRIVE
//
// MessageText:
//
//  The system cannot find the drive specified.
//

  ERROR_INVALID_DRIVE = 15;
  {$EXTERNALSYM ERROR_INVALID_DRIVE}

//
// MessageId: ERROR_CURRENT_DIRECTORY
//
// MessageText:
//
//  The directory cannot be removed.
//

  ERROR_CURRENT_DIRECTORY = 16;
  {$EXTERNALSYM ERROR_CURRENT_DIRECTORY}

//
// MessageId: ERROR_NOT_SAME_DEVICE
//
// MessageText:
//
//  The system cannot move the file to a different disk drive.
//

  ERROR_NOT_SAME_DEVICE = 17;
  {$EXTERNALSYM ERROR_NOT_SAME_DEVICE}

//
// MessageId: ERROR_NO_MORE_FILES
//
// MessageText:
//
//  There are no more files.
//

  ERROR_NO_MORE_FILES = 18;
  {$EXTERNALSYM ERROR_NO_MORE_FILES}

//
// MessageId: ERROR_WRITE_PROTECT
//
// MessageText:
//
//  The media is write protected.
//

  ERROR_WRITE_PROTECT = 19;
  {$EXTERNALSYM ERROR_WRITE_PROTECT}

//
// MessageId: ERROR_BAD_UNIT
//
// MessageText:
//
//  The system cannot find the device specified.
//

  ERROR_BAD_UNIT = 20;
  {$EXTERNALSYM ERROR_BAD_UNIT}

//
// MessageId: ERROR_NOT_READY
//
// MessageText:
//
//  The device is not ready.
//

  ERROR_NOT_READY = 21;
  {$EXTERNALSYM ERROR_NOT_READY}

//
// MessageId: ERROR_BAD_COMMAND
//
// MessageText:
//
//  The device does not recognize the command.
//

  ERROR_BAD_COMMAND = 22;
  {$EXTERNALSYM ERROR_BAD_COMMAND}

//
// MessageId: ERROR_CRC
//
// MessageText:
//
//  Data error (cyclic redundancy check).
//

  ERROR_CRC = 23;
  {$EXTERNALSYM ERROR_CRC}

//
// MessageId: ERROR_BAD_LENGTH
//
// MessageText:
//
//  The program issued a command but the command length is incorrect.
//

  ERROR_BAD_LENGTH = 24;
  {$EXTERNALSYM ERROR_BAD_LENGTH}

//
// MessageId: ERROR_SEEK
//
// MessageText:
//
//  The drive cannot locate a specific area or track on the disk.
//

  ERROR_SEEK = 25;
  {$EXTERNALSYM ERROR_SEEK}

//
// MessageId: ERROR_NOT_DOS_DISK
//
// MessageText:
//
//  The specified disk or diskette cannot be accessed.
//

  ERROR_NOT_DOS_DISK = 26;
  {$EXTERNALSYM ERROR_NOT_DOS_DISK}

//
// MessageId: ERROR_SECTOR_NOT_FOUND
//
// MessageText:
//
//  The drive cannot find the sector requested.
//

  ERROR_SECTOR_NOT_FOUND = 27;
  {$EXTERNALSYM ERROR_SECTOR_NOT_FOUND}

//
// MessageId: ERROR_OUT_OF_PAPER
//
// MessageText:
//
//  The printer is out of paper.
//

  ERROR_OUT_OF_PAPER = 28;
  {$EXTERNALSYM ERROR_OUT_OF_PAPER}

//
// MessageId: ERROR_WRITE_FAULT
//
// MessageText:
//
//  The system cannot write to the specified device.
//

  ERROR_WRITE_FAULT = 29;
  {$EXTERNALSYM ERROR_WRITE_FAULT}

//
// MessageId: ERROR_READ_FAULT
//
// MessageText:
//
//  The system cannot read from the specified device.
//

  ERROR_READ_FAULT = 30;
  {$EXTERNALSYM ERROR_READ_FAULT}

//
// MessageId: ERROR_GEN_FAILURE
//
// MessageText:
//
//  A device attached to the system is not functioning.
//

  ERROR_GEN_FAILURE = 31;
  {$EXTERNALSYM ERROR_GEN_FAILURE}

//
// MessageId: ERROR_SHARING_VIOLATION
//
// MessageText:
//
//  The process cannot access the file because it is being used by another process.
//

  ERROR_SHARING_VIOLATION = 32;
  {$EXTERNALSYM ERROR_SHARING_VIOLATION}

//
// MessageId: ERROR_LOCK_VIOLATION
//
// MessageText:
//
//  The process cannot access the file because another process has locked a portion of the file.
//

  ERROR_LOCK_VIOLATION = 33;
  {$EXTERNALSYM ERROR_LOCK_VIOLATION}

//
// MessageId: ERROR_WRONG_DISK
//
// MessageText:
//
//  The wrong diskette is in the drive.
//  Insert %2 (Volume Serial Number: %3)
//  into drive %1.
//

  ERROR_WRONG_DISK = 34;
  {$EXTERNALSYM ERROR_WRONG_DISK}

//
// MessageId: ERROR_SHARING_BUFFER_EXCEEDED
//
// MessageText:
//
//  Too many files opened for sharing.
//

  ERROR_SHARING_BUFFER_EXCEEDED = 36;
  {$EXTERNALSYM ERROR_SHARING_BUFFER_EXCEEDED}

//
// MessageId: ERROR_HANDLE_EOF
//
// MessageText:
//
//  Reached the end of the file.
//

  ERROR_HANDLE_EOF = 38;
  {$EXTERNALSYM ERROR_HANDLE_EOF}

//
// MessageId: ERROR_HANDLE_DISK_FULL
//
// MessageText:
//
//  The disk is full.
//

  ERROR_HANDLE_DISK_FULL = 39;
  {$EXTERNALSYM ERROR_HANDLE_DISK_FULL}

//
// MessageId: ERROR_NOT_SUPPORTED
//
// MessageText:
//
//  The network request is not supported.
//

  ERROR_NOT_SUPPORTED = 50;
  {$EXTERNALSYM ERROR_NOT_SUPPORTED}

//
// MessageId: ERROR_REM_NOT_LIST
//
// MessageText:
//
//  The remote computer is not available.
//

  ERROR_REM_NOT_LIST = 51;
  {$EXTERNALSYM ERROR_REM_NOT_LIST}

//
// MessageId: ERROR_DUP_NAME
//
// MessageText:
//
//  A duplicate name exists on the network.
//

  ERROR_DUP_NAME = 52;
  {$EXTERNALSYM ERROR_DUP_NAME}

//
// MessageId: ERROR_BAD_NETPATH
//
// MessageText:
//
//  The network path was not found.
//

  ERROR_BAD_NETPATH = 53;
  {$EXTERNALSYM ERROR_BAD_NETPATH}

//
// MessageId: ERROR_NETWORK_BUSY
//
// MessageText:
//
//  The network is busy.
//

  ERROR_NETWORK_BUSY = 54;
  {$EXTERNALSYM ERROR_NETWORK_BUSY}

//
// MessageId: ERROR_DEV_NOT_EXIST
//
// MessageText:
//
//  The specified network resource or device is no longer available.
//

  ERROR_DEV_NOT_EXIST = 55; // dderror
  {$EXTERNALSYM ERROR_DEV_NOT_EXIST}

//
// MessageId: ERROR_TOO_MANY_CMDS
//
// MessageText:
//
//  The network BIOS command limit has been reached.
//

  ERROR_TOO_MANY_CMDS = 56;
  {$EXTERNALSYM ERROR_TOO_MANY_CMDS}

//
// MessageId: ERROR_ADAP_HDW_ERR
//
// MessageText:
//
//  A network adapter hardware error occurred.
//

  ERROR_ADAP_HDW_ERR = 57;
  {$EXTERNALSYM ERROR_ADAP_HDW_ERR}

//
// MessageId: ERROR_BAD_NET_RESP
//
// MessageText:
//
//  The specified server cannot perform the requested operation.
//

  ERROR_BAD_NET_RESP = 58;
  {$EXTERNALSYM ERROR_BAD_NET_RESP}

//
// MessageId: ERROR_UNEXP_NET_ERR
//
// MessageText:
//
//  An unexpected network error occurred.
//

  ERROR_UNEXP_NET_ERR = 59;
  {$EXTERNALSYM ERROR_UNEXP_NET_ERR}

//
// MessageId: ERROR_BAD_REM_ADAP
//
// MessageText:
//
//  The remote adapter is not compatible.
//

  ERROR_BAD_REM_ADAP = 60;
  {$EXTERNALSYM ERROR_BAD_REM_ADAP}

//
// MessageId: ERROR_PRINTQ_FULL
//
// MessageText:
//
//  The printer queue is full.
//

  ERROR_PRINTQ_FULL = 61;
  {$EXTERNALSYM ERROR_PRINTQ_FULL}

//
// MessageId: ERROR_NO_SPOOL_SPACE
//
// MessageText:
//
//  Space to store the file waiting to be printed is not available on the server.
//

  ERROR_NO_SPOOL_SPACE = 62;
  {$EXTERNALSYM ERROR_NO_SPOOL_SPACE}

//
// MessageId: ERROR_PRINT_CANCELLED
//
// MessageText:
//
//  Your file waiting to be printed was deleted.
//

  ERROR_PRINT_CANCELLED = 63;
  {$EXTERNALSYM ERROR_PRINT_CANCELLED}

//
// MessageId: ERROR_NETNAME_DELETED
//
// MessageText:
//
//  The specified network name is no longer available.
//

  ERROR_NETNAME_DELETED = 64;
  {$EXTERNALSYM ERROR_NETNAME_DELETED}

//
// MessageId: ERROR_NETWORK_ACCESS_DENIED
//
// MessageText:
//
//  Network access is denied.
//

  ERROR_NETWORK_ACCESS_DENIED = 65;
  {$EXTERNALSYM ERROR_NETWORK_ACCESS_DENIED}

//
// MessageId: ERROR_BAD_DEV_TYPE
//
// MessageText:
//
//  The network resource type is not correct.
//

  ERROR_BAD_DEV_TYPE = 66;
  {$EXTERNALSYM ERROR_BAD_DEV_TYPE}

//
// MessageId: ERROR_BAD_NET_NAME
//
// MessageText:
//
//  The network name cannot be found.
//

  ERROR_BAD_NET_NAME = 67;
  {$EXTERNALSYM ERROR_BAD_NET_NAME}

//
// MessageId: ERROR_TOO_MANY_NAMES
//
// MessageText:
//
//  The name limit for the local computer network adapter card was exceeded.
//

  ERROR_TOO_MANY_NAMES = 68;
  {$EXTERNALSYM ERROR_TOO_MANY_NAMES}

//
// MessageId: ERROR_TOO_MANY_SESS
//
// MessageText:
//
//  The network BIOS session limit was exceeded.
//

  ERROR_TOO_MANY_SESS = 69;
  {$EXTERNALSYM ERROR_TOO_MANY_SESS}

//
// MessageId: ERROR_SHARING_PAUSED
//
// MessageText:
//
//  The remote server has been paused or is in the process of being started.
//

  ERROR_SHARING_PAUSED = 70;
  {$EXTERNALSYM ERROR_SHARING_PAUSED}

//
// MessageId: ERROR_REQ_NOT_ACCEP
//
// MessageText:
//
//  No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.
//

  ERROR_REQ_NOT_ACCEP = 71;
  {$EXTERNALSYM ERROR_REQ_NOT_ACCEP}

//
// MessageId: ERROR_REDIR_PAUSED
//
// MessageText:
//
//  The specified printer or disk device has been paused.
//

  ERROR_REDIR_PAUSED = 72;
  {$EXTERNALSYM ERROR_REDIR_PAUSED}

//
// MessageId: ERROR_FILE_EXISTS
//
// MessageText:
//
//  The file exists.
//

  ERROR_FILE_EXISTS = 80;
  {$EXTERNALSYM ERROR_FILE_EXISTS}

//
// MessageId: ERROR_CANNOT_MAKE
//
// MessageText:
//
//  The directory or file cannot be created.
//

  ERROR_CANNOT_MAKE = 82;
  {$EXTERNALSYM ERROR_CANNOT_MAKE}

//
// MessageId: ERROR_FAIL_I24
//
// MessageText:
//
//  Fail on INT 24.
//

  ERROR_FAIL_I24 = 83;
  {$EXTERNALSYM ERROR_FAIL_I24}

//
// MessageId: ERROR_OUT_OF_STRUCTURES
//
// MessageText:
//
//  Storage to process this request is not available.
//

  ERROR_OUT_OF_STRUCTURES = 84;
  {$EXTERNALSYM ERROR_OUT_OF_STRUCTURES}

//
// MessageId: ERROR_ALREADY_ASSIGNED
//
// MessageText:
//
//  The local device name is already in use.
//

  ERROR_ALREADY_ASSIGNED = 85;
  {$EXTERNALSYM ERROR_ALREADY_ASSIGNED}

//
// MessageId: ERROR_INVALID_PASSWORD
//
// MessageText:
//
//  The specified network password is not correct.
//

  ERROR_INVALID_PASSWORD = 86;
  {$EXTERNALSYM ERROR_INVALID_PASSWORD}

//
// MessageId: ERROR_INVALID_PARAMETER
//
// MessageText:
//
//  The parameter is incorrect.
//

  ERROR_INVALID_PARAMETER = 87; // dderror
  {$EXTERNALSYM ERROR_INVALID_PARAMETER}

//
// MessageId: ERROR_NET_WRITE_FAULT
//
// MessageText:
//
//  A write fault occurred on the network.
//

  ERROR_NET_WRITE_FAULT = 88;
  {$EXTERNALSYM ERROR_NET_WRITE_FAULT}

//
// MessageId: ERROR_NO_PROC_SLOTS
//
// MessageText:
//
//  The system cannot start another process at this time.
//

  ERROR_NO_PROC_SLOTS = 89;
  {$EXTERNALSYM ERROR_NO_PROC_SLOTS}

//
// MessageId: ERROR_TOO_MANY_SEMAPHORES
//
// MessageText:
//
//  Cannot create another system semaphore.
//

  ERROR_TOO_MANY_SEMAPHORES = 100;
  {$EXTERNALSYM ERROR_TOO_MANY_SEMAPHORES}

//
// MessageId: ERROR_EXCL_SEM_ALREADY_OWNED
//
// MessageText:
//
//  The exclusive semaphore is owned by another process.
//

  ERROR_EXCL_SEM_ALREADY_OWNED = 101;
  {$EXTERNALSYM ERROR_EXCL_SEM_ALREADY_OWNED}

//
// MessageId: ERROR_SEM_IS_SET
//
// MessageText:
//
//  The semaphore is set and cannot be closed.
//

  ERROR_SEM_IS_SET = 102;
  {$EXTERNALSYM ERROR_SEM_IS_SET}

//
// MessageId: ERROR_TOO_MANY_SEM_REQUESTS
//
// MessageText:
//
//  The semaphore cannot be set again.
//

  ERROR_TOO_MANY_SEM_REQUESTS = 103;
  {$EXTERNALSYM ERROR_TOO_MANY_SEM_REQUESTS}

//
// MessageId: ERROR_INVALID_AT_INTERRUPT_TIME
//
// MessageText:
//
//  Cannot request exclusive semaphores at interrupt time.
//

  ERROR_INVALID_AT_INTERRUPT_TIME = 104;
  {$EXTERNALSYM ERROR_INVALID_AT_INTERRUPT_TIME}

//
// MessageId: ERROR_SEM_OWNER_DIED
//
// MessageText:
//
//  The previous ownership of this semaphore has ended.
//

  ERROR_SEM_OWNER_DIED = 105;
  {$EXTERNALSYM ERROR_SEM_OWNER_DIED}

//
// MessageId: ERROR_SEM_USER_LIMIT
//
// MessageText:
//
//  Insert the diskette for drive %1.
//

  ERROR_SEM_USER_LIMIT = 106;
  {$EXTERNALSYM ERROR_SEM_USER_LIMIT}

//
// MessageId: ERROR_DISK_CHANGE
//
// MessageText:
//
//  The program stopped because an alternate diskette was not inserted.
//

  ERROR_DISK_CHANGE = 107;
  {$EXTERNALSYM ERROR_DISK_CHANGE}

//
// MessageId: ERROR_DRIVE_LOCKED
//
// MessageText:
//
//  The disk is in use or locked by
//  another process.
//

  ERROR_DRIVE_LOCKED = 108;
  {$EXTERNALSYM ERROR_DRIVE_LOCKED}

//
// MessageId: ERROR_BROKEN_PIPE
//
// MessageText:
//
//  The pipe has been ended.
//

  ERROR_BROKEN_PIPE = 109;
  {$EXTERNALSYM ERROR_BROKEN_PIPE}

//
// MessageId: ERROR_OPEN_FAILED
//
// MessageText:
//
//  The system cannot open the
//  device or file specified.
//

  ERROR_OPEN_FAILED = 110;
  {$EXTERNALSYM ERROR_OPEN_FAILED}

//
// MessageId: ERROR_BUFFER_OVERFLOW
//
// MessageText:
//
//  The file name is too long.
//

  ERROR_BUFFER_OVERFLOW = 111;
  {$EXTERNALSYM ERROR_BUFFER_OVERFLOW}

//
// MessageId: ERROR_DISK_FULL
//
// MessageText:
//
//  There is not enough space on the disk.
//

  ERROR_DISK_FULL = 112;
  {$EXTERNALSYM ERROR_DISK_FULL}

//
// MessageId: ERROR_NO_MORE_SEARCH_HANDLES
//
// MessageText:
//
//  No more internal file identifiers available.
//

  ERROR_NO_MORE_SEARCH_HANDLES = 113;
  {$EXTERNALSYM ERROR_NO_MORE_SEARCH_HANDLES}

//
// MessageId: ERROR_INVALID_TARGET_HANDLE
//
// MessageText:
//
//  The target internal file identifier is incorrect.
//

  ERROR_INVALID_TARGET_HANDLE = 114;
  {$EXTERNALSYM ERROR_INVALID_TARGET_HANDLE}

//
// MessageId: ERROR_INVALID_CATEGORY
//
// MessageText:
//
//  The IOCTL call made by the application program is not correct.
//

  ERROR_INVALID_CATEGORY = 117;
  {$EXTERNALSYM ERROR_INVALID_CATEGORY}

//
// MessageId: ERROR_INVALID_VERIFY_SWITCH
//
// MessageText:
//
//  The verify-on-write switch parameter value is not correct.
//

  ERROR_INVALID_VERIFY_SWITCH = 118;
  {$EXTERNALSYM ERROR_INVALID_VERIFY_SWITCH}

//
// MessageId: ERROR_BAD_DRIVER_LEVEL
//
// MessageText:
//
//  The system does not support the command requested.
//

  ERROR_BAD_DRIVER_LEVEL = 119;
  {$EXTERNALSYM ERROR_BAD_DRIVER_LEVEL}

//
// MessageId: ERROR_CALL_NOT_IMPLEMENTED
//
// MessageText:
//
//  This function is not supported on this system.
//

  ERROR_CALL_NOT_IMPLEMENTED = 120;
  {$EXTERNALSYM ERROR_CALL_NOT_IMPLEMENTED}

//
// MessageId: ERROR_SEM_TIMEOUT
//
// MessageText:
//
//  The semaphore timeout period has expired.
//

  ERROR_SEM_TIMEOUT = 121;
  {$EXTERNALSYM ERROR_SEM_TIMEOUT}

//
// MessageId: ERROR_INSUFFICIENT_BUFFER
//
// MessageText:
//
//  The data area passed to a system call is too small.
//

  ERROR_INSUFFICIENT_BUFFER = 122; // dderror
  {$EXTERNALSYM ERROR_INSUFFICIENT_BUFFER}

//
// MessageId: ERROR_INVALID_NAME
//
// MessageText:
//
//  The filename, directory name, or volume label syntax is incorrect.
//

  ERROR_INVALID_NAME = 123; // dderror
  {$EXTERNALSYM ERROR_INVALID_NAME}

//
// MessageId: ERROR_INVALID_LEVEL
//
// MessageText:
//
//  The system call level is not correct.
//

  ERROR_INVALID_LEVEL = 124;
  {$EXTERNALSYM ERROR_INVALID_LEVEL}

//
// MessageId: ERROR_NO_VOLUME_LABEL
//
// MessageText:
//
//  The disk has no volume label.
//

  ERROR_NO_VOLUME_LABEL = 125;
  {$EXTERNALSYM ERROR_NO_VOLUME_LABEL}

//
// MessageId: ERROR_MOD_NOT_FOUND
//
// MessageText:
//
//  The specified module could not be found.
//

  ERROR_MOD_NOT_FOUND = 126;
  {$EXTERNALSYM ERROR_MOD_NOT_FOUND}

//
// MessageId: ERROR_PROC_NOT_FOUND
//
// MessageText:
//
//  The specified procedure could not be found.
//

  ERROR_PROC_NOT_FOUND = 127;
  {$EXTERNALSYM ERROR_PROC_NOT_FOUND}

//
// MessageId: ERROR_WAIT_NO_CHILDREN
//
// MessageText:
//
//  There are no child processes to wait for.
//

  ERROR_WAIT_NO_CHILDREN = 128;
  {$EXTERNALSYM ERROR_WAIT_NO_CHILDREN}

//
// MessageId: ERROR_CHILD_NOT_COMPLETE
//
// MessageText:
//
//  The %1 application cannot be run in Win32 mode.
//

  ERROR_CHILD_NOT_COMPLETE = 129;
  {$EXTERNALSYM ERROR_CHILD_NOT_COMPLETE}

//
// MessageId: ERROR_DIRECT_ACCESS_HANDLE
//
// MessageText:
//
//  Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.
//

  ERROR_DIRECT_ACCESS_HANDLE = 130;
  {$EXTERNALSYM ERROR_DIRECT_ACCESS_HANDLE}

//
// MessageId: ERROR_NEGATIVE_SEEK
//
// MessageText:
//
//  An attempt was made to move the file pointer before the beginning of the file.
//

  ERROR_NEGATIVE_SEEK = 131;
  {$EXTERNALSYM ERROR_NEGATIVE_SEEK}

//
// MessageId: ERROR_SEEK_ON_DEVICE
//
// MessageText:
//
//  The file pointer cannot be set on the specified device or file.
//

  ERROR_SEEK_ON_DEVICE = 132;
  {$EXTERNALSYM ERROR_SEEK_ON_DEVICE}

//
// MessageId: ERROR_IS_JOIN_TARGET
//
// MessageText:
//
//  A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.
//

  ERROR_IS_JOIN_TARGET = 133;
  {$EXTERNALSYM ERROR_IS_JOIN_TARGET}

//
// MessageId: ERROR_IS_JOINED
//
// MessageText:
//
//  An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.
//

  ERROR_IS_JOINED = 134;
  {$EXTERNALSYM ERROR_IS_JOINED}

//
// MessageId: ERROR_IS_SUBSTED
//
// MessageText:
//
//  An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.
//

  ERROR_IS_SUBSTED = 135;
  {$EXTERNALSYM ERROR_IS_SUBSTED}

//
// MessageId: ERROR_NOT_JOINED
//
// MessageText:
//
//  The system tried to delete the JOIN of a drive that is not joined.
//

  ERROR_NOT_JOINED = 136;
  {$EXTERNALSYM ERROR_NOT_JOINED}

//
// MessageId: ERROR_NOT_SUBSTED
//
// MessageText:
//
//  The system tried to delete the substitution of a drive that is not substituted.
//

  ERROR_NOT_SUBSTED = 137;
  {$EXTERNALSYM ERROR_NOT_SUBSTED}

//
// MessageId: ERROR_JOIN_TO_JOIN
//
// MessageText:
//
//  The system tried to join a drive to a directory on a joined drive.
//

  ERROR_JOIN_TO_JOIN = 138;
  {$EXTERNALSYM ERROR_JOIN_TO_JOIN}

//
// MessageId: ERROR_SUBST_TO_SUBST
//
// MessageText:
//
//  The system tried to substitute a drive to a directory on a substituted drive.
//

  ERROR_SUBST_TO_SUBST = 139;
  {$EXTERNALSYM ERROR_SUBST_TO_SUBST}

//
// MessageId: ERROR_JOIN_TO_SUBST
//
// MessageText:
//
//  The system tried to join a drive to a directory on a substituted drive.
//

  ERROR_JOIN_TO_SUBST = 140;
  {$EXTERNALSYM ERROR_JOIN_TO_SUBST}

//
// MessageId: ERROR_SUBST_TO_JOIN
//
// MessageText:
//
//  The system tried to SUBST a drive to a directory on a joined drive.
//

  ERROR_SUBST_TO_JOIN = 141;
  {$EXTERNALSYM ERROR_SUBST_TO_JOIN}

//
// MessageId: ERROR_BUSY_DRIVE
//
// MessageText:
//
//  The system cannot perform a JOIN or SUBST at this time.
//

  ERROR_BUSY_DRIVE = 142;
  {$EXTERNALSYM ERROR_BUSY_DRIVE}

//
// MessageId: ERROR_SAME_DRIVE
//
// MessageText:
//
//  The system cannot join or substitute a drive to or for a directory on the same drive.
//

  ERROR_SAME_DRIVE = 143;
  {$EXTERNALSYM ERROR_SAME_DRIVE}

//
// MessageId: ERROR_DIR_NOT_ROOT
//
// MessageText:
//
//  The directory is not a subdirectory of the root directory.
//

  ERROR_DIR_NOT_ROOT = 144;
  {$EXTERNALSYM ERROR_DIR_NOT_ROOT}

//
// MessageId: ERROR_DIR_NOT_EMPTY
//
// MessageText:
//
//  The directory is not empty.
//

  ERROR_DIR_NOT_EMPTY = 145;
  {$EXTERNALSYM ERROR_DIR_NOT_EMPTY}

//
// MessageId: ERROR_IS_SUBST_PATH
//
// MessageText:
//
//  The path specified is being used in a substitute.
//

  ERROR_IS_SUBST_PATH = 146;
  {$EXTERNALSYM ERROR_IS_SUBST_PATH}

//
// MessageId: ERROR_IS_JOIN_PATH
//
// MessageText:
//
//  Not enough resources are available to process this command.
//

  ERROR_IS_JOIN_PATH = 147;
  {$EXTERNALSYM ERROR_IS_JOIN_PATH}

//
// MessageId: ERROR_PATH_BUSY
//
// MessageText:
//
//  The path specified cannot be used at this time.
//

  ERROR_PATH_BUSY = 148;
  {$EXTERNALSYM ERROR_PATH_BUSY}

//
// MessageId: ERROR_IS_SUBST_TARGET
//
// MessageText:
//
//  An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.
//

  ERROR_IS_SUBST_TARGET = 149;
  {$EXTERNALSYM ERROR_IS_SUBST_TARGET}

//
// MessageId: ERROR_SYSTEM_TRACE
//
// MessageText:
//
//  System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.
//

  ERROR_SYSTEM_TRACE = 150;
  {$EXTERNALSYM ERROR_SYSTEM_TRACE}

//
// MessageId: ERROR_INVALID_EVENT_COUNT
//
// MessageText:
//
//  The number of specified semaphore events for DosMuxSemWait is not correct.
//

  ERROR_INVALID_EVENT_COUNT = 151;
  {$EXTERNALSYM ERROR_INVALID_EVENT_COUNT}

//
// MessageId: ERROR_TOO_MANY_MUXWAITERS
//
// MessageText:
//
//  DosMuxSemWait did not execute; too many semaphores are already set.
//

  ERROR_TOO_MANY_MUXWAITERS = 152;
  {$EXTERNALSYM ERROR_TOO_MANY_MUXWAITERS}

//
// MessageId: ERROR_INVALID_LIST_FORMAT
//
// MessageText:
//
//  The DosMuxSemWait list is not correct.
//

  ERROR_INVALID_LIST_FORMAT = 153;
  {$EXTERNALSYM ERROR_INVALID_LIST_FORMAT}

//
// MessageId: ERROR_LABEL_TOO_LONG
//
// MessageText:
//
//  The volume label you entered exceeds the label character
//  limit of the target file system.
//

  ERROR_LABEL_TOO_LONG = 154;
  {$EXTERNALSYM ERROR_LABEL_TOO_LONG}

//
// MessageId: ERROR_TOO_MANY_TCBS
//
// MessageText:
//
//  Cannot create another thread.
//

  ERROR_TOO_MANY_TCBS = 155;
  {$EXTERNALSYM ERROR_TOO_MANY_TCBS}

//
// MessageId: ERROR_SIGNAL_REFUSED
//
// MessageText:
//
//  The recipient process has refused the signal.
//

  ERROR_SIGNAL_REFUSED = 156;
  {$EXTERNALSYM ERROR_SIGNAL_REFUSED}

//
// MessageId: ERROR_DISCARDED
//
// MessageText:
//
//  The segment is already discarded and cannot be locked.
//

  ERROR_DISCARDED = 157;
  {$EXTERNALSYM ERROR_DISCARDED}

//
// MessageId: ERROR_NOT_LOCKED
//
// MessageText:
//
//  The segment is already unlocked.
//

  ERROR_NOT_LOCKED = 158;
  {$EXTERNALSYM ERROR_NOT_LOCKED}

//
// MessageId: ERROR_BAD_THREADID_ADDR
//
// MessageText:
//
//  The address for the thread ID is not correct.
//

  ERROR_BAD_THREADID_ADDR = 159;
  {$EXTERNALSYM ERROR_BAD_THREADID_ADDR}

//
// MessageId: ERROR_BAD_ARGUMENTS
//
// MessageText:
//
//  The argument string passed to DosExecPgm is not correct.
//

  ERROR_BAD_ARGUMENTS = 160;
  {$EXTERNALSYM ERROR_BAD_ARGUMENTS}

//
// MessageId: ERROR_BAD_PATHNAME
//
// MessageText:
//
//  The specified path is invalid.
//

  ERROR_BAD_PATHNAME = 161;
  {$EXTERNALSYM ERROR_BAD_PATHNAME}

//
// MessageId: ERROR_SIGNAL_PENDING
//
// MessageText:
//
//  A signal is already pending.
//

  ERROR_SIGNAL_PENDING = 162;
  {$EXTERNALSYM ERROR_SIGNAL_PENDING}

//
// MessageId: ERROR_MAX_THRDS_REACHED
//
// MessageText:
//
//  No more threads can be created in the system.
//

  ERROR_MAX_THRDS_REACHED = 164;
  {$EXTERNALSYM ERROR_MAX_THRDS_REACHED}

//
// MessageId: ERROR_LOCK_FAILED
//
// MessageText:
//
//  Unable to lock a region of a file.
//

  ERROR_LOCK_FAILED = 167;
  {$EXTERNALSYM ERROR_LOCK_FAILED}

//
// MessageId: ERROR_BUSY
//
// MessageText:
//
//  The requested resource is in use.
//

  ERROR_BUSY = 170;
  {$EXTERNALSYM ERROR_BUSY}

//
// MessageId: ERROR_CANCEL_VIOLATION
//
// MessageText:
//
//  A lock request was not outstanding for the supplied cancel region.
//

  ERROR_CANCEL_VIOLATION = 173;
  {$EXTERNALSYM ERROR_CANCEL_VIOLATION}

//
// MessageId: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
//
// MessageText:
//
//  The file system does not support atomic changes to the lock type.
//

  ERROR_ATOMIC_LOCKS_NOT_SUPPORTED = 174;
  {$EXTERNALSYM ERROR_ATOMIC_LOCKS_NOT_SUPPORTED}

//
// MessageId: ERROR_INVALID_SEGMENT_NUMBER
//
// MessageText:
//
//  The system detected a segment number that was not correct.
//

  ERROR_INVALID_SEGMENT_NUMBER = 180;
  {$EXTERNALSYM ERROR_INVALID_SEGMENT_NUMBER}

//
// MessageId: ERROR_INVALID_ORDINAL
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_ORDINAL = 182;
  {$EXTERNALSYM ERROR_INVALID_ORDINAL}

//
// MessageId: ERROR_ALREADY_EXISTS
//
// MessageText:
//
//  Cannot create a file when that file already exists.
//

  ERROR_ALREADY_EXISTS = 183;
  {$EXTERNALSYM ERROR_ALREADY_EXISTS}

//
// MessageId: ERROR_INVALID_FLAG_NUMBER
//
// MessageText:
//
//  The flag passed is not correct.
//

  ERROR_INVALID_FLAG_NUMBER = 186;
  {$EXTERNALSYM ERROR_INVALID_FLAG_NUMBER}

//
// MessageId: ERROR_SEM_NOT_FOUND
//
// MessageText:
//
//  The specified system semaphore name was not found.
//

  ERROR_SEM_NOT_FOUND = 187;
  {$EXTERNALSYM ERROR_SEM_NOT_FOUND}

//
// MessageId: ERROR_INVALID_STARTING_CODESEG
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_STARTING_CODESEG = 188;
  {$EXTERNALSYM ERROR_INVALID_STARTING_CODESEG}

//
// MessageId: ERROR_INVALID_STACKSEG
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_STACKSEG = 189;
  {$EXTERNALSYM ERROR_INVALID_STACKSEG}

//
// MessageId: ERROR_INVALID_MODULETYPE
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_MODULETYPE = 190;
  {$EXTERNALSYM ERROR_INVALID_MODULETYPE}

//
// MessageId: ERROR_INVALID_EXE_SIGNATURE
//
// MessageText:
//
//  Cannot run %1 in Win32 mode.
//

  ERROR_INVALID_EXE_SIGNATURE = 191;
  {$EXTERNALSYM ERROR_INVALID_EXE_SIGNATURE}

//
// MessageId: ERROR_EXE_MARKED_INVALID
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_EXE_MARKED_INVALID = 192;
  {$EXTERNALSYM ERROR_EXE_MARKED_INVALID}

//
// MessageId: ERROR_BAD_EXE_FORMAT
//
// MessageText:
//
//  %1 is not a valid Win32 application.
//

  ERROR_BAD_EXE_FORMAT = 193;
  {$EXTERNALSYM ERROR_BAD_EXE_FORMAT}

//
// MessageId: ERROR_ITERATED_DATA_EXCEEDS_64k
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_ITERATED_DATA_EXCEEDS_64k = 194;
  {$EXTERNALSYM ERROR_ITERATED_DATA_EXCEEDS_64k}

//
// MessageId: ERROR_INVALID_MINALLOCSIZE
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_MINALLOCSIZE = 195;
  {$EXTERNALSYM ERROR_INVALID_MINALLOCSIZE}

//
// MessageId: ERROR_DYNLINK_FROM_INVALID_RING
//
// MessageText:
//
//  The operating system cannot run this application program.
//

  ERROR_DYNLINK_FROM_INVALID_RING = 196;
  {$EXTERNALSYM ERROR_DYNLINK_FROM_INVALID_RING}

//
// MessageId: ERROR_IOPL_NOT_ENABLED
//
// MessageText:
//
//  The operating system is not presently configured to run this application.
//

  ERROR_IOPL_NOT_ENABLED = 197;
  {$EXTERNALSYM ERROR_IOPL_NOT_ENABLED}

//
// MessageId: ERROR_INVALID_SEGDPL
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INVALID_SEGDPL = 198;
  {$EXTERNALSYM ERROR_INVALID_SEGDPL}

//
// MessageId: ERROR_AUTODATASEG_EXCEEDS_64k
//
// MessageText:
//
//  The operating system cannot run this application program.
//

  ERROR_AUTODATASEG_EXCEEDS_64k = 199;
  {$EXTERNALSYM ERROR_AUTODATASEG_EXCEEDS_64k}

//
// MessageId: ERROR_RING2SEG_MUST_BE_MOVABLE
//
// MessageText:
//
//  The code segment cannot be greater than or equal to 64K.
//

  ERROR_RING2SEG_MUST_BE_MOVABLE = 200;
  {$EXTERNALSYM ERROR_RING2SEG_MUST_BE_MOVABLE}

//
// MessageId: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_RELOC_CHAIN_XEEDS_SEGLIM = 201;
  {$EXTERNALSYM ERROR_RELOC_CHAIN_XEEDS_SEGLIM}

//
// MessageId: ERROR_INFLOOP_IN_RELOC_CHAIN
//
// MessageText:
//
//  The operating system cannot run %1.
//

  ERROR_INFLOOP_IN_RELOC_CHAIN = 202;
  {$EXTERNALSYM ERROR_INFLOOP_IN_RELOC_CHAIN}

//
// MessageId: ERROR_ENVVAR_NOT_FOUND
//
// MessageText:
//
//  The system could not find the environment
//  option that was entered.
//

  ERROR_ENVVAR_NOT_FOUND = 203;
  {$EXTERNALSYM ERROR_ENVVAR_NOT_FOUND}

//
// MessageId: ERROR_NO_SIGNAL_SENT
//
// MessageText:
//
//  No process in the command subtree has a
//  signal handler.
//

  ERROR_NO_SIGNAL_SENT = 205;
  {$EXTERNALSYM ERROR_NO_SIGNAL_SENT}

//
// MessageId: ERROR_FILENAME_EXCED_RANGE
//
// MessageText:
//
//  The filename or extension is too long.
//

  ERROR_FILENAME_EXCED_RANGE = 206;
  {$EXTERNALSYM ERROR_FILENAME_EXCED_RANGE}

//
// MessageId: ERROR_RING2_STACK_IN_USE
//
// MessageText:
//
//  The ring 2 stack is in use.
//

  ERROR_RING2_STACK_IN_USE = 207;
  {$EXTERNALSYM ERROR_RING2_STACK_IN_USE}

//
// MessageId: ERROR_META_EXPANSION_TOO_LONG
//
// MessageText:
//
//  The global filename characters, * or ?, are entered incorrectly or too many global filename characters are specified.
//

  ERROR_META_EXPANSION_TOO_LONG = 208;
  {$EXTERNALSYM ERROR_META_EXPANSION_TOO_LONG}

//
// MessageId: ERROR_INVALID_SIGNAL_NUMBER
//
// MessageText:
//
//  The signal being posted is not correct.
//

  ERROR_INVALID_SIGNAL_NUMBER = 209;
  {$EXTERNALSYM ERROR_INVALID_SIGNAL_NUMBER}

//
// MessageId: ERROR_THREAD_1_INACTIVE
//
// MessageText:
//
//  The signal handler cannot be set.
//

  ERROR_THREAD_1_INACTIVE = 210;
  {$EXTERNALSYM ERROR_THREAD_1_INACTIVE}

//
// MessageId: ERROR_LOCKED
//
// MessageText:
//
//  The segment is locked and cannot be reallocated.
//

  ERROR_LOCKED = 212;
  {$EXTERNALSYM ERROR_LOCKED}

//
// MessageId: ERROR_TOO_MANY_MODULES
//
// MessageText:
//
//  Too many dynamic-link modules are attached to this program or dynamic-link module.
//

  ERROR_TOO_MANY_MODULES = 214;
  {$EXTERNALSYM ERROR_TOO_MANY_MODULES}

//
// MessageId: ERROR_NESTING_NOT_ALLOWED
//
// MessageText:
//
//  Cannot nest calls to LoadModule.
//

  ERROR_NESTING_NOT_ALLOWED = 215;
  {$EXTERNALSYM ERROR_NESTING_NOT_ALLOWED}

//
// MessageId: ERROR_EXE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
//  The image file %1 is valid, but is for a machine type other than the current machine.
//

  ERROR_EXE_MACHINE_TYPE_MISMATCH = 216;
  {$EXTERNALSYM ERROR_EXE_MACHINE_TYPE_MISMATCH}

//
// MessageId: ERROR_BAD_PIPE
//
// MessageText:
//
//  The pipe state is invalid.
//

  ERROR_BAD_PIPE = 230;
  {$EXTERNALSYM ERROR_BAD_PIPE}

//
// MessageId: ERROR_PIPE_BUSY
//
// MessageText:
//
//  All pipe instances are busy.
//

  ERROR_PIPE_BUSY = 231;
  {$EXTERNALSYM ERROR_PIPE_BUSY}

//
// MessageId: ERROR_NO_DATA
//
// MessageText:
//
//  The pipe is being closed.
//

  ERROR_NO_DATA = 232;
  {$EXTERNALSYM ERROR_NO_DATA}

//
// MessageId: ERROR_PIPE_NOT_CONNECTED
//
// MessageText:
//
//  No process is on the other end of the pipe.
//

  ERROR_PIPE_NOT_CONNECTED = 233;
  {$EXTERNALSYM ERROR_PIPE_NOT_CONNECTED}

//
// MessageId: ERROR_MORE_DATA
//
// MessageText:
//
//  More data is available.
//

  ERROR_MORE_DATA = 234; // dderror
  {$EXTERNALSYM ERROR_MORE_DATA}

//
// MessageId: ERROR_VC_DISCONNECTED
//
// MessageText:
//
//  The session was canceled.
//

  ERROR_VC_DISCONNECTED = 240;
  {$EXTERNALSYM ERROR_VC_DISCONNECTED}

//
// MessageId: ERROR_INVALID_EA_NAME
//
// MessageText:
//
//  The specified extended attribute name was invalid.
//

  ERROR_INVALID_EA_NAME = 254;
  {$EXTERNALSYM ERROR_INVALID_EA_NAME}

//
// MessageId: ERROR_EA_LIST_INCONSISTENT
//
// MessageText:
//
//  The extended attributes are inconsistent.
//

  ERROR_EA_LIST_INCONSISTENT = 255;
  {$EXTERNALSYM ERROR_EA_LIST_INCONSISTENT}

//
// MessageId: WAIT_TIMEOUT
//
// MessageText:
//
//  The wait operation timed out.
//

  WAIT_TIMEOUT = 258;
  {$EXTERNALSYM WAIT_TIMEOUT}

//
// MessageId: ERROR_NO_MORE_ITEMS
//
// MessageText:
//
//  No more data is available.
//

  ERROR_NO_MORE_ITEMS = 259;
  {$EXTERNALSYM ERROR_NO_MORE_ITEMS}

//
// MessageId: ERROR_CANNOT_COPY
//
// MessageText:
//
//  The copy functions cannot be used.
//

  ERROR_CANNOT_COPY = 266;
  {$EXTERNALSYM ERROR_CANNOT_COPY}

//
// MessageId: ERROR_DIRECTORY
//
// MessageText:
//
//  The directory name is invalid.
//

  ERROR_DIRECTORY = 267;
  {$EXTERNALSYM ERROR_DIRECTORY}

//
// MessageId: ERROR_EAS_DIDNT_FIT
//
// MessageText:
//
//  The extended attributes did not fit in the buffer.
//

  ERROR_EAS_DIDNT_FIT = 275;
  {$EXTERNALSYM ERROR_EAS_DIDNT_FIT}

//
// MessageId: ERROR_EA_FILE_CORRUPT
//
// MessageText:
//
//  The extended attribute file on the mounted file system is corrupt.
//

  ERROR_EA_FILE_CORRUPT = 276;
  {$EXTERNALSYM ERROR_EA_FILE_CORRUPT}

//
// MessageId: ERROR_EA_TABLE_FULL
//
// MessageText:
//
//  The extended attribute table file is full.
//

  ERROR_EA_TABLE_FULL = 277;
  {$EXTERNALSYM ERROR_EA_TABLE_FULL}

//
// MessageId: ERROR_INVALID_EA_HANDLE
//
// MessageText:
//
//  The specified extended attribute handle is invalid.
//

  ERROR_INVALID_EA_HANDLE = 278;
  {$EXTERNALSYM ERROR_INVALID_EA_HANDLE}

//
// MessageId: ERROR_EAS_NOT_SUPPORTED
//
// MessageText:
//
//  The mounted file system does not support extended attributes.
//

  ERROR_EAS_NOT_SUPPORTED = 282;
  {$EXTERNALSYM ERROR_EAS_NOT_SUPPORTED}

//
// MessageId: ERROR_NOT_OWNER
//
// MessageText:
//
//  Attempt to release mutex not owned by caller.
//

  ERROR_NOT_OWNER = 288;
  {$EXTERNALSYM ERROR_NOT_OWNER}

//
// MessageId: ERROR_TOO_MANY_POSTS
//
// MessageText:
//
//  Too many posts were made to a semaphore.
//

  ERROR_TOO_MANY_POSTS = 298;
  {$EXTERNALSYM ERROR_TOO_MANY_POSTS}

//
// MessageId: ERROR_PARTIAL_COPY
//
// MessageText:
//
//  Only part of a ReadProcessMemory or WriteProcessMemory request was completed.
//

  ERROR_PARTIAL_COPY = 299;
  {$EXTERNALSYM ERROR_PARTIAL_COPY}

//
// MessageId: ERROR_OPLOCK_NOT_GRANTED
//
// MessageText:
//
//  The oplock request is denied.
//

  ERROR_OPLOCK_NOT_GRANTED = 300;
  {$EXTERNALSYM ERROR_OPLOCK_NOT_GRANTED}

//
// MessageId: ERROR_INVALID_OPLOCK_PROTOCOL
//
// MessageText:
//
//  An invalid oplock acknowledgment was received by the system.
//

  ERROR_INVALID_OPLOCK_PROTOCOL = 301;
  {$EXTERNALSYM ERROR_INVALID_OPLOCK_PROTOCOL}

//
// MessageId: ERROR_MR_MID_NOT_FOUND
//
// MessageText:
//
//  The system cannot find message text for message number 0x%1 in the message file for %2.
//

  ERROR_MR_MID_NOT_FOUND = 317;
  {$EXTERNALSYM ERROR_MR_MID_NOT_FOUND}

//
// MessageId: ERROR_INVALID_ADDRESS
//
// MessageText:
//
//  Attempt to access invalid address.
//

  ERROR_INVALID_ADDRESS = 487;
  {$EXTERNALSYM ERROR_INVALID_ADDRESS}

//
// MessageId: ERROR_ARITHMETIC_OVERFLOW
//
// MessageText:
//
//  Arithmetic result exceeded 32 bits.
//

  ERROR_ARITHMETIC_OVERFLOW = 534;
  {$EXTERNALSYM ERROR_ARITHMETIC_OVERFLOW}

//
// MessageId: ERROR_PIPE_CONNECTED
//
// MessageText:
//
//  There is a process on other end of the pipe.
//

  ERROR_PIPE_CONNECTED = 535;
  {$EXTERNALSYM ERROR_PIPE_CONNECTED}

//
// MessageId: ERROR_PIPE_LISTENING
//
// MessageText:
//
//  Waiting for a process to open the other end of the pipe.
//

  ERROR_PIPE_LISTENING = 536;
  {$EXTERNALSYM ERROR_PIPE_LISTENING}

//
// MessageId: ERROR_EA_ACCESS_DENIED
//
// MessageText:
//
//  Access to the extended attribute was denied.
//

  ERROR_EA_ACCESS_DENIED = 994;
  {$EXTERNALSYM ERROR_EA_ACCESS_DENIED}

//
// MessageId: ERROR_OPERATION_ABORTED
//
// MessageText:
//
//  The I/O operation has been aborted because of either a thread exit or an application request.
//

  ERROR_OPERATION_ABORTED = 995;
  {$EXTERNALSYM ERROR_OPERATION_ABORTED}

//
// MessageId: ERROR_IO_INCOMPLETE
//
// MessageText:
//
//  Overlapped I/O event is not in a signaled state.
//

  ERROR_IO_INCOMPLETE = 996;
  {$EXTERNALSYM ERROR_IO_INCOMPLETE}

//
// MessageId: ERROR_IO_PENDING
//
// MessageText:
//
//  Overlapped I/O operation is in progress.
//

  ERROR_IO_PENDING = 997; // dderror
  {$EXTERNALSYM ERROR_IO_PENDING}

//
// MessageId: ERROR_NOACCESS
//
// MessageText:
//
//  Invalid access to memory location.
//

  ERROR_NOACCESS = 998;
  {$EXTERNALSYM ERROR_NOACCESS}

//
// MessageId: ERROR_SWAPERROR
//
// MessageText:
//
//  Error performing inpage operation.
//

  ERROR_SWAPERROR = 999;
  {$EXTERNALSYM ERROR_SWAPERROR}

//
// MessageId: ERROR_STACK_OVERFLOW
//
// MessageText:
//
//  Recursion too deep; the stack overflowed.
//

  ERROR_STACK_OVERFLOW = 1001;
  {$EXTERNALSYM ERROR_STACK_OVERFLOW}

//
// MessageId: ERROR_INVALID_MESSAGE
//
// MessageText:
//
//  The window cannot act on the sent message.
//

  ERROR_INVALID_MESSAGE = 1002;
  {$EXTERNALSYM ERROR_INVALID_MESSAGE}

//
// MessageId: ERROR_CAN_NOT_COMPLETE
//
// MessageText:
//
//  Cannot complete this function.
//

  ERROR_CAN_NOT_COMPLETE = 1003;
  {$EXTERNALSYM ERROR_CAN_NOT_COMPLETE}

//
// MessageId: ERROR_INVALID_FLAGS
//
// MessageText:
//
//  Invalid flags.
//

  ERROR_INVALID_FLAGS = 1004;
  {$EXTERNALSYM ERROR_INVALID_FLAGS}

//
// MessageId: ERROR_UNRECOGNIZED_VOLUME
//
// MessageText:
//
//  The volume does not contain a recognized file system.
//  Please make sure that all required file system drivers are loaded and that the volume is not corrupted.
//

  ERROR_UNRECOGNIZED_VOLUME = 1005;
  {$EXTERNALSYM ERROR_UNRECOGNIZED_VOLUME}

//
// MessageId: ERROR_FILE_INVALID
//
// MessageText:
//
//  The volume for a file has been externally altered so that the opened file is no longer valid.
//

  ERROR_FILE_INVALID = 1006;
  {$EXTERNALSYM ERROR_FILE_INVALID}

//
// MessageId: ERROR_FULLSCREEN_MODE
//
// MessageText:
//
//  The requested operation cannot be performed in full-screen mode.
//

  ERROR_FULLSCREEN_MODE = 1007;
  {$EXTERNALSYM ERROR_FULLSCREEN_MODE}

//
// MessageId: ERROR_NO_TOKEN
//
// MessageText:
//
//  An attempt was made to reference a token that does not exist.
//

  ERROR_NO_TOKEN = 1008;
  {$EXTERNALSYM ERROR_NO_TOKEN}

//
// MessageId: ERROR_BADDB
//
// MessageText:
//
//  The configuration registry database is corrupt.
//

  ERROR_BADDB = 1009;
  {$EXTERNALSYM ERROR_BADDB}

//
// MessageId: ERROR_BADKEY
//
// MessageText:
//
//  The configuration registry key is invalid.
//

  ERROR_BADKEY = 1010;
  {$EXTERNALSYM ERROR_BADKEY}

//
// MessageId: ERROR_CANTOPEN
//
// MessageText:
//
//  The configuration registry key could not be opened.
//

  ERROR_CANTOPEN = 1011;
  {$EXTERNALSYM ERROR_CANTOPEN}

//
// MessageId: ERROR_CANTREAD
//
// MessageText:
//
//  The configuration registry key could not be read.
//

  ERROR_CANTREAD = 1012;
  {$EXTERNALSYM ERROR_CANTREAD}

//
// MessageId: ERROR_CANTWRITE
//
// MessageText:
//
//  The configuration registry key could not be written.
//

  ERROR_CANTWRITE = 1013;
  {$EXTERNALSYM ERROR_CANTWRITE}

//
// MessageId: ERROR_REGISTRY_RECOVERED
//
// MessageText:
//
//  One of the files in the registry database had to be recovered by use of a log or alternate copy. The recovery was successful.
//

  ERROR_REGISTRY_RECOVERED = 1014;
  {$EXTERNALSYM ERROR_REGISTRY_RECOVERED}

//
// MessageId: ERROR_REGISTRY_CORRUPT
//
// MessageText:
//
//  The registry is corrupted. The structure of one of the files containing registry data is corrupted, or the system's memory image of the file is corrupted, or the file could not be recovered because the alternate copy or log was absent or corrupted.
//

  ERROR_REGISTRY_CORRUPT = 1015;
  {$EXTERNALSYM ERROR_REGISTRY_CORRUPT}

//
// MessageId: ERROR_REGISTRY_IO_FAILED
//
// MessageText:
//
//  An I/O operation initiated by the registry failed unrecoverably. The registry could not read in, or write out, or flush, one of the files that contain the system's image of the registry.
//

  ERROR_REGISTRY_IO_FAILED = 1016;
  {$EXTERNALSYM ERROR_REGISTRY_IO_FAILED}

//
// MessageId: ERROR_NOT_REGISTRY_FILE
//
// MessageText:
//
//  The system has attempted to load or restore a file into the registry, but the specified file is not in a registry file format.
//

  ERROR_NOT_REGISTRY_FILE = 1017;
  {$EXTERNALSYM ERROR_NOT_REGISTRY_FILE}

//
// MessageId: ERROR_KEY_DELETED
//
// MessageText:
//
//  Illegal operation attempted on a registry key that has been marked for deletion.
//

  ERROR_KEY_DELETED = 1018;
  {$EXTERNALSYM ERROR_KEY_DELETED}

//
// MessageId: ERROR_NO_LOG_SPACE
//
// MessageText:
//
//  System could not allocate the required space in a registry log.
//

  ERROR_NO_LOG_SPACE = 1019;
  {$EXTERNALSYM ERROR_NO_LOG_SPACE}

//
// MessageId: ERROR_KEY_HAS_CHILDREN
//
// MessageText:
//
//  Cannot create a symbolic link in a registry key that already has subkeys or values.
//

  ERROR_KEY_HAS_CHILDREN = 1020;
  {$EXTERNALSYM ERROR_KEY_HAS_CHILDREN}

//
// MessageId: ERROR_CHILD_MUST_BE_VOLATILE
//
// MessageText:
//
//  Cannot create a stable subkey under a volatile parent key.
//

  ERROR_CHILD_MUST_BE_VOLATILE = 1021;
  {$EXTERNALSYM ERROR_CHILD_MUST_BE_VOLATILE}

//
// MessageId: ERROR_NOTIFY_ENUM_DIR
//
// MessageText:
//
//  A notify change request is being completed and the information is not being returned in the caller's buffer. The caller now needs to enumerate the files to find the changes.
//

  ERROR_NOTIFY_ENUM_DIR = 1022;
  {$EXTERNALSYM ERROR_NOTIFY_ENUM_DIR}

//
// MessageId: ERROR_DEPENDENT_SERVICES_RUNNING
//
// MessageText:
//
//  A stop control has been sent to a service that other running services are dependent on.
//

  ERROR_DEPENDENT_SERVICES_RUNNING = 1051;
  {$EXTERNALSYM ERROR_DEPENDENT_SERVICES_RUNNING}

//
// MessageId: ERROR_INVALID_SERVICE_CONTROL
//
// MessageText:
//
//  The requested control is not valid for this service.
//

  ERROR_INVALID_SERVICE_CONTROL = 1052;
  {$EXTERNALSYM ERROR_INVALID_SERVICE_CONTROL}

//
// MessageId: ERROR_SERVICE_REQUEST_TIMEOUT
//
// MessageText:
//
//  The service did not respond to the start or control request in a timely fashion.
//

  ERROR_SERVICE_REQUEST_TIMEOUT = 1053;
  {$EXTERNALSYM ERROR_SERVICE_REQUEST_TIMEOUT}

//
// MessageId: ERROR_SERVICE_NO_THREAD
//
// MessageText:
//
//  A thread could not be created for the service.
//

  ERROR_SERVICE_NO_THREAD = 1054;
  {$EXTERNALSYM ERROR_SERVICE_NO_THREAD}

//
// MessageId: ERROR_SERVICE_DATABASE_LOCKED
//
// MessageText:
//
//  The service database is locked.
//

  ERROR_SERVICE_DATABASE_LOCKED = 1055;
  {$EXTERNALSYM ERROR_SERVICE_DATABASE_LOCKED}

//
// MessageId: ERROR_SERVICE_ALREADY_RUNNING
//
// MessageText:
//
//  An instance of the service is already running.
//

  ERROR_SERVICE_ALREADY_RUNNING = 1056;
  {$EXTERNALSYM ERROR_SERVICE_ALREADY_RUNNING}

//
// MessageId: ERROR_INVALID_SERVICE_ACCOUNT
//
// MessageText:
//
//  The account name is invalid or does not exist, or the password is invalid for the account name specified.
//

  ERROR_INVALID_SERVICE_ACCOUNT = 1057;
  {$EXTERNALSYM ERROR_INVALID_SERVICE_ACCOUNT}

//
// MessageId: ERROR_SERVICE_DISABLED
//
// MessageText:
//
//  The service cannot be started, either because it is disabled or because it has no enabled devices associated with it.
//

  ERROR_SERVICE_DISABLED = 1058;
  {$EXTERNALSYM ERROR_SERVICE_DISABLED}

//
// MessageId: ERROR_CIRCULAR_DEPENDENCY
//
// MessageText:
//
//  Circular service dependency was specified.
//

  ERROR_CIRCULAR_DEPENDENCY = 1059;
  {$EXTERNALSYM ERROR_CIRCULAR_DEPENDENCY}

//
// MessageId: ERROR_SERVICE_DOES_NOT_EXIST
//
// MessageText:
//
//  The specified service does not exist as an installed service.
//

  ERROR_SERVICE_DOES_NOT_EXIST = 1060;
  {$EXTERNALSYM ERROR_SERVICE_DOES_NOT_EXIST}

//
// MessageId: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
//
// MessageText:
//
//  The service cannot accept control messages at this time.
//

  ERROR_SERVICE_CANNOT_ACCEPT_CTRL = 1061;
  {$EXTERNALSYM ERROR_SERVICE_CANNOT_ACCEPT_CTRL}

//
// MessageId: ERROR_SERVICE_NOT_ACTIVE
//
// MessageText:
//
//  The service has not been started.
//

  ERROR_SERVICE_NOT_ACTIVE = 1062;
  {$EXTERNALSYM ERROR_SERVICE_NOT_ACTIVE}

//
// MessageId: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
//
// MessageText:
//
//  The service process could not connect to the service controller.
//

  ERROR_FAILED_SERVICE_CONTROLLER_CONNECT = 1063;
  {$EXTERNALSYM ERROR_FAILED_SERVICE_CONTROLLER_CONNECT}

//
// MessageId: ERROR_EXCEPTION_IN_SERVICE
//
// MessageText:
//
//  An exception occurred in the service when handling the control request.
//

  ERROR_EXCEPTION_IN_SERVICE = 1064;
  {$EXTERNALSYM ERROR_EXCEPTION_IN_SERVICE}

//
// MessageId: ERROR_DATABASE_DOES_NOT_EXIST
//
// MessageText:
//
//  The database specified does not exist.
//

  ERROR_DATABASE_DOES_NOT_EXIST = 1065;
  {$EXTERNALSYM ERROR_DATABASE_DOES_NOT_EXIST}

//
// MessageId: ERROR_SERVICE_SPECIFIC_ERROR
//
// MessageText:
//
//  The service has returned a service-specific error code.
//

  ERROR_SERVICE_SPECIFIC_ERROR = 1066;
  {$EXTERNALSYM ERROR_SERVICE_SPECIFIC_ERROR}

//
// MessageId: ERROR_PROCESS_ABORTED
//
// MessageText:
//
//  The process terminated unexpectedly.
//

  ERROR_PROCESS_ABORTED = 1067;
  {$EXTERNALSYM ERROR_PROCESS_ABORTED}

//
// MessageId: ERROR_SERVICE_DEPENDENCY_FAIL
//
// MessageText:
//
//  The dependency service or group failed to start.
//

  ERROR_SERVICE_DEPENDENCY_FAIL = 1068;
  {$EXTERNALSYM ERROR_SERVICE_DEPENDENCY_FAIL}

//
// MessageId: ERROR_SERVICE_LOGON_FAILED
//
// MessageText:
//
//  The service did not start due to a logon failure.
//

  ERROR_SERVICE_LOGON_FAILED = 1069;
  {$EXTERNALSYM ERROR_SERVICE_LOGON_FAILED}

//
// MessageId: ERROR_SERVICE_START_HANG
//
// MessageText:
//
//  After starting, the service hung in a start-pending state.
//

  ERROR_SERVICE_START_HANG = 1070;
  {$EXTERNALSYM ERROR_SERVICE_START_HANG}

//
// MessageId: ERROR_INVALID_SERVICE_LOCK
//
// MessageText:
//
//  The specified service database lock is invalid.
//

  ERROR_INVALID_SERVICE_LOCK = 1071;
  {$EXTERNALSYM ERROR_INVALID_SERVICE_LOCK}

//
// MessageId: ERROR_SERVICE_MARKED_FOR_DELETE
//
// MessageText:
//
//  The specified service has been marked for deletion.
//

  ERROR_SERVICE_MARKED_FOR_DELETE = 1072;
  {$EXTERNALSYM ERROR_SERVICE_MARKED_FOR_DELETE}

//
// MessageId: ERROR_SERVICE_EXISTS
//
// MessageText:
//
//  The specified service already exists.
//

  ERROR_SERVICE_EXISTS = 1073;
  {$EXTERNALSYM ERROR_SERVICE_EXISTS}

//
// MessageId: ERROR_ALREADY_RUNNING_LKG
//
// MessageText:
//
//  The system is currently running with the last-known-good configuration.
//

  ERROR_ALREADY_RUNNING_LKG = 1074;
  {$EXTERNALSYM ERROR_ALREADY_RUNNING_LKG}

//
// MessageId: ERROR_SERVICE_DEPENDENCY_DELETED
//
// MessageText:
//
//  The dependency service does not exist or has been marked for deletion.
//

  ERROR_SERVICE_DEPENDENCY_DELETED = 1075;
  {$EXTERNALSYM ERROR_SERVICE_DEPENDENCY_DELETED}

//
// MessageId: ERROR_BOOT_ALREADY_ACCEPTED
//
// MessageText:
//
//  The current boot has already been accepted for use as the last-known-good control set.
//

  ERROR_BOOT_ALREADY_ACCEPTED = 1076;
  {$EXTERNALSYM ERROR_BOOT_ALREADY_ACCEPTED}

//
// MessageId: ERROR_SERVICE_NEVER_STARTED
//
// MessageText:
//
//  No attempts to start the service have been made since the last boot.
//

  ERROR_SERVICE_NEVER_STARTED = 1077;
  {$EXTERNALSYM ERROR_SERVICE_NEVER_STARTED}

//
// MessageId: ERROR_DUPLICATE_SERVICE_NAME
//
// MessageText:
//
//  The name is already in use as either a service name or a service display name.
//

  ERROR_DUPLICATE_SERVICE_NAME = 1078;
  {$EXTERNALSYM ERROR_DUPLICATE_SERVICE_NAME}

//
// MessageId: ERROR_DIFFERENT_SERVICE_ACCOUNT
//
// MessageText:
//
//  The account specified for this service is different from the account specified for other services running in the same process.
//

  ERROR_DIFFERENT_SERVICE_ACCOUNT = 1079;
  {$EXTERNALSYM ERROR_DIFFERENT_SERVICE_ACCOUNT}

//
// MessageId: ERROR_CANNOT_DETECT_DRIVER_FAILURE
//
// MessageText:
//
//  Failure actions can only be set for Win32 services, not for drivers.
//

  ERROR_CANNOT_DETECT_DRIVER_FAILURE = 1080;
  {$EXTERNALSYM ERROR_CANNOT_DETECT_DRIVER_FAILURE}

//
// MessageId: ERROR_CANNOT_DETECT_PROCESS_ABORT
//
// MessageText:
//
//  This service runs in the same process as the service control manager.
//  Therefore, the service control manager cannot take action if this service's process terminates unexpectedly.
//

  ERROR_CANNOT_DETECT_PROCESS_ABORT = 1081;
  {$EXTERNALSYM ERROR_CANNOT_DETECT_PROCESS_ABORT}

//
// MessageId: ERROR_NO_RECOVERY_PROGRAM
//
// MessageText:
//
//  No recovery program has been configured for this service.
//

  ERROR_NO_RECOVERY_PROGRAM = 1082;
  {$EXTERNALSYM ERROR_NO_RECOVERY_PROGRAM}

//
// MessageId: ERROR_SERVICE_NOT_IN_EXE
//
// MessageText:
//
//  The executable program that this service is configured to run in does not implement the service.
//

  ERROR_SERVICE_NOT_IN_EXE = 1083;
  {$EXTERNALSYM ERROR_SERVICE_NOT_IN_EXE}

//
// MessageId: ERROR_END_OF_MEDIA
//
// MessageText:
//
//  The physical end of the tape has been reached.
//

  ERROR_END_OF_MEDIA = 1100;
  {$EXTERNALSYM ERROR_END_OF_MEDIA}

//
// MessageId: ERROR_FILEMARK_DETECTED
//
// MessageText:
//
//  A tape access reached a filemark.
//

  ERROR_FILEMARK_DETECTED = 1101;
  {$EXTERNALSYM ERROR_FILEMARK_DETECTED}

//
// MessageId: ERROR_BEGINNING_OF_MEDIA
//
// MessageText:
//
//  The beginning of the tape or a partition was encountered.
//

  ERROR_BEGINNING_OF_MEDIA = 1102;
  {$EXTERNALSYM ERROR_BEGINNING_OF_MEDIA}

//
// MessageId: ERROR_SETMARK_DETECTED
//
// MessageText:
//
//  A tape access reached the end of a set of files.
//

  ERROR_SETMARK_DETECTED = 1103;
  {$EXTERNALSYM ERROR_SETMARK_DETECTED}

//
// MessageId: ERROR_NO_DATA_DETECTED
//
// MessageText:
//
//  No more data is on the tape.
//

  ERROR_NO_DATA_DETECTED = 1104;
  {$EXTERNALSYM ERROR_NO_DATA_DETECTED}

//
// MessageId: ERROR_PARTITION_FAILURE
//
// MessageText:
//
//  Tape could not be partitioned.
//

  ERROR_PARTITION_FAILURE = 1105;
  {$EXTERNALSYM ERROR_PARTITION_FAILURE}

//
// MessageId: ERROR_INVALID_BLOCK_LENGTH
//
// MessageText:
//
//  When accessing a new tape of a multivolume partition, the current block size is incorrect.
//

  ERROR_INVALID_BLOCK_LENGTH = 1106;
  {$EXTERNALSYM ERROR_INVALID_BLOCK_LENGTH}

//
// MessageId: ERROR_DEVICE_NOT_PARTITIONED
//
// MessageText:
//
//  Tape partition information could not be found when loading a tape.
//

  ERROR_DEVICE_NOT_PARTITIONED = 1107;
  {$EXTERNALSYM ERROR_DEVICE_NOT_PARTITIONED}

//
// MessageId: ERROR_UNABLE_TO_LOCK_MEDIA
//
// MessageText:
//
//  Unable to lock the media eject mechanism.
//

  ERROR_UNABLE_TO_LOCK_MEDIA = 1108;
  {$EXTERNALSYM ERROR_UNABLE_TO_LOCK_MEDIA}

//
// MessageId: ERROR_UNABLE_TO_UNLOAD_MEDIA
//
// MessageText:
//
//  Unable to unload the media.
//

  ERROR_UNABLE_TO_UNLOAD_MEDIA = 1109;
  {$EXTERNALSYM ERROR_UNABLE_TO_UNLOAD_MEDIA}

//
// MessageId: ERROR_MEDIA_CHANGED
//
// MessageText:
//
//  The media in the drive may have changed.
//

  ERROR_MEDIA_CHANGED = 1110;
  {$EXTERNALSYM ERROR_MEDIA_CHANGED}

//
// MessageId: ERROR_BUS_RESET
//
// MessageText:
//
//  The I/O bus was reset.
//

  ERROR_BUS_RESET = 1111;
  {$EXTERNALSYM ERROR_BUS_RESET}

//
// MessageId: ERROR_NO_MEDIA_IN_DRIVE
//
// MessageText:
//
//  No media in drive.
//

  ERROR_NO_MEDIA_IN_DRIVE = 1112;
  {$EXTERNALSYM ERROR_NO_MEDIA_IN_DRIVE}

//
// MessageId: ERROR_NO_UNICODE_TRANSLATION
//
// MessageText:
//
//  No mapping for the Unicode character exists in the target multi-byte code page.
//

  ERROR_NO_UNICODE_TRANSLATION = 1113;
  {$EXTERNALSYM ERROR_NO_UNICODE_TRANSLATION}

//
// MessageId: ERROR_DLL_INIT_FAILED
//
// MessageText:
//
//  A dynamic link library (DLL) initialization routine failed.
//

  ERROR_DLL_INIT_FAILED = 1114;
  {$EXTERNALSYM ERROR_DLL_INIT_FAILED}

//
// MessageId: ERROR_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
//  A system shutdown is in progress.
//

  ERROR_SHUTDOWN_IN_PROGRESS = 1115;
  {$EXTERNALSYM ERROR_SHUTDOWN_IN_PROGRESS}

//
// MessageId: ERROR_NO_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
//  Unable to abort the system shutdown because no shutdown was in progress.
//

  ERROR_NO_SHUTDOWN_IN_PROGRESS = 1116;
  {$EXTERNALSYM ERROR_NO_SHUTDOWN_IN_PROGRESS}

//
// MessageId: ERROR_IO_DEVICE
//
// MessageText:
//
//  The request could not be performed because of an I/O device error.
//

  ERROR_IO_DEVICE = 1117;
  {$EXTERNALSYM ERROR_IO_DEVICE}

//
// MessageId: ERROR_SERIAL_NO_DEVICE
//
// MessageText:
//
//  No serial device was successfully initialized. The serial driver will unload.
//

  ERROR_SERIAL_NO_DEVICE = 1118;
  {$EXTERNALSYM ERROR_SERIAL_NO_DEVICE}

//
// MessageId: ERROR_IRQ_BUSY
//
// MessageText:
//
//  Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.
//

  ERROR_IRQ_BUSY = 1119;
  {$EXTERNALSYM ERROR_IRQ_BUSY}

//
// MessageId: ERROR_MORE_WRITES
//
// MessageText:
//
//  A serial I/O operation was completed by another write to the serial port.
//  (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
//

  ERROR_MORE_WRITES = 1120;
  {$EXTERNALSYM ERROR_MORE_WRITES}

//
// MessageId: ERROR_COUNTER_TIMEOUT
//
// MessageText:
//
//  A serial I/O operation completed because the timeout period expired.
//  (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
//

  ERROR_COUNTER_TIMEOUT = 1121;
  {$EXTERNALSYM ERROR_COUNTER_TIMEOUT}

//
// MessageId: ERROR_FLOPPY_ID_MARK_NOT_FOUND
//
// MessageText:
//
//  No ID address mark was found on the floppy disk.
//

  ERROR_FLOPPY_ID_MARK_NOT_FOUND = 1122;
  {$EXTERNALSYM ERROR_FLOPPY_ID_MARK_NOT_FOUND}

//
// MessageId: ERROR_FLOPPY_WRONG_CYLINDER
//
// MessageText:
//
//  Mismatch between the floppy disk sector ID field and the floppy disk controller track address.
//

  ERROR_FLOPPY_WRONG_CYLINDER = 1123;
  {$EXTERNALSYM ERROR_FLOPPY_WRONG_CYLINDER}

//
// MessageId: ERROR_FLOPPY_UNKNOWN_ERROR
//
// MessageText:
//
//  The floppy disk controller reported an error that is not recognized by the floppy disk driver.
//

  ERROR_FLOPPY_UNKNOWN_ERROR = 1124;
  {$EXTERNALSYM ERROR_FLOPPY_UNKNOWN_ERROR}

//
// MessageId: ERROR_FLOPPY_BAD_REGISTERS
//
// MessageText:
//
//  The floppy disk controller returned inconsistent results in its registers.
//

  ERROR_FLOPPY_BAD_REGISTERS = 1125;
  {$EXTERNALSYM ERROR_FLOPPY_BAD_REGISTERS}

//
// MessageId: ERROR_DISK_RECALIBRATE_FAILED
//
// MessageText:
//
//  While accessing the hard disk, a recalibrate operation failed, even after retries.
//

  ERROR_DISK_RECALIBRATE_FAILED = 1126;
  {$EXTERNALSYM ERROR_DISK_RECALIBRATE_FAILED}

//
// MessageId: ERROR_DISK_OPERATION_FAILED
//
// MessageText:
//
//  While accessing the hard disk, a disk operation failed even after retries.
//

  ERROR_DISK_OPERATION_FAILED = 1127;
  {$EXTERNALSYM ERROR_DISK_OPERATION_FAILED}

//
// MessageId: ERROR_DISK_RESET_FAILED
//
// MessageText:
//
//  While accessing the hard disk, a disk controller reset was needed, but even that failed.
//

  ERROR_DISK_RESET_FAILED = 1128;
  {$EXTERNALSYM ERROR_DISK_RESET_FAILED}

//
// MessageId: ERROR_EOM_OVERFLOW
//
// MessageText:
//
//  Physical end of tape encountered.
//

  ERROR_EOM_OVERFLOW = 1129;
  {$EXTERNALSYM ERROR_EOM_OVERFLOW}

//
// MessageId: ERROR_NOT_ENOUGH_SERVER_MEMORY
//
// MessageText:
//
//  Not enough server storage is available to process this command.
//

  ERROR_NOT_ENOUGH_SERVER_MEMORY = 1130;
  {$EXTERNALSYM ERROR_NOT_ENOUGH_SERVER_MEMORY}

//
// MessageId: ERROR_POSSIBLE_DEADLOCK
//
// MessageText:
//
//  A potential deadlock condition has been detected.
//

  ERROR_POSSIBLE_DEADLOCK = 1131;
  {$EXTERNALSYM ERROR_POSSIBLE_DEADLOCK}

//
// MessageId: ERROR_MAPPED_ALIGNMENT
//
// MessageText:
//
//  The base address or the file offset specified does not have the proper alignment.
//

  ERROR_MAPPED_ALIGNMENT = 1132;
  {$EXTERNALSYM ERROR_MAPPED_ALIGNMENT}

//
// MessageId: ERROR_SET_POWER_STATE_VETOED
//
// MessageText:
//
//  An attempt to change the system power state was vetoed by another application or driver.
//

  ERROR_SET_POWER_STATE_VETOED = 1140;
  {$EXTERNALSYM ERROR_SET_POWER_STATE_VETOED}

//
// MessageId: ERROR_SET_POWER_STATE_FAILED
//
// MessageText:
//
//  The system BIOS failed an attempt to change the system power state.
//

  ERROR_SET_POWER_STATE_FAILED = 1141;
  {$EXTERNALSYM ERROR_SET_POWER_STATE_FAILED}

//
// MessageId: ERROR_TOO_MANY_LINKS
//
// MessageText:
//
//  An attempt was made to create more links on a file than the file system supports.
//

  ERROR_TOO_MANY_LINKS = 1142;
  {$EXTERNALSYM ERROR_TOO_MANY_LINKS}

//
// MessageId: ERROR_OLD_WIN_VERSION
//
// MessageText:
//
//  The specified program requires a newer version of Windows.
//

  ERROR_OLD_WIN_VERSION = 1150;
  {$EXTERNALSYM ERROR_OLD_WIN_VERSION}

//
// MessageId: ERROR_APP_WRONG_OS
//
// MessageText:
//
//  The specified program is not a Windows or MS-DOS program.
//

  ERROR_APP_WRONG_OS = 1151;
  {$EXTERNALSYM ERROR_APP_WRONG_OS}

//
// MessageId: ERROR_SINGLE_INSTANCE_APP
//
// MessageText:
//
//  Cannot start more than one instance of the specified program.
//

  ERROR_SINGLE_INSTANCE_APP = 1152;
  {$EXTERNALSYM ERROR_SINGLE_INSTANCE_APP}

//
// MessageId: ERROR_RMODE_APP
//
// MessageText:
//
//  The specified program was written for an earlier version of Windows.
//

  ERROR_RMODE_APP = 1153;
  {$EXTERNALSYM ERROR_RMODE_APP}

//
// MessageId: ERROR_INVALID_DLL
//
// MessageText:
//
//  One of the library files needed to run this application is damaged.
//

  ERROR_INVALID_DLL = 1154;
  {$EXTERNALSYM ERROR_INVALID_DLL}

//
// MessageId: ERROR_NO_ASSOCIATION
//
// MessageText:
//
//  No application is associated with the specified file for this operation.
//

  ERROR_NO_ASSOCIATION = 1155;
  {$EXTERNALSYM ERROR_NO_ASSOCIATION}

//
// MessageId: ERROR_DDE_FAIL
//
// MessageText:
//
//  An error occurred in sending the command to the application.
//

  ERROR_DDE_FAIL = 1156;
  {$EXTERNALSYM ERROR_DDE_FAIL}

//
// MessageId: ERROR_DLL_NOT_FOUND
//
// MessageText:
//
//  One of the library files needed to run this application cannot be found.
//

  ERROR_DLL_NOT_FOUND = 1157;
  {$EXTERNALSYM ERROR_DLL_NOT_FOUND}

//
// MessageId: ERROR_NO_MORE_USER_HANDLES
//
// MessageText:
//
//  The current process has used all of its system allowance of handles for Window Manager objects.
//

  ERROR_NO_MORE_USER_HANDLES = 1158;
  {$EXTERNALSYM ERROR_NO_MORE_USER_HANDLES}

//
// MessageId: ERROR_MESSAGE_SYNC_ONLY
//
// MessageText:
//
//  The message can be used only with synchronous operations.
//

  ERROR_MESSAGE_SYNC_ONLY = 1159;
  {$EXTERNALSYM ERROR_MESSAGE_SYNC_ONLY}

//
// MessageId: ERROR_SOURCE_ELEMENT_EMPTY
//
// MessageText:
//
//  The indicated source element has no media.
//

  ERROR_SOURCE_ELEMENT_EMPTY = 1160;
  {$EXTERNALSYM ERROR_SOURCE_ELEMENT_EMPTY}

//
// MessageId: ERROR_DESTINATION_ELEMENT_FULL
//
// MessageText:
//
//  The indicated destination element already contains media.
//

  ERROR_DESTINATION_ELEMENT_FULL = 1161;
  {$EXTERNALSYM ERROR_DESTINATION_ELEMENT_FULL}

//
// MessageId: ERROR_ILLEGAL_ELEMENT_ADDRESS
//
// MessageText:
//
//  The indicated element does not exist.
//

  ERROR_ILLEGAL_ELEMENT_ADDRESS = 1162;
  {$EXTERNALSYM ERROR_ILLEGAL_ELEMENT_ADDRESS}

//
// MessageId: ERROR_MAGAZINE_NOT_PRESENT
//
// MessageText:
//
//  The indicated element is part of a magazine that is not present.
//

  ERROR_MAGAZINE_NOT_PRESENT = 1163;
  {$EXTERNALSYM ERROR_MAGAZINE_NOT_PRESENT}

//
// MessageId: ERROR_DEVICE_REINITIALIZATION_NEEDED
//
// MessageText:
//
//  The indicated device requires reinitialization due to hardware errors.
//

  ERROR_DEVICE_REINITIALIZATION_NEEDED = 1164; // dderror
  {$EXTERNALSYM ERROR_DEVICE_REINITIALIZATION_NEEDED}

//
// MessageId: ERROR_DEVICE_REQUIRES_CLEANING
//
// MessageText:
//
//  The device has indicated that cleaning is required before further operations are attempted.
//

  ERROR_DEVICE_REQUIRES_CLEANING = 1165;
  {$EXTERNALSYM ERROR_DEVICE_REQUIRES_CLEANING}

//
// MessageId: ERROR_DEVICE_DOOR_OPEN
//
// MessageText:
//
//  The device has indicated that its door is open.
//

  ERROR_DEVICE_DOOR_OPEN = 1166;
  {$EXTERNALSYM ERROR_DEVICE_DOOR_OPEN}

//
// MessageId: ERROR_DEVICE_NOT_CONNECTED
//
// MessageText:
//
//  The device is not connected.
//

  ERROR_DEVICE_NOT_CONNECTED = 1167;
  {$EXTERNALSYM ERROR_DEVICE_NOT_CONNECTED}

//
// MessageId: ERROR_NOT_FOUND
//
// MessageText:
//
//  Element not found.
//

  ERROR_NOT_FOUND = 1168;
  {$EXTERNALSYM ERROR_NOT_FOUND}

//
// MessageId: ERROR_NO_MATCH
//
// MessageText:
//
//  There was no match for the specified key in the index.
//

  ERROR_NO_MATCH = 1169;
  {$EXTERNALSYM ERROR_NO_MATCH}

//
// MessageId: ERROR_SET_NOT_FOUND
//
// MessageText:
//
//  The property set specified does not exist on the object.
//

  ERROR_SET_NOT_FOUND = 1170;
  {$EXTERNALSYM ERROR_SET_NOT_FOUND}

//
// MessageId: ERROR_POINT_NOT_FOUND
//
// MessageText:
//
//  The point passed to GetMouseMovePoints is not in the buffer.
//

  ERROR_POINT_NOT_FOUND = 1171;
  {$EXTERNALSYM ERROR_POINT_NOT_FOUND}

//
// MessageId: ERROR_NO_TRACKING_SERVICE
//
// MessageText:
//
//  The tracking (workstation) service is not running.
//

  ERROR_NO_TRACKING_SERVICE = 1172;
  {$EXTERNALSYM ERROR_NO_TRACKING_SERVICE}

//
// MessageId: ERROR_NO_VOLUME_ID
//
// MessageText:
//
//  The Volume ID could not be found.
//

  ERROR_NO_VOLUME_ID = 1173;
  {$EXTERNALSYM ERROR_NO_VOLUME_ID}

//
// MessageId: ERROR_UNABLE_TO_REMOVE_REPLACED
//
// MessageText:
//
//  Unable to remove the file to be replaced.
//

  ERROR_UNABLE_TO_REMOVE_REPLACED = 1175;
  {$EXTERNALSYM ERROR_UNABLE_TO_REMOVE_REPLACED}

//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT
//
// MessageText:
//
//  Unable to move the replacement file to the file to be replaced. The file to be replaced has retained its original name.
//

  ERROR_UNABLE_TO_MOVE_REPLACEMENT = 1176;
  {$EXTERNALSYM ERROR_UNABLE_TO_MOVE_REPLACEMENT}

//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT_2
//
// MessageText:
//
//  Unable to move the replacement file to the file to be replaced. The file to be replaced has been renamed using the backup name.
//

  ERROR_UNABLE_TO_MOVE_REPLACEMENT_2 = 1177;
  {$EXTERNALSYM ERROR_UNABLE_TO_MOVE_REPLACEMENT_2}

//
// MessageId: ERROR_JOURNAL_DELETE_IN_PROGRESS
//
// MessageText:
//
//  The volume change journal is being deleted.
//

  ERROR_JOURNAL_DELETE_IN_PROGRESS = 1178;
  {$EXTERNALSYM ERROR_JOURNAL_DELETE_IN_PROGRESS}

//
// MessageId: ERROR_JOURNAL_NOT_ACTIVE
//
// MessageText:
//
//  The volume change journal service is not active.
//

  ERROR_JOURNAL_NOT_ACTIVE = 1179;
  {$EXTERNALSYM ERROR_JOURNAL_NOT_ACTIVE}

//
// MessageId: ERROR_POTENTIAL_FILE_FOUND
//
// MessageText:
//
//  A file was found, but it may not be the correct file.
//

  ERROR_POTENTIAL_FILE_FOUND = 1180;
  {$EXTERNALSYM ERROR_POTENTIAL_FILE_FOUND}

//
// MessageId: ERROR_JOURNAL_ENTRY_DELETED
//
// MessageText:
//
//  The journal entry has been deleted from the journal.
//

  ERROR_JOURNAL_ENTRY_DELETED = 1181;
  {$EXTERNALSYM ERROR_JOURNAL_ENTRY_DELETED}

//
// MessageId: ERROR_BAD_DEVICE
//
// MessageText:
//
//  The specified device name is invalid.
//

  ERROR_BAD_DEVICE = 1200;
  {$EXTERNALSYM ERROR_BAD_DEVICE}

//
// MessageId: ERROR_CONNECTION_UNAVAIL
//
// MessageText:
//
//  The device is not currently connected but it is a remembered connection.
//

  ERROR_CONNECTION_UNAVAIL = 1201;
  {$EXTERNALSYM ERROR_CONNECTION_UNAVAIL}

//
// MessageId: ERROR_DEVICE_ALREADY_REMEMBERED
//
// MessageText:
//
//  An attempt was made to remember a device that had previously been remembered.
//

  ERROR_DEVICE_ALREADY_REMEMBERED = 1202;
  {$EXTERNALSYM ERROR_DEVICE_ALREADY_REMEMBERED}

//
// MessageId: ERROR_NO_NET_OR_BAD_PATH
//
// MessageText:
//
//  No network provider accepted the given network path.
//

  ERROR_NO_NET_OR_BAD_PATH = 1203;
  {$EXTERNALSYM ERROR_NO_NET_OR_BAD_PATH}

//
// MessageId: ERROR_BAD_PROVIDER
//
// MessageText:
//
//  The specified network provider name is invalid.
//

  ERROR_BAD_PROVIDER = 1204;
  {$EXTERNALSYM ERROR_BAD_PROVIDER}

//
// MessageId: ERROR_CANNOT_OPEN_PROFILE
//
// MessageText:
//
//  Unable to open the network connection profile.
//

  ERROR_CANNOT_OPEN_PROFILE = 1205;
  {$EXTERNALSYM ERROR_CANNOT_OPEN_PROFILE}

//
// MessageId: ERROR_BAD_PROFILE
//
// MessageText:
//
//  The network connection profile is corrupted.
//

  ERROR_BAD_PROFILE = 1206;
  {$EXTERNALSYM ERROR_BAD_PROFILE}

//
// MessageId: ERROR_NOT_CONTAINER
//
// MessageText:
//
//  Cannot enumerate a noncontainer.
//

  ERROR_NOT_CONTAINER = 1207;
  {$EXTERNALSYM ERROR_NOT_CONTAINER}

//
// MessageId: ERROR_EXTENDED_ERROR
//
// MessageText:
//
//  An extended error has occurred.
//

  ERROR_EXTENDED_ERROR = 1208;
  {$EXTERNALSYM ERROR_EXTENDED_ERROR}

//
// MessageId: ERROR_INVALID_GROUPNAME
//
// MessageText:
//
//  The format of the specified group name is invalid.
//

  ERROR_INVALID_GROUPNAME = 1209;
  {$EXTERNALSYM ERROR_INVALID_GROUPNAME}

//
// MessageId: ERROR_INVALID_COMPUTERNAME
//
// MessageText:
//
//  The format of the specified computer name is invalid.
//

  ERROR_INVALID_COMPUTERNAME = 1210;
  {$EXTERNALSYM ERROR_INVALID_COMPUTERNAME}

//
// MessageId: ERROR_INVALID_EVENTNAME
//
// MessageText:
//
//  The format of the specified event name is invalid.
//

  ERROR_INVALID_EVENTNAME = 1211;
  {$EXTERNALSYM ERROR_INVALID_EVENTNAME}

//
// MessageId: ERROR_INVALID_DOMAINNAME
//
// MessageText:
//
//  The format of the specified domain name is invalid.
//

  ERROR_INVALID_DOMAINNAME = 1212;
  {$EXTERNALSYM ERROR_INVALID_DOMAINNAME}

//
// MessageId: ERROR_INVALID_SERVICENAME
//
// MessageText:
//
//  The format of the specified service name is invalid.
//

  ERROR_INVALID_SERVICENAME = 1213;
  {$EXTERNALSYM ERROR_INVALID_SERVICENAME}

//
// MessageId: ERROR_INVALID_NETNAME
//
// MessageText:
//
//  The format of the specified network name is invalid.
//

  ERROR_INVALID_NETNAME = 1214;
  {$EXTERNALSYM ERROR_INVALID_NETNAME}

//
// MessageId: ERROR_INVALID_SHARENAME
//
// MessageText:
//
//  The format of the specified share name is invalid.
//

  ERROR_INVALID_SHARENAME = 1215;
  {$EXTERNALSYM ERROR_INVALID_SHARENAME}

//
// MessageId: ERROR_INVALID_PASSWORDNAME
//
// MessageText:
//
//  The format of the specified password is invalid.
//

  ERROR_INVALID_PASSWORDNAME = 1216;
  {$EXTERNALSYM ERROR_INVALID_PASSWORDNAME}

//
// MessageId: ERROR_INVALID_MESSAGENAME
//
// MessageText:
//
//  The format of the specified message name is invalid.
//

  ERROR_INVALID_MESSAGENAME = 1217;
  {$EXTERNALSYM ERROR_INVALID_MESSAGENAME}

//
// MessageId: ERROR_INVALID_MESSAGEDEST
//
// MessageText:
//
//  The format of the specified message destination is invalid.
//

  ERROR_INVALID_MESSAGEDEST = 1218;
  {$EXTERNALSYM ERROR_INVALID_MESSAGEDEST}

//
// MessageId: ERROR_SESSION_CREDENTIAL_CONFLICT
//
// MessageText:
//
//  The credentials supplied conflict with an existing set of credentials.
//

  ERROR_SESSION_CREDENTIAL_CONFLICT = 1219;
  {$EXTERNALSYM ERROR_SESSION_CREDENTIAL_CONFLICT}

//
// MessageId: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
//
// MessageText:
//
//  An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
//

  ERROR_REMOTE_SESSION_LIMIT_EXCEEDED = 1220;
  {$EXTERNALSYM ERROR_REMOTE_SESSION_LIMIT_EXCEEDED}

//
// MessageId: ERROR_DUP_DOMAINNAME
//
// MessageText:
//
//  The workgroup or domain name is already in use by another computer on the network.
//

  ERROR_DUP_DOMAINNAME = 1221;
  {$EXTERNALSYM ERROR_DUP_DOMAINNAME}

//
// MessageId: ERROR_NO_NETWORK
//
// MessageText:
//
//  The network is not present or not started.
//

  ERROR_NO_NETWORK = 1222;
  {$EXTERNALSYM ERROR_NO_NETWORK}

//
// MessageId: ERROR_CANCELLED
//
// MessageText:
//
//  The operation was canceled by the user.
//

  ERROR_CANCELLED = 1223;
  {$EXTERNALSYM ERROR_CANCELLED}

//
// MessageId: ERROR_USER_MAPPED_FILE
//
// MessageText:
//
//  The requested operation cannot be performed on a file with a user-mapped section open.
//

  ERROR_USER_MAPPED_FILE = 1224;
  {$EXTERNALSYM ERROR_USER_MAPPED_FILE}

//
// MessageId: ERROR_CONNECTION_REFUSED
//
// MessageText:
//
//  The remote system refused the network connection.
//

  ERROR_CONNECTION_REFUSED = 1225;
  {$EXTERNALSYM ERROR_CONNECTION_REFUSED}

//
// MessageId: ERROR_GRACEFUL_DISCONNECT
//
// MessageText:
//
//  The network connection was gracefully closed.
//

  ERROR_GRACEFUL_DISCONNECT = 1226;
  {$EXTERNALSYM ERROR_GRACEFUL_DISCONNECT}

//
// MessageId: ERROR_ADDRESS_ALREADY_ASSOCIATED
//
// MessageText:
//
//  The network transport endpoint already has an address associated with it.
//

  ERROR_ADDRESS_ALREADY_ASSOCIATED = 1227;
  {$EXTERNALSYM ERROR_ADDRESS_ALREADY_ASSOCIATED}

//
// MessageId: ERROR_ADDRESS_NOT_ASSOCIATED
//
// MessageText:
//
//  An address has not yet been associated with the network endpoint.
//

  ERROR_ADDRESS_NOT_ASSOCIATED = 1228;
  {$EXTERNALSYM ERROR_ADDRESS_NOT_ASSOCIATED}

//
// MessageId: ERROR_CONNECTION_INVALID
//
// MessageText:
//
//  An operation was attempted on a nonexistent network connection.
//

  ERROR_CONNECTION_INVALID = 1229;
  {$EXTERNALSYM ERROR_CONNECTION_INVALID}

//
// MessageId: ERROR_CONNECTION_ACTIVE
//
// MessageText:
//
//  An invalid operation was attempted on an active network connection.
//

  ERROR_CONNECTION_ACTIVE = 1230;
  {$EXTERNALSYM ERROR_CONNECTION_ACTIVE}

//
// MessageId: ERROR_NETWORK_UNREACHABLE
//
// MessageText:
//
//  The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//

  ERROR_NETWORK_UNREACHABLE = 1231;
  {$EXTERNALSYM ERROR_NETWORK_UNREACHABLE}

//
// MessageId: ERROR_HOST_UNREACHABLE
//
// MessageText:
//
//  The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//

  ERROR_HOST_UNREACHABLE = 1232;
  {$EXTERNALSYM ERROR_HOST_UNREACHABLE}

//
// MessageId: ERROR_PROTOCOL_UNREACHABLE
//
// MessageText:
//
//  The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//

  ERROR_PROTOCOL_UNREACHABLE = 1233;
  {$EXTERNALSYM ERROR_PROTOCOL_UNREACHABLE}

//
// MessageId: ERROR_PORT_UNREACHABLE
//
// MessageText:
//
//  No service is operating at the destination network endpoint on the remote system.
//

  ERROR_PORT_UNREACHABLE = 1234;
  {$EXTERNALSYM ERROR_PORT_UNREACHABLE}

//
// MessageId: ERROR_REQUEST_ABORTED
//
// MessageText:
//
//  The request was aborted.
//

  ERROR_REQUEST_ABORTED = 1235;
  {$EXTERNALSYM ERROR_REQUEST_ABORTED}

//
// MessageId: ERROR_CONNECTION_ABORTED
//
// MessageText:
//
//  The network connection was aborted by the local system.
//

  ERROR_CONNECTION_ABORTED = 1236;
  {$EXTERNALSYM ERROR_CONNECTION_ABORTED}

//
// MessageId: ERROR_RETRY
//
// MessageText:
//
//  The operation could not be completed. A retry should be performed.
//

  ERROR_RETRY = 1237;
  {$EXTERNALSYM ERROR_RETRY}

//
// MessageId: ERROR_CONNECTION_COUNT_LIMIT
//
// MessageText:
//
//  A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.
//

  ERROR_CONNECTION_COUNT_LIMIT = 1238;
  {$EXTERNALSYM ERROR_CONNECTION_COUNT_LIMIT}

//
// MessageId: ERROR_LOGIN_TIME_RESTRICTION
//
// MessageText:
//
//  Attempting to log in during an unauthorized time of day for this account.
//

  ERROR_LOGIN_TIME_RESTRICTION = 1239;
  {$EXTERNALSYM ERROR_LOGIN_TIME_RESTRICTION}

//
// MessageId: ERROR_LOGIN_WKSTA_RESTRICTION
//
// MessageText:
//
//  The account is not authorized to log in from this station.
//

  ERROR_LOGIN_WKSTA_RESTRICTION = 1240;
  {$EXTERNALSYM ERROR_LOGIN_WKSTA_RESTRICTION}

//
// MessageId: ERROR_INCORRECT_ADDRESS
//
// MessageText:
//
//  The network address could not be used for the operation requested.
//

  ERROR_INCORRECT_ADDRESS = 1241;
  {$EXTERNALSYM ERROR_INCORRECT_ADDRESS}

//
// MessageId: ERROR_ALREADY_REGISTERED
//
// MessageText:
//
//  The service is already registered.
//

  ERROR_ALREADY_REGISTERED = 1242;
  {$EXTERNALSYM ERROR_ALREADY_REGISTERED}

//
// MessageId: ERROR_SERVICE_NOT_FOUND
//
// MessageText:
//
//  The specified service does not exist.
//

  ERROR_SERVICE_NOT_FOUND = 1243;
  {$EXTERNALSYM ERROR_SERVICE_NOT_FOUND}

//
// MessageId: ERROR_NOT_AUTHENTICATED
//
// MessageText:
//
//  The operation being requested was not performed because the user has not been authenticated.
//

  ERROR_NOT_AUTHENTICATED = 1244;
  {$EXTERNALSYM ERROR_NOT_AUTHENTICATED}

//
// MessageId: ERROR_NOT_LOGGED_ON
//
// MessageText:
//
//  The operation being requested was not performed because the user has not logged on to the network.
//  The specified service does not exist.
//

  ERROR_NOT_LOGGED_ON = 1245;
  {$EXTERNALSYM ERROR_NOT_LOGGED_ON}

//
// MessageId: ERROR_CONTINUE
//
// MessageText:
//
//  Continue with work in progress.
//

  ERROR_CONTINUE = 1246; // dderror
  {$EXTERNALSYM ERROR_CONTINUE}

//
// MessageId: ERROR_ALREADY_INITIALIZED
//
// MessageText:
//
//  An attempt was made to perform an initialization operation when initialization has already been completed.
//

  ERROR_ALREADY_INITIALIZED = 1247;
  {$EXTERNALSYM ERROR_ALREADY_INITIALIZED}

//
// MessageId: ERROR_NO_MORE_DEVICES
//
// MessageText:
//
//  No more local devices.
//

  ERROR_NO_MORE_DEVICES = 1248; // dderror
  {$EXTERNALSYM ERROR_NO_MORE_DEVICES}

//
// MessageId: ERROR_NO_SUCH_SITE
//
// MessageText:
//
//  The specified site does not exist.
//

  ERROR_NO_SUCH_SITE = 1249;
  {$EXTERNALSYM ERROR_NO_SUCH_SITE}

//
// MessageId: ERROR_DOMAIN_CONTROLLER_EXISTS
//
// MessageText:
//
//  A domain controller with the specified name already exists.
//

  ERROR_DOMAIN_CONTROLLER_EXISTS = 1250;
  {$EXTERNALSYM ERROR_DOMAIN_CONTROLLER_EXISTS}

//
// MessageId: ERROR_ONLY_IF_CONNECTED
//
// MessageText:
//
//  This operation is supported only when you are connected to the server.
//

  ERROR_ONLY_IF_CONNECTED = 1251;
  {$EXTERNALSYM ERROR_ONLY_IF_CONNECTED}

//
// MessageId: ERROR_OVERRIDE_NOCHANGES
//
// MessageText:
//
//  The group policy framework should call the extension even if there are no changes.
//

  ERROR_OVERRIDE_NOCHANGES = 1252;
  {$EXTERNALSYM ERROR_OVERRIDE_NOCHANGES}

//
// MessageId: ERROR_BAD_USER_PROFILE
//
// MessageText:
//
//  The specified user does not have a valid profile.
//

  ERROR_BAD_USER_PROFILE = 1253;
  {$EXTERNALSYM ERROR_BAD_USER_PROFILE}

//
// MessageId: ERROR_NOT_SUPPORTED_ON_SBS
//
// MessageText:
//
//  This operation is not supported on a Microsoft Small Business Server
//

  ERROR_NOT_SUPPORTED_ON_SBS = 1254;
  {$EXTERNALSYM ERROR_NOT_SUPPORTED_ON_SBS}



///////////////////////////
//                       //
// Security Status Codes //
//                       //
///////////////////////////


//
// MessageId: ERROR_NOT_ALL_ASSIGNED
//
// MessageText:
//
//  Not all privileges referenced are assigned to the caller.
//

  ERROR_NOT_ALL_ASSIGNED = 1300;
  {$EXTERNALSYM ERROR_NOT_ALL_ASSIGNED}

//
// MessageId: ERROR_SOME_NOT_MAPPED
//
// MessageText:
//
//  Some mapping between account names and security IDs was not done.
//

  ERROR_SOME_NOT_MAPPED = 1301;
  {$EXTERNALSYM ERROR_SOME_NOT_MAPPED}

//
// MessageId: ERROR_NO_QUOTAS_FOR_ACCOUNT
//
// MessageText:
//
//  No system quota limits are specifically set for this account.
//

  ERROR_NO_QUOTAS_FOR_ACCOUNT = 1302;
  {$EXTERNALSYM ERROR_NO_QUOTAS_FOR_ACCOUNT}

//
// MessageId: ERROR_LOCAL_USER_SESSION_KEY
//
// MessageText:
//
//  No encryption key is available. A well-known encryption key was returned.
//

  ERROR_LOCAL_USER_SESSION_KEY = 1303;
  {$EXTERNALSYM ERROR_LOCAL_USER_SESSION_KEY}

//
// MessageId: ERROR_NULL_LM_PASSWORD
//
// MessageText:
//
//  The password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a NULL string.
//

  ERROR_NULL_LM_PASSWORD = 1304;
  {$EXTERNALSYM ERROR_NULL_LM_PASSWORD}

//
// MessageId: ERROR_UNKNOWN_REVISION
//
// MessageText:
//
//  The revision level is unknown.
//

  ERROR_UNKNOWN_REVISION = 1305;
  {$EXTERNALSYM ERROR_UNKNOWN_REVISION}

//
// MessageId: ERROR_REVISION_MISMATCH
//
// MessageText:
//
//  Indicates two revision levels are incompatible.
//

  ERROR_REVISION_MISMATCH = 1306;
  {$EXTERNALSYM ERROR_REVISION_MISMATCH}

//
// MessageId: ERROR_INVALID_OWNER
//
// MessageText:
//
//  This security ID may not be assigned as the owner of this object.
//

  ERROR_INVALID_OWNER = 1307;
  {$EXTERNALSYM ERROR_INVALID_OWNER}

//
// MessageId: ERROR_INVALID_PRIMARY_GROUP
//
// MessageText:
//
//  This security ID may not be assigned as the primary group of an object.
//

  ERROR_INVALID_PRIMARY_GROUP = 1308;
  {$EXTERNALSYM ERROR_INVALID_PRIMARY_GROUP}

//
// MessageId: ERROR_NO_IMPERSONATION_TOKEN
//
// MessageText:
//
//  An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.
//

  ERROR_NO_IMPERSONATION_TOKEN = 1309;
  {$EXTERNALSYM ERROR_NO_IMPERSONATION_TOKEN}

//
// MessageId: ERROR_CANT_DISABLE_MANDATORY
//
// MessageText:
//
//  The group may not be disabled.
//

  ERROR_CANT_DISABLE_MANDATORY = 1310;
  {$EXTERNALSYM ERROR_CANT_DISABLE_MANDATORY}

//
// MessageId: ERROR_NO_LOGON_SERVERS
//
// MessageText:
//
//  There are currently no logon servers available to service the logon request.
//

  ERROR_NO_LOGON_SERVERS = 1311;
  {$EXTERNALSYM ERROR_NO_LOGON_SERVERS}

//
// MessageId: ERROR_NO_SUCH_LOGON_SESSION
//
// MessageText:
//
//  A specified logon session does not exist. It may already have been terminated.
//

  ERROR_NO_SUCH_LOGON_SESSION = 1312;
  {$EXTERNALSYM ERROR_NO_SUCH_LOGON_SESSION}

//
// MessageId: ERROR_NO_SUCH_PRIVILEGE
//
// MessageText:
//
//  A specified privilege does not exist.
//

  ERROR_NO_SUCH_PRIVILEGE = 1313;
  {$EXTERNALSYM ERROR_NO_SUCH_PRIVILEGE}

//
// MessageId: ERROR_PRIVILEGE_NOT_HELD
//
// MessageText:
//
//  A required privilege is not held by the client.
//

  ERROR_PRIVILEGE_NOT_HELD = 1314;
  {$EXTERNALSYM ERROR_PRIVILEGE_NOT_HELD}

//
// MessageId: ERROR_INVALID_ACCOUNT_NAME
//
// MessageText:
//
//  The name provided is not a properly formed account name.
//

  ERROR_INVALID_ACCOUNT_NAME = 1315;
  {$EXTERNALSYM ERROR_INVALID_ACCOUNT_NAME}

//
// MessageId: ERROR_USER_EXISTS
//
// MessageText:
//
//  The specified user already exists.
//

  ERROR_USER_EXISTS = 1316;
  {$EXTERNALSYM ERROR_USER_EXISTS}

//
// MessageId: ERROR_NO_SUCH_USER
//
// MessageText:
//
//  The specified user does not exist.
//

  ERROR_NO_SUCH_USER = 1317;
  {$EXTERNALSYM ERROR_NO_SUCH_USER}

//
// MessageId: ERROR_GROUP_EXISTS
//
// MessageText:
//
//  The specified group already exists.
//

  ERROR_GROUP_EXISTS = 1318;
  {$EXTERNALSYM ERROR_GROUP_EXISTS}

//
// MessageId: ERROR_NO_SUCH_GROUP
//
// MessageText:
//
//  The specified group does not exist.
//

  ERROR_NO_SUCH_GROUP = 1319;
  {$EXTERNALSYM ERROR_NO_SUCH_GROUP}

//
// MessageId: ERROR_MEMBER_IN_GROUP
//
// MessageText:
//
//  Either the specified user account is already a member of the specified group, or the specified group cannot be deleted because it contains a member.
//

  ERROR_MEMBER_IN_GROUP = 1320;
  {$EXTERNALSYM ERROR_MEMBER_IN_GROUP}

//
// MessageId: ERROR_MEMBER_NOT_IN_GROUP
//
// MessageText:
//
//  The specified user account is not a member of the specified group account.
//

  ERROR_MEMBER_NOT_IN_GROUP = 1321;
  {$EXTERNALSYM ERROR_MEMBER_NOT_IN_GROUP}

//
// MessageId: ERROR_LAST_ADMIN
//
// MessageText:
//
//  The last remaining administration account cannot be disabled or deleted.
//

  ERROR_LAST_ADMIN = 1322;
  {$EXTERNALSYM ERROR_LAST_ADMIN}

//
// MessageId: ERROR_WRONG_PASSWORD
//
// MessageText:
//
//  Unable to update the password. The value provided as the current password is incorrect.
//

  ERROR_WRONG_PASSWORD = 1323;
  {$EXTERNALSYM ERROR_WRONG_PASSWORD}

//
// MessageId: ERROR_ILL_FORMED_PASSWORD
//
// MessageText:
//
//  Unable to update the password. The value provided for the new password contains values that are not allowed in passwords.
//

  ERROR_ILL_FORMED_PASSWORD = 1324;
  {$EXTERNALSYM ERROR_ILL_FORMED_PASSWORD}

//
// MessageId: ERROR_PASSWORD_RESTRICTION
//
// MessageText:
//
//  Unable to update the password. The value provided for the new password does not meet the length, complexity, or history requirement of the domain.
//

  ERROR_PASSWORD_RESTRICTION = 1325;
  {$EXTERNALSYM ERROR_PASSWORD_RESTRICTION}

//
// MessageId: ERROR_LOGON_FAILURE
//
// MessageText:
//
//  Logon failure: unknown user name or bad password.
//

  ERROR_LOGON_FAILURE = 1326;
  {$EXTERNALSYM ERROR_LOGON_FAILURE}

//
// MessageId: ERROR_ACCOUNT_RESTRICTION
//
// MessageText:
//
//  Logon failure: user account restriction.
//

  ERROR_ACCOUNT_RESTRICTION = 1327;
  {$EXTERNALSYM ERROR_ACCOUNT_RESTRICTION}

//
// MessageId: ERROR_INVALID_LOGON_HOURS
//
// MessageText:
//
//  Logon failure: account logon time restriction violation.
//

  ERROR_INVALID_LOGON_HOURS = 1328;
  {$EXTERNALSYM ERROR_INVALID_LOGON_HOURS}

//
// MessageId: ERROR_INVALID_WORKSTATION
//
// MessageText:
//
//  Logon failure: user not allowed to log on to this computer.
//

  ERROR_INVALID_WORKSTATION = 1329;
  {$EXTERNALSYM ERROR_INVALID_WORKSTATION}

//
// MessageId: ERROR_PASSWORD_EXPIRED
//
// MessageText:
//
//  Logon failure: the specified account password has expired.
//

  ERROR_PASSWORD_EXPIRED = 1330;
  {$EXTERNALSYM ERROR_PASSWORD_EXPIRED}

//
// MessageId: ERROR_ACCOUNT_DISABLED
//
// MessageText:
//
//  Logon failure: account currently disabled.
//

  ERROR_ACCOUNT_DISABLED = 1331;
  {$EXTERNALSYM ERROR_ACCOUNT_DISABLED}

//
// MessageId: ERROR_NONE_MAPPED
//
// MessageText:
//
//  No mapping between account names and security IDs was done.
//

  ERROR_NONE_MAPPED = 1332;
  {$EXTERNALSYM ERROR_NONE_MAPPED}

//
// MessageId: ERROR_TOO_MANY_LUIDS_REQUESTED
//
// MessageText:
//
//  Too many local user identifiers (LUIDs) were requested at one time.
//

  ERROR_TOO_MANY_LUIDS_REQUESTED = 1333;
  {$EXTERNALSYM ERROR_TOO_MANY_LUIDS_REQUESTED}

//
// MessageId: ERROR_LUIDS_EXHAUSTED
//
// MessageText:
//
//  No more local user identifiers (LUIDs) are available.
//

  ERROR_LUIDS_EXHAUSTED = 1334;
  {$EXTERNALSYM ERROR_LUIDS_EXHAUSTED}

//
// MessageId: ERROR_INVALID_SUB_AUTHORITY
//
// MessageText:
//
//  The subauthority part of a security ID is invalid for this particular use.
//

  ERROR_INVALID_SUB_AUTHORITY = 1335;
  {$EXTERNALSYM ERROR_INVALID_SUB_AUTHORITY}

//
// MessageId: ERROR_INVALID_ACL
//
// MessageText:
//
//  The access control list (ACL) structure is invalid.
//

  ERROR_INVALID_ACL = 1336;
  {$EXTERNALSYM ERROR_INVALID_ACL}

//
// MessageId: ERROR_INVALID_SID
//
// MessageText:
//
//  The security ID structure is invalid.
//

  ERROR_INVALID_SID = 1337;
  {$EXTERNALSYM ERROR_INVALID_SID}

//
// MessageId: ERROR_INVALID_SECURITY_DESCR
//
// MessageText:
//
//  The security descriptor structure is invalid.
//

  ERROR_INVALID_SECURITY_DESCR = 1338;
  {$EXTERNALSYM ERROR_INVALID_SECURITY_DESCR}

//
// MessageId: ERROR_BAD_INHERITANCE_ACL
//
// MessageText:
//
//  The inherited access control list (ACL) or access control entry (ACE) could not be built.
//

  ERROR_BAD_INHERITANCE_ACL = 1340;
  {$EXTERNALSYM ERROR_BAD_INHERITANCE_ACL}

//
// MessageId: ERROR_SERVER_DISABLED
//
// MessageText:
//
//  The server is currently disabled.
//

  ERROR_SERVER_DISABLED = 1341;
  {$EXTERNALSYM ERROR_SERVER_DISABLED}

//
// MessageId: ERROR_SERVER_NOT_DISABLED
//
// MessageText:
//
//  The server is currently enabled.
//

  ERROR_SERVER_NOT_DISABLED = 1342;
  {$EXTERNALSYM ERROR_SERVER_NOT_DISABLED}

//
// MessageId: ERROR_INVALID_ID_AUTHORITY
//
// MessageText:
//
//  The value provided was an invalid value for an identifier authority.
//

  ERROR_INVALID_ID_AUTHORITY = 1343;
  {$EXTERNALSYM ERROR_INVALID_ID_AUTHORITY}

//
// MessageId: ERROR_ALLOTTED_SPACE_EXCEEDED
//
// MessageText:
//
//  No more memory is available for security information updates.
//

  ERROR_ALLOTTED_SPACE_EXCEEDED = 1344;
  {$EXTERNALSYM ERROR_ALLOTTED_SPACE_EXCEEDED}

//
// MessageId: ERROR_INVALID_GROUP_ATTRIBUTES
//
// MessageText:
//
//  The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
//

  ERROR_INVALID_GROUP_ATTRIBUTES = 1345;
  {$EXTERNALSYM ERROR_INVALID_GROUP_ATTRIBUTES}

//
// MessageId: ERROR_BAD_IMPERSONATION_LEVEL
//
// MessageText:
//
//  Either a required impersonation level was not provided, or the provided impersonation level is invalid.
//

  ERROR_BAD_IMPERSONATION_LEVEL = 1346;
  {$EXTERNALSYM ERROR_BAD_IMPERSONATION_LEVEL}

//
// MessageId: ERROR_CANT_OPEN_ANONYMOUS
//
// MessageText:
//
//  Cannot open an anonymous level security token.
//

  ERROR_CANT_OPEN_ANONYMOUS = 1347;
  {$EXTERNALSYM ERROR_CANT_OPEN_ANONYMOUS}

//
// MessageId: ERROR_BAD_VALIDATION_CLASS
//
// MessageText:
//
//  The validation information class requested was invalid.
//

  ERROR_BAD_VALIDATION_CLASS = 1348;
  {$EXTERNALSYM ERROR_BAD_VALIDATION_CLASS}

//
// MessageId: ERROR_BAD_TOKEN_TYPE
//
// MessageText:
//
//  The type of the token is inappropriate for its attempted use.
//

  ERROR_BAD_TOKEN_TYPE = 1349;
  {$EXTERNALSYM ERROR_BAD_TOKEN_TYPE}

//
// MessageId: ERROR_NO_SECURITY_ON_OBJECT
//
// MessageText:
//
//  Unable to perform a security operation on an object that has no associated security.
//

  ERROR_NO_SECURITY_ON_OBJECT = 1350;
  {$EXTERNALSYM ERROR_NO_SECURITY_ON_OBJECT}

//
// MessageId: ERROR_CANT_ACCESS_DOMAIN_INFO
//
// MessageText:
//
//  Configuration information could not be read from the domain controller, either because the machine is unavailable, or access has been denied.
//

  ERROR_CANT_ACCESS_DOMAIN_INFO = 1351;
  {$EXTERNALSYM ERROR_CANT_ACCESS_DOMAIN_INFO}

//
// MessageId: ERROR_INVALID_SERVER_STATE
//
// MessageText:
//
//  The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform the security operation.
//

  ERROR_INVALID_SERVER_STATE = 1352;
  {$EXTERNALSYM ERROR_INVALID_SERVER_STATE}

//
// MessageId: ERROR_INVALID_DOMAIN_STATE
//
// MessageText:
//
//  The domain was in the wrong state to perform the security operation.
//

  ERROR_INVALID_DOMAIN_STATE = 1353;
  {$EXTERNALSYM ERROR_INVALID_DOMAIN_STATE}

//
// MessageId: ERROR_INVALID_DOMAIN_ROLE
//
// MessageText:
//
//  This operation is only allowed for the Primary Domain Controller of the domain.
//

  ERROR_INVALID_DOMAIN_ROLE = 1354;
  {$EXTERNALSYM ERROR_INVALID_DOMAIN_ROLE}

//
// MessageId: ERROR_NO_SUCH_DOMAIN
//
// MessageText:
//
//  The specified domain either does not exist or could not be contacted.
//

  ERROR_NO_SUCH_DOMAIN = 1355;
  {$EXTERNALSYM ERROR_NO_SUCH_DOMAIN}

//
// MessageId: ERROR_DOMAIN_EXISTS
//
// MessageText:
//
//  The specified domain already exists.
//

  ERROR_DOMAIN_EXISTS = 1356;
  {$EXTERNALSYM ERROR_DOMAIN_EXISTS}

//
// MessageId: ERROR_DOMAIN_LIMIT_EXCEEDED
//
// MessageText:
//
//  An attempt was made to exceed the limit on the number of domains per server.
//

  ERROR_DOMAIN_LIMIT_EXCEEDED = 1357;
  {$EXTERNALSYM ERROR_DOMAIN_LIMIT_EXCEEDED}

//
// MessageId: ERROR_INTERNAL_DB_CORRUPTION
//
// MessageText:
//
//  Unable to complete the requested operation because of either a catastrophic media failure or a data structure corruption on the disk.
//

  ERROR_INTERNAL_DB_CORRUPTION = 1358;
  {$EXTERNALSYM ERROR_INTERNAL_DB_CORRUPTION}

//
// MessageId: ERROR_INTERNAL_ERROR
//
// MessageText:
//
//  An internal error occurred.
//

  ERROR_INTERNAL_ERROR = 1359;
  {$EXTERNALSYM ERROR_INTERNAL_ERROR}

//
// MessageId: ERROR_GENERIC_NOT_MAPPED
//
// MessageText:
//
//  Generic access types were contained in an access mask which should already be mapped to nongeneric types.
//

  ERROR_GENERIC_NOT_MAPPED = 1360;
  {$EXTERNALSYM ERROR_GENERIC_NOT_MAPPED}

//
// MessageId: ERROR_BAD_DESCRIPTOR_FORMAT
//
// MessageText:
//
//  A security descriptor is not in the right format (absolute or self-relative).
//

  ERROR_BAD_DESCRIPTOR_FORMAT = 1361;
  {$EXTERNALSYM ERROR_BAD_DESCRIPTOR_FORMAT}

//
// MessageId: ERROR_NOT_LOGON_PROCESS
//
// MessageText:
//
//  The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.
//

  ERROR_NOT_LOGON_PROCESS = 1362;
  {$EXTERNALSYM ERROR_NOT_LOGON_PROCESS}

//
// MessageId: ERROR_LOGON_SESSION_EXISTS
//
// MessageText:
//
//  Cannot start a new logon session with an ID that is already in use.
//

  ERROR_LOGON_SESSION_EXISTS = 1363;
  {$EXTERNALSYM ERROR_LOGON_SESSION_EXISTS}

//
// MessageId: ERROR_NO_SUCH_PACKAGE
//
// MessageText:
//
//  A specified authentication package is unknown.
//

  ERROR_NO_SUCH_PACKAGE = 1364;
  {$EXTERNALSYM ERROR_NO_SUCH_PACKAGE}

//
// MessageId: ERROR_BAD_LOGON_SESSION_STATE
//
// MessageText:
//
//  The logon session is not in a state that is consistent with the requested operation.
//

  ERROR_BAD_LOGON_SESSION_STATE = 1365;
  {$EXTERNALSYM ERROR_BAD_LOGON_SESSION_STATE}

//
// MessageId: ERROR_LOGON_SESSION_COLLISION
//
// MessageText:
//
//  The logon session ID is already in use.
//

  ERROR_LOGON_SESSION_COLLISION = 1366;
  {$EXTERNALSYM ERROR_LOGON_SESSION_COLLISION}

//
// MessageId: ERROR_INVALID_LOGON_TYPE
//
// MessageText:
//
//  A logon request contained an invalid logon type value.
//

  ERROR_INVALID_LOGON_TYPE = 1367;
  {$EXTERNALSYM ERROR_INVALID_LOGON_TYPE}

//
// MessageId: ERROR_CANNOT_IMPERSONATE
//
// MessageText:
//
//  Unable to impersonate using a named pipe until data has been read from that pipe.
//

  ERROR_CANNOT_IMPERSONATE = 1368;
  {$EXTERNALSYM ERROR_CANNOT_IMPERSONATE}

//
// MessageId: ERROR_RXACT_INVALID_STATE
//
// MessageText:
//
//  The transaction state of a registry subtree is incompatible with the requested operation.
//

  ERROR_RXACT_INVALID_STATE = 1369;
  {$EXTERNALSYM ERROR_RXACT_INVALID_STATE}

//
// MessageId: ERROR_RXACT_COMMIT_FAILURE
//
// MessageText:
//
//  An internal security database corruption has been encountered.
//

  ERROR_RXACT_COMMIT_FAILURE = 1370;
  {$EXTERNALSYM ERROR_RXACT_COMMIT_FAILURE}

//
// MessageId: ERROR_SPECIAL_ACCOUNT
//
// MessageText:
//
//  Cannot perform this operation on built-in accounts.
//

  ERROR_SPECIAL_ACCOUNT = 1371;
  {$EXTERNALSYM ERROR_SPECIAL_ACCOUNT}

//
// MessageId: ERROR_SPECIAL_GROUP
//
// MessageText:
//
//  Cannot perform this operation on this built-in special group.
//

  ERROR_SPECIAL_GROUP = 1372;
  {$EXTERNALSYM ERROR_SPECIAL_GROUP}

//
// MessageId: ERROR_SPECIAL_USER
//
// MessageText:
//
//  Cannot perform this operation on this built-in special user.
//

  ERROR_SPECIAL_USER = 1373;
  {$EXTERNALSYM ERROR_SPECIAL_USER}

//
// MessageId: ERROR_MEMBERS_PRIMARY_GROUP
//
// MessageText:
//
//  The user cannot be removed from a group because the group is currently the user's primary group.
//

  ERROR_MEMBERS_PRIMARY_GROUP = 1374;
  {$EXTERNALSYM ERROR_MEMBERS_PRIMARY_GROUP}

//
// MessageId: ERROR_TOKEN_ALREADY_IN_USE
//
// MessageText:
//
//  The token is already in use as a primary token.
//

  ERROR_TOKEN_ALREADY_IN_USE = 1375;
  {$EXTERNALSYM ERROR_TOKEN_ALREADY_IN_USE}

//
// MessageId: ERROR_NO_SUCH_ALIAS
//
// MessageText:
//
//  The specified local group does not exist.
//

  ERROR_NO_SUCH_ALIAS = 1376;
  {$EXTERNALSYM ERROR_NO_SUCH_ALIAS}

//
// MessageId: ERROR_MEMBER_NOT_IN_ALIAS
//
// MessageText:
//
//  The specified account name is not a member of the local group.
//

  ERROR_MEMBER_NOT_IN_ALIAS = 1377;
  {$EXTERNALSYM ERROR_MEMBER_NOT_IN_ALIAS}

//
// MessageId: ERROR_MEMBER_IN_ALIAS
//
// MessageText:
//
//  The specified account name is already a member of the local group.
//

  ERROR_MEMBER_IN_ALIAS = 1378;
  {$EXTERNALSYM ERROR_MEMBER_IN_ALIAS}

//
// MessageId: ERROR_ALIAS_EXISTS
//
// MessageText:
//
//  The specified local group already exists.
//

  ERROR_ALIAS_EXISTS = 1379;
  {$EXTERNALSYM ERROR_ALIAS_EXISTS}

//
// MessageId: ERROR_LOGON_NOT_GRANTED
//
// MessageText:
//
//  Logon failure: the user has not been granted the requested logon type at this computer.
//

  ERROR_LOGON_NOT_GRANTED = 1380;
  {$EXTERNALSYM ERROR_LOGON_NOT_GRANTED}

//
// MessageId: ERROR_TOO_MANY_SECRETS
//
// MessageText:
//
//  The maximum number of secrets that may be stored in a single system has been exceeded.
//

  ERROR_TOO_MANY_SECRETS = 1381;
  {$EXTERNALSYM ERROR_TOO_MANY_SECRETS}

//
// MessageId: ERROR_SECRET_TOO_LONG
//
// MessageText:
//
//  The length of a secret exceeds the maximum length allowed.
//

  ERROR_SECRET_TOO_LONG = 1382;
  {$EXTERNALSYM ERROR_SECRET_TOO_LONG}

//
// MessageId: ERROR_INTERNAL_DB_ERROR
//
// MessageText:
//
//  The local security authority database contains an internal inconsistency.
//

  ERROR_INTERNAL_DB_ERROR = 1383;
  {$EXTERNALSYM ERROR_INTERNAL_DB_ERROR}

//
// MessageId: ERROR_TOO_MANY_CONTEXT_IDS
//
// MessageText:
//
//  During a logon attempt, the user's security context accumulated too many security IDs.
//

  ERROR_TOO_MANY_CONTEXT_IDS = 1384;
  {$EXTERNALSYM ERROR_TOO_MANY_CONTEXT_IDS}

//
// MessageId: ERROR_LOGON_TYPE_NOT_GRANTED
//
// MessageText:
//
//  Logon failure: the user has not been granted the requested logon type at this computer.
//

  ERROR_LOGON_TYPE_NOT_GRANTED = 1385;
  {$EXTERNALSYM ERROR_LOGON_TYPE_NOT_GRANTED}

//
// MessageId: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
//  A cross-encrypted password is necessary to change a user password.
//

  ERROR_NT_CROSS_ENCRYPTION_REQUIRED = 1386;
  {$EXTERNALSYM ERROR_NT_CROSS_ENCRYPTION_REQUIRED}

//
// MessageId: ERROR_NO_SUCH_MEMBER
//
// MessageText:
//
//  A member could not be added to or removed from the local group because the member does not exist.
//

  ERROR_NO_SUCH_MEMBER = 1387;
  {$EXTERNALSYM ERROR_NO_SUCH_MEMBER}

//
// MessageId: ERROR_INVALID_MEMBER
//
// MessageText:
//
//  A new member could not be added to a local group because the member has the wrong account type.
//

  ERROR_INVALID_MEMBER = 1388;
  {$EXTERNALSYM ERROR_INVALID_MEMBER}

//
// MessageId: ERROR_TOO_MANY_SIDS
//
// MessageText:
//
//  Too many security IDs have been specified.
//

  ERROR_TOO_MANY_SIDS = 1389;
  {$EXTERNALSYM ERROR_TOO_MANY_SIDS}

//
// MessageId: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
//  A cross-encrypted password is necessary to change this user password.
//

  ERROR_LM_CROSS_ENCRYPTION_REQUIRED = 1390;
  {$EXTERNALSYM ERROR_LM_CROSS_ENCRYPTION_REQUIRED}

//
// MessageId: ERROR_NO_INHERITANCE
//
// MessageText:
//
//  Indicates an ACL contains no inheritable components.
//

  ERROR_NO_INHERITANCE = 1391;
  {$EXTERNALSYM ERROR_NO_INHERITANCE}

//
// MessageId: ERROR_FILE_CORRUPT
//
// MessageText:
//
//  The file or directory is corrupted and unreadable.
//

  ERROR_FILE_CORRUPT = 1392;
  {$EXTERNALSYM ERROR_FILE_CORRUPT}

//
// MessageId: ERROR_DISK_CORRUPT
//
// MessageText:
//
//  The disk structure is corrupted and unreadable.
//

  ERROR_DISK_CORRUPT = 1393;
  {$EXTERNALSYM ERROR_DISK_CORRUPT}

//
// MessageId: ERROR_NO_USER_SESSION_KEY
//
// MessageText:
//
//  There is no user session key for the specified logon session.
//

  ERROR_NO_USER_SESSION_KEY = 1394;
  {$EXTERNALSYM ERROR_NO_USER_SESSION_KEY}

//
// MessageId: ERROR_LICENSE_QUOTA_EXCEEDED
//
// MessageText:
//
//  The service being accessed is licensed for a particular number of connections.
//  No more connections can be made to the service at this time because there are already as many connections as the service can accept.
//

  ERROR_LICENSE_QUOTA_EXCEEDED = 1395;
  {$EXTERNALSYM ERROR_LICENSE_QUOTA_EXCEEDED}

//
// MessageId: ERROR_WRONG_TARGET_NAME
//
// MessageText:
//
//  Logon Failure: The target account name is incorrect.
//

  ERROR_WRONG_TARGET_NAME = 1396;
  {$EXTERNALSYM ERROR_WRONG_TARGET_NAME}

//
// MessageId: ERROR_MUTUAL_AUTH_FAILED
//
// MessageText:
//
//  Mutual Authentication failed. The server's password is out of date at the domain controller.
//

  ERROR_MUTUAL_AUTH_FAILED = 1397;
  {$EXTERNALSYM ERROR_MUTUAL_AUTH_FAILED}

//
// MessageId: ERROR_TIME_SKEW
//
// MessageText:
//
//  There is a time difference between the client and server.
//

  ERROR_TIME_SKEW = 1398;
  {$EXTERNALSYM ERROR_TIME_SKEW}

// End of security error codes



///////////////////////////
//                       //
// WinUser Error Codes   //
//                       //
///////////////////////////


//
// MessageId: ERROR_INVALID_WINDOW_HANDLE
//
// MessageText:
//
//  Invalid window handle.
//

  ERROR_INVALID_WINDOW_HANDLE = 1400;
  {$EXTERNALSYM ERROR_INVALID_WINDOW_HANDLE}

//
// MessageId: ERROR_INVALID_MENU_HANDLE
//
// MessageText:
//
//  Invalid menu handle.
//

  ERROR_INVALID_MENU_HANDLE = 1401;
  {$EXTERNALSYM ERROR_INVALID_MENU_HANDLE}

//
// MessageId: ERROR_INVALID_CURSOR_HANDLE
//
// MessageText:
//
//  Invalid cursor handle.
//

  ERROR_INVALID_CURSOR_HANDLE = 1402;
  {$EXTERNALSYM ERROR_INVALID_CURSOR_HANDLE}

//
// MessageId: ERROR_INVALID_ACCEL_HANDLE
//
// MessageText:
//
//  Invalid accelerator table handle.
//

  ERROR_INVALID_ACCEL_HANDLE = 1403;
  {$EXTERNALSYM ERROR_INVALID_ACCEL_HANDLE}

//
// MessageId: ERROR_INVALID_HOOK_HANDLE
//
// MessageText:
//
//  Invalid hook handle.
//

  ERROR_INVALID_HOOK_HANDLE = 1404;
  {$EXTERNALSYM ERROR_INVALID_HOOK_HANDLE}

//
// MessageId: ERROR_INVALID_DWP_HANDLE
//
// MessageText:
//
//  Invalid handle to a multiple-window position structure.
//

  ERROR_INVALID_DWP_HANDLE = 1405;
  {$EXTERNALSYM ERROR_INVALID_DWP_HANDLE}

//
// MessageId: ERROR_TLW_WITH_WSCHILD
//
// MessageText:
//
//  Cannot create a top-level child window.
//

  ERROR_TLW_WITH_WSCHILD = 1406;
  {$EXTERNALSYM ERROR_TLW_WITH_WSCHILD}

//
// MessageId: ERROR_CANNOT_FIND_WND_CLASS
//
// MessageText:
//
//  Cannot find window class.
//

  ERROR_CANNOT_FIND_WND_CLASS = 1407;
  {$EXTERNALSYM ERROR_CANNOT_FIND_WND_CLASS}

//
// MessageId: ERROR_WINDOW_OF_OTHER_THREAD
//
// MessageText:
//
//  Invalid window; it belongs to other thread.
//

  ERROR_WINDOW_OF_OTHER_THREAD = 1408;
  {$EXTERNALSYM ERROR_WINDOW_OF_OTHER_THREAD}

//
// MessageId: ERROR_HOTKEY_ALREADY_REGISTERED
//
// MessageText:
//
//  Hot key is already registered.
//

  ERROR_HOTKEY_ALREADY_REGISTERED = 1409;
  {$EXTERNALSYM ERROR_HOTKEY_ALREADY_REGISTERED}

//
// MessageId: ERROR_CLASS_ALREADY_EXISTS
//
// MessageText:
//
//  Class already exists.
//

  ERROR_CLASS_ALREADY_EXISTS = 1410;
  {$EXTERNALSYM ERROR_CLASS_ALREADY_EXISTS}

//
// MessageId: ERROR_CLASS_DOES_NOT_EXIST
//
// MessageText:
//
//  Class does not exist.
//

  ERROR_CLASS_DOES_NOT_EXIST = 1411;
  {$EXTERNALSYM ERROR_CLASS_DOES_NOT_EXIST}

//
// MessageId: ERROR_CLASS_HAS_WINDOWS
//
// MessageText:
//
//  Class still has open windows.
//

  ERROR_CLASS_HAS_WINDOWS = 1412;
  {$EXTERNALSYM ERROR_CLASS_HAS_WINDOWS}

//
// MessageId: ERROR_INVALID_INDEX
//
// MessageText:
//
//  Invalid index.
//

  ERROR_INVALID_INDEX = 1413;
  {$EXTERNALSYM ERROR_INVALID_INDEX}

//
// MessageId: ERROR_INVALID_ICON_HANDLE
//
// MessageText:
//
//  Invalid icon handle.
//

  ERROR_INVALID_ICON_HANDLE = 1414;
  {$EXTERNALSYM ERROR_INVALID_ICON_HANDLE}

//
// MessageId: ERROR_PRIVATE_DIALOG_INDEX
//
// MessageText:
//
//  Using private DIALOG window words.
//

  ERROR_PRIVATE_DIALOG_INDEX = 1415;
  {$EXTERNALSYM ERROR_PRIVATE_DIALOG_INDEX}

//
// MessageId: ERROR_LISTBOX_ID_NOT_FOUND
//
// MessageText:
//
//  The list box identifier was not found.
//

  ERROR_LISTBOX_ID_NOT_FOUND = 1416;
  {$EXTERNALSYM ERROR_LISTBOX_ID_NOT_FOUND}

//
// MessageId: ERROR_NO_WILDCARD_CHARACTERS
//
// MessageText:
//
//  No wildcards were found.
//

  ERROR_NO_WILDCARD_CHARACTERS = 1417;
  {$EXTERNALSYM ERROR_NO_WILDCARD_CHARACTERS}

//
// MessageId: ERROR_CLIPBOARD_NOT_OPEN
//
// MessageText:
//
//  Thread does not have a clipboard open.
//

  ERROR_CLIPBOARD_NOT_OPEN = 1418;
  {$EXTERNALSYM ERROR_CLIPBOARD_NOT_OPEN}

//
// MessageId: ERROR_HOTKEY_NOT_REGISTERED
//
// MessageText:
//
//  Hot key is not registered.
//

  ERROR_HOTKEY_NOT_REGISTERED = 1419;
  {$EXTERNALSYM ERROR_HOTKEY_NOT_REGISTERED}

//
// MessageId: ERROR_WINDOW_NOT_DIALOG
//
// MessageText:
//
//  The window is not a valid dialog window.
//

  ERROR_WINDOW_NOT_DIALOG = 1420;
  {$EXTERNALSYM ERROR_WINDOW_NOT_DIALOG}

//
// MessageId: ERROR_CONTROL_ID_NOT_FOUND
//
// MessageText:
//
//  Control ID not found.
//

  ERROR_CONTROL_ID_NOT_FOUND = 1421;
  {$EXTERNALSYM ERROR_CONTROL_ID_NOT_FOUND}

//
// MessageId: ERROR_INVALID_COMBOBOX_MESSAGE
//
// MessageText:
//
//  Invalid message for a combo box because it does not have an edit control.
//

  ERROR_INVALID_COMBOBOX_MESSAGE = 1422;
  {$EXTERNALSYM ERROR_INVALID_COMBOBOX_MESSAGE}

//
// MessageId: ERROR_WINDOW_NOT_COMBOBOX
//
// MessageText:
//
//  The window is not a combo box.
//

  ERROR_WINDOW_NOT_COMBOBOX = 1423;
  {$EXTERNALSYM ERROR_WINDOW_NOT_COMBOBOX}

//
// MessageId: ERROR_INVALID_EDIT_HEIGHT
//
// MessageText:
//
//  Height must be less than 256.
//

  ERROR_INVALID_EDIT_HEIGHT = 1424;
  {$EXTERNALSYM ERROR_INVALID_EDIT_HEIGHT}

//
// MessageId: ERROR_DC_NOT_FOUND
//
// MessageText:
//
//  Invalid device context (DC) handle.
//

  ERROR_DC_NOT_FOUND = 1425;
  {$EXTERNALSYM ERROR_DC_NOT_FOUND}

//
// MessageId: ERROR_INVALID_HOOK_FILTER
//
// MessageText:
//
//  Invalid hook procedure type.
//

  ERROR_INVALID_HOOK_FILTER = 1426;
  {$EXTERNALSYM ERROR_INVALID_HOOK_FILTER}

//
// MessageId: ERROR_INVALID_FILTER_PROC
//
// MessageText:
//
//  Invalid hook procedure.
//

  ERROR_INVALID_FILTER_PROC = 1427;
  {$EXTERNALSYM ERROR_INVALID_FILTER_PROC}

//
// MessageId: ERROR_HOOK_NEEDS_HMOD
//
// MessageText:
//
//  Cannot set nonlocal hook without a module handle.
//

  ERROR_HOOK_NEEDS_HMOD = 1428;
  {$EXTERNALSYM ERROR_HOOK_NEEDS_HMOD}

//
// MessageId: ERROR_GLOBAL_ONLY_HOOK
//
// MessageText:
//
//  This hook procedure can only be set globally.
//

  ERROR_GLOBAL_ONLY_HOOK = 1429;
  {$EXTERNALSYM ERROR_GLOBAL_ONLY_HOOK}

//
// MessageId: ERROR_JOURNAL_HOOK_SET
//
// MessageText:
//
//  The journal hook procedure is already installed.
//

  ERROR_JOURNAL_HOOK_SET = 1430;
  {$EXTERNALSYM ERROR_JOURNAL_HOOK_SET}

//
// MessageId: ERROR_HOOK_NOT_INSTALLED
//
// MessageText:
//
//  The hook procedure is not installed.
//

  ERROR_HOOK_NOT_INSTALLED = 1431;
  {$EXTERNALSYM ERROR_HOOK_NOT_INSTALLED}

//
// MessageId: ERROR_INVALID_LB_MESSAGE
//
// MessageText:
//
//  Invalid message for single-selection list box.
//

  ERROR_INVALID_LB_MESSAGE = 1432;
  {$EXTERNALSYM ERROR_INVALID_LB_MESSAGE}

//
// MessageId: ERROR_SETCOUNT_ON_BAD_LB
//
// MessageText:
//
//  LB_SETCOUNT sent to non-lazy list box.
//

  ERROR_SETCOUNT_ON_BAD_LB = 1433;
  {$EXTERNALSYM ERROR_SETCOUNT_ON_BAD_LB}

//
// MessageId: ERROR_LB_WITHOUT_TABSTOPS
//
// MessageText:
//
//  This list box does not support tab stops.
//

  ERROR_LB_WITHOUT_TABSTOPS = 1434;
  {$EXTERNALSYM ERROR_LB_WITHOUT_TABSTOPS}

//
// MessageId: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
//
// MessageText:
//
//  Cannot destroy object created by another thread.
//

  ERROR_DESTROY_OBJECT_OF_OTHER_THREAD = 1435;
  {$EXTERNALSYM ERROR_DESTROY_OBJECT_OF_OTHER_THREAD}

//
// MessageId: ERROR_CHILD_WINDOW_MENU
//
// MessageText:
//
//  Child windows cannot have menus.
//

  ERROR_CHILD_WINDOW_MENU = 1436;
  {$EXTERNALSYM ERROR_CHILD_WINDOW_MENU}

//
// MessageId: ERROR_NO_SYSTEM_MENU
//
// MessageText:
//
//  The window does not have a system menu.
//

  ERROR_NO_SYSTEM_MENU = 1437;
  {$EXTERNALSYM ERROR_NO_SYSTEM_MENU}

//
// MessageId: ERROR_INVALID_MSGBOX_STYLE
//
// MessageText:
//
//  Invalid message box style.
//

  ERROR_INVALID_MSGBOX_STYLE = 1438;
  {$EXTERNALSYM ERROR_INVALID_MSGBOX_STYLE}

//
// MessageId: ERROR_INVALID_SPI_VALUE
//
// MessageText:
//
//  Invalid system-wide (SPI_*) parameter.
//

  ERROR_INVALID_SPI_VALUE = 1439;
  {$EXTERNALSYM ERROR_INVALID_SPI_VALUE}

//
// MessageId: ERROR_SCREEN_ALREADY_LOCKED
//
// MessageText:
//
//  Screen already locked.
//

  ERROR_SCREEN_ALREADY_LOCKED = 1440;
  {$EXTERNALSYM ERROR_SCREEN_ALREADY_LOCKED}

//
// MessageId: ERROR_HWNDS_HAVE_DIFF_PARENT
//
// MessageText:
//
//  All handles to windows in a multiple-window position structure must have the same parent.
//

  ERROR_HWNDS_HAVE_DIFF_PARENT = 1441;
  {$EXTERNALSYM ERROR_HWNDS_HAVE_DIFF_PARENT}

//
// MessageId: ERROR_NOT_CHILD_WINDOW
//
// MessageText:
//
//  The window is not a child window.
//

  ERROR_NOT_CHILD_WINDOW = 1442;
  {$EXTERNALSYM ERROR_NOT_CHILD_WINDOW}

//
// MessageId: ERROR_INVALID_GW_COMMAND
//
// MessageText:
//
//  Invalid GW_* command.
//

  ERROR_INVALID_GW_COMMAND = 1443;
  {$EXTERNALSYM ERROR_INVALID_GW_COMMAND}

//
// MessageId: ERROR_INVALID_THREAD_ID
//
// MessageText:
//
//  Invalid thread identifier.
//

  ERROR_INVALID_THREAD_ID = 1444;
  {$EXTERNALSYM ERROR_INVALID_THREAD_ID}

//
// MessageId: ERROR_NON_MDICHILD_WINDOW
//
// MessageText:
//
//  Cannot process a message from a window that is not a multiple document interface (MDI) window.
//

  ERROR_NON_MDICHILD_WINDOW = 1445;
  {$EXTERNALSYM ERROR_NON_MDICHILD_WINDOW}

//
// MessageId: ERROR_POPUP_ALREADY_ACTIVE
//
// MessageText:
//
//  Popup menu already active.
//

  ERROR_POPUP_ALREADY_ACTIVE = 1446;
  {$EXTERNALSYM ERROR_POPUP_ALREADY_ACTIVE}

//
// MessageId: ERROR_NO_SCROLLBARS
//
// MessageText:
//
//  The window does not have scroll bars.
//

  ERROR_NO_SCROLLBARS = 1447;
  {$EXTERNALSYM ERROR_NO_SCROLLBARS}

//
// MessageId: ERROR_INVALID_SCROLLBAR_RANGE
//
// MessageText:
//
//  Scroll bar range cannot be greater than MAXLONG.
//

  ERROR_INVALID_SCROLLBAR_RANGE = 1448;
  {$EXTERNALSYM ERROR_INVALID_SCROLLBAR_RANGE}

//
// MessageId: ERROR_INVALID_SHOWWIN_COMMAND
//
// MessageText:
//
//  Cannot show or remove the window in the way specified.
//

  ERROR_INVALID_SHOWWIN_COMMAND = 1449;
  {$EXTERNALSYM ERROR_INVALID_SHOWWIN_COMMAND}

//
// MessageId: ERROR_NO_SYSTEM_RESOURCES
//
// MessageText:
//
//  Insufficient system resources exist to complete the requested service.
//

  ERROR_NO_SYSTEM_RESOURCES = 1450;
  {$EXTERNALSYM ERROR_NO_SYSTEM_RESOURCES}

//
// MessageId: ERROR_NONPAGED_SYSTEM_RESOURCES
//
// MessageText:
//
//  Insufficient system resources exist to complete the requested service.
//

  ERROR_NONPAGED_SYSTEM_RESOURCES = 1451;
  {$EXTERNALSYM ERROR_NONPAGED_SYSTEM_RESOURCES}

//
// MessageId: ERROR_PAGED_SYSTEM_RESOURCES
//
// MessageText:
//
//  Insufficient system resources exist to complete the requested service.
//

  ERROR_PAGED_SYSTEM_RESOURCES = 1452;
  {$EXTERNALSYM ERROR_PAGED_SYSTEM_RESOURCES}

//
// MessageId: ERROR_WORKING_SET_QUOTA
//
// MessageText:
//
//  Insufficient quota to complete the requested service.
//

  ERROR_WORKING_SET_QUOTA = 1453;
  {$EXTERNALSYM ERROR_WORKING_SET_QUOTA}

//
// MessageId: ERROR_PAGEFILE_QUOTA
//
// MessageText:
//
//  Insufficient quota to complete the requested service.
//

  ERROR_PAGEFILE_QUOTA = 1454;
  {$EXTERNALSYM ERROR_PAGEFILE_QUOTA}

//
// MessageId: ERROR_COMMITMENT_LIMIT
//
// MessageText:
//
//  The paging file is too small for this operation to complete.
//

  ERROR_COMMITMENT_LIMIT = 1455;
  {$EXTERNALSYM ERROR_COMMITMENT_LIMIT}

//
// MessageId: ERROR_MENU_ITEM_NOT_FOUND
//
// MessageText:
//
//  A menu item was not found.
//

  ERROR_MENU_ITEM_NOT_FOUND = 1456;
  {$EXTERNALSYM ERROR_MENU_ITEM_NOT_FOUND}

//
// MessageId: ERROR_INVALID_KEYBOARD_HANDLE
//
// MessageText:
//
//  Invalid keyboard layout handle.
//

  ERROR_INVALID_KEYBOARD_HANDLE = 1457;
  {$EXTERNALSYM ERROR_INVALID_KEYBOARD_HANDLE}

//
// MessageId: ERROR_HOOK_TYPE_NOT_ALLOWED
//
// MessageText:
//
//  Hook type not allowed.
//

  ERROR_HOOK_TYPE_NOT_ALLOWED = 1458;
  {$EXTERNALSYM ERROR_HOOK_TYPE_NOT_ALLOWED}

//
// MessageId: ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION
//
// MessageText:
//
//  This operation requires an interactive window station.
//

  ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION = 1459;
  {$EXTERNALSYM ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION}

//
// MessageId: ERROR_TIMEOUT
//
// MessageText:
//
//  This operation returned because the timeout period expired.
//

  ERROR_TIMEOUT = 1460;
  {$EXTERNALSYM ERROR_TIMEOUT}

//
// MessageId: ERROR_INVALID_MONITOR_HANDLE
//
// MessageText:
//
//  Invalid monitor handle.
//

  ERROR_INVALID_MONITOR_HANDLE = 1461;
  {$EXTERNALSYM ERROR_INVALID_MONITOR_HANDLE}

// End of WinUser error codes



///////////////////////////
//                       //
// Eventlog Status Codes //
//                       //
///////////////////////////


//
// MessageId: ERROR_EVENTLOG_FILE_CORRUPT
//
// MessageText:
//
//  The event log file is corrupted.
//

  ERROR_EVENTLOG_FILE_CORRUPT = 1500;
  {$EXTERNALSYM ERROR_EVENTLOG_FILE_CORRUPT}

//
// MessageId: ERROR_EVENTLOG_CANT_START
//
// MessageText:
//
//  No event log file could be opened, so the event logging service did not start.
//

  ERROR_EVENTLOG_CANT_START = 1501;
  {$EXTERNALSYM ERROR_EVENTLOG_CANT_START}

//
// MessageId: ERROR_LOG_FILE_FULL
//
// MessageText:
//
//  The event log file is full.
//

  ERROR_LOG_FILE_FULL = 1502;
  {$EXTERNALSYM ERROR_LOG_FILE_FULL}

//
// MessageId: ERROR_EVENTLOG_FILE_CHANGED
//
// MessageText:
//
//  The event log file has changed between read operations.
//

  ERROR_EVENTLOG_FILE_CHANGED = 1503;
  {$EXTERNALSYM ERROR_EVENTLOG_FILE_CHANGED}

// End of eventlog error codes



///////////////////////////
//                       //
// MSI Error Codes       //
//                       //
///////////////////////////


//
// MessageId: ERROR_INSTALL_SERVICE_FAILURE
//
// MessageText:
//
//  The Windows Installer service could not be accessed.  Contact your support personnel to verify that the Windows Installer service is properly registered.
//

  ERROR_INSTALL_SERVICE_FAILURE = 1601;
  {$EXTERNALSYM ERROR_INSTALL_SERVICE_FAILURE}

//
// MessageId: ERROR_INSTALL_USEREXIT
//
// MessageText:
//
//  User cancelled installation.
//

  ERROR_INSTALL_USEREXIT = 1602;
  {$EXTERNALSYM ERROR_INSTALL_USEREXIT}

//
// MessageId: ERROR_INSTALL_FAILURE
//
// MessageText:
//
//  Fatal error during installation.
//

  ERROR_INSTALL_FAILURE = 1603;
  {$EXTERNALSYM ERROR_INSTALL_FAILURE}

//
// MessageId: ERROR_INSTALL_SUSPEND
//
// MessageText:
//
//  Installation suspended, incomplete.
//

  ERROR_INSTALL_SUSPEND = 1604;
  {$EXTERNALSYM ERROR_INSTALL_SUSPEND}

//
// MessageId: ERROR_UNKNOWN_PRODUCT
//
// MessageText:
//
//  This action is only valid for products that are currently installed.
//

  ERROR_UNKNOWN_PRODUCT = 1605;
  {$EXTERNALSYM ERROR_UNKNOWN_PRODUCT}

//
// MessageId: ERROR_UNKNOWN_FEATURE
//
// MessageText:
//
//  Feature ID not registered.
//

  ERROR_UNKNOWN_FEATURE = 1606;
  {$EXTERNALSYM ERROR_UNKNOWN_FEATURE}

//
// MessageId: ERROR_UNKNOWN_COMPONENT
//
// MessageText:
//
//  Component ID not registered.
//

  ERROR_UNKNOWN_COMPONENT = 1607;
  {$EXTERNALSYM ERROR_UNKNOWN_COMPONENT}

//
// MessageId: ERROR_UNKNOWN_PROPERTY
//
// MessageText:
//
//  Unknown property.
//

  ERROR_UNKNOWN_PROPERTY = 1608;
  {$EXTERNALSYM ERROR_UNKNOWN_PROPERTY}

//
// MessageId: ERROR_INVALID_HANDLE_STATE
//
// MessageText:
//
//  Handle is in an invalid state.
//

  ERROR_INVALID_HANDLE_STATE = 1609;
  {$EXTERNALSYM ERROR_INVALID_HANDLE_STATE}

//
// MessageId: ERROR_BAD_CONFIGURATION
//
// MessageText:
//
//  The configuration data for this product is corrupt.  Contact your support personnel.
//

  ERROR_BAD_CONFIGURATION = 1610;
  {$EXTERNALSYM ERROR_BAD_CONFIGURATION}

//
// MessageId: ERROR_INDEX_ABSENT
//
// MessageText:
//
//  Component qualifier not present.
//

  ERROR_INDEX_ABSENT = 1611;
  {$EXTERNALSYM ERROR_INDEX_ABSENT}

//
// MessageId: ERROR_INSTALL_SOURCE_ABSENT
//
// MessageText:
//
//  The installation source for this product is not available.  Verify that the source exists and that you can access it.
//

  ERROR_INSTALL_SOURCE_ABSENT = 1612;
  {$EXTERNALSYM ERROR_INSTALL_SOURCE_ABSENT}

//
// MessageId: ERROR_INSTALL_PACKAGE_VERSION
//
// MessageText:
//
//  This installation package cannot be installed by the Windows Installer service.  You must install a Windows service pack that contains a newer version of the Windows Installer service.
//

  ERROR_INSTALL_PACKAGE_VERSION = 1613;
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_VERSION}

//
// MessageId: ERROR_PRODUCT_UNINSTALLED
//
// MessageText:
//
//  Product is uninstalled.
//

  ERROR_PRODUCT_UNINSTALLED = 1614;
  {$EXTERNALSYM ERROR_PRODUCT_UNINSTALLED}

//
// MessageId: ERROR_BAD_QUERY_SYNTAX
//
// MessageText:
//
//  SQL query syntax invalid or unsupported.
//

  ERROR_BAD_QUERY_SYNTAX = 1615;
  {$EXTERNALSYM ERROR_BAD_QUERY_SYNTAX}

//
// MessageId: ERROR_INVALID_FIELD
//
// MessageText:
//
//  Record field does not exist.
//

  ERROR_INVALID_FIELD = 1616;
  {$EXTERNALSYM ERROR_INVALID_FIELD}

//
// MessageId: ERROR_DEVICE_REMOVED
//
// MessageText:
//
//  The device has been removed.
//

  ERROR_DEVICE_REMOVED = 1617;
  {$EXTERNALSYM ERROR_DEVICE_REMOVED}

//
// MessageId: ERROR_INSTALL_ALREADY_RUNNING
//
// MessageText:
//
//  Another installation is already in progress.  Complete that installation before proceeding with this install.
//

  ERROR_INSTALL_ALREADY_RUNNING = 1618;
  {$EXTERNALSYM ERROR_INSTALL_ALREADY_RUNNING}

//
// MessageId: ERROR_INSTALL_PACKAGE_OPEN_FAILED
//
// MessageText:
//
//  This installation package could not be opened.  Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
//

  ERROR_INSTALL_PACKAGE_OPEN_FAILED = 1619;
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_OPEN_FAILED}

//
// MessageId: ERROR_INSTALL_PACKAGE_INVALID
//
// MessageText:
//
//  This installation package could not be opened.  Contact the application vendor to verify that this is a valid Windows Installer package.
//

  ERROR_INSTALL_PACKAGE_INVALID = 1620;
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_INVALID}

//
// MessageId: ERROR_INSTALL_UI_FAILURE
//
// MessageText:
//
//  There was an error starting the Windows Installer service user interface.  Contact your support personnel.
//

  ERROR_INSTALL_UI_FAILURE = 1621;
  {$EXTERNALSYM ERROR_INSTALL_UI_FAILURE}

//
// MessageId: ERROR_INSTALL_LOG_FAILURE
//
// MessageText:
//
//  Error opening installation log file. Verify that the specified log file location exists and that you can write to it.
//

  ERROR_INSTALL_LOG_FAILURE = 1622;
  {$EXTERNALSYM ERROR_INSTALL_LOG_FAILURE}

//
// MessageId: ERROR_INSTALL_LANGUAGE_UNSUPPORTED
//
// MessageText:
//
//  The language of this installation package is not supported by your system.
//

  ERROR_INSTALL_LANGUAGE_UNSUPPORTED = 1623;
  {$EXTERNALSYM ERROR_INSTALL_LANGUAGE_UNSUPPORTED}

//
// MessageId: ERROR_INSTALL_TRANSFORM_FAILURE
//
// MessageText:
//
//  Error applying transforms.  Verify that the specified transform paths are valid.
//

  ERROR_INSTALL_TRANSFORM_FAILURE = 1624;
  {$EXTERNALSYM ERROR_INSTALL_TRANSFORM_FAILURE}

//
// MessageId: ERROR_INSTALL_PACKAGE_REJECTED
//
// MessageText:
//
//  This installation is forbidden by system policy.  Contact your system administrator.
//

  ERROR_INSTALL_PACKAGE_REJECTED = 1625;
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_REJECTED}

//
// MessageId: ERROR_FUNCTION_NOT_CALLED
//
// MessageText:
//
//  Function could not be executed.
//

  ERROR_FUNCTION_NOT_CALLED = 1626;
  {$EXTERNALSYM ERROR_FUNCTION_NOT_CALLED}

//
// MessageId: ERROR_FUNCTION_FAILED
//
// MessageText:
//
//  Function failed during execution.
//

  ERROR_FUNCTION_FAILED = 1627;
  {$EXTERNALSYM ERROR_FUNCTION_FAILED}

//
// MessageId: ERROR_INVALID_TABLE
//
// MessageText:
//
//  Invalid or unknown table specified.
//

  ERROR_INVALID_TABLE = 1628;
  {$EXTERNALSYM ERROR_INVALID_TABLE}

//
// MessageId: ERROR_DATATYPE_MISMATCH
//
// MessageText:
//
//  Data supplied is of wrong type.
//

  ERROR_DATATYPE_MISMATCH = 1629;
  {$EXTERNALSYM ERROR_DATATYPE_MISMATCH}

//
// MessageId: ERROR_UNSUPPORTED_TYPE
//
// MessageText:
//
//  Data of this type is not supported.
//

  ERROR_UNSUPPORTED_TYPE = 1630;
  {$EXTERNALSYM ERROR_UNSUPPORTED_TYPE}

//
// MessageId: ERROR_CREATE_FAILED
//
// MessageText:
//
//  The Windows Installer service failed to start.  Contact your support personnel.
//

  ERROR_CREATE_FAILED = 1631;
  {$EXTERNALSYM ERROR_CREATE_FAILED}

//
// MessageId: ERROR_INSTALL_TEMP_UNWRITABLE
//
// MessageText:
//
//  The temp folder is either full or inaccessible.  Verify that the temp folder exists and that you can write to it.
//

  ERROR_INSTALL_TEMP_UNWRITABLE = 1632;
  {$EXTERNALSYM ERROR_INSTALL_TEMP_UNWRITABLE}

//
// MessageId: ERROR_INSTALL_PLATFORM_UNSUPPORTED
//
// MessageText:
//
//  This installation package is not supported by this processor type. Contact your product vendor.
//

  ERROR_INSTALL_PLATFORM_UNSUPPORTED = 1633;
  {$EXTERNALSYM ERROR_INSTALL_PLATFORM_UNSUPPORTED}

//
// MessageId: ERROR_INSTALL_NOTUSED
//
// MessageText:
//
//  Component not used on this computer.
//

  ERROR_INSTALL_NOTUSED = 1634;
  {$EXTERNALSYM ERROR_INSTALL_NOTUSED}

//
// MessageId: ERROR_PATCH_PACKAGE_OPEN_FAILED
//
// MessageText:
//
//  This patch package could not be opened.  Verify that the patch package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer patch package.
//

  ERROR_PATCH_PACKAGE_OPEN_FAILED = 1635;
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_OPEN_FAILED}

//
// MessageId: ERROR_PATCH_PACKAGE_INVALID
//
// MessageText:
//
//  This patch package could not be opened.  Contact the application vendor to verify that this is a valid Windows Installer patch package.
//

  ERROR_PATCH_PACKAGE_INVALID = 1636;
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_INVALID}

//
// MessageId: ERROR_PATCH_PACKAGE_UNSUPPORTED
//
// MessageText:
//
//  This patch package cannot be processed by the Windows Installer service.  You must install a Windows service pack that contains a newer version of the Windows Installer service.
//

  ERROR_PATCH_PACKAGE_UNSUPPORTED = 1637;
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_UNSUPPORTED}

//
// MessageId: ERROR_PRODUCT_VERSION
//
// MessageText:
//
//  Another version of this product is already installed.  Installation of this version cannot continue.  To configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
//

  ERROR_PRODUCT_VERSION = 1638;
  {$EXTERNALSYM ERROR_PRODUCT_VERSION}

//
// MessageId: ERROR_INVALID_COMMAND_LINE
//
// MessageText:
//
//  Invalid command line argument.  Consult the Windows Installer SDK for detailed command line help.
//

  ERROR_INVALID_COMMAND_LINE = 1639;
  {$EXTERNALSYM ERROR_INVALID_COMMAND_LINE}

//
// MessageId: ERROR_INSTALL_REMOTE_DISALLOWED
//
// MessageText:
//
//  Only administrators have permission to add, remove, or configure server software during a Terminal services remote session. If you want to install or configure software on the server, contact your network administrator.
//

  ERROR_INSTALL_REMOTE_DISALLOWED = 1640;
  {$EXTERNALSYM ERROR_INSTALL_REMOTE_DISALLOWED}

//
// MessageId: ERROR_SUCCESS_REBOOT_INITIATED
//
// MessageText:
//
//  The requested operation completed successfully.  The system will be restarted so the changes can take effect.
//

  ERROR_SUCCESS_REBOOT_INITIATED = 1641;
  {$EXTERNALSYM ERROR_SUCCESS_REBOOT_INITIATED}

//
// MessageId: ERROR_PATCH_TARGET_NOT_FOUND
//
// MessageText:
//
//  The upgrade patch cannot be installed by the Windows Installer service because the program to be upgraded may be missing, or the upgrade patch may update a different version of the program. Verify that the program to be upgraded exists on your computer and that you have the correct upgrade patch.
//

  ERROR_PATCH_TARGET_NOT_FOUND = 1642;
  {$EXTERNALSYM ERROR_PATCH_TARGET_NOT_FOUND}

// End of MSI error codes



///////////////////////////
//                       //
//   RPC Status Codes    //
//                       //
///////////////////////////


//
// MessageId: RPC_S_INVALID_STRING_BINDING
//
// MessageText:
//
//  The string binding is invalid.
//

  RPC_S_INVALID_STRING_BINDING = 1700;
  {$EXTERNALSYM RPC_S_INVALID_STRING_BINDING}

//
// MessageId: RPC_S_WRONG_KIND_OF_BINDING
//
// MessageText:
//
//  The binding handle is not the correct type.
//

  RPC_S_WRONG_KIND_OF_BINDING = 1701;
  {$EXTERNALSYM RPC_S_WRONG_KIND_OF_BINDING}

//
// MessageId: RPC_S_INVALID_BINDING
//
// MessageText:
//
//  The binding handle is invalid.
//

  RPC_S_INVALID_BINDING = 1702;
  {$EXTERNALSYM RPC_S_INVALID_BINDING}

//
// MessageId: RPC_S_PROTSEQ_NOT_SUPPORTED
//
// MessageText:
//
//  The RPC protocol sequence is not supported.
//

  RPC_S_PROTSEQ_NOT_SUPPORTED = 1703;
  {$EXTERNALSYM RPC_S_PROTSEQ_NOT_SUPPORTED}

//
// MessageId: RPC_S_INVALID_RPC_PROTSEQ
//
// MessageText:
//
//  The RPC protocol sequence is invalid.
//

  RPC_S_INVALID_RPC_PROTSEQ = 1704;
  {$EXTERNALSYM RPC_S_INVALID_RPC_PROTSEQ}

//
// MessageId: RPC_S_INVALID_STRING_UUID
//
// MessageText:
//
//  The string universal unique identifier (UUID) is invalid.
//

  RPC_S_INVALID_STRING_UUID = 1705;
  {$EXTERNALSYM RPC_S_INVALID_STRING_UUID}

//
// MessageId: RPC_S_INVALID_ENDPOINT_FORMAT
//
// MessageText:
//
//  The endpoint format is invalid.
//

  RPC_S_INVALID_ENDPOINT_FORMAT = 1706;
  {$EXTERNALSYM RPC_S_INVALID_ENDPOINT_FORMAT}

//
// MessageId: RPC_S_INVALID_NET_ADDR
//
// MessageText:
//
//  The network address is invalid.
//

  RPC_S_INVALID_NET_ADDR = 1707;
  {$EXTERNALSYM RPC_S_INVALID_NET_ADDR}

//
// MessageId: RPC_S_NO_ENDPOINT_FOUND
//
// MessageText:
//
//  No endpoint was found.
//

  RPC_S_NO_ENDPOINT_FOUND = 1708;
  {$EXTERNALSYM RPC_S_NO_ENDPOINT_FOUND}

//
// MessageId: RPC_S_INVALID_TIMEOUT
//
// MessageText:
//
//  The timeout value is invalid.
//

  RPC_S_INVALID_TIMEOUT = 1709;
  {$EXTERNALSYM RPC_S_INVALID_TIMEOUT}

//
// MessageId: RPC_S_OBJECT_NOT_FOUND
//
// MessageText:
//
//  The object universal unique identifier (UUID) was not found.
//

  RPC_S_OBJECT_NOT_FOUND = 1710;
  {$EXTERNALSYM RPC_S_OBJECT_NOT_FOUND}

//
// MessageId: RPC_S_ALREADY_REGISTERED
//
// MessageText:
//
//  The object universal unique identifier (UUID) has already been registered.
//

  RPC_S_ALREADY_REGISTERED = 1711;
  {$EXTERNALSYM RPC_S_ALREADY_REGISTERED}

//
// MessageId: RPC_S_TYPE_ALREADY_REGISTERED
//
// MessageText:
//
//  The type universal unique identifier (UUID) has already been registered.
//

  RPC_S_TYPE_ALREADY_REGISTERED = 1712;
  {$EXTERNALSYM RPC_S_TYPE_ALREADY_REGISTERED}

//
// MessageId: RPC_S_ALREADY_LISTENING
//
// MessageText:
//
//  The RPC server is already listening.
//

  RPC_S_ALREADY_LISTENING = 1713;
  {$EXTERNALSYM RPC_S_ALREADY_LISTENING}

//
// MessageId: RPC_S_NO_PROTSEQS_REGISTERED
//
// MessageText:
//
//  No protocol sequences have been registered.
//

  RPC_S_NO_PROTSEQS_REGISTERED = 1714;
  {$EXTERNALSYM RPC_S_NO_PROTSEQS_REGISTERED}

//
// MessageId: RPC_S_NOT_LISTENING
//
// MessageText:
//
//  The RPC server is not listening.
//

  RPC_S_NOT_LISTENING = 1715;
  {$EXTERNALSYM RPC_S_NOT_LISTENING}

//
// MessageId: RPC_S_UNKNOWN_MGR_TYPE
//
// MessageText:
//
//  The manager type is unknown.
//

  RPC_S_UNKNOWN_MGR_TYPE = 1716;
  {$EXTERNALSYM RPC_S_UNKNOWN_MGR_TYPE}

//
// MessageId: RPC_S_UNKNOWN_IF
//
// MessageText:
//
//  The interface is unknown.
//

  RPC_S_UNKNOWN_IF = 1717;
  {$EXTERNALSYM RPC_S_UNKNOWN_IF}

//
// MessageId: RPC_S_NO_BINDINGS
//
// MessageText:
//
//  There are no bindings.
//

  RPC_S_NO_BINDINGS = 1718;
  {$EXTERNALSYM RPC_S_NO_BINDINGS}

//
// MessageId: RPC_S_NO_PROTSEQS
//
// MessageText:
//
//  There are no protocol sequences.
//

  RPC_S_NO_PROTSEQS = 1719;
  {$EXTERNALSYM RPC_S_NO_PROTSEQS}

//
// MessageId: RPC_S_CANT_CREATE_ENDPOINT
//
// MessageText:
//
//  The endpoint cannot be created.
//

  RPC_S_CANT_CREATE_ENDPOINT = 1720;
  {$EXTERNALSYM RPC_S_CANT_CREATE_ENDPOINT}

//
// MessageId: RPC_S_OUT_OF_RESOURCES
//
// MessageText:
//
//  Not enough resources are available to complete this operation.
//

  RPC_S_OUT_OF_RESOURCES = 1721;
  {$EXTERNALSYM RPC_S_OUT_OF_RESOURCES}

//
// MessageId: RPC_S_SERVER_UNAVAILABLE
//
// MessageText:
//
//  The RPC server is unavailable.
//

  RPC_S_SERVER_UNAVAILABLE = 1722;
  {$EXTERNALSYM RPC_S_SERVER_UNAVAILABLE}

//
// MessageId: RPC_S_SERVER_TOO_BUSY
//
// MessageText:
//
//  The RPC server is too busy to complete this operation.
//

  RPC_S_SERVER_TOO_BUSY = 1723;
  {$EXTERNALSYM RPC_S_SERVER_TOO_BUSY}

//
// MessageId: RPC_S_INVALID_NETWORK_OPTIONS
//
// MessageText:
//
//  The network options are invalid.
//

  RPC_S_INVALID_NETWORK_OPTIONS = 1724;
  {$EXTERNALSYM RPC_S_INVALID_NETWORK_OPTIONS}

//
// MessageId: RPC_S_NO_CALL_ACTIVE
//
// MessageText:
//
//  There are no remote procedure calls active on this thread.
//

  RPC_S_NO_CALL_ACTIVE = 1725;
  {$EXTERNALSYM RPC_S_NO_CALL_ACTIVE}

//
// MessageId: RPC_S_CALL_FAILED
//
// MessageText:
//
//  The remote procedure call failed.
//

  RPC_S_CALL_FAILED = 1726;
  {$EXTERNALSYM RPC_S_CALL_FAILED}

//
// MessageId: RPC_S_CALL_FAILED_DNE
//
// MessageText:
//
//  The remote procedure call failed and did not execute.
//

  RPC_S_CALL_FAILED_DNE = 1727;
  {$EXTERNALSYM RPC_S_CALL_FAILED_DNE}

//
// MessageId: RPC_S_PROTOCOL_ERROR
//
// MessageText:
//
//  A remote procedure call (RPC) protocol error occurred.
//

  RPC_S_PROTOCOL_ERROR = 1728;
  {$EXTERNALSYM RPC_S_PROTOCOL_ERROR}

//
// MessageId: RPC_S_UNSUPPORTED_TRANS_SYN
//
// MessageText:
//
//  The transfer syntax is not supported by the RPC server.
//

  RPC_S_UNSUPPORTED_TRANS_SYN = 1730;
  {$EXTERNALSYM RPC_S_UNSUPPORTED_TRANS_SYN}

//
// MessageId: RPC_S_UNSUPPORTED_TYPE
//
// MessageText:
//
//  The universal unique identifier (UUID) type is not supported.
//

  RPC_S_UNSUPPORTED_TYPE = 1732;
  {$EXTERNALSYM RPC_S_UNSUPPORTED_TYPE}

//
// MessageId: RPC_S_INVALID_TAG
//
// MessageText:
//
//  The tag is invalid.
//

  RPC_S_INVALID_TAG = 1733;
  {$EXTERNALSYM RPC_S_INVALID_TAG}

//
// MessageId: RPC_S_INVALID_BOUND
//
// MessageText:
//
//  The array bounds are invalid.
//

  RPC_S_INVALID_BOUND = 1734;
  {$EXTERNALSYM RPC_S_INVALID_BOUND}

//
// MessageId: RPC_S_NO_ENTRY_NAME
//
// MessageText:
//
//  The binding does not contain an entry name.
//

  RPC_S_NO_ENTRY_NAME = 1735;
  {$EXTERNALSYM RPC_S_NO_ENTRY_NAME}

//
// MessageId: RPC_S_INVALID_NAME_SYNTAX
//
// MessageText:
//
//  The name syntax is invalid.
//

  RPC_S_INVALID_NAME_SYNTAX = 1736;
  {$EXTERNALSYM RPC_S_INVALID_NAME_SYNTAX}

//
// MessageId: RPC_S_UNSUPPORTED_NAME_SYNTAX
//
// MessageText:
//
//  The name syntax is not supported.
//

  RPC_S_UNSUPPORTED_NAME_SYNTAX = 1737;
  {$EXTERNALSYM RPC_S_UNSUPPORTED_NAME_SYNTAX}

//
// MessageId: RPC_S_UUID_NO_ADDRESS
//
// MessageText:
//
//  No network address is available to use to construct a universal unique identifier (UUID).
//

  RPC_S_UUID_NO_ADDRESS = 1739;
  {$EXTERNALSYM RPC_S_UUID_NO_ADDRESS}

//
// MessageId: RPC_S_DUPLICATE_ENDPOINT
//
// MessageText:
//
//  The endpoint is a duplicate.
//

  RPC_S_DUPLICATE_ENDPOINT = 1740;
  {$EXTERNALSYM RPC_S_DUPLICATE_ENDPOINT}

//
// MessageId: RPC_S_UNKNOWN_AUTHN_TYPE
//
// MessageText:
//
//  The authentication type is unknown.
//

  RPC_S_UNKNOWN_AUTHN_TYPE = 1741;
  {$EXTERNALSYM RPC_S_UNKNOWN_AUTHN_TYPE}

//
// MessageId: RPC_S_MAX_CALLS_TOO_SMALL
//
// MessageText:
//
//  The maximum number of calls is too small.
//

  RPC_S_MAX_CALLS_TOO_SMALL = 1742;
  {$EXTERNALSYM RPC_S_MAX_CALLS_TOO_SMALL}

//
// MessageId: RPC_S_STRING_TOO_LONG
//
// MessageText:
//
//  The string is too long.
//

  RPC_S_STRING_TOO_LONG = 1743;
  {$EXTERNALSYM RPC_S_STRING_TOO_LONG}

//
// MessageId: RPC_S_PROTSEQ_NOT_FOUND
//
// MessageText:
//
//  The RPC protocol sequence was not found.
//

  RPC_S_PROTSEQ_NOT_FOUND = 1744;
  {$EXTERNALSYM RPC_S_PROTSEQ_NOT_FOUND}

//
// MessageId: RPC_S_PROCNUM_OUT_OF_RANGE
//
// MessageText:
//
//  The procedure number is out of range.
//

  RPC_S_PROCNUM_OUT_OF_RANGE = 1745;
  {$EXTERNALSYM RPC_S_PROCNUM_OUT_OF_RANGE}

//
// MessageId: RPC_S_BINDING_HAS_NO_AUTH
//
// MessageText:
//
//  The binding does not contain any authentication information.
//

  RPC_S_BINDING_HAS_NO_AUTH = 1746;
  {$EXTERNALSYM RPC_S_BINDING_HAS_NO_AUTH}

//
// MessageId: RPC_S_UNKNOWN_AUTHN_SERVICE
//
// MessageText:
//
//  The authentication service is unknown.
//

  RPC_S_UNKNOWN_AUTHN_SERVICE = 1747;
  {$EXTERNALSYM RPC_S_UNKNOWN_AUTHN_SERVICE}

//
// MessageId: RPC_S_UNKNOWN_AUTHN_LEVEL
//
// MessageText:
//
//  The authentication level is unknown.
//

  RPC_S_UNKNOWN_AUTHN_LEVEL = 1748;
  {$EXTERNALSYM RPC_S_UNKNOWN_AUTHN_LEVEL}

//
// MessageId: RPC_S_INVALID_AUTH_IDENTITY
//
// MessageText:
//
//  The security context is invalid.
//

  RPC_S_INVALID_AUTH_IDENTITY = 1749;
  {$EXTERNALSYM RPC_S_INVALID_AUTH_IDENTITY}

//
// MessageId: RPC_S_UNKNOWN_AUTHZ_SERVICE
//
// MessageText:
//
//  The authorization service is unknown.
//

  RPC_S_UNKNOWN_AUTHZ_SERVICE = 1750;
  {$EXTERNALSYM RPC_S_UNKNOWN_AUTHZ_SERVICE}

//
// MessageId: EPT_S_INVALID_ENTRY
//
// MessageText:
//
//  The entry is invalid.
//

  EPT_S_INVALID_ENTRY = 1751;
  {$EXTERNALSYM EPT_S_INVALID_ENTRY}

//
// MessageId: EPT_S_CANT_PERFORM_OP
//
// MessageText:
//
//  The server endpoint cannot perform the operation.
//

  EPT_S_CANT_PERFORM_OP = 1752;
  {$EXTERNALSYM EPT_S_CANT_PERFORM_OP}

//
// MessageId: EPT_S_NOT_REGISTERED
//
// MessageText:
//
//  There are no more endpoints available from the endpoint mapper.
//

  EPT_S_NOT_REGISTERED = 1753;
  {$EXTERNALSYM EPT_S_NOT_REGISTERED}

//
// MessageId: RPC_S_NOTHING_TO_EXPORT
//
// MessageText:
//
//  No interfaces have been exported.
//

  RPC_S_NOTHING_TO_EXPORT = 1754;
  {$EXTERNALSYM RPC_S_NOTHING_TO_EXPORT}

//
// MessageId: RPC_S_INCOMPLETE_NAME
//
// MessageText:
//
//  The entry name is incomplete.
//

  RPC_S_INCOMPLETE_NAME = 1755;
  {$EXTERNALSYM RPC_S_INCOMPLETE_NAME}

//
// MessageId: RPC_S_INVALID_VERS_OPTION
//
// MessageText:
//
//  The version option is invalid.
//

  RPC_S_INVALID_VERS_OPTION = 1756;
  {$EXTERNALSYM RPC_S_INVALID_VERS_OPTION}

//
// MessageId: RPC_S_NO_MORE_MEMBERS
//
// MessageText:
//
//  There are no more members.
//

  RPC_S_NO_MORE_MEMBERS = 1757;
  {$EXTERNALSYM RPC_S_NO_MORE_MEMBERS}

//
// MessageId: RPC_S_NOT_ALL_OBJS_UNEXPORTED
//
// MessageText:
//
//  There is nothing to unexport.
//

  RPC_S_NOT_ALL_OBJS_UNEXPORTED = 1758;
  {$EXTERNALSYM RPC_S_NOT_ALL_OBJS_UNEXPORTED}

//
// MessageId: RPC_S_INTERFACE_NOT_FOUND
//
// MessageText:
//
//  The interface was not found.
//

  RPC_S_INTERFACE_NOT_FOUND = 1759;
  {$EXTERNALSYM RPC_S_INTERFACE_NOT_FOUND}

//
// MessageId: RPC_S_ENTRY_ALREADY_EXISTS
//
// MessageText:
//
//  The entry already exists.
//

  RPC_S_ENTRY_ALREADY_EXISTS = 1760;
  {$EXTERNALSYM RPC_S_ENTRY_ALREADY_EXISTS}

//
// MessageId: RPC_S_ENTRY_NOT_FOUND
//
// MessageText:
//
//  The entry is not found.
//

  RPC_S_ENTRY_NOT_FOUND = 1761;
  {$EXTERNALSYM RPC_S_ENTRY_NOT_FOUND}

//
// MessageId: RPC_S_NAME_SERVICE_UNAVAILABLE
//
// MessageText:
//
//  The name service is unavailable.
//

  RPC_S_NAME_SERVICE_UNAVAILABLE = 1762;
  {$EXTERNALSYM RPC_S_NAME_SERVICE_UNAVAILABLE}

//
// MessageId: RPC_S_INVALID_NAF_ID
//
// MessageText:
//
//  The network address family is invalid.
//

  RPC_S_INVALID_NAF_ID = 1763;
  {$EXTERNALSYM RPC_S_INVALID_NAF_ID}

//
// MessageId: RPC_S_CANNOT_SUPPORT
//
// MessageText:
//
//  The requested operation is not supported.
//

  RPC_S_CANNOT_SUPPORT = 1764;
  {$EXTERNALSYM RPC_S_CANNOT_SUPPORT}

//
// MessageId: RPC_S_NO_CONTEXT_AVAILABLE
//
// MessageText:
//
//  No security context is available to allow impersonation.
//

  RPC_S_NO_CONTEXT_AVAILABLE = 1765;
  {$EXTERNALSYM RPC_S_NO_CONTEXT_AVAILABLE}

//
// MessageId: RPC_S_INTERNAL_ERROR
//
// MessageText:
//
//  An internal error occurred in a remote procedure call (RPC).
//

  RPC_S_INTERNAL_ERROR = 1766;
  {$EXTERNALSYM RPC_S_INTERNAL_ERROR}

//
// MessageId: RPC_S_ZERO_DIVIDE
//
// MessageText:
//
//  The RPC server attempted an integer division by zero.
//

  RPC_S_ZERO_DIVIDE = 1767;
  {$EXTERNALSYM RPC_S_ZERO_DIVIDE}

//
// MessageId: RPC_S_ADDRESS_ERROR
//
// MessageText:
//
//  An addressing error occurred in the RPC server.
//

  RPC_S_ADDRESS_ERROR = 1768;
  {$EXTERNALSYM RPC_S_ADDRESS_ERROR}

//
// MessageId: RPC_S_FP_DIV_ZERO
//
// MessageText:
//
//  A floating-point operation at the RPC server caused a division by zero.
//

  RPC_S_FP_DIV_ZERO = 1769;
  {$EXTERNALSYM RPC_S_FP_DIV_ZERO}

//
// MessageId: RPC_S_FP_UNDERFLOW
//
// MessageText:
//
//  A floating-point underflow occurred at the RPC server.
//

  RPC_S_FP_UNDERFLOW = 1770;
  {$EXTERNALSYM RPC_S_FP_UNDERFLOW}

//
// MessageId: RPC_S_FP_OVERFLOW
//
// MessageText:
//
//  A floating-point overflow occurred at the RPC server.
//

  RPC_S_FP_OVERFLOW = 1771;
  {$EXTERNALSYM RPC_S_FP_OVERFLOW}

//
// MessageId: RPC_X_NO_MORE_ENTRIES
//
// MessageText:
//
//  The list of RPC servers available for the binding of auto handles has been exhausted.
//

  RPC_X_NO_MORE_ENTRIES = 1772;
  {$EXTERNALSYM RPC_X_NO_MORE_ENTRIES}

//
// MessageId: RPC_X_SS_CHAR_TRANS_OPEN_FAIL
//
// MessageText:
//
//  Unable to open the character translation table file.
//

  RPC_X_SS_CHAR_TRANS_OPEN_FAIL = 1773;
  {$EXTERNALSYM RPC_X_SS_CHAR_TRANS_OPEN_FAIL}

//
// MessageId: RPC_X_SS_CHAR_TRANS_SHORT_FILE
//
// MessageText:
//
//  The file containing the character translation table has fewer than 512 bytes.
//

  RPC_X_SS_CHAR_TRANS_SHORT_FILE = 1774;
  {$EXTERNALSYM RPC_X_SS_CHAR_TRANS_SHORT_FILE}

//
// MessageId: RPC_X_SS_IN_NULL_CONTEXT
//
// MessageText:
//
//  A null context handle was passed from the client to the host during a remote procedure call.
//

  RPC_X_SS_IN_NULL_CONTEXT = 1775;
  {$EXTERNALSYM RPC_X_SS_IN_NULL_CONTEXT}

//
// MessageId: RPC_X_SS_CONTEXT_DAMAGED
//
// MessageText:
//
//  The context handle changed during a remote procedure call.
//

  RPC_X_SS_CONTEXT_DAMAGED = 1777;
  {$EXTERNALSYM RPC_X_SS_CONTEXT_DAMAGED}

//
// MessageId: RPC_X_SS_HANDLES_MISMATCH
//
// MessageText:
//
//  The binding handles passed to a remote procedure call do not match.
//

  RPC_X_SS_HANDLES_MISMATCH = 1778;
  {$EXTERNALSYM RPC_X_SS_HANDLES_MISMATCH}

//
// MessageId: RPC_X_SS_CANNOT_GET_CALL_HANDLE
//
// MessageText:
//
//  The stub is unable to get the remote procedure call handle.
//

  RPC_X_SS_CANNOT_GET_CALL_HANDLE = 1779;
  {$EXTERNALSYM RPC_X_SS_CANNOT_GET_CALL_HANDLE}

//
// MessageId: RPC_X_NULL_REF_POINTER
//
// MessageText:
//
//  A null reference pointer was passed to the stub.
//

  RPC_X_NULL_REF_POINTER = 1780;
  {$EXTERNALSYM RPC_X_NULL_REF_POINTER}

//
// MessageId: RPC_X_ENUM_VALUE_OUT_OF_RANGE
//
// MessageText:
//
//  The enumeration value is out of range.
//

  RPC_X_ENUM_VALUE_OUT_OF_RANGE = 1781;
  {$EXTERNALSYM RPC_X_ENUM_VALUE_OUT_OF_RANGE}

//
// MessageId: RPC_X_BYTE_COUNT_TOO_SMALL
//
// MessageText:
//
//  The byte count is too small.
//

  RPC_X_BYTE_COUNT_TOO_SMALL = 1782;
  {$EXTERNALSYM RPC_X_BYTE_COUNT_TOO_SMALL}

//
// MessageId: RPC_X_BAD_STUB_DATA
//
// MessageText:
//
//  The stub received bad data.
//

  RPC_X_BAD_STUB_DATA = 1783;
  {$EXTERNALSYM RPC_X_BAD_STUB_DATA}

//
// MessageId: ERROR_INVALID_USER_BUFFER
//
// MessageText:
//
//  The supplied user buffer is not valid for the requested operation.
//

  ERROR_INVALID_USER_BUFFER = 1784;
  {$EXTERNALSYM ERROR_INVALID_USER_BUFFER}

//
// MessageId: ERROR_UNRECOGNIZED_MEDIA
//
// MessageText:
//
//  The disk media is not recognized. It may not be formatted.
//

  ERROR_UNRECOGNIZED_MEDIA = 1785;
  {$EXTERNALSYM ERROR_UNRECOGNIZED_MEDIA}

//
// MessageId: ERROR_NO_TRUST_LSA_SECRET
//
// MessageText:
//
//  The workstation does not have a trust secret.
//

  ERROR_NO_TRUST_LSA_SECRET = 1786;
  {$EXTERNALSYM ERROR_NO_TRUST_LSA_SECRET}

//
// MessageId: ERROR_NO_TRUST_SAM_ACCOUNT
//
// MessageText:
//
//  The security database on the server does not have a computer account for this workstation trust relationship.
//

  ERROR_NO_TRUST_SAM_ACCOUNT = 1787;
  {$EXTERNALSYM ERROR_NO_TRUST_SAM_ACCOUNT}

//
// MessageId: ERROR_TRUSTED_DOMAIN_FAILURE
//
// MessageText:
//
//  The trust relationship between the primary domain and the trusted domain failed.
//

  ERROR_TRUSTED_DOMAIN_FAILURE = 1788;
  {$EXTERNALSYM ERROR_TRUSTED_DOMAIN_FAILURE}

//
// MessageId: ERROR_TRUSTED_RELATIONSHIP_FAILURE
//
// MessageText:
//
//  The trust relationship between this workstation and the primary domain failed.
//

  ERROR_TRUSTED_RELATIONSHIP_FAILURE = 1789;
  {$EXTERNALSYM ERROR_TRUSTED_RELATIONSHIP_FAILURE}

//
// MessageId: ERROR_TRUST_FAILURE
//
// MessageText:
//
//  The network logon failed.
//

  ERROR_TRUST_FAILURE = 1790;
  {$EXTERNALSYM ERROR_TRUST_FAILURE}

//
// MessageId: RPC_S_CALL_IN_PROGRESS
//
// MessageText:
//
//  A remote procedure call is already in progress for this thread.
//

  RPC_S_CALL_IN_PROGRESS = 1791;
  {$EXTERNALSYM RPC_S_CALL_IN_PROGRESS}

//
// MessageId: ERROR_NETLOGON_NOT_STARTED
//
// MessageText:
//
//  An attempt was made to logon, but the network logon service was not started.
//

  ERROR_NETLOGON_NOT_STARTED = 1792;
  {$EXTERNALSYM ERROR_NETLOGON_NOT_STARTED}

//
// MessageId: ERROR_ACCOUNT_EXPIRED
//
// MessageText:
//
//  The user's account has expired.
//

  ERROR_ACCOUNT_EXPIRED = 1793;
  {$EXTERNALSYM ERROR_ACCOUNT_EXPIRED}

//
// MessageId: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
//
// MessageText:
//
//  The redirector is in use and cannot be unloaded.
//

  ERROR_REDIRECTOR_HAS_OPEN_HANDLES = 1794;
  {$EXTERNALSYM ERROR_REDIRECTOR_HAS_OPEN_HANDLES}

//
// MessageId: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
//
// MessageText:
//
//  The specified printer driver is already installed.
//

  ERROR_PRINTER_DRIVER_ALREADY_INSTALLED = 1795;
  {$EXTERNALSYM ERROR_PRINTER_DRIVER_ALREADY_INSTALLED}

//
// MessageId: ERROR_UNKNOWN_PORT
//
// MessageText:
//
//  The specified port is unknown.
//

  ERROR_UNKNOWN_PORT = 1796;
  {$EXTERNALSYM ERROR_UNKNOWN_PORT}

//
// MessageId: ERROR_UNKNOWN_PRINTER_DRIVER
//
// MessageText:
//
//  The printer driver is unknown.
//

  ERROR_UNKNOWN_PRINTER_DRIVER = 1797;
  {$EXTERNALSYM ERROR_UNKNOWN_PRINTER_DRIVER}

//
// MessageId: ERROR_UNKNOWN_PRINTPROCESSOR
//
// MessageText:
//
//  The print processor is unknown.
//

  ERROR_UNKNOWN_PRINTPROCESSOR = 1798;
  {$EXTERNALSYM ERROR_UNKNOWN_PRINTPROCESSOR}

//
// MessageId: ERROR_INVALID_SEPARATOR_FILE
//
// MessageText:
//
//  The specified separator file is invalid.
//

  ERROR_INVALID_SEPARATOR_FILE = 1799;
  {$EXTERNALSYM ERROR_INVALID_SEPARATOR_FILE}

//
// MessageId: ERROR_INVALID_PRIORITY
//
// MessageText:
//
//  The specified priority is invalid.
//

  ERROR_INVALID_PRIORITY = 1800;
  {$EXTERNALSYM ERROR_INVALID_PRIORITY}

//
// MessageId: ERROR_INVALID_PRINTER_NAME
//
// MessageText:
//
//  The printer name is invalid.
//

  ERROR_INVALID_PRINTER_NAME = 1801;
  {$EXTERNALSYM ERROR_INVALID_PRINTER_NAME}

//
// MessageId: ERROR_PRINTER_ALREADY_EXISTS
//
// MessageText:
//
//  The printer already exists.
//

  ERROR_PRINTER_ALREADY_EXISTS = 1802;
  {$EXTERNALSYM ERROR_PRINTER_ALREADY_EXISTS}

//
// MessageId: ERROR_INVALID_PRINTER_COMMAND
//
// MessageText:
//
//  The printer command is invalid.
//

  ERROR_INVALID_PRINTER_COMMAND = 1803;
  {$EXTERNALSYM ERROR_INVALID_PRINTER_COMMAND}

//
// MessageId: ERROR_INVALID_DATATYPE
//
// MessageText:
//
//  The specified datatype is invalid.
//

  ERROR_INVALID_DATATYPE = 1804;
  {$EXTERNALSYM ERROR_INVALID_DATATYPE}

//
// MessageId: ERROR_INVALID_ENVIRONMENT
//
// MessageText:
//
//  The environment specified is invalid.
//

  ERROR_INVALID_ENVIRONMENT = 1805;
  {$EXTERNALSYM ERROR_INVALID_ENVIRONMENT}

//
// MessageId: RPC_S_NO_MORE_BINDINGS
//
// MessageText:
//
//  There are no more bindings.
//

  RPC_S_NO_MORE_BINDINGS = 1806;
  {$EXTERNALSYM RPC_S_NO_MORE_BINDINGS}

//
// MessageId: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
//
// MessageText:
//
//  The account used is an interdomain trust account. Use your global user account or local user account to access this server.
//

  ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT = 1807;
  {$EXTERNALSYM ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT}

//
// MessageId: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
//
// MessageText:
//
//  The account used is a computer account. Use your global user account or local user account to access this server.
//

  ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT = 1808;
  {$EXTERNALSYM ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT}

//
// MessageId: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
//
// MessageText:
//
//  The account used is a server trust account. Use your global user account or local user account to access this server.
//

  ERROR_NOLOGON_SERVER_TRUST_ACCOUNT = 1809;
  {$EXTERNALSYM ERROR_NOLOGON_SERVER_TRUST_ACCOUNT}

//
// MessageId: ERROR_DOMAIN_TRUST_INCONSISTENT
//
// MessageText:
//
//  The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.
//

  ERROR_DOMAIN_TRUST_INCONSISTENT = 1810;
  {$EXTERNALSYM ERROR_DOMAIN_TRUST_INCONSISTENT}

//
// MessageId: ERROR_SERVER_HAS_OPEN_HANDLES
//
// MessageText:
//
//  The server is in use and cannot be unloaded.
//

  ERROR_SERVER_HAS_OPEN_HANDLES = 1811;
  {$EXTERNALSYM ERROR_SERVER_HAS_OPEN_HANDLES}

//
// MessageId: ERROR_RESOURCE_DATA_NOT_FOUND
//
// MessageText:
//
//  The specified image file did not contain a resource section.
//

  ERROR_RESOURCE_DATA_NOT_FOUND = 1812;
  {$EXTERNALSYM ERROR_RESOURCE_DATA_NOT_FOUND}

//
// MessageId: ERROR_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
//  The specified resource type cannot be found in the image file.
//

  ERROR_RESOURCE_TYPE_NOT_FOUND = 1813;
  {$EXTERNALSYM ERROR_RESOURCE_TYPE_NOT_FOUND}

//
// MessageId: ERROR_RESOURCE_NAME_NOT_FOUND
//
// MessageText:
//
//  The specified resource name cannot be found in the image file.
//

  ERROR_RESOURCE_NAME_NOT_FOUND = 1814;
  {$EXTERNALSYM ERROR_RESOURCE_NAME_NOT_FOUND}

//
// MessageId: ERROR_RESOURCE_LANG_NOT_FOUND
//
// MessageText:
//
//  The specified resource language ID cannot be found in the image file.
//

  ERROR_RESOURCE_LANG_NOT_FOUND = 1815;
  {$EXTERNALSYM ERROR_RESOURCE_LANG_NOT_FOUND}

//
// MessageId: ERROR_NOT_ENOUGH_QUOTA
//
// MessageText:
//
//  Not enough quota is available to process this command.
//

  ERROR_NOT_ENOUGH_QUOTA = 1816;
  {$EXTERNALSYM ERROR_NOT_ENOUGH_QUOTA}

//
// MessageId: RPC_S_NO_INTERFACES
//
// MessageText:
//
//  No interfaces have been registered.
//

  RPC_S_NO_INTERFACES = 1817;
  {$EXTERNALSYM RPC_S_NO_INTERFACES}

//
// MessageId: RPC_S_CALL_CANCELLED
//
// MessageText:
//
//  The remote procedure call was cancelled.
//

  RPC_S_CALL_CANCELLED = 1818;
  {$EXTERNALSYM RPC_S_CALL_CANCELLED}

//
// MessageId: RPC_S_BINDING_INCOMPLETE
//
// MessageText:
//
//  The binding handle does not contain all required information.
//

  RPC_S_BINDING_INCOMPLETE = 1819;
  {$EXTERNALSYM RPC_S_BINDING_INCOMPLETE}

//
// MessageId: RPC_S_COMM_FAILURE
//
// MessageText:
//
//  A communications failure occurred during a remote procedure call.
//

  RPC_S_COMM_FAILURE = 1820;
  {$EXTERNALSYM RPC_S_COMM_FAILURE}

//
// MessageId: RPC_S_UNSUPPORTED_AUTHN_LEVEL
//
// MessageText:
//
//  The requested authentication level is not supported.
//

  RPC_S_UNSUPPORTED_AUTHN_LEVEL = 1821;
  {$EXTERNALSYM RPC_S_UNSUPPORTED_AUTHN_LEVEL}

//
// MessageId: RPC_S_NO_PRINC_NAME
//
// MessageText:
//
//  No principal name registered.
//

  RPC_S_NO_PRINC_NAME = 1822;
  {$EXTERNALSYM RPC_S_NO_PRINC_NAME}

//
// MessageId: RPC_S_NOT_RPC_ERROR
//
// MessageText:
//
//  The error specified is not a valid Windows RPC error code.
//

  RPC_S_NOT_RPC_ERROR = 1823;
  {$EXTERNALSYM RPC_S_NOT_RPC_ERROR}

//
// MessageId: RPC_S_UUID_LOCAL_ONLY
//
// MessageText:
//
//  A UUID that is valid only on this computer has been allocated.
//

  RPC_S_UUID_LOCAL_ONLY = 1824;
  {$EXTERNALSYM RPC_S_UUID_LOCAL_ONLY}

//
// MessageId: RPC_S_SEC_PKG_ERROR
//
// MessageText:
//
//  A security package specific error occurred.
//

  RPC_S_SEC_PKG_ERROR = 1825;
  {$EXTERNALSYM RPC_S_SEC_PKG_ERROR}

//
// MessageId: RPC_S_NOT_CANCELLED
//
// MessageText:
//
//  Thread is not canceled.
//

  RPC_S_NOT_CANCELLED = 1826;
  {$EXTERNALSYM RPC_S_NOT_CANCELLED}

//
// MessageId: RPC_X_INVALID_ES_ACTION
//
// MessageText:
//
//  Invalid operation on the encoding/decoding handle.
//

  RPC_X_INVALID_ES_ACTION = 1827;
  {$EXTERNALSYM RPC_X_INVALID_ES_ACTION}

//
// MessageId: RPC_X_WRONG_ES_VERSION
//
// MessageText:
//
//  Incompatible version of the serializing package.
//

  RPC_X_WRONG_ES_VERSION = 1828;
  {$EXTERNALSYM RPC_X_WRONG_ES_VERSION}

//
// MessageId: RPC_X_WRONG_STUB_VERSION
//
// MessageText:
//
//  Incompatible version of the RPC stub.
//

  RPC_X_WRONG_STUB_VERSION = 1829;
  {$EXTERNALSYM RPC_X_WRONG_STUB_VERSION}

//
// MessageId: RPC_X_INVALID_PIPE_OBJECT
//
// MessageText:
//
//  The RPC pipe object is invalid or corrupted.
//

  RPC_X_INVALID_PIPE_OBJECT = 1830;
  {$EXTERNALSYM RPC_X_INVALID_PIPE_OBJECT}

//
// MessageId: RPC_X_WRONG_PIPE_ORDER
//
// MessageText:
//
//  An invalid operation was attempted on an RPC pipe object.
//

  RPC_X_WRONG_PIPE_ORDER = 1831;
  {$EXTERNALSYM RPC_X_WRONG_PIPE_ORDER}

//
// MessageId: RPC_X_WRONG_PIPE_VERSION
//
// MessageText:
//
//  Unsupported RPC pipe version.
//

  RPC_X_WRONG_PIPE_VERSION = 1832;
  {$EXTERNALSYM RPC_X_WRONG_PIPE_VERSION}

//
// MessageId: RPC_S_GROUP_MEMBER_NOT_FOUND
//
// MessageText:
//
//  The group member was not found.
//

  RPC_S_GROUP_MEMBER_NOT_FOUND = 1898;
  {$EXTERNALSYM RPC_S_GROUP_MEMBER_NOT_FOUND}

//
// MessageId: EPT_S_CANT_CREATE
//
// MessageText:
//
//  The endpoint mapper database entry could not be created.
//

  EPT_S_CANT_CREATE = 1899;
  {$EXTERNALSYM EPT_S_CANT_CREATE}

//
// MessageId: RPC_S_INVALID_OBJECT
//
// MessageText:
//
//  The object universal unique identifier (UUID) is the nil UUID.
//

  RPC_S_INVALID_OBJECT = 1900;
  {$EXTERNALSYM RPC_S_INVALID_OBJECT}

//
// MessageId: ERROR_INVALID_TIME
//
// MessageText:
//
//  The specified time is invalid.
//

  ERROR_INVALID_TIME = 1901;
  {$EXTERNALSYM ERROR_INVALID_TIME}

//
// MessageId: ERROR_INVALID_FORM_NAME
//
// MessageText:
//
//  The specified form name is invalid.
//

  ERROR_INVALID_FORM_NAME = 1902;
  {$EXTERNALSYM ERROR_INVALID_FORM_NAME}

//
// MessageId: ERROR_INVALID_FORM_SIZE
//
// MessageText:
//
//  The specified form size is invalid.
//

  ERROR_INVALID_FORM_SIZE = 1903;
  {$EXTERNALSYM ERROR_INVALID_FORM_SIZE}

//
// MessageId: ERROR_ALREADY_WAITING
//
// MessageText:
//
//  The specified printer handle is already being waited on
//

  ERROR_ALREADY_WAITING = 1904;
  {$EXTERNALSYM ERROR_ALREADY_WAITING}

//
// MessageId: ERROR_PRINTER_DELETED
//
// MessageText:
//
//  The specified printer has been deleted.
//

  ERROR_PRINTER_DELETED = 1905;
  {$EXTERNALSYM ERROR_PRINTER_DELETED}

//
// MessageId: ERROR_INVALID_PRINTER_STATE
//
// MessageText:
//
//  The state of the printer is invalid.
//

  ERROR_INVALID_PRINTER_STATE = 1906;
  {$EXTERNALSYM ERROR_INVALID_PRINTER_STATE}

//
// MessageId: ERROR_PASSWORD_MUST_CHANGE
//
// MessageText:
//
//  The user's password must be changed before logging on the first time.
//

  ERROR_PASSWORD_MUST_CHANGE = 1907;
  {$EXTERNALSYM ERROR_PASSWORD_MUST_CHANGE}

//
// MessageId: ERROR_DOMAIN_CONTROLLER_NOT_FOUND
//
// MessageText:
//
//  Could not find the domain controller for this domain.
//

  ERROR_DOMAIN_CONTROLLER_NOT_FOUND = 1908;
  {$EXTERNALSYM ERROR_DOMAIN_CONTROLLER_NOT_FOUND}

//
// MessageId: ERROR_ACCOUNT_LOCKED_OUT
//
// MessageText:
//
//  The referenced account is currently locked out and may not be logged on to.
//

  ERROR_ACCOUNT_LOCKED_OUT = 1909;
  {$EXTERNALSYM ERROR_ACCOUNT_LOCKED_OUT}

//
// MessageId: OR_INVALID_OXID
//
// MessageText:
//
//  The object exporter specified was not found.
//

  OR_INVALID_OXID = 1910;
  {$EXTERNALSYM OR_INVALID_OXID}

//
// MessageId: OR_INVALID_OID
//
// MessageText:
//
//  The object specified was not found.
//

  OR_INVALID_OID = 1911;
  {$EXTERNALSYM OR_INVALID_OID}

//
// MessageId: OR_INVALID_SET
//
// MessageText:
//
//  The object resolver set specified was not found.
//

  OR_INVALID_SET = 1912;
  {$EXTERNALSYM OR_INVALID_SET}

//
// MessageId: RPC_S_SEND_INCOMPLETE
//
// MessageText:
//
//  Some data remains to be sent in the request buffer.
//

  RPC_S_SEND_INCOMPLETE = 1913;
  {$EXTERNALSYM RPC_S_SEND_INCOMPLETE}

//
// MessageId: RPC_S_INVALID_ASYNC_HANDLE
//
// MessageText:
//
//  Invalid asynchronous remote procedure call handle.
//

  RPC_S_INVALID_ASYNC_HANDLE = 1914;
  {$EXTERNALSYM RPC_S_INVALID_ASYNC_HANDLE}

//
// MessageId: RPC_S_INVALID_ASYNC_CALL
//
// MessageText:
//
//  Invalid asynchronous RPC call handle for this operation.
//

  RPC_S_INVALID_ASYNC_CALL = 1915;
  {$EXTERNALSYM RPC_S_INVALID_ASYNC_CALL}

//
// MessageId: RPC_X_PIPE_CLOSED
//
// MessageText:
//
//  The RPC pipe object has already been closed.
//

  RPC_X_PIPE_CLOSED = 1916;
  {$EXTERNALSYM RPC_X_PIPE_CLOSED}

//
// MessageId: RPC_X_PIPE_DISCIPLINE_ERROR
//
// MessageText:
//
//  The RPC call completed before all pipes were processed.
//

  RPC_X_PIPE_DISCIPLINE_ERROR = 1917;
  {$EXTERNALSYM RPC_X_PIPE_DISCIPLINE_ERROR}

//
// MessageId: RPC_X_PIPE_EMPTY
//
// MessageText:
//
//  No more data is available from the RPC pipe.
//

  RPC_X_PIPE_EMPTY = 1918;
  {$EXTERNALSYM RPC_X_PIPE_EMPTY}

//
// MessageId: ERROR_NO_SITENAME
//
// MessageText:
//
//  No site name is available for this machine.
//

  ERROR_NO_SITENAME = 1919;
  {$EXTERNALSYM ERROR_NO_SITENAME}

//
// MessageId: ERROR_CANT_ACCESS_FILE
//
// MessageText:
//
//  The file can not be accessed by the system.
//

  ERROR_CANT_ACCESS_FILE = 1920;
  {$EXTERNALSYM ERROR_CANT_ACCESS_FILE}

//
// MessageId: ERROR_CANT_RESOLVE_FILENAME
//
// MessageText:
//
//  The name of the file cannot be resolved by the system.
//

  ERROR_CANT_RESOLVE_FILENAME = 1921;
  {$EXTERNALSYM ERROR_CANT_RESOLVE_FILENAME}

//
// MessageId: RPC_S_ENTRY_TYPE_MISMATCH
//
// MessageText:
//
//  The entry is not of the expected type.
//

  RPC_S_ENTRY_TYPE_MISMATCH = 1922;
  {$EXTERNALSYM RPC_S_ENTRY_TYPE_MISMATCH}

//
// MessageId: RPC_S_NOT_ALL_OBJS_EXPORTED
//
// MessageText:
//
//  Not all object UUIDs could be exported to the specified entry.
//

  RPC_S_NOT_ALL_OBJS_EXPORTED = 1923;
  {$EXTERNALSYM RPC_S_NOT_ALL_OBJS_EXPORTED}

//
// MessageId: RPC_S_INTERFACE_NOT_EXPORTED
//
// MessageText:
//
//  Interface could not be exported to the specified entry.
//

  RPC_S_INTERFACE_NOT_EXPORTED = 1924;
  {$EXTERNALSYM RPC_S_INTERFACE_NOT_EXPORTED}

//
// MessageId: RPC_S_PROFILE_NOT_ADDED
//
// MessageText:
//
//  The specified profile entry could not be added.
//

  RPC_S_PROFILE_NOT_ADDED = 1925;
  {$EXTERNALSYM RPC_S_PROFILE_NOT_ADDED}

//
// MessageId: RPC_S_PRF_ELT_NOT_ADDED
//
// MessageText:
//
//  The specified profile element could not be added.
//

  RPC_S_PRF_ELT_NOT_ADDED = 1926;
  {$EXTERNALSYM RPC_S_PRF_ELT_NOT_ADDED}

//
// MessageId: RPC_S_PRF_ELT_NOT_REMOVED
//
// MessageText:
//
//  The specified profile element could not be removed.
//

  RPC_S_PRF_ELT_NOT_REMOVED = 1927;
  {$EXTERNALSYM RPC_S_PRF_ELT_NOT_REMOVED}

//
// MessageId: RPC_S_GRP_ELT_NOT_ADDED
//
// MessageText:
//
//  The group element could not be added.
//

  RPC_S_GRP_ELT_NOT_ADDED = 1928;
  {$EXTERNALSYM RPC_S_GRP_ELT_NOT_ADDED}

//
// MessageId: RPC_S_GRP_ELT_NOT_REMOVED
//
// MessageText:
//
//  The group element could not be removed.
//

  RPC_S_GRP_ELT_NOT_REMOVED = 1929;
  {$EXTERNALSYM RPC_S_GRP_ELT_NOT_REMOVED}

//
// MessageId: ERROR_NO_BROWSER_SERVERS_FOUND
//
// MessageText:
//
//  The list of servers for this workgroup is not currently available
//

  ERROR_NO_BROWSER_SERVERS_FOUND = 6118;
  {$EXTERNALSYM ERROR_NO_BROWSER_SERVERS_FOUND}




///////////////////////////
//                       //
//   OpenGL Error Code   //
//                       //
///////////////////////////


//
// MessageId: ERROR_INVALID_PIXEL_FORMAT
//
// MessageText:
//
//  The pixel format is invalid.
//

  ERROR_INVALID_PIXEL_FORMAT = 2000;
  {$EXTERNALSYM ERROR_INVALID_PIXEL_FORMAT}

//
// MessageId: ERROR_BAD_DRIVER
//
// MessageText:
//
//  The specified driver is invalid.
//

  ERROR_BAD_DRIVER = 2001;
  {$EXTERNALSYM ERROR_BAD_DRIVER}

//
// MessageId: ERROR_INVALID_WINDOW_STYLE
//
// MessageText:
//
//  The window style or class attribute is invalid for this operation.
//

  ERROR_INVALID_WINDOW_STYLE = 2002;
  {$EXTERNALSYM ERROR_INVALID_WINDOW_STYLE}

//
// MessageId: ERROR_METAFILE_NOT_SUPPORTED
//
// MessageText:
//
//  The requested metafile operation is not supported.
//

  ERROR_METAFILE_NOT_SUPPORTED = 2003;
  {$EXTERNALSYM ERROR_METAFILE_NOT_SUPPORTED}

//
// MessageId: ERROR_TRANSFORM_NOT_SUPPORTED
//
// MessageText:
//
//  The requested transformation operation is not supported.
//

  ERROR_TRANSFORM_NOT_SUPPORTED = 2004;
  {$EXTERNALSYM ERROR_TRANSFORM_NOT_SUPPORTED}

//
// MessageId: ERROR_CLIPPING_NOT_SUPPORTED
//
// MessageText:
//
//  The requested clipping operation is not supported.
//

  ERROR_CLIPPING_NOT_SUPPORTED = 2005;
  {$EXTERNALSYM ERROR_CLIPPING_NOT_SUPPORTED}

// End of OpenGL error codes



///////////////////////////////////////////
//                                       //
//   Image Color Management Error Code   //
//                                       //
///////////////////////////////////////////


//
// MessageId: ERROR_INVALID_CMM
//
// MessageText:
//
//  The specified color management module is invalid.
//

  ERROR_INVALID_CMM = 2010;
  {$EXTERNALSYM ERROR_INVALID_CMM}

//
// MessageId: ERROR_INVALID_PROFILE
//
// MessageText:
//
//  The specified color profile is invalid.
//

  ERROR_INVALID_PROFILE = 2011;
  {$EXTERNALSYM ERROR_INVALID_PROFILE}

//
// MessageId: ERROR_TAG_NOT_FOUND
//
// MessageText:
//
//  The specified tag was not found.
//

  ERROR_TAG_NOT_FOUND = 2012;
  {$EXTERNALSYM ERROR_TAG_NOT_FOUND}

//
// MessageId: ERROR_TAG_NOT_PRESENT
//
// MessageText:
//
//  A required tag is not present.
//

  ERROR_TAG_NOT_PRESENT = 2013;
  {$EXTERNALSYM ERROR_TAG_NOT_PRESENT}

//
// MessageId: ERROR_DUPLICATE_TAG
//
// MessageText:
//
//  The specified tag is already present.
//

  ERROR_DUPLICATE_TAG = 2014;
  {$EXTERNALSYM ERROR_DUPLICATE_TAG}

//
// MessageId: ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE
//
// MessageText:
//
//  The specified color profile is not associated with any device.
//

  ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE = 2015;
  {$EXTERNALSYM ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE}

//
// MessageId: ERROR_PROFILE_NOT_FOUND
//
// MessageText:
//
//  The specified color profile was not found.
//

  ERROR_PROFILE_NOT_FOUND = 2016;
  {$EXTERNALSYM ERROR_PROFILE_NOT_FOUND}

//
// MessageId: ERROR_INVALID_COLORSPACE
//
// MessageText:
//
//  The specified color space is invalid.
//

  ERROR_INVALID_COLORSPACE = 2017;
  {$EXTERNALSYM ERROR_INVALID_COLORSPACE}

//
// MessageId: ERROR_ICM_NOT_ENABLED
//
// MessageText:
//
//  Image Color Management is not enabled.
//

  ERROR_ICM_NOT_ENABLED = 2018;
  {$EXTERNALSYM ERROR_ICM_NOT_ENABLED}

//
// MessageId: ERROR_DELETING_ICM_XFORM
//
// MessageText:
//
//  There was an error while deleting the color transform.
//

  ERROR_DELETING_ICM_XFORM = 2019;
  {$EXTERNALSYM ERROR_DELETING_ICM_XFORM}

//
// MessageId: ERROR_INVALID_TRANSFORM
//
// MessageText:
//
//  The specified color transform is invalid.
//

  ERROR_INVALID_TRANSFORM = 2020;
  {$EXTERNALSYM ERROR_INVALID_TRANSFORM}

//
// MessageId: ERROR_COLORSPACE_MISMATCH
//
// MessageText:
//
//  The specified transform does not match the bitmap's color space.
//

  ERROR_COLORSPACE_MISMATCH = 2021;
  {$EXTERNALSYM ERROR_COLORSPACE_MISMATCH}

//
// MessageId: ERROR_INVALID_COLORINDEX
//
// MessageText:
//
//  The specified named color index is not present in the profile.
//

  ERROR_INVALID_COLORINDEX = 2022;
  {$EXTERNALSYM ERROR_INVALID_COLORINDEX}




///////////////////////////
//                       //
// Winnet32 Status Codes //
//                       //
///////////////////////////


//
// MessageId: ERROR_CONNECTED_OTHER_PASSWORD
//
// MessageText:
//
//  The network connection was made successfully, but the user had to be prompted for a password other than the one originally specified.
//

  ERROR_CONNECTED_OTHER_PASSWORD = 2108;
  {$EXTERNALSYM ERROR_CONNECTED_OTHER_PASSWORD}

//
// MessageId: ERROR_BAD_USERNAME
//
// MessageText:
//
//  The specified username is invalid.
//

  ERROR_BAD_USERNAME = 2202;
  {$EXTERNALSYM ERROR_BAD_USERNAME}

//
// MessageId: ERROR_NOT_CONNECTED
//
// MessageText:
//
//  This network connection does not exist.
//

  ERROR_NOT_CONNECTED = 2250;
  {$EXTERNALSYM ERROR_NOT_CONNECTED}

//
// MessageId: ERROR_OPEN_FILES
//
// MessageText:
//
//  This network connection has files open or requests pending.
//

  ERROR_OPEN_FILES = 2401;
  {$EXTERNALSYM ERROR_OPEN_FILES}

//
// MessageId: ERROR_ACTIVE_CONNECTIONS
//
// MessageText:
//
//  Active connections still exist.
//

  ERROR_ACTIVE_CONNECTIONS = 2402;
  {$EXTERNALSYM ERROR_ACTIVE_CONNECTIONS}

//
// MessageId: ERROR_DEVICE_IN_USE
//
// MessageText:
//
//  The device is in use by an active process and cannot be disconnected.
//

  ERROR_DEVICE_IN_USE = 2404;
  {$EXTERNALSYM ERROR_DEVICE_IN_USE}


////////////////////////////////////
//                                //
//     Win32 Spooler Error Codes  //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_UNKNOWN_PRINT_MONITOR
//
// MessageText:
//
//  The specified print monitor is unknown.
//

  ERROR_UNKNOWN_PRINT_MONITOR = 3000;
  {$EXTERNALSYM ERROR_UNKNOWN_PRINT_MONITOR}

//
// MessageId: ERROR_PRINTER_DRIVER_IN_USE
//
// MessageText:
//
//  The specified printer driver is currently in use.
//

  ERROR_PRINTER_DRIVER_IN_USE = 3001;
  {$EXTERNALSYM ERROR_PRINTER_DRIVER_IN_USE}

//
// MessageId: ERROR_SPOOL_FILE_NOT_FOUND
//
// MessageText:
//
//  The spool file was not found.
//

  ERROR_SPOOL_FILE_NOT_FOUND = 3002;
  {$EXTERNALSYM ERROR_SPOOL_FILE_NOT_FOUND}

//
// MessageId: ERROR_SPL_NO_STARTDOC
//
// MessageText:
//
//  A StartDocPrinter call was not issued.
//

  ERROR_SPL_NO_STARTDOC = 3003;
  {$EXTERNALSYM ERROR_SPL_NO_STARTDOC}

//
// MessageId: ERROR_SPL_NO_ADDJOB
//
// MessageText:
//
//  An AddJob call was not issued.
//

  ERROR_SPL_NO_ADDJOB = 3004;
  {$EXTERNALSYM ERROR_SPL_NO_ADDJOB}

//
// MessageId: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
//
// MessageText:
//
//  The specified print processor has already been installed.
//

  ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED = 3005;
  {$EXTERNALSYM ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED}

//
// MessageId: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
//
// MessageText:
//
//  The specified print monitor has already been installed.
//

  ERROR_PRINT_MONITOR_ALREADY_INSTALLED = 3006;
  {$EXTERNALSYM ERROR_PRINT_MONITOR_ALREADY_INSTALLED}

//
// MessageId: ERROR_INVALID_PRINT_MONITOR
//
// MessageText:
//
//  The specified print monitor does not have the required functions.
//

  ERROR_INVALID_PRINT_MONITOR = 3007;
  {$EXTERNALSYM ERROR_INVALID_PRINT_MONITOR}

//
// MessageId: ERROR_PRINT_MONITOR_IN_USE
//
// MessageText:
//
//  The specified print monitor is currently in use.
//

  ERROR_PRINT_MONITOR_IN_USE = 3008;
  {$EXTERNALSYM ERROR_PRINT_MONITOR_IN_USE}

//
// MessageId: ERROR_PRINTER_HAS_JOBS_QUEUED
//
// MessageText:
//
//  The requested operation is not allowed when there are jobs queued to the printer.
//

  ERROR_PRINTER_HAS_JOBS_QUEUED = 3009;
  {$EXTERNALSYM ERROR_PRINTER_HAS_JOBS_QUEUED}

//
// MessageId: ERROR_SUCCESS_REBOOT_REQUIRED
//
// MessageText:
//
//  The requested operation is successful. Changes will not be effective until the system is rebooted.
//

  ERROR_SUCCESS_REBOOT_REQUIRED = 3010;
  {$EXTERNALSYM ERROR_SUCCESS_REBOOT_REQUIRED}

//
// MessageId: ERROR_SUCCESS_RESTART_REQUIRED
//
// MessageText:
//
//  The requested operation is successful. Changes will not be effective until the service is restarted.
//

  ERROR_SUCCESS_RESTART_REQUIRED = 3011;
  {$EXTERNALSYM ERROR_SUCCESS_RESTART_REQUIRED}

//
// MessageId: ERROR_PRINTER_NOT_FOUND
//
// MessageText:
//
//  No printers were found.
//

  ERROR_PRINTER_NOT_FOUND = 3012;
  {$EXTERNALSYM ERROR_PRINTER_NOT_FOUND}

////////////////////////////////////
//                                //
//     Wins Error Codes           //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_WINS_INTERNAL
//
// MessageText:
//
//  WINS encountered an error while processing the command.
//

  ERROR_WINS_INTERNAL = 4000;
  {$EXTERNALSYM ERROR_WINS_INTERNAL}

//
// MessageId: ERROR_CAN_NOT_DEL_LOCAL_WINS
//
// MessageText:
//
//  The local WINS can not be deleted.
//

  ERROR_CAN_NOT_DEL_LOCAL_WINS = 4001;
  {$EXTERNALSYM ERROR_CAN_NOT_DEL_LOCAL_WINS}

//
// MessageId: ERROR_STATIC_INIT
//
// MessageText:
//
//  The importation from the file failed.
//

  ERROR_STATIC_INIT = 4002;
  {$EXTERNALSYM ERROR_STATIC_INIT}

//
// MessageId: ERROR_INC_BACKUP
//
// MessageText:
//
//  The backup failed. Was a full backup done before?
//

  ERROR_INC_BACKUP = 4003;
  {$EXTERNALSYM ERROR_INC_BACKUP}

//
// MessageId: ERROR_FULL_BACKUP
//
// MessageText:
//
//  The backup failed. Check the directory to which you are backing the database.
//

  ERROR_FULL_BACKUP = 4004;
  {$EXTERNALSYM ERROR_FULL_BACKUP}

//
// MessageId: ERROR_REC_NON_EXISTENT
//
// MessageText:
//
//  The name does not exist in the WINS database.
//

  ERROR_REC_NON_EXISTENT = 4005;
  {$EXTERNALSYM ERROR_REC_NON_EXISTENT}

//
// MessageId: ERROR_RPL_NOT_ALLOWED
//
// MessageText:
//
//  Replication with a nonconfigured partner is not allowed.
//

  ERROR_RPL_NOT_ALLOWED = 4006;
  {$EXTERNALSYM ERROR_RPL_NOT_ALLOWED}

////////////////////////////////////
//                                //
//     DHCP Error Codes           //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_DHCP_ADDRESS_CONFLICT
//
// MessageText:
//
//  The DHCP client has obtained an IP address that is already in use on the network. The local interface will be disabled until the DHCP client can obtain a new address.
//

  ERROR_DHCP_ADDRESS_CONFLICT = 4100;
  {$EXTERNALSYM ERROR_DHCP_ADDRESS_CONFLICT}

////////////////////////////////////
//                                //
//     WMI Error Codes            //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_WMI_GUID_NOT_FOUND
//
// MessageText:
//
//  The GUID passed was not recognized as valid by a WMI data provider.
//

  ERROR_WMI_GUID_NOT_FOUND = 4200;
  {$EXTERNALSYM ERROR_WMI_GUID_NOT_FOUND}

//
// MessageId: ERROR_WMI_INSTANCE_NOT_FOUND
//
// MessageText:
//
//  The instance name passed was not recognized as valid by a WMI data provider.
//

  ERROR_WMI_INSTANCE_NOT_FOUND = 4201;
  {$EXTERNALSYM ERROR_WMI_INSTANCE_NOT_FOUND}

//
// MessageId: ERROR_WMI_ITEMID_NOT_FOUND
//
// MessageText:
//
//  The data item ID passed was not recognized as valid by a WMI data provider.
//

  ERROR_WMI_ITEMID_NOT_FOUND = 4202;
  {$EXTERNALSYM ERROR_WMI_ITEMID_NOT_FOUND}

//
// MessageId: ERROR_WMI_TRY_AGAIN
//
// MessageText:
//
//  The WMI request could not be completed and should be retried.
//

  ERROR_WMI_TRY_AGAIN = 4203;
  {$EXTERNALSYM ERROR_WMI_TRY_AGAIN}

//
// MessageId: ERROR_WMI_DP_NOT_FOUND
//
// MessageText:
//
//  The WMI data provider could not be located.
//

  ERROR_WMI_DP_NOT_FOUND = 4204;
  {$EXTERNALSYM ERROR_WMI_DP_NOT_FOUND}

//
// MessageId: ERROR_WMI_UNRESOLVED_INSTANCE_REF
//
// MessageText:
//
//  The WMI data provider references an instance set that has not been registered.
//

  ERROR_WMI_UNRESOLVED_INSTANCE_REF = 4205;
  {$EXTERNALSYM ERROR_WMI_UNRESOLVED_INSTANCE_REF}

//
// MessageId: ERROR_WMI_ALREADY_ENABLED
//
// MessageText:
//
//  The WMI data block or event notification has already been enabled.
//

  ERROR_WMI_ALREADY_ENABLED = 4206;
  {$EXTERNALSYM ERROR_WMI_ALREADY_ENABLED}

//
// MessageId: ERROR_WMI_GUID_DISCONNECTED
//
// MessageText:
//
//  The WMI data block is no longer available.
//

  ERROR_WMI_GUID_DISCONNECTED = 4207;
  {$EXTERNALSYM ERROR_WMI_GUID_DISCONNECTED}

//
// MessageId: ERROR_WMI_SERVER_UNAVAILABLE
//
// MessageText:
//
//  The WMI data service is not available.
//

  ERROR_WMI_SERVER_UNAVAILABLE = 4208;
  {$EXTERNALSYM ERROR_WMI_SERVER_UNAVAILABLE}

//
// MessageId: ERROR_WMI_DP_FAILED
//
// MessageText:
//
//  The WMI data provider failed to carry out the request.
//

  ERROR_WMI_DP_FAILED = 4209;
  {$EXTERNALSYM ERROR_WMI_DP_FAILED}

//
// MessageId: ERROR_WMI_INVALID_MOF
//
// MessageText:
//
//  The WMI MOF information is not valid.
//

  ERROR_WMI_INVALID_MOF = 4210;
  {$EXTERNALSYM ERROR_WMI_INVALID_MOF}

//
// MessageId: ERROR_WMI_INVALID_REGINFO
//
// MessageText:
//
//  The WMI registration information is not valid.
//

  ERROR_WMI_INVALID_REGINFO = 4211;
  {$EXTERNALSYM ERROR_WMI_INVALID_REGINFO}

//
// MessageId: ERROR_WMI_ALREADY_DISABLED
//
// MessageText:
//
//  The WMI data block or event notification has already been disabled.
//

  ERROR_WMI_ALREADY_DISABLED = 4212;
  {$EXTERNALSYM ERROR_WMI_ALREADY_DISABLED}

//
// MessageId: ERROR_WMI_READ_ONLY
//
// MessageText:
//
//  The WMI data item or data block is read only.
//

  ERROR_WMI_READ_ONLY = 4213;
  {$EXTERNALSYM ERROR_WMI_READ_ONLY}

//
// MessageId: ERROR_WMI_SET_FAILURE
//
// MessageText:
//
//  The WMI data item or data block could not be changed.
//

  ERROR_WMI_SET_FAILURE = 4214;
  {$EXTERNALSYM ERROR_WMI_SET_FAILURE}

//////////////////////////////////////////
//                                      //
// NT Media Services (RSM) Error Codes  //
//                                      //
//////////////////////////////////////////
//
// MessageId: ERROR_INVALID_MEDIA
//
// MessageText:
//
//  The media identifier does not represent a valid medium.
//

  ERROR_INVALID_MEDIA = 4300;
  {$EXTERNALSYM ERROR_INVALID_MEDIA}

//
// MessageId: ERROR_INVALID_LIBRARY
//
// MessageText:
//
//  The library identifier does not represent a valid library.
//

  ERROR_INVALID_LIBRARY = 4301;
  {$EXTERNALSYM ERROR_INVALID_LIBRARY}

//
// MessageId: ERROR_INVALID_MEDIA_POOL
//
// MessageText:
//
//  The media pool identifier does not represent a valid media pool.
//

  ERROR_INVALID_MEDIA_POOL = 4302;
  {$EXTERNALSYM ERROR_INVALID_MEDIA_POOL}

//
// MessageId: ERROR_DRIVE_MEDIA_MISMATCH
//
// MessageText:
//
//  The drive and medium are not compatible or exist in different libraries.
//

  ERROR_DRIVE_MEDIA_MISMATCH = 4303;
  {$EXTERNALSYM ERROR_DRIVE_MEDIA_MISMATCH}

//
// MessageId: ERROR_MEDIA_OFFLINE
//
// MessageText:
//
//  The medium currently exists in an offline library and must be online to perform this operation.
//

  ERROR_MEDIA_OFFLINE = 4304;
  {$EXTERNALSYM ERROR_MEDIA_OFFLINE}

//
// MessageId: ERROR_LIBRARY_OFFLINE
//
// MessageText:
//
//  The operation cannot be performed on an offline library.
//

  ERROR_LIBRARY_OFFLINE = 4305;
  {$EXTERNALSYM ERROR_LIBRARY_OFFLINE}

//
// MessageId: ERROR_EMPTY
//
// MessageText:
//
//  The library, drive, or media pool is empty.
//

  ERROR_EMPTY = 4306;
  {$EXTERNALSYM ERROR_EMPTY}

//
// MessageId: ERROR_NOT_EMPTY
//
// MessageText:
//
//  The library, drive, or media pool must be empty to perform this operation.
//

  ERROR_NOT_EMPTY = 4307;
  {$EXTERNALSYM ERROR_NOT_EMPTY}

//
// MessageId: ERROR_MEDIA_UNAVAILABLE
//
// MessageText:
//
//  No media is currently available in this media pool or library.
//

  ERROR_MEDIA_UNAVAILABLE = 4308;
  {$EXTERNALSYM ERROR_MEDIA_UNAVAILABLE}

//
// MessageId: ERROR_RESOURCE_DISABLED
//
// MessageText:
//
//  A resource required for this operation is disabled.
//

  ERROR_RESOURCE_DISABLED = 4309;
  {$EXTERNALSYM ERROR_RESOURCE_DISABLED}

//
// MessageId: ERROR_INVALID_CLEANER
//
// MessageText:
//
//  The media identifier does not represent a valid cleaner.
//

  ERROR_INVALID_CLEANER = 4310;
  {$EXTERNALSYM ERROR_INVALID_CLEANER}

//
// MessageId: ERROR_UNABLE_TO_CLEAN
//
// MessageText:
//
//  The drive cannot be cleaned or does not support cleaning.
//

  ERROR_UNABLE_TO_CLEAN = 4311;
  {$EXTERNALSYM ERROR_UNABLE_TO_CLEAN}

//
// MessageId: ERROR_OBJECT_NOT_FOUND
//
// MessageText:
//
//  The object identifier does not represent a valid object.
//

  ERROR_OBJECT_NOT_FOUND = 4312;
  {$EXTERNALSYM ERROR_OBJECT_NOT_FOUND}

//
// MessageId: ERROR_DATABASE_FAILURE
//
// MessageText:
//
//  Unable to read from or write to the database.
//

  ERROR_DATABASE_FAILURE = 4313;
  {$EXTERNALSYM ERROR_DATABASE_FAILURE}

//
// MessageId: ERROR_DATABASE_FULL
//
// MessageText:
//
//  The database is full.
//

  ERROR_DATABASE_FULL = 4314;
  {$EXTERNALSYM ERROR_DATABASE_FULL}

//
// MessageId: ERROR_MEDIA_INCOMPATIBLE
//
// MessageText:
//
//  The medium is not compatible with the device or media pool.
//

  ERROR_MEDIA_INCOMPATIBLE = 4315;
  {$EXTERNALSYM ERROR_MEDIA_INCOMPATIBLE}

//
// MessageId: ERROR_RESOURCE_NOT_PRESENT
//
// MessageText:
//
//  The resource required for this operation does not exist.
//

  ERROR_RESOURCE_NOT_PRESENT = 4316;
  {$EXTERNALSYM ERROR_RESOURCE_NOT_PRESENT}

//
// MessageId: ERROR_INVALID_OPERATION
//
// MessageText:
//
//  The operation identifier is not valid.
//

  ERROR_INVALID_OPERATION = 4317;
  {$EXTERNALSYM ERROR_INVALID_OPERATION}

//
// MessageId: ERROR_MEDIA_NOT_AVAILABLE
//
// MessageText:
//
//  The media is not mounted or ready for use.
//

  ERROR_MEDIA_NOT_AVAILABLE = 4318;
  {$EXTERNALSYM ERROR_MEDIA_NOT_AVAILABLE}

//
// MessageId: ERROR_DEVICE_NOT_AVAILABLE
//
// MessageText:
//
//  The device is not ready for use.
//

  ERROR_DEVICE_NOT_AVAILABLE = 4319;
  {$EXTERNALSYM ERROR_DEVICE_NOT_AVAILABLE}

//
// MessageId: ERROR_REQUEST_REFUSED
//
// MessageText:
//
//  The operator or administrator has refused the request.
//

  ERROR_REQUEST_REFUSED = 4320;
  {$EXTERNALSYM ERROR_REQUEST_REFUSED}

//
// MessageId: ERROR_INVALID_DRIVE_OBJECT
//
// MessageText:
//
//  The drive identifier does not represent a valid drive.
//

  ERROR_INVALID_DRIVE_OBJECT = 4321;
  {$EXTERNALSYM ERROR_INVALID_DRIVE_OBJECT}

//
// MessageId: ERROR_LIBRARY_FULL
//
// MessageText:
//
//  Library is full.  No slot is available for use.
//

  ERROR_LIBRARY_FULL = 4322;
  {$EXTERNALSYM ERROR_LIBRARY_FULL}

//
// MessageId: ERROR_MEDIUM_NOT_ACCESSIBLE
//
// MessageText:
//
//  The transport cannot access the medium.
//

  ERROR_MEDIUM_NOT_ACCESSIBLE = 4323;
  {$EXTERNALSYM ERROR_MEDIUM_NOT_ACCESSIBLE}

//
// MessageId: ERROR_UNABLE_TO_LOAD_MEDIUM
//
// MessageText:
//
//  Unable to load the medium into the drive.
//

  ERROR_UNABLE_TO_LOAD_MEDIUM = 4324;
  {$EXTERNALSYM ERROR_UNABLE_TO_LOAD_MEDIUM}

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_DRIVE
//
// MessageText:
//
//  Unable to retrieve the drive status.
//

  ERROR_UNABLE_TO_INVENTORY_DRIVE = 4325;
  {$EXTERNALSYM ERROR_UNABLE_TO_INVENTORY_DRIVE}

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_SLOT
//
// MessageText:
//
//  Unable to retrieve the slot status.
//

  ERROR_UNABLE_TO_INVENTORY_SLOT = 4326;
  {$EXTERNALSYM ERROR_UNABLE_TO_INVENTORY_SLOT}

//
// MessageId: ERROR_UNABLE_TO_INVENTORY_TRANSPORT
//
// MessageText:
//
//  Unable to retrieve status about the transport.
//

  ERROR_UNABLE_TO_INVENTORY_TRANSPORT = 4327;
  {$EXTERNALSYM ERROR_UNABLE_TO_INVENTORY_TRANSPORT}

//
// MessageId: ERROR_TRANSPORT_FULL
//
// MessageText:
//
//  Cannot use the transport because it is already in use.
//

  ERROR_TRANSPORT_FULL = 4328;
  {$EXTERNALSYM ERROR_TRANSPORT_FULL}

//
// MessageId: ERROR_CONTROLLING_IEPORT
//
// MessageText:
//
//  Unable to open or close the inject/eject port.
//

  ERROR_CONTROLLING_IEPORT = 4329;
  {$EXTERNALSYM ERROR_CONTROLLING_IEPORT}

//
// MessageId: ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA
//
// MessageText:
//
//  Unable to eject the medium because it is in a drive.
//

  ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA = 4330;
  {$EXTERNALSYM ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA}

//
// MessageId: ERROR_CLEANER_SLOT_SET
//
// MessageText:
//
//  A cleaner slot is already reserved.
//

  ERROR_CLEANER_SLOT_SET = 4331;
  {$EXTERNALSYM ERROR_CLEANER_SLOT_SET}

//
// MessageId: ERROR_CLEANER_SLOT_NOT_SET
//
// MessageText:
//
//  A cleaner slot is not reserved.
//

  ERROR_CLEANER_SLOT_NOT_SET = 4332;
  {$EXTERNALSYM ERROR_CLEANER_SLOT_NOT_SET}

//
// MessageId: ERROR_CLEANER_CARTRIDGE_SPENT
//
// MessageText:
//
//  The cleaner cartridge has performed the maximum number of drive cleanings.
//

  ERROR_CLEANER_CARTRIDGE_SPENT = 4333;
  {$EXTERNALSYM ERROR_CLEANER_CARTRIDGE_SPENT}

//
// MessageId: ERROR_UNEXPECTED_OMID
//
// MessageText:
//
//  Unexpected on-medium identifier.
//

  ERROR_UNEXPECTED_OMID = 4334;
  {$EXTERNALSYM ERROR_UNEXPECTED_OMID}

//
// MessageId: ERROR_CANT_DELETE_LAST_ITEM
//
// MessageText:
//
//  The last remaining item in this group or resource cannot be deleted.
//

  ERROR_CANT_DELETE_LAST_ITEM = 4335;
  {$EXTERNALSYM ERROR_CANT_DELETE_LAST_ITEM}

//
// MessageId: ERROR_MESSAGE_EXCEEDS_MAX_SIZE
//
// MessageText:
//
//  The message provided exceeds the maximum size allowed for this parameter.
//

  ERROR_MESSAGE_EXCEEDS_MAX_SIZE = 4336;
  {$EXTERNALSYM ERROR_MESSAGE_EXCEEDS_MAX_SIZE}

//
// MessageId: ERROR_VOLUME_CONTAINS_SYS_FILES
//
// MessageText:
//
//  The volume contains system or paging files.
//

  ERROR_VOLUME_CONTAINS_SYS_FILES = 4337;
  {$EXTERNALSYM ERROR_VOLUME_CONTAINS_SYS_FILES}

//
// MessageId: ERROR_INDIGENOUS_TYPE
//
// MessageText:
//
//  The media type cannot be removed from this library since at least one drive in the library reports it can support this media type.
//

  ERROR_INDIGENOUS_TYPE = 4338;
  {$EXTERNALSYM ERROR_INDIGENOUS_TYPE}

//
// MessageId: ERROR_NO_SUPPORTING_DRIVES
//
// MessageText:
//
//  This offline media cannot be mounted on this system since no enabled drives are present which can be used.
//

  ERROR_NO_SUPPORTING_DRIVES = 4339;
  {$EXTERNALSYM ERROR_NO_SUPPORTING_DRIVES}

////////////////////////////////////////////
//                                        //
// NT Remote Storage Service Error Codes  //
//                                        //
////////////////////////////////////////////
//
// MessageId: ERROR_FILE_OFFLINE
//
// MessageText:
//
//  The remote storage service was not able to recall the file.
//

  ERROR_FILE_OFFLINE = 4350;
  {$EXTERNALSYM ERROR_FILE_OFFLINE}

//
// MessageId: ERROR_REMOTE_STORAGE_NOT_ACTIVE
//
// MessageText:
//
//  The remote storage service is not operational at this time.
//

  ERROR_REMOTE_STORAGE_NOT_ACTIVE = 4351;
  {$EXTERNALSYM ERROR_REMOTE_STORAGE_NOT_ACTIVE}

//
// MessageId: ERROR_REMOTE_STORAGE_MEDIA_ERROR
//
// MessageText:
//
//  The remote storage service encountered a media error.
//

  ERROR_REMOTE_STORAGE_MEDIA_ERROR = 4352;
  {$EXTERNALSYM ERROR_REMOTE_STORAGE_MEDIA_ERROR}

////////////////////////////////////////////
//                                        //
// NT Reparse Points Error Codes          //
//                                        //
////////////////////////////////////////////
//
// MessageId: ERROR_NOT_A_REPARSE_POINT
//
// MessageText:
//
//  The file or directory is not a reparse point.
//

  ERROR_NOT_A_REPARSE_POINT = 4390;
  {$EXTERNALSYM ERROR_NOT_A_REPARSE_POINT}

//
// MessageId: ERROR_REPARSE_ATTRIBUTE_CONFLICT
//
// MessageText:
//
//  The reparse point attribute cannot be set because it conflicts with an existing attribute.
//

  ERROR_REPARSE_ATTRIBUTE_CONFLICT = 4391;
  {$EXTERNALSYM ERROR_REPARSE_ATTRIBUTE_CONFLICT}

//
// MessageId: ERROR_INVALID_REPARSE_DATA
//
// MessageText:
//
//  The data present in the reparse point buffer is invalid.
//

  ERROR_INVALID_REPARSE_DATA = 4392;
  {$EXTERNALSYM ERROR_INVALID_REPARSE_DATA}

//
// MessageId: ERROR_REPARSE_TAG_INVALID
//
// MessageText:
//
//  The tag present in the reparse point buffer is invalid.
//

  ERROR_REPARSE_TAG_INVALID = 4393;
  {$EXTERNALSYM ERROR_REPARSE_TAG_INVALID}

//
// MessageId: ERROR_REPARSE_TAG_MISMATCH
//
// MessageText:
//
//  There is a mismatch between the tag specified in the request and the tag present in the reparse point.
//  
//

  ERROR_REPARSE_TAG_MISMATCH = 4394;
  {$EXTERNALSYM ERROR_REPARSE_TAG_MISMATCH}

////////////////////////////////////////////
//                                        //
// NT Single Instance Store Error Codes   //
//                                        //
////////////////////////////////////////////
//
// MessageId: ERROR_VOLUME_NOT_SIS_ENABLED
//
// MessageText:
//
//  Single Instance Storage is not available on this volume.
//

  ERROR_VOLUME_NOT_SIS_ENABLED = 4500;
  {$EXTERNALSYM ERROR_VOLUME_NOT_SIS_ENABLED}

////////////////////////////////////
//                                //
//     Cluster Error Codes        //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_DEPENDENT_RESOURCE_EXISTS
//
// MessageText:
//
//  The cluster resource cannot be moved to another group because other resources are dependent on it.
//

  ERROR_DEPENDENT_RESOURCE_EXISTS = 5001;
  {$EXTERNALSYM ERROR_DEPENDENT_RESOURCE_EXISTS}

//
// MessageId: ERROR_DEPENDENCY_NOT_FOUND
//
// MessageText:
//
//  The cluster resource dependency cannot be found.
//

  ERROR_DEPENDENCY_NOT_FOUND = 5002;
  {$EXTERNALSYM ERROR_DEPENDENCY_NOT_FOUND}

//
// MessageId: ERROR_DEPENDENCY_ALREADY_EXISTS
//
// MessageText:
//
//  The cluster resource cannot be made dependent on the specified resource because it is already dependent.
//

  ERROR_DEPENDENCY_ALREADY_EXISTS = 5003;
  {$EXTERNALSYM ERROR_DEPENDENCY_ALREADY_EXISTS}

//
// MessageId: ERROR_RESOURCE_NOT_ONLINE
//
// MessageText:
//
//  The cluster resource is not online.
//

  ERROR_RESOURCE_NOT_ONLINE = 5004;
  {$EXTERNALSYM ERROR_RESOURCE_NOT_ONLINE}

//
// MessageId: ERROR_HOST_NODE_NOT_AVAILABLE
//
// MessageText:
//
//  A cluster node is not available for this operation.
//

  ERROR_HOST_NODE_NOT_AVAILABLE = 5005;
  {$EXTERNALSYM ERROR_HOST_NODE_NOT_AVAILABLE}

//
// MessageId: ERROR_RESOURCE_NOT_AVAILABLE
//
// MessageText:
//
//  The cluster resource is not available.
//

  ERROR_RESOURCE_NOT_AVAILABLE = 5006;
  {$EXTERNALSYM ERROR_RESOURCE_NOT_AVAILABLE}

//
// MessageId: ERROR_RESOURCE_NOT_FOUND
//
// MessageText:
//
//  The cluster resource could not be found.
//

  ERROR_RESOURCE_NOT_FOUND = 5007;
  {$EXTERNALSYM ERROR_RESOURCE_NOT_FOUND}

//
// MessageId: ERROR_SHUTDOWN_CLUSTER
//
// MessageText:
//
//  The cluster is being shut down.
//

  ERROR_SHUTDOWN_CLUSTER = 5008;
  {$EXTERNALSYM ERROR_SHUTDOWN_CLUSTER}

//
// MessageId: ERROR_CANT_EVICT_ACTIVE_NODE
//
// MessageText:
//
//  A cluster node cannot be evicted from the cluster while it is online.
//

  ERROR_CANT_EVICT_ACTIVE_NODE = 5009;
  {$EXTERNALSYM ERROR_CANT_EVICT_ACTIVE_NODE}

//
// MessageId: ERROR_OBJECT_ALREADY_EXISTS
//
// MessageText:
//
//  The object already exists.
//

  ERROR_OBJECT_ALREADY_EXISTS = 5010;
  {$EXTERNALSYM ERROR_OBJECT_ALREADY_EXISTS}

//
// MessageId: ERROR_OBJECT_IN_LIST
//
// MessageText:
//
//  The object is already in the list.
//

  ERROR_OBJECT_IN_LIST = 5011;
  {$EXTERNALSYM ERROR_OBJECT_IN_LIST}

//
// MessageId: ERROR_GROUP_NOT_AVAILABLE
//
// MessageText:
//
//  The cluster group is not available for any new requests.
//

  ERROR_GROUP_NOT_AVAILABLE = 5012;
  {$EXTERNALSYM ERROR_GROUP_NOT_AVAILABLE}

//
// MessageId: ERROR_GROUP_NOT_FOUND
//
// MessageText:
//
//  The cluster group could not be found.
//

  ERROR_GROUP_NOT_FOUND = 5013;
  {$EXTERNALSYM ERROR_GROUP_NOT_FOUND}

//
// MessageId: ERROR_GROUP_NOT_ONLINE
//
// MessageText:
//
//  The operation could not be completed because the cluster group is not online.
//

  ERROR_GROUP_NOT_ONLINE = 5014;
  {$EXTERNALSYM ERROR_GROUP_NOT_ONLINE}

//
// MessageId: ERROR_HOST_NODE_NOT_RESOURCE_OWNER
//
// MessageText:
//
//  The cluster node is not the owner of the resource.
//

  ERROR_HOST_NODE_NOT_RESOURCE_OWNER = 5015;
  {$EXTERNALSYM ERROR_HOST_NODE_NOT_RESOURCE_OWNER}

//
// MessageId: ERROR_HOST_NODE_NOT_GROUP_OWNER
//
// MessageText:
//
//  The cluster node is not the owner of the group.
//

  ERROR_HOST_NODE_NOT_GROUP_OWNER = 5016;
  {$EXTERNALSYM ERROR_HOST_NODE_NOT_GROUP_OWNER}

//
// MessageId: ERROR_RESMON_CREATE_FAILED
//
// MessageText:
//
//  The cluster resource could not be created in the specified resource monitor.
//

  ERROR_RESMON_CREATE_FAILED = 5017;
  {$EXTERNALSYM ERROR_RESMON_CREATE_FAILED}

//
// MessageId: ERROR_RESMON_ONLINE_FAILED
//
// MessageText:
//
//  The cluster resource could not be brought online by the resource monitor.
//

  ERROR_RESMON_ONLINE_FAILED = 5018;
  {$EXTERNALSYM ERROR_RESMON_ONLINE_FAILED}

//
// MessageId: ERROR_RESOURCE_ONLINE
//
// MessageText:
//
//  The operation could not be completed because the cluster resource is online.
//

  ERROR_RESOURCE_ONLINE = 5019;
  {$EXTERNALSYM ERROR_RESOURCE_ONLINE}

//
// MessageId: ERROR_QUORUM_RESOURCE
//
// MessageText:
//
//  The cluster resource could not be deleted or brought offline because it is the quorum resource.
//

  ERROR_QUORUM_RESOURCE = 5020;
  {$EXTERNALSYM ERROR_QUORUM_RESOURCE}

//
// MessageId: ERROR_NOT_QUORUM_CAPABLE
//
// MessageText:
//
//  The cluster could not make the specified resource a quorum resource because it is not capable of being a quorum resource.
//

  ERROR_NOT_QUORUM_CAPABLE = 5021;
  {$EXTERNALSYM ERROR_NOT_QUORUM_CAPABLE}

//
// MessageId: ERROR_CLUSTER_SHUTTING_DOWN
//
// MessageText:
//
//  The cluster software is shutting down.
//

  ERROR_CLUSTER_SHUTTING_DOWN = 5022;
  {$EXTERNALSYM ERROR_CLUSTER_SHUTTING_DOWN}

//
// MessageId: ERROR_INVALID_STATE
//
// MessageText:
//
//  The group or resource is not in the correct state to perform the requested operation.
//

  ERROR_INVALID_STATE = 5023;
  {$EXTERNALSYM ERROR_INVALID_STATE}

//
// MessageId: ERROR_RESOURCE_PROPERTIES_STORED
//
// MessageText:
//
//  The properties were stored but not all changes will take effect until the next time the resource is brought online.
//

  ERROR_RESOURCE_PROPERTIES_STORED = 5024;
  {$EXTERNALSYM ERROR_RESOURCE_PROPERTIES_STORED}

//
// MessageId: ERROR_NOT_QUORUM_CLASS
//
// MessageText:
//
//  The cluster could not make the specified resource a quorum resource because it does not belong to a shared storage class.
//

  ERROR_NOT_QUORUM_CLASS = 5025;
  {$EXTERNALSYM ERROR_NOT_QUORUM_CLASS}

//
// MessageId: ERROR_CORE_RESOURCE
//
// MessageText:
//
//  The cluster resource could not be deleted since it is a core resource.
//

  ERROR_CORE_RESOURCE = 5026;
  {$EXTERNALSYM ERROR_CORE_RESOURCE}

//
// MessageId: ERROR_QUORUM_RESOURCE_ONLINE_FAILED
//
// MessageText:
//
//  The quorum resource failed to come online.
//

  ERROR_QUORUM_RESOURCE_ONLINE_FAILED = 5027;
  {$EXTERNALSYM ERROR_QUORUM_RESOURCE_ONLINE_FAILED}

//
// MessageId: ERROR_QUORUMLOG_OPEN_FAILED
//
// MessageText:
//
//  The quorum log could not be created or mounted successfully.
//

  ERROR_QUORUMLOG_OPEN_FAILED = 5028;
  {$EXTERNALSYM ERROR_QUORUMLOG_OPEN_FAILED}

//
// MessageId: ERROR_CLUSTERLOG_CORRUPT
//
// MessageText:
//
//  The cluster log is corrupt.
//

  ERROR_CLUSTERLOG_CORRUPT = 5029;
  {$EXTERNALSYM ERROR_CLUSTERLOG_CORRUPT}

//
// MessageId: ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE
//
// MessageText:
//
//  The record could not be written to the cluster log since it exceeds the maximum size.
//

  ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE = 5030;
  {$EXTERNALSYM ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE}

//
// MessageId: ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE
//
// MessageText:
//
//  The cluster log exceeds its maximum size.
//

  ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE = 5031;
  {$EXTERNALSYM ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE}

//
// MessageId: ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND
//
// MessageText:
//
//  No checkpoint record was found in the cluster log.
//

  ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND = 5032;
  {$EXTERNALSYM ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND}

//
// MessageId: ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE
//
// MessageText:
//
//  The minimum required disk space needed for logging is not available.
//

  ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE = 5033;
  {$EXTERNALSYM ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE}

//
// MessageId: ERROR_QUORUM_OWNER_ALIVE
//
// MessageText:
//
//  The cluster node failed to take control of the quorum resource because the resource is owned by another active node.
//

  ERROR_QUORUM_OWNER_ALIVE = 5034;
  {$EXTERNALSYM ERROR_QUORUM_OWNER_ALIVE}

//
// MessageId: ERROR_NETWORK_NOT_AVAILABLE
//
// MessageText:
//
//  A cluster network is not available for this operation.
//

  ERROR_NETWORK_NOT_AVAILABLE = 5035;
  {$EXTERNALSYM ERROR_NETWORK_NOT_AVAILABLE}

//
// MessageId: ERROR_NODE_NOT_AVAILABLE
//
// MessageText:
//
//  A cluster node is not available for this operation.
//

  ERROR_NODE_NOT_AVAILABLE = 5036;
  {$EXTERNALSYM ERROR_NODE_NOT_AVAILABLE}

//
// MessageId: ERROR_ALL_NODES_NOT_AVAILABLE
//
// MessageText:
//
//  All cluster nodes must be running to perform this operation.
//

  ERROR_ALL_NODES_NOT_AVAILABLE = 5037;
  {$EXTERNALSYM ERROR_ALL_NODES_NOT_AVAILABLE}

//
// MessageId: ERROR_RESOURCE_FAILED
//
// MessageText:
//
//  A cluster resource failed.
//

  ERROR_RESOURCE_FAILED = 5038;
  {$EXTERNALSYM ERROR_RESOURCE_FAILED}

//
// MessageId: ERROR_CLUSTER_INVALID_NODE
//
// MessageText:
//
//  The cluster node is not valid.
//

  ERROR_CLUSTER_INVALID_NODE = 5039;
  {$EXTERNALSYM ERROR_CLUSTER_INVALID_NODE}

//
// MessageId: ERROR_CLUSTER_NODE_EXISTS
//
// MessageText:
//
//  The cluster node already exists.
//

  ERROR_CLUSTER_NODE_EXISTS = 5040;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_EXISTS}

//
// MessageId: ERROR_CLUSTER_JOIN_IN_PROGRESS
//
// MessageText:
//
//  A node is in the process of joining the cluster.
//

  ERROR_CLUSTER_JOIN_IN_PROGRESS = 5041;
  {$EXTERNALSYM ERROR_CLUSTER_JOIN_IN_PROGRESS}

//
// MessageId: ERROR_CLUSTER_NODE_NOT_FOUND
//
// MessageText:
//
//  The cluster node was not found.
//

  ERROR_CLUSTER_NODE_NOT_FOUND = 5042;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND
//
// MessageText:
//
//  The cluster local node information was not found.
//

  ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND = 5043;
  {$EXTERNALSYM ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_NETWORK_EXISTS
//
// MessageText:
//
//  The cluster network already exists.
//

  ERROR_CLUSTER_NETWORK_EXISTS = 5044;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_EXISTS}

//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND
//
// MessageText:
//
//  The cluster network was not found.
//

  ERROR_CLUSTER_NETWORK_NOT_FOUND = 5045;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_NETINTERFACE_EXISTS
//
// MessageText:
//
//  The cluster network interface already exists.
//

  ERROR_CLUSTER_NETINTERFACE_EXISTS = 5046;
  {$EXTERNALSYM ERROR_CLUSTER_NETINTERFACE_EXISTS}

//
// MessageId: ERROR_CLUSTER_NETINTERFACE_NOT_FOUND
//
// MessageText:
//
//  The cluster network interface was not found.
//

  ERROR_CLUSTER_NETINTERFACE_NOT_FOUND = 5047;
  {$EXTERNALSYM ERROR_CLUSTER_NETINTERFACE_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_INVALID_REQUEST
//
// MessageText:
//
//  The cluster request is not valid for this object.
//

  ERROR_CLUSTER_INVALID_REQUEST = 5048;
  {$EXTERNALSYM ERROR_CLUSTER_INVALID_REQUEST}

//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK_PROVIDER
//
// MessageText:
//
//  The cluster network provider is not valid.
//

  ERROR_CLUSTER_INVALID_NETWORK_PROVIDER = 5049;
  {$EXTERNALSYM ERROR_CLUSTER_INVALID_NETWORK_PROVIDER}

//
// MessageId: ERROR_CLUSTER_NODE_DOWN
//
// MessageText:
//
//  The cluster node is down.
//

  ERROR_CLUSTER_NODE_DOWN = 5050;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_DOWN}

//
// MessageId: ERROR_CLUSTER_NODE_UNREACHABLE
//
// MessageText:
//
//  The cluster node is not reachable.
//

  ERROR_CLUSTER_NODE_UNREACHABLE = 5051;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_UNREACHABLE}

//
// MessageId: ERROR_CLUSTER_NODE_NOT_MEMBER
//
// MessageText:
//
//  The cluster node is not a member of the cluster.
//

  ERROR_CLUSTER_NODE_NOT_MEMBER = 5052;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_NOT_MEMBER}

//
// MessageId: ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS
//
// MessageText:
//
//  A cluster join operation is not in progress.
//

  ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS = 5053;
  {$EXTERNALSYM ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS}

//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK
//
// MessageText:
//
//  The cluster network is not valid.
//

  ERROR_CLUSTER_INVALID_NETWORK = 5054;
  {$EXTERNALSYM ERROR_CLUSTER_INVALID_NETWORK}

//
// MessageId: ERROR_CLUSTER_NODE_UP
//
// MessageText:
//
//  The cluster node is up.
//

  ERROR_CLUSTER_NODE_UP = 5056;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_UP}

//
// MessageId: ERROR_CLUSTER_IPADDR_IN_USE
//
// MessageText:
//
//  The cluster IP address is already in use.
//

  ERROR_CLUSTER_IPADDR_IN_USE = 5057;
  {$EXTERNALSYM ERROR_CLUSTER_IPADDR_IN_USE}

//
// MessageId: ERROR_CLUSTER_NODE_NOT_PAUSED
//
// MessageText:
//
//  The cluster node is not paused.
//

  ERROR_CLUSTER_NODE_NOT_PAUSED = 5058;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_NOT_PAUSED}

//
// MessageId: ERROR_CLUSTER_NO_SECURITY_CONTEXT
//
// MessageText:
//
//  No cluster security context is available.
//

  ERROR_CLUSTER_NO_SECURITY_CONTEXT = 5059;
  {$EXTERNALSYM ERROR_CLUSTER_NO_SECURITY_CONTEXT}

//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_INTERNAL
//
// MessageText:
//
//  The cluster network is not configured for internal cluster communication.
//

  ERROR_CLUSTER_NETWORK_NOT_INTERNAL = 5060;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_NOT_INTERNAL}

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_UP
//
// MessageText:
//
//  The cluster node is already up.
//

  ERROR_CLUSTER_NODE_ALREADY_UP = 5061;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_ALREADY_UP}

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_DOWN
//
// MessageText:
//
//  The cluster node is already down.
//

  ERROR_CLUSTER_NODE_ALREADY_DOWN = 5062;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_ALREADY_DOWN}

//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_ONLINE
//
// MessageText:
//
//  The cluster network is already online.
//

  ERROR_CLUSTER_NETWORK_ALREADY_ONLINE = 5063;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_ALREADY_ONLINE}

//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE
//
// MessageText:
//
//  The cluster network is already offline.
//

  ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE = 5064;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE}

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_MEMBER
//
// MessageText:
//
//  The cluster node is already a member of the cluster.
//

  ERROR_CLUSTER_NODE_ALREADY_MEMBER = 5065;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_ALREADY_MEMBER}

//
// MessageId: ERROR_CLUSTER_LAST_INTERNAL_NETWORK
//
// MessageText:
//
//  The cluster network is the only one configured for internal cluster communication between two or more active cluster nodes. The internal communication capability cannot be removed from the network.
//

  ERROR_CLUSTER_LAST_INTERNAL_NETWORK = 5066;
  {$EXTERNALSYM ERROR_CLUSTER_LAST_INTERNAL_NETWORK}

//
// MessageId: ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS
//
// MessageText:
//
//  One or more cluster resources depend on the network to provide service to clients. The client access capability cannot be removed from the network.
//

  ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS = 5067;
  {$EXTERNALSYM ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS}

//
// MessageId: ERROR_INVALID_OPERATION_ON_QUORUM
//
// MessageText:
//
//  This operation cannot be performed on the cluster resource as it the quorum resource. You may not bring the quorum resource offline or modify its possible owners list.
//

  ERROR_INVALID_OPERATION_ON_QUORUM = 5068;
  {$EXTERNALSYM ERROR_INVALID_OPERATION_ON_QUORUM}

//
// MessageId: ERROR_DEPENDENCY_NOT_ALLOWED
//
// MessageText:
//
//  The cluster quorum resource is not allowed to have any dependencies.
//

  ERROR_DEPENDENCY_NOT_ALLOWED = 5069;
  {$EXTERNALSYM ERROR_DEPENDENCY_NOT_ALLOWED}

//
// MessageId: ERROR_CLUSTER_NODE_PAUSED
//
// MessageText:
//
//  The cluster node is paused.
//

  ERROR_CLUSTER_NODE_PAUSED = 5070;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_PAUSED}

//
// MessageId: ERROR_NODE_CANT_HOST_RESOURCE
//
// MessageText:
//
//  The cluster resource cannot be brought online. The owner node cannot run this resource.
//

  ERROR_NODE_CANT_HOST_RESOURCE = 5071;
  {$EXTERNALSYM ERROR_NODE_CANT_HOST_RESOURCE}

//
// MessageId: ERROR_CLUSTER_NODE_NOT_READY
//
// MessageText:
//
//  The cluster node is not ready to perform the requested operation.
//

  ERROR_CLUSTER_NODE_NOT_READY = 5072;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_NOT_READY}

//
// MessageId: ERROR_CLUSTER_NODE_SHUTTING_DOWN
//
// MessageText:
//
//  The cluster node is shutting down.
//

  ERROR_CLUSTER_NODE_SHUTTING_DOWN = 5073;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_SHUTTING_DOWN}

//
// MessageId: ERROR_CLUSTER_JOIN_ABORTED
//
// MessageText:
//
//  The cluster join operation was aborted.
//

  ERROR_CLUSTER_JOIN_ABORTED = 5074;
  {$EXTERNALSYM ERROR_CLUSTER_JOIN_ABORTED}

//
// MessageId: ERROR_CLUSTER_INCOMPATIBLE_VERSIONS
//
// MessageText:
//
//  The cluster join operation failed due to incompatible software versions between the joining node and its sponsor.
//

  ERROR_CLUSTER_INCOMPATIBLE_VERSIONS = 5075;
  {$EXTERNALSYM ERROR_CLUSTER_INCOMPATIBLE_VERSIONS}

//
// MessageId: ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED
//
// MessageText:
//
//  This resource cannot be created because the cluster has reached the limit on the number of resources it can monitor.
//

  ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED = 5076;
  {$EXTERNALSYM ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED}

//
// MessageId: ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED
//
// MessageText:
//
//  The system configuration changed during the cluster join or form operation. The join or form operation was aborted.
//

  ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED = 5077;
  {$EXTERNALSYM ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED}

//
// MessageId: ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
//  The specified resource type was not found.
//

  ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND = 5078;
  {$EXTERNALSYM ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED
//
// MessageText:
//
//  The specified node does not support a resource of this type.  This may be due to version inconsistencies or due to the absence of the resource DLL on this node.
//

  ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED = 5079;
  {$EXTERNALSYM ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED}

//
// MessageId: ERROR_CLUSTER_RESNAME_NOT_FOUND
//
// MessageText:
//
//  The specified resource name is not supported by this resource DLL. This may be due to a bad (or changed) name supplied to the resource DLL.
//

  ERROR_CLUSTER_RESNAME_NOT_FOUND = 5080;
  {$EXTERNALSYM ERROR_CLUSTER_RESNAME_NOT_FOUND}

//
// MessageId: ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED
//
// MessageText:
//
//  No authentication package could be registered with the RPC server.
//

  ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED = 5081;
  {$EXTERNALSYM ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED}

//
// MessageId: ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST
//
// MessageText:
//
//  You cannot bring the group online because the owner of the group is not in the preferred list for the group. To change the owner node for the group, move the group.
//

  ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST = 5082;
  {$EXTERNALSYM ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST}

//
// MessageId: ERROR_CLUSTER_DATABASE_SEQMISMATCH
//
// MessageText:
//
//  The join operation failed because the cluster database sequence number has changed or is incompatible with the locker node. This may happen during a join operation if the cluster database was changing during the join.
//

  ERROR_CLUSTER_DATABASE_SEQMISMATCH = 5083;
  {$EXTERNALSYM ERROR_CLUSTER_DATABASE_SEQMISMATCH}

//
// MessageId: ERROR_RESMON_INVALID_STATE
//
// MessageText:
//
//  The resource monitor will not allow the fail operation to be performed while the resource is in its current state. This may happen if the resource is in a pending state.
//

  ERROR_RESMON_INVALID_STATE = 5084;
  {$EXTERNALSYM ERROR_RESMON_INVALID_STATE}

//
// MessageId: ERROR_CLUSTER_GUM_NOT_LOCKER
//
// MessageText:
//
//  A non locker code got a request to reserve the lock for making global updates.
//

  ERROR_CLUSTER_GUM_NOT_LOCKER = 5085;
  {$EXTERNALSYM ERROR_CLUSTER_GUM_NOT_LOCKER}

//
// MessageId: ERROR_QUORUM_DISK_NOT_FOUND
//
// MessageText:
//
//  The quorum disk could not be located by the cluster service.
//

  ERROR_QUORUM_DISK_NOT_FOUND = 5086;
  {$EXTERNALSYM ERROR_QUORUM_DISK_NOT_FOUND}

//
// MessageId: ERROR_DATABASE_BACKUP_CORRUPT
//
// MessageText:
//
//  The backed up cluster database is possibly corrupt.
//

  ERROR_DATABASE_BACKUP_CORRUPT = 5087;
  {$EXTERNALSYM ERROR_DATABASE_BACKUP_CORRUPT}

//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT
//
// MessageText:
//
//  A DFS root already exists in this cluster node.
//

  ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT = 5088;
  {$EXTERNALSYM ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT}

//
// MessageId: ERROR_RESOURCE_PROPERTY_UNCHANGEABLE
//
// MessageText:
//
//  An attempt to modify a resource property failed because it conflicts with another existing property.
//

  ERROR_RESOURCE_PROPERTY_UNCHANGEABLE = 5089;
  {$EXTERNALSYM ERROR_RESOURCE_PROPERTY_UNCHANGEABLE}

////////////////////////////////////
//                                //
//     EFS Error Codes            //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_ENCRYPTION_FAILED
//
// MessageText:
//
//  The specified file could not be encrypted.
//

  ERROR_ENCRYPTION_FAILED = 6000;
  {$EXTERNALSYM ERROR_ENCRYPTION_FAILED}

//
// MessageId: ERROR_DECRYPTION_FAILED
//
// MessageText:
//
//  The specified file could not be decrypted.
//

  ERROR_DECRYPTION_FAILED = 6001;
  {$EXTERNALSYM ERROR_DECRYPTION_FAILED}

//
// MessageId: ERROR_FILE_ENCRYPTED
//
// MessageText:
//
//  The specified file is encrypted and the user does not have the ability to decrypt it.
//

  ERROR_FILE_ENCRYPTED = 6002;
  {$EXTERNALSYM ERROR_FILE_ENCRYPTED}

//
// MessageId: ERROR_NO_RECOVERY_POLICY
//
// MessageText:
//
//  There is no valid encryption recovery policy configured for this system.
//

  ERROR_NO_RECOVERY_POLICY = 6003;
  {$EXTERNALSYM ERROR_NO_RECOVERY_POLICY}

//
// MessageId: ERROR_NO_EFS
//
// MessageText:
//
//  The required encryption driver is not loaded for this system.
//

  ERROR_NO_EFS = 6004;
  {$EXTERNALSYM ERROR_NO_EFS}

//
// MessageId: ERROR_WRONG_EFS
//
// MessageText:
//
//  The file was encrypted with a different encryption driver than is currently loaded.
//

  ERROR_WRONG_EFS = 6005;
  {$EXTERNALSYM ERROR_WRONG_EFS}

//
// MessageId: ERROR_NO_USER_KEYS
//
// MessageText:
//
//  There are no EFS keys defined for the user.
//

  ERROR_NO_USER_KEYS = 6006;
  {$EXTERNALSYM ERROR_NO_USER_KEYS}

//
// MessageId: ERROR_FILE_NOT_ENCRYPTED
//
// MessageText:
//
//  The specified file is not encrypted.
//

  ERROR_FILE_NOT_ENCRYPTED = 6007;
  {$EXTERNALSYM ERROR_FILE_NOT_ENCRYPTED}

//
// MessageId: ERROR_NOT_EXPORT_FORMAT
//
// MessageText:
//
//  The specified file is not in the defined EFS export format.
//

  ERROR_NOT_EXPORT_FORMAT = 6008;
  {$EXTERNALSYM ERROR_NOT_EXPORT_FORMAT}

//
// MessageId: ERROR_FILE_READ_ONLY
//
// MessageText:
//
//  The specified file is read only.
//

  ERROR_FILE_READ_ONLY = 6009;
  {$EXTERNALSYM ERROR_FILE_READ_ONLY}

//
// MessageId: ERROR_DIR_EFS_DISALLOWED
//
// MessageText:
//
//  The directory has been disabled for encryption.
//

  ERROR_DIR_EFS_DISALLOWED = 6010;
  {$EXTERNALSYM ERROR_DIR_EFS_DISALLOWED}

//
// MessageId: ERROR_EFS_SERVER_NOT_TRUSTED
//
// MessageText:
//
//  The server is not trusted for remote encryption operation.
//

  ERROR_EFS_SERVER_NOT_TRUSTED = 6011;
  {$EXTERNALSYM ERROR_EFS_SERVER_NOT_TRUSTED}

//////////////////////////////////////////////////////////////////
//                                                              //
// Task Scheduler Error Codes that NET START must understand    //
//                                                              //
//////////////////////////////////////////////////////////////////
//
// MessageId: SCHED_E_SERVICE_NOT_LOCALSYSTEM
//
// MessageText:
//
//  The Task Scheduler service must be configured to run in the System account to function properly.  Individual tasks may be configured to run in other accounts.
//

  SCHED_E_SERVICE_NOT_LOCALSYSTEM = 6200;
  {$EXTERNALSYM SCHED_E_SERVICE_NOT_LOCALSYSTEM}

////////////////////////////////////
//                                //
// Terminal Server Error Codes    //
//                                //
////////////////////////////////////
//
// MessageId: ERROR_CTX_WINSTATION_NAME_INVALID
//
// MessageText:
//
//  The specified session name is invalid.
//

  ERROR_CTX_WINSTATION_NAME_INVALID = 7001;
  {$EXTERNALSYM ERROR_CTX_WINSTATION_NAME_INVALID}

//
// MessageId: ERROR_CTX_INVALID_PD
//
// MessageText:
//
//  The specified protocol driver is invalid.
//

  ERROR_CTX_INVALID_PD = 7002;
  {$EXTERNALSYM ERROR_CTX_INVALID_PD}

//
// MessageId: ERROR_CTX_PD_NOT_FOUND
//
// MessageText:
//
//  The specified protocol driver was not found in the system path.
//

  ERROR_CTX_PD_NOT_FOUND = 7003;
  {$EXTERNALSYM ERROR_CTX_PD_NOT_FOUND}

//
// MessageId: ERROR_CTX_WD_NOT_FOUND
//
// MessageText:
//
//  The specified terminal connection driver was not found in the system path.
//

  ERROR_CTX_WD_NOT_FOUND = 7004;
  {$EXTERNALSYM ERROR_CTX_WD_NOT_FOUND}

//
// MessageId: ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY
//
// MessageText:
//
//  A registry key for event logging could not be created for this session.
//

  ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY = 7005;
  {$EXTERNALSYM ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY}

//
// MessageId: ERROR_CTX_SERVICE_NAME_COLLISION
//
// MessageText:
//
//  A service with the same name already exists on the system.
//

  ERROR_CTX_SERVICE_NAME_COLLISION = 7006;
  {$EXTERNALSYM ERROR_CTX_SERVICE_NAME_COLLISION}

//
// MessageId: ERROR_CTX_CLOSE_PENDING
//
// MessageText:
//
//  A close operation is pending on the session.
//

  ERROR_CTX_CLOSE_PENDING = 7007;
  {$EXTERNALSYM ERROR_CTX_CLOSE_PENDING}

//
// MessageId: ERROR_CTX_NO_OUTBUF
//
// MessageText:
//
//  There are no free output buffers available.
//

  ERROR_CTX_NO_OUTBUF = 7008;
  {$EXTERNALSYM ERROR_CTX_NO_OUTBUF}

//
// MessageId: ERROR_CTX_MODEM_INF_NOT_FOUND
//
// MessageText:
//
//  The MODEM.INF file was not found.
//

  ERROR_CTX_MODEM_INF_NOT_FOUND = 7009;
  {$EXTERNALSYM ERROR_CTX_MODEM_INF_NOT_FOUND}

//
// MessageId: ERROR_CTX_INVALID_MODEMNAME
//
// MessageText:
//
//  The modem name was not found in MODEM.INF.
//

  ERROR_CTX_INVALID_MODEMNAME = 7010;
  {$EXTERNALSYM ERROR_CTX_INVALID_MODEMNAME}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_ERROR
//
// MessageText:
//
//  The modem did not accept the command sent to it. Verify that the configured modem name matches the attached modem.
//

  ERROR_CTX_MODEM_RESPONSE_ERROR = 7011;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_ERROR}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_TIMEOUT
//
// MessageText:
//
//  The modem did not respond to the command sent to it. Verify that the modem is properly cabled and powered on.
//

  ERROR_CTX_MODEM_RESPONSE_TIMEOUT = 7012;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_TIMEOUT}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_CARRIER
//
// MessageText:
//
//  Carrier detect has failed or carrier has been dropped due to disconnect.
//

  ERROR_CTX_MODEM_RESPONSE_NO_CARRIER = 7013;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_NO_CARRIER}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE
//
// MessageText:
//
//  Dial tone not detected within the required time. Verify that the phone cable is properly attached and functional.
//

  ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE = 7014;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_BUSY
//
// MessageText:
//
//  Busy signal detected at remote site on callback.
//

  ERROR_CTX_MODEM_RESPONSE_BUSY = 7015;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_BUSY}

//
// MessageId: ERROR_CTX_MODEM_RESPONSE_VOICE
//
// MessageText:
//
//  Voice detected at remote site on callback.
//

  ERROR_CTX_MODEM_RESPONSE_VOICE = 7016;
  {$EXTERNALSYM ERROR_CTX_MODEM_RESPONSE_VOICE}

//
// MessageId: ERROR_CTX_TD_ERROR
//
// MessageText:
//
//  Transport driver error
//

  ERROR_CTX_TD_ERROR = 7017;
  {$EXTERNALSYM ERROR_CTX_TD_ERROR}

//
// MessageId: ERROR_CTX_WINSTATION_NOT_FOUND
//
// MessageText:
//
//  The specified session cannot be found.
//

  ERROR_CTX_WINSTATION_NOT_FOUND = 7022;
  {$EXTERNALSYM ERROR_CTX_WINSTATION_NOT_FOUND}

//
// MessageId: ERROR_CTX_WINSTATION_ALREADY_EXISTS
//
// MessageText:
//
//  The specified session name is already in use.
//

  ERROR_CTX_WINSTATION_ALREADY_EXISTS = 7023;
  {$EXTERNALSYM ERROR_CTX_WINSTATION_ALREADY_EXISTS}

//
// MessageId: ERROR_CTX_WINSTATION_BUSY
//
// MessageText:
//
//  The requested operation cannot be completed because the terminal connection is currently busy processing a connect, disconnect, reset, or delete operation.
//

  ERROR_CTX_WINSTATION_BUSY = 7024;
  {$EXTERNALSYM ERROR_CTX_WINSTATION_BUSY}

//
// MessageId: ERROR_CTX_BAD_VIDEO_MODE
//
// MessageText:
//
//  An attempt has been made to connect to a session whose video mode is not supported by the current client.
//

  ERROR_CTX_BAD_VIDEO_MODE = 7025;
  {$EXTERNALSYM ERROR_CTX_BAD_VIDEO_MODE}

//
// MessageId: ERROR_CTX_GRAPHICS_INVALID
//
// MessageText:
//
//  The application attempted to enable DOS graphics mode.
//  DOS graphics mode is not supported.
//

  ERROR_CTX_GRAPHICS_INVALID = 7035;
  {$EXTERNALSYM ERROR_CTX_GRAPHICS_INVALID}

//
// MessageId: ERROR_CTX_LOGON_DISABLED
//
// MessageText:
//
//  Your interactive logon privilege has been disabled.
//  Please contact your administrator.
//

  ERROR_CTX_LOGON_DISABLED = 7037;
  {$EXTERNALSYM ERROR_CTX_LOGON_DISABLED}

//
// MessageId: ERROR_CTX_NOT_CONSOLE
//
// MessageText:
//
//  The requested operation can be performed only on the system console.
//  This is most often the result of a driver or system DLL requiring direct console access.
//

  ERROR_CTX_NOT_CONSOLE = 7038;
  {$EXTERNALSYM ERROR_CTX_NOT_CONSOLE}

//
// MessageId: ERROR_CTX_CLIENT_QUERY_TIMEOUT
//
// MessageText:
//
//  The client failed to respond to the server connect message.
//

  ERROR_CTX_CLIENT_QUERY_TIMEOUT = 7040;
  {$EXTERNALSYM ERROR_CTX_CLIENT_QUERY_TIMEOUT}

//
// MessageId: ERROR_CTX_CONSOLE_DISCONNECT
//
// MessageText:
//
//  Disconnecting the console session is not supported.
//

  ERROR_CTX_CONSOLE_DISCONNECT = 7041;
  {$EXTERNALSYM ERROR_CTX_CONSOLE_DISCONNECT}

//
// MessageId: ERROR_CTX_CONSOLE_CONNECT
//
// MessageText:
//
//  Reconnecting a disconnected session to the console is not supported.
//

  ERROR_CTX_CONSOLE_CONNECT = 7042;
  {$EXTERNALSYM ERROR_CTX_CONSOLE_CONNECT}

//
// MessageId: ERROR_CTX_SHADOW_DENIED
//
// MessageText:
//
//  The request to control another session remotely was denied.
//

  ERROR_CTX_SHADOW_DENIED = 7044;
  {$EXTERNALSYM ERROR_CTX_SHADOW_DENIED}

//
// MessageId: ERROR_CTX_WINSTATION_ACCESS_DENIED
//
// MessageText:
//
//  The requested session access is denied.
//

  ERROR_CTX_WINSTATION_ACCESS_DENIED = 7045;
  {$EXTERNALSYM ERROR_CTX_WINSTATION_ACCESS_DENIED}

//
// MessageId: ERROR_CTX_INVALID_WD
//
// MessageText:
//
//  The specified terminal connection driver is invalid.
//

  ERROR_CTX_INVALID_WD = 7049;
  {$EXTERNALSYM ERROR_CTX_INVALID_WD}

//
// MessageId: ERROR_CTX_SHADOW_INVALID
//
// MessageText:
//
//  The requested session cannot be controlled remotely.
//  This may be because the session is disconnected or does not currently have a user logged on. Also, you cannot control a session remotely from the system console or control the system console remotely. And you cannot remote control your own current session.
//

  ERROR_CTX_SHADOW_INVALID = 7050;
  {$EXTERNALSYM ERROR_CTX_SHADOW_INVALID}

//
// MessageId: ERROR_CTX_SHADOW_DISABLED
//
// MessageText:
//
//  The requested session is not configured to allow remote control.
//

  ERROR_CTX_SHADOW_DISABLED = 7051;
  {$EXTERNALSYM ERROR_CTX_SHADOW_DISABLED}

//
// MessageId: ERROR_CTX_CLIENT_LICENSE_IN_USE
//
// MessageText:
//
//  Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number is currently being used by another user.
//  Please call your system administrator to obtain a new copy of the Terminal Server client with a valid, unique license number.
//

  ERROR_CTX_CLIENT_LICENSE_IN_USE = 7052;
  {$EXTERNALSYM ERROR_CTX_CLIENT_LICENSE_IN_USE}

//
// MessageId: ERROR_CTX_CLIENT_LICENSE_NOT_SET
//
// MessageText:
//
//  Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number has not been entered for this copy of the Terminal Server client.
//  Please call your system administrator for help in entering a valid, unique license number for this Terminal Server client.
//

  ERROR_CTX_CLIENT_LICENSE_NOT_SET = 7053;
  {$EXTERNALSYM ERROR_CTX_CLIENT_LICENSE_NOT_SET}

//
// MessageId: ERROR_CTX_LICENSE_NOT_AVAILABLE
//
// MessageText:
//
//  The system has reached its licensed logon limit.
//  Please try again later.
//

  ERROR_CTX_LICENSE_NOT_AVAILABLE = 7054;
  {$EXTERNALSYM ERROR_CTX_LICENSE_NOT_AVAILABLE}

//
// MessageId: ERROR_CTX_LICENSE_CLIENT_INVALID
//
// MessageText:
//
//  The client you are using is not licensed to use this system.  Your logon request is denied.
//

  ERROR_CTX_LICENSE_CLIENT_INVALID = 7055;
  {$EXTERNALSYM ERROR_CTX_LICENSE_CLIENT_INVALID}

//
// MessageId: ERROR_CTX_LICENSE_EXPIRED
//
// MessageText:
//
//  The system license has expired.  Your logon request is denied.
//

  ERROR_CTX_LICENSE_EXPIRED = 7056;
  {$EXTERNALSYM ERROR_CTX_LICENSE_EXPIRED}

///////////////////////////////////////////////////
//                                                /
//             Traffic Control Error Codes        /
//                                                /
//                  7500 to  7999                 /
//                                                /
//         defined in: tcerror.h                  /
///////////////////////////////////////////////////
///////////////////////////////////////////////////
//                                                /
//             Active Directory Error Codes       /
//                                                /
//                  8000 to  8999                 /
///////////////////////////////////////////////////
// *****************
// FACILITY_FILE_REPLICATION_SERVICE
// *****************
//
// MessageId: FRS_ERR_INVALID_API_SEQUENCE
//
// MessageText:
//
//  The file replication service API was called incorrectly.
//

  FRS_ERR_INVALID_API_SEQUENCE = 8001;
  {$EXTERNALSYM FRS_ERR_INVALID_API_SEQUENCE}

//
// MessageId: FRS_ERR_STARTING_SERVICE
//
// MessageText:
//
//  The file replication service cannot be started.
//

  FRS_ERR_STARTING_SERVICE = 8002;
  {$EXTERNALSYM FRS_ERR_STARTING_SERVICE}

//
// MessageId: FRS_ERR_STOPPING_SERVICE
//
// MessageText:
//
//  The file replication service cannot be stopped.
//

  FRS_ERR_STOPPING_SERVICE = 8003;
  {$EXTERNALSYM FRS_ERR_STOPPING_SERVICE}

//
// MessageId: FRS_ERR_INTERNAL_API
//
// MessageText:
//
//  The file replication service API terminated the request.
//  The event log may have more information.
//

  FRS_ERR_INTERNAL_API = 8004;
  {$EXTERNALSYM FRS_ERR_INTERNAL_API}

//
// MessageId: FRS_ERR_INTERNAL
//
// MessageText:
//
//  The file replication service terminated the request.
//  The event log may have more information.
//

  FRS_ERR_INTERNAL = 8005;
  {$EXTERNALSYM FRS_ERR_INTERNAL}

//
// MessageId: FRS_ERR_SERVICE_COMM
//
// MessageText:
//
//  The file replication service cannot be contacted.
//  The event log may have more information.
//

  FRS_ERR_SERVICE_COMM = 8006;
  {$EXTERNALSYM FRS_ERR_SERVICE_COMM}

//
// MessageId: FRS_ERR_INSUFFICIENT_PRIV
//
// MessageText:
//
//  The file replication service cannot satisfy the request because the user has insufficient privileges.
//  The event log may have more information.
//

  FRS_ERR_INSUFFICIENT_PRIV = 8007;
  {$EXTERNALSYM FRS_ERR_INSUFFICIENT_PRIV}

//
// MessageId: FRS_ERR_AUTHENTICATION
//
// MessageText:
//
//  The file replication service cannot satisfy the request because authenticated RPC is not available.
//  The event log may have more information.
//

  FRS_ERR_AUTHENTICATION = 8008;
  {$EXTERNALSYM FRS_ERR_AUTHENTICATION}

//
// MessageId: FRS_ERR_PARENT_INSUFFICIENT_PRIV
//
// MessageText:
//
//  The file replication service cannot satisfy the request because the user has insufficient privileges on the domain controller.
//  The event log may have more information.
//

  FRS_ERR_PARENT_INSUFFICIENT_PRIV = 8009;
  {$EXTERNALSYM FRS_ERR_PARENT_INSUFFICIENT_PRIV}

//
// MessageId: FRS_ERR_PARENT_AUTHENTICATION
//
// MessageText:
//
//  The file replication service cannot satisfy the request because authenticated RPC is not available on the domain controller.
//  The event log may have more information.
//

  FRS_ERR_PARENT_AUTHENTICATION = 8010;
  {$EXTERNALSYM FRS_ERR_PARENT_AUTHENTICATION}

//
// MessageId: FRS_ERR_CHILD_TO_PARENT_COMM
//
// MessageText:
//
//  The file replication service cannot communicate with the file replication service on the domain controller.
//  The event log may have more information.
//

  FRS_ERR_CHILD_TO_PARENT_COMM = 8011;
  {$EXTERNALSYM FRS_ERR_CHILD_TO_PARENT_COMM}

//
// MessageId: FRS_ERR_PARENT_TO_CHILD_COMM
//
// MessageText:
//
//  The file replication service on the domain controller cannot communicate with the file replication service on this computer.
//  The event log may have more information.
//

  FRS_ERR_PARENT_TO_CHILD_COMM = 8012;
  {$EXTERNALSYM FRS_ERR_PARENT_TO_CHILD_COMM}

//
// MessageId: FRS_ERR_SYSVOL_POPULATE
//
// MessageText:
//
//  The file replication service cannot populate the system volume because of an internal error.
//  The event log may have more information.
//

  FRS_ERR_SYSVOL_POPULATE = 8013;
  {$EXTERNALSYM FRS_ERR_SYSVOL_POPULATE}

//
// MessageId: FRS_ERR_SYSVOL_POPULATE_TIMEOUT
//
// MessageText:
//
//  The file replication service cannot populate the system volume because of an internal timeout.
//  The event log may have more information.
//

  FRS_ERR_SYSVOL_POPULATE_TIMEOUT = 8014;
  {$EXTERNALSYM FRS_ERR_SYSVOL_POPULATE_TIMEOUT}

//
// MessageId: FRS_ERR_SYSVOL_IS_BUSY
//
// MessageText:
//
//  The file replication service cannot process the request. The system volume is busy with a previous request.
//

  FRS_ERR_SYSVOL_IS_BUSY = 8015;
  {$EXTERNALSYM FRS_ERR_SYSVOL_IS_BUSY}

//
// MessageId: FRS_ERR_SYSVOL_DEMOTE
//
// MessageText:
//
//  The file replication service cannot stop replicating the system volume because of an internal error.
//  The event log may have more information.
//

  FRS_ERR_SYSVOL_DEMOTE = 8016;
  {$EXTERNALSYM FRS_ERR_SYSVOL_DEMOTE}

//
// MessageId: FRS_ERR_INVALID_SERVICE_PARAMETER
//
// MessageText:
//
//  The file replication service detected an invalid parameter.
//

  FRS_ERR_INVALID_SERVICE_PARAMETER = 8017;
  {$EXTERNALSYM FRS_ERR_INVALID_SERVICE_PARAMETER}

// *****************
// FACILITY DIRECTORY SERVICE
// *****************

  DS_S_SUCCESS = NO_ERROR;
  {$EXTERNALSYM DS_S_SUCCESS}
//
// MessageId: ERROR_DS_NOT_INSTALLED
//
// MessageText:
//
//  An error occurred while installing the directory service. For more information, see the event log.
//

  ERROR_DS_NOT_INSTALLED = 8200;
  {$EXTERNALSYM ERROR_DS_NOT_INSTALLED}

//
// MessageId: ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY
//
// MessageText:
//
//  The directory service evaluated group memberships locally.
//

  ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY = 8201;
  {$EXTERNALSYM ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY}

//
// MessageId: ERROR_DS_NO_ATTRIBUTE_OR_VALUE
//
// MessageText:
//
//  The specified directory service attribute or value does not exist.
//

  ERROR_DS_NO_ATTRIBUTE_OR_VALUE = 8202;
  {$EXTERNALSYM ERROR_DS_NO_ATTRIBUTE_OR_VALUE}

//
// MessageId: ERROR_DS_INVALID_ATTRIBUTE_SYNTAX
//
// MessageText:
//
//  The attribute syntax specified to the directory service is invalid.
//

  ERROR_DS_INVALID_ATTRIBUTE_SYNTAX = 8203;
  {$EXTERNALSYM ERROR_DS_INVALID_ATTRIBUTE_SYNTAX}

//
// MessageId: ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED
//
// MessageText:
//
//  The attribute type specified to the directory service is not defined.
//

  ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED = 8204;
  {$EXTERNALSYM ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED}

//
// MessageId: ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS
//
// MessageText:
//
//  The specified directory service attribute or value already exists.
//

  ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS = 8205;
  {$EXTERNALSYM ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS}

//
// MessageId: ERROR_DS_BUSY
//
// MessageText:
//
//  The directory service is busy.
//

  ERROR_DS_BUSY = 8206;
  {$EXTERNALSYM ERROR_DS_BUSY}

//
// MessageId: ERROR_DS_UNAVAILABLE
//
// MessageText:
//
//  The directory service is unavailable.
//

  ERROR_DS_UNAVAILABLE = 8207;
  {$EXTERNALSYM ERROR_DS_UNAVAILABLE}

//
// MessageId: ERROR_DS_NO_RIDS_ALLOCATED
//
// MessageText:
//
//  The directory service was unable to allocate a relative identifier.
//

  ERROR_DS_NO_RIDS_ALLOCATED = 8208;
  {$EXTERNALSYM ERROR_DS_NO_RIDS_ALLOCATED}

//
// MessageId: ERROR_DS_NO_MORE_RIDS
//
// MessageText:
//
//  The directory service has exhausted the pool of relative identifiers.
//

  ERROR_DS_NO_MORE_RIDS = 8209;
  {$EXTERNALSYM ERROR_DS_NO_MORE_RIDS}

//
// MessageId: ERROR_DS_INCORRECT_ROLE_OWNER
//
// MessageText:
//
//  The requested operation could not be performed because the directory service is not the master for that type of operation.
//

  ERROR_DS_INCORRECT_ROLE_OWNER = 8210;
  {$EXTERNALSYM ERROR_DS_INCORRECT_ROLE_OWNER}

//
// MessageId: ERROR_DS_RIDMGR_INIT_ERROR
//
// MessageText:
//
//  The directory service was unable to initialize the subsystem that allocates relative identifiers.
//

  ERROR_DS_RIDMGR_INIT_ERROR = 8211;
  {$EXTERNALSYM ERROR_DS_RIDMGR_INIT_ERROR}

//
// MessageId: ERROR_DS_OBJ_CLASS_VIOLATION
//
// MessageText:
//
//  The requested operation did not satisfy one or more constraints associated with the class of the object.
//

  ERROR_DS_OBJ_CLASS_VIOLATION = 8212;
  {$EXTERNALSYM ERROR_DS_OBJ_CLASS_VIOLATION}

//
// MessageId: ERROR_DS_CANT_ON_NON_LEAF
//
// MessageText:
//
//  The directory service can perform the requested operation only on a leaf object.
//

  ERROR_DS_CANT_ON_NON_LEAF = 8213;
  {$EXTERNALSYM ERROR_DS_CANT_ON_NON_LEAF}

//
// MessageId: ERROR_DS_CANT_ON_RDN
//
// MessageText:
//
//  The directory service cannot perform the requested operation on the RDN attribute of an object.
//

  ERROR_DS_CANT_ON_RDN = 8214;
  {$EXTERNALSYM ERROR_DS_CANT_ON_RDN}

//
// MessageId: ERROR_DS_CANT_MOD_OBJ_CLASS
//
// MessageText:
//
//  The directory service detected an attempt to modify the object class of an object.
//

  ERROR_DS_CANT_MOD_OBJ_CLASS = 8215;
  {$EXTERNALSYM ERROR_DS_CANT_MOD_OBJ_CLASS}

//
// MessageId: ERROR_DS_CROSS_DOM_MOVE_ERROR
//
// MessageText:
//
//  The requested cross-domain move operation could not be performed.
//

  ERROR_DS_CROSS_DOM_MOVE_ERROR = 8216;
  {$EXTERNALSYM ERROR_DS_CROSS_DOM_MOVE_ERROR}

//
// MessageId: ERROR_DS_GC_NOT_AVAILABLE
//
// MessageText:
//
//  Unable to contact the global catalog server.
//

  ERROR_DS_GC_NOT_AVAILABLE = 8217;
  {$EXTERNALSYM ERROR_DS_GC_NOT_AVAILABLE}

//
// MessageId: ERROR_SHARED_POLICY
//
// MessageText:
//
//  The policy object is shared and can only be modified at the root.
//

  ERROR_SHARED_POLICY = 8218;
  {$EXTERNALSYM ERROR_SHARED_POLICY}

//
// MessageId: ERROR_POLICY_OBJECT_NOT_FOUND
//
// MessageText:
//
//  The policy object does not exist.
//

  ERROR_POLICY_OBJECT_NOT_FOUND = 8219;
  {$EXTERNALSYM ERROR_POLICY_OBJECT_NOT_FOUND}

//
// MessageId: ERROR_POLICY_ONLY_IN_DS
//
// MessageText:
//
//  The requested policy information is only in the directory service.
//

  ERROR_POLICY_ONLY_IN_DS = 8220;
  {$EXTERNALSYM ERROR_POLICY_ONLY_IN_DS}

//
// MessageId: ERROR_PROMOTION_ACTIVE
//
// MessageText:
//
//  A domain controller promotion is currently active.
//

  ERROR_PROMOTION_ACTIVE = 8221;
  {$EXTERNALSYM ERROR_PROMOTION_ACTIVE}

//
// MessageId: ERROR_NO_PROMOTION_ACTIVE
//
// MessageText:
//
//  A domain controller promotion is not currently active
//

  ERROR_NO_PROMOTION_ACTIVE = 8222;
  {$EXTERNALSYM ERROR_NO_PROMOTION_ACTIVE}

// 8223 unused
//
// MessageId: ERROR_DS_OPERATIONS_ERROR
//
// MessageText:
//
//  An operations error occurred.
//

  ERROR_DS_OPERATIONS_ERROR = 8224;
  {$EXTERNALSYM ERROR_DS_OPERATIONS_ERROR}

//
// MessageId: ERROR_DS_PROTOCOL_ERROR
//
// MessageText:
//
//  A protocol error occurred.
//

  ERROR_DS_PROTOCOL_ERROR = 8225;
  {$EXTERNALSYM ERROR_DS_PROTOCOL_ERROR}

//
// MessageId: ERROR_DS_TIMELIMIT_EXCEEDED
//
// MessageText:
//
//  The time limit for this request was exceeded.
//

  ERROR_DS_TIMELIMIT_EXCEEDED = 8226;
  {$EXTERNALSYM ERROR_DS_TIMELIMIT_EXCEEDED}

//
// MessageId: ERROR_DS_SIZELIMIT_EXCEEDED
//
// MessageText:
//
//  The size limit for this request was exceeded.
//

  ERROR_DS_SIZELIMIT_EXCEEDED = 8227;
  {$EXTERNALSYM ERROR_DS_SIZELIMIT_EXCEEDED}

//
// MessageId: ERROR_DS_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
//  The administrative limit for this request was exceeded.
//

  ERROR_DS_ADMIN_LIMIT_EXCEEDED = 8228;
  {$EXTERNALSYM ERROR_DS_ADMIN_LIMIT_EXCEEDED}

//
// MessageId: ERROR_DS_COMPARE_FALSE
//
// MessageText:
//
//  The compare response was false.
//

  ERROR_DS_COMPARE_FALSE = 8229;
  {$EXTERNALSYM ERROR_DS_COMPARE_FALSE}

//
// MessageId: ERROR_DS_COMPARE_TRUE
//
// MessageText:
//
//  The compare response was true.
//

  ERROR_DS_COMPARE_TRUE = 8230;
  {$EXTERNALSYM ERROR_DS_COMPARE_TRUE}

//
// MessageId: ERROR_DS_AUTH_METHOD_NOT_SUPPORTED
//
// MessageText:
//
//  The requested authentication method is not supported by the server.
//

  ERROR_DS_AUTH_METHOD_NOT_SUPPORTED = 8231;
  {$EXTERNALSYM ERROR_DS_AUTH_METHOD_NOT_SUPPORTED}

//
// MessageId: ERROR_DS_STRONG_AUTH_REQUIRED
//
// MessageText:
//
//  A more secure authentication method is required for this server.
//

  ERROR_DS_STRONG_AUTH_REQUIRED = 8232;
  {$EXTERNALSYM ERROR_DS_STRONG_AUTH_REQUIRED}

//
// MessageId: ERROR_DS_INAPPROPRIATE_AUTH
//
// MessageText:
//
//  Inappropriate authentication.
//

  ERROR_DS_INAPPROPRIATE_AUTH = 8233;
  {$EXTERNALSYM ERROR_DS_INAPPROPRIATE_AUTH}

//
// MessageId: ERROR_DS_AUTH_UNKNOWN
//
// MessageText:
//
//  The authentication mechanism is unknown.
//

  ERROR_DS_AUTH_UNKNOWN = 8234;
  {$EXTERNALSYM ERROR_DS_AUTH_UNKNOWN}

//
// MessageId: ERROR_DS_REFERRAL
//
// MessageText:
//
//  A referral was returned from the server.
//

  ERROR_DS_REFERRAL = 8235;
  {$EXTERNALSYM ERROR_DS_REFERRAL}

//
// MessageId: ERROR_DS_UNAVAILABLE_CRIT_EXTENSION
//
// MessageText:
//
//  The server does not support the requested critical extension.
//

  ERROR_DS_UNAVAILABLE_CRIT_EXTENSION = 8236;
  {$EXTERNALSYM ERROR_DS_UNAVAILABLE_CRIT_EXTENSION}

//
// MessageId: ERROR_DS_CONFIDENTIALITY_REQUIRED
//
// MessageText:
//
//  This request requires a secure connection.
//

  ERROR_DS_CONFIDENTIALITY_REQUIRED = 8237;
  {$EXTERNALSYM ERROR_DS_CONFIDENTIALITY_REQUIRED}

//
// MessageId: ERROR_DS_INAPPROPRIATE_MATCHING
//
// MessageText:
//
//  Inappropriate matching.
//

  ERROR_DS_INAPPROPRIATE_MATCHING = 8238;
  {$EXTERNALSYM ERROR_DS_INAPPROPRIATE_MATCHING}

//
// MessageId: ERROR_DS_CONSTRAINT_VIOLATION
//
// MessageText:
//
//  A constraint violation occurred.
//

  ERROR_DS_CONSTRAINT_VIOLATION = 8239;
  {$EXTERNALSYM ERROR_DS_CONSTRAINT_VIOLATION}

//
// MessageId: ERROR_DS_NO_SUCH_OBJECT
//
// MessageText:
//
//  There is no such object on the server.
//

  ERROR_DS_NO_SUCH_OBJECT = 8240;
  {$EXTERNALSYM ERROR_DS_NO_SUCH_OBJECT}

//
// MessageId: ERROR_DS_ALIAS_PROBLEM
//
// MessageText:
//
//  There is an alias problem.
//

  ERROR_DS_ALIAS_PROBLEM = 8241;
  {$EXTERNALSYM ERROR_DS_ALIAS_PROBLEM}

//
// MessageId: ERROR_DS_INVALID_DN_SYNTAX
//
// MessageText:
//
//  An invalid dn syntax has been specified.
//

  ERROR_DS_INVALID_DN_SYNTAX = 8242;
  {$EXTERNALSYM ERROR_DS_INVALID_DN_SYNTAX}

//
// MessageId: ERROR_DS_IS_LEAF
//
// MessageText:
//
//  The object is a leaf object.
//

  ERROR_DS_IS_LEAF = 8243;
  {$EXTERNALSYM ERROR_DS_IS_LEAF}

//
// MessageId: ERROR_DS_ALIAS_DEREF_PROBLEM
//
// MessageText:
//
//  There is an alias dereferencing problem.
//

  ERROR_DS_ALIAS_DEREF_PROBLEM = 8244;
  {$EXTERNALSYM ERROR_DS_ALIAS_DEREF_PROBLEM}

//
// MessageId: ERROR_DS_UNWILLING_TO_PERFORM
//
// MessageText:
//
//  The server is unwilling to process the request.
//

  ERROR_DS_UNWILLING_TO_PERFORM = 8245;
  {$EXTERNALSYM ERROR_DS_UNWILLING_TO_PERFORM}

//
// MessageId: ERROR_DS_LOOP_DETECT
//
// MessageText:
//
//  A loop has been detected.
//

  ERROR_DS_LOOP_DETECT = 8246;
  {$EXTERNALSYM ERROR_DS_LOOP_DETECT}

//
// MessageId: ERROR_DS_NAMING_VIOLATION
//
// MessageText:
//
//  There is a naming violation.
//

  ERROR_DS_NAMING_VIOLATION = 8247;
  {$EXTERNALSYM ERROR_DS_NAMING_VIOLATION}

//
// MessageId: ERROR_DS_OBJECT_RESULTS_TOO_LARGE
//
// MessageText:
//
//  The result set is too large.
//

  ERROR_DS_OBJECT_RESULTS_TOO_LARGE = 8248;
  {$EXTERNALSYM ERROR_DS_OBJECT_RESULTS_TOO_LARGE}

//
// MessageId: ERROR_DS_AFFECTS_MULTIPLE_DSAS
//
// MessageText:
//
//  The operation affects multiple DSAs
//

  ERROR_DS_AFFECTS_MULTIPLE_DSAS = 8249;
  {$EXTERNALSYM ERROR_DS_AFFECTS_MULTIPLE_DSAS}

//
// MessageId: ERROR_DS_SERVER_DOWN
//
// MessageText:
//
//  The server is not operational.
//

  ERROR_DS_SERVER_DOWN = 8250;
  {$EXTERNALSYM ERROR_DS_SERVER_DOWN}

//
// MessageId: ERROR_DS_LOCAL_ERROR
//
// MessageText:
//
//  A local error has occurred.
//

  ERROR_DS_LOCAL_ERROR = 8251;
  {$EXTERNALSYM ERROR_DS_LOCAL_ERROR}

//
// MessageId: ERROR_DS_ENCODING_ERROR
//
// MessageText:
//
//  An encoding error has occurred.
//

  ERROR_DS_ENCODING_ERROR = 8252;
  {$EXTERNALSYM ERROR_DS_ENCODING_ERROR}

//
// MessageId: ERROR_DS_DECODING_ERROR
//
// MessageText:
//
//  A decoding error has occurred.
//

  ERROR_DS_DECODING_ERROR = 8253;
  {$EXTERNALSYM ERROR_DS_DECODING_ERROR}

//
// MessageId: ERROR_DS_FILTER_UNKNOWN
//
// MessageText:
//
//  The search filter cannot be recognized.
//

  ERROR_DS_FILTER_UNKNOWN = 8254;
  {$EXTERNALSYM ERROR_DS_FILTER_UNKNOWN}

//
// MessageId: ERROR_DS_PARAM_ERROR
//
// MessageText:
//
//  One or more parameters are illegal.
//

  ERROR_DS_PARAM_ERROR = 8255;
  {$EXTERNALSYM ERROR_DS_PARAM_ERROR}

//
// MessageId: ERROR_DS_NOT_SUPPORTED
//
// MessageText:
//
//  The specified method is not supported.
//

  ERROR_DS_NOT_SUPPORTED = 8256;
  {$EXTERNALSYM ERROR_DS_NOT_SUPPORTED}

//
// MessageId: ERROR_DS_NO_RESULTS_RETURNED
//
// MessageText:
//
//  No results were returned.
//

  ERROR_DS_NO_RESULTS_RETURNED = 8257;
  {$EXTERNALSYM ERROR_DS_NO_RESULTS_RETURNED}

//
// MessageId: ERROR_DS_CONTROL_NOT_FOUND
//
// MessageText:
//
//  The specified control is not supported by the server.
//

  ERROR_DS_CONTROL_NOT_FOUND = 8258;
  {$EXTERNALSYM ERROR_DS_CONTROL_NOT_FOUND}

//
// MessageId: ERROR_DS_CLIENT_LOOP
//
// MessageText:
//
//  A referral loop was detected by the client.
//

  ERROR_DS_CLIENT_LOOP = 8259;
  {$EXTERNALSYM ERROR_DS_CLIENT_LOOP}

//
// MessageId: ERROR_DS_REFERRAL_LIMIT_EXCEEDED
//
// MessageText:
//
//  The preset referral limit was exceeded.
//

  ERROR_DS_REFERRAL_LIMIT_EXCEEDED = 8260;
  {$EXTERNALSYM ERROR_DS_REFERRAL_LIMIT_EXCEEDED}

//
// MessageId: ERROR_DS_ROOT_MUST_BE_NC
//
// MessageText:
//
//  The root object must be the head of a naming context. The root object cannot have an instantiated parent.
//

  ERROR_DS_ROOT_MUST_BE_NC = 8301;
  {$EXTERNALSYM ERROR_DS_ROOT_MUST_BE_NC}

//
// MessageId: ERROR_DS_ADD_REPLICA_INHIBITED
//
// MessageText:
//
//  The add replica operation cannot be performed. The naming context must be writable in order to create the replica.
//

  ERROR_DS_ADD_REPLICA_INHIBITED = 8302;
  {$EXTERNALSYM ERROR_DS_ADD_REPLICA_INHIBITED}

//
// MessageId: ERROR_DS_ATT_NOT_DEF_IN_SCHEMA
//
// MessageText:
//
//  A reference to an attribute that is not defined in the schema occurred.
//

  ERROR_DS_ATT_NOT_DEF_IN_SCHEMA = 8303;
  {$EXTERNALSYM ERROR_DS_ATT_NOT_DEF_IN_SCHEMA}

//
// MessageId: ERROR_DS_MAX_OBJ_SIZE_EXCEEDED
//
// MessageText:
//
//  The maximum size of an object has been exceeded.
//

  ERROR_DS_MAX_OBJ_SIZE_EXCEEDED = 8304;
  {$EXTERNALSYM ERROR_DS_MAX_OBJ_SIZE_EXCEEDED}

//
// MessageId: ERROR_DS_OBJ_STRING_NAME_EXISTS
//
// MessageText:
//
//  An attempt was made to add an object to the directory with a name that is already in use.
//

  ERROR_DS_OBJ_STRING_NAME_EXISTS = 8305;
  {$EXTERNALSYM ERROR_DS_OBJ_STRING_NAME_EXISTS}

//
// MessageId: ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA
//
// MessageText:
//
//  An attempt was made to add an object of a class that does not have an RDN defined in the schema.
//

  ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA = 8306;
  {$EXTERNALSYM ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA}

//
// MessageId: ERROR_DS_RDN_DOESNT_MATCH_SCHEMA
//
// MessageText:
//
//  An attempt was made to add an object using an RDN that is not the RDN defined in the schema.
//

  ERROR_DS_RDN_DOESNT_MATCH_SCHEMA = 8307;
  {$EXTERNALSYM ERROR_DS_RDN_DOESNT_MATCH_SCHEMA}

//
// MessageId: ERROR_DS_NO_REQUESTED_ATTS_FOUND
//
// MessageText:
//
//  None of the requested attributes were found on the objects.
//

  ERROR_DS_NO_REQUESTED_ATTS_FOUND = 8308;
  {$EXTERNALSYM ERROR_DS_NO_REQUESTED_ATTS_FOUND}

//
// MessageId: ERROR_DS_USER_BUFFER_TO_SMALL
//
// MessageText:
//
//  The user buffer is too small.
//

  ERROR_DS_USER_BUFFER_TO_SMALL = 8309;
  {$EXTERNALSYM ERROR_DS_USER_BUFFER_TO_SMALL}

//
// MessageId: ERROR_DS_ATT_IS_NOT_ON_OBJ
//
// MessageText:
//
//  The attribute specified in the operation is not present on the object.
//

  ERROR_DS_ATT_IS_NOT_ON_OBJ = 8310;
  {$EXTERNALSYM ERROR_DS_ATT_IS_NOT_ON_OBJ}

//
// MessageId: ERROR_DS_ILLEGAL_MOD_OPERATION
//
// MessageText:
//
//  Illegal modify operation. Some aspect of the modification is not permitted.
//

  ERROR_DS_ILLEGAL_MOD_OPERATION = 8311;
  {$EXTERNALSYM ERROR_DS_ILLEGAL_MOD_OPERATION}

//
// MessageId: ERROR_DS_OBJ_TOO_LARGE
//
// MessageText:
//
//  The specified object is too large.
//

  ERROR_DS_OBJ_TOO_LARGE = 8312;
  {$EXTERNALSYM ERROR_DS_OBJ_TOO_LARGE}

//
// MessageId: ERROR_DS_BAD_INSTANCE_TYPE
//
// MessageText:
//
//  The specified instance type is not valid.
//

  ERROR_DS_BAD_INSTANCE_TYPE = 8313;
  {$EXTERNALSYM ERROR_DS_BAD_INSTANCE_TYPE}

//
// MessageId: ERROR_DS_MASTERDSA_REQUIRED
//
// MessageText:
//
//  The operation must be performed at a master DSA.
//

  ERROR_DS_MASTERDSA_REQUIRED = 8314;
  {$EXTERNALSYM ERROR_DS_MASTERDSA_REQUIRED}

//
// MessageId: ERROR_DS_OBJECT_CLASS_REQUIRED
//
// MessageText:
//
//  The object class attribute must be specified.
//

  ERROR_DS_OBJECT_CLASS_REQUIRED = 8315;
  {$EXTERNALSYM ERROR_DS_OBJECT_CLASS_REQUIRED}

//
// MessageId: ERROR_DS_MISSING_REQUIRED_ATT
//
// MessageText:
//
//  A required attribute is missing.
//

  ERROR_DS_MISSING_REQUIRED_ATT = 8316;
  {$EXTERNALSYM ERROR_DS_MISSING_REQUIRED_ATT}

//
// MessageId: ERROR_DS_ATT_NOT_DEF_FOR_CLASS
//
// MessageText:
//
//  An attempt was made to modify an object to include an attribute that is not legal for its class.
//

  ERROR_DS_ATT_NOT_DEF_FOR_CLASS = 8317;
  {$EXTERNALSYM ERROR_DS_ATT_NOT_DEF_FOR_CLASS}

//
// MessageId: ERROR_DS_ATT_ALREADY_EXISTS
//
// MessageText:
//
//  The specified attribute is already present on the object.
//

  ERROR_DS_ATT_ALREADY_EXISTS = 8318;
  {$EXTERNALSYM ERROR_DS_ATT_ALREADY_EXISTS}

// 8319 unused
//
// MessageId: ERROR_DS_CANT_ADD_ATT_VALUES
//
// MessageText:
//
//  The specified attribute is not present, or has no values.
//

  ERROR_DS_CANT_ADD_ATT_VALUES = 8320;
  {$EXTERNALSYM ERROR_DS_CANT_ADD_ATT_VALUES}

//
// MessageId: ERROR_DS_SINGLE_VALUE_CONSTRAINT
//
// MessageText:
//
//  Mutliple values were specified for an attribute that can have only one value.
//

  ERROR_DS_SINGLE_VALUE_CONSTRAINT = 8321;
  {$EXTERNALSYM ERROR_DS_SINGLE_VALUE_CONSTRAINT}

//
// MessageId: ERROR_DS_RANGE_CONSTRAINT
//
// MessageText:
//
//  A value for the attribute was not in the acceptable range of values.
//

  ERROR_DS_RANGE_CONSTRAINT = 8322;
  {$EXTERNALSYM ERROR_DS_RANGE_CONSTRAINT}

//
// MessageId: ERROR_DS_ATT_VAL_ALREADY_EXISTS
//
// MessageText:
//
//  The specified value already exists.
//

  ERROR_DS_ATT_VAL_ALREADY_EXISTS = 8323;
  {$EXTERNALSYM ERROR_DS_ATT_VAL_ALREADY_EXISTS}

//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT
//
// MessageText:
//
//  The attribute cannot be removed because it is not present on the object.
//

  ERROR_DS_CANT_REM_MISSING_ATT = 8324;
  {$EXTERNALSYM ERROR_DS_CANT_REM_MISSING_ATT}

//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT_VAL
//
// MessageText:
//
//  The attribute value cannot be removed because it is not present on the object.
//

  ERROR_DS_CANT_REM_MISSING_ATT_VAL = 8325;
  {$EXTERNALSYM ERROR_DS_CANT_REM_MISSING_ATT_VAL}

//
// MessageId: ERROR_DS_ROOT_CANT_BE_SUBREF
//
// MessageText:
//
//  The specified root object cannot be a subref.
//

  ERROR_DS_ROOT_CANT_BE_SUBREF = 8326;
  {$EXTERNALSYM ERROR_DS_ROOT_CANT_BE_SUBREF}

//
// MessageId: ERROR_DS_NO_CHAINING
//
// MessageText:
//
//  Chaining is not permitted.
//

  ERROR_DS_NO_CHAINING = 8327;
  {$EXTERNALSYM ERROR_DS_NO_CHAINING}

//
// MessageId: ERROR_DS_NO_CHAINED_EVAL
//
// MessageText:
//
//  Chained evaluation is not permitted.
//

  ERROR_DS_NO_CHAINED_EVAL = 8328;
  {$EXTERNALSYM ERROR_DS_NO_CHAINED_EVAL}

//
// MessageId: ERROR_DS_NO_PARENT_OBJECT
//
// MessageText:
//
//  The operation could not be performed because the object's parent is either uninstantiated or deleted.
//

  ERROR_DS_NO_PARENT_OBJECT = 8329;
  {$EXTERNALSYM ERROR_DS_NO_PARENT_OBJECT}

//
// MessageId: ERROR_DS_PARENT_IS_AN_ALIAS
//
// MessageText:
//
//  Having a parent that is an alias is not permitted. Aliases are leaf objects.
//

  ERROR_DS_PARENT_IS_AN_ALIAS = 8330;
  {$EXTERNALSYM ERROR_DS_PARENT_IS_AN_ALIAS}

//
// MessageId: ERROR_DS_CANT_MIX_MASTER_AND_REPS
//
// MessageText:
//
//  The object and parent must be of the same type, either both masters or
//  both replicas.
//

  ERROR_DS_CANT_MIX_MASTER_AND_REPS = 8331;
  {$EXTERNALSYM ERROR_DS_CANT_MIX_MASTER_AND_REPS}

//
// MessageId: ERROR_DS_CHILDREN_EXIST
//
// MessageText:
//
//  The operation cannot be performed because child objects exist. This operation can only be performed on a leaf object.
//

  ERROR_DS_CHILDREN_EXIST = 8332;
  {$EXTERNALSYM ERROR_DS_CHILDREN_EXIST}

//
// MessageId: ERROR_DS_OBJ_NOT_FOUND
//
// MessageText:
//
//  Directory object not found.
//

  ERROR_DS_OBJ_NOT_FOUND = 8333;
  {$EXTERNALSYM ERROR_DS_OBJ_NOT_FOUND}

//
// MessageId: ERROR_DS_ALIASED_OBJ_MISSING
//
// MessageText:
//
//  The aliased object is missing.
//

  ERROR_DS_ALIASED_OBJ_MISSING = 8334;
  {$EXTERNALSYM ERROR_DS_ALIASED_OBJ_MISSING}

//
// MessageId: ERROR_DS_BAD_NAME_SYNTAX
//
// MessageText:
//
//  The object name has bad syntax.
//

  ERROR_DS_BAD_NAME_SYNTAX = 8335;
  {$EXTERNALSYM ERROR_DS_BAD_NAME_SYNTAX}

//
// MessageId: ERROR_DS_ALIAS_POINTS_TO_ALIAS
//
// MessageText:
//
//  It is not permitted for an alias to refer to another alias.
//

  ERROR_DS_ALIAS_POINTS_TO_ALIAS = 8336;
  {$EXTERNALSYM ERROR_DS_ALIAS_POINTS_TO_ALIAS}

//
// MessageId: ERROR_DS_CANT_DEREF_ALIAS
//
// MessageText:
//
//  The alias cannot be dereferenced.
//

  ERROR_DS_CANT_DEREF_ALIAS = 8337;
  {$EXTERNALSYM ERROR_DS_CANT_DEREF_ALIAS}

//
// MessageId: ERROR_DS_OUT_OF_SCOPE
//
// MessageText:
//
//  The operation is out of scope.
//

  ERROR_DS_OUT_OF_SCOPE = 8338;
  {$EXTERNALSYM ERROR_DS_OUT_OF_SCOPE}

// 8339 unused
//
// MessageId: ERROR_DS_CANT_DELETE_DSA_OBJ
//
// MessageText:
//
//  The DSA object cannot be deleted.
//

  ERROR_DS_CANT_DELETE_DSA_OBJ = 8340;
  {$EXTERNALSYM ERROR_DS_CANT_DELETE_DSA_OBJ}

//
// MessageId: ERROR_DS_GENERIC_ERROR
//
// MessageText:
//
//  A directory service error has occurred.
//

  ERROR_DS_GENERIC_ERROR = 8341;
  {$EXTERNALSYM ERROR_DS_GENERIC_ERROR}

//
// MessageId: ERROR_DS_DSA_MUST_BE_INT_MASTER
//
// MessageText:
//
//  The operation can only be performed on an internal master DSA object.
//

  ERROR_DS_DSA_MUST_BE_INT_MASTER = 8342;
  {$EXTERNALSYM ERROR_DS_DSA_MUST_BE_INT_MASTER}

//
// MessageId: ERROR_DS_CLASS_NOT_DSA
//
// MessageText:
//
//  The object must be of class DSA.
//

  ERROR_DS_CLASS_NOT_DSA = 8343;
  {$EXTERNALSYM ERROR_DS_CLASS_NOT_DSA}

//
// MessageId: ERROR_DS_INSUFF_ACCESS_RIGHTS
//
// MessageText:
//
//  Insufficient access rights to perform the operation.
//

  ERROR_DS_INSUFF_ACCESS_RIGHTS = 8344;
  {$EXTERNALSYM ERROR_DS_INSUFF_ACCESS_RIGHTS}

//
// MessageId: ERROR_DS_ILLEGAL_SUPERIOR
//
// MessageText:
//
//  The object cannot be added because the parent is not on the list of possible superiors.
//

  ERROR_DS_ILLEGAL_SUPERIOR = 8345;
  {$EXTERNALSYM ERROR_DS_ILLEGAL_SUPERIOR}

//
// MessageId: ERROR_DS_ATTRIBUTE_OWNED_BY_SAM
//
// MessageText:
//
//  Access to the attribute is not permitted because the attribute is owned by the Security Accounts Manager (SAM).
//

  ERROR_DS_ATTRIBUTE_OWNED_BY_SAM = 8346;
  {$EXTERNALSYM ERROR_DS_ATTRIBUTE_OWNED_BY_SAM}

//
// MessageId: ERROR_DS_NAME_TOO_MANY_PARTS
//
// MessageText:
//
//  The name has too many parts.
//

  ERROR_DS_NAME_TOO_MANY_PARTS = 8347;
  {$EXTERNALSYM ERROR_DS_NAME_TOO_MANY_PARTS}

//
// MessageId: ERROR_DS_NAME_TOO_LONG
//
// MessageText:
//
//  The name is too long.
//

  ERROR_DS_NAME_TOO_LONG = 8348;
  {$EXTERNALSYM ERROR_DS_NAME_TOO_LONG}

//
// MessageId: ERROR_DS_NAME_VALUE_TOO_LONG
//
// MessageText:
//
//  The name value is too long.
//

  ERROR_DS_NAME_VALUE_TOO_LONG = 8349;
  {$EXTERNALSYM ERROR_DS_NAME_VALUE_TOO_LONG}

//
// MessageId: ERROR_DS_NAME_UNPARSEABLE
//
// MessageText:
//
//  The directory service encountered an error parsing a name.
//

  ERROR_DS_NAME_UNPARSEABLE = 8350;
  {$EXTERNALSYM ERROR_DS_NAME_UNPARSEABLE}

//
// MessageId: ERROR_DS_NAME_TYPE_UNKNOWN
//
// MessageText:
//
//  The directory service cannot get the attribute type for a name.
//

  ERROR_DS_NAME_TYPE_UNKNOWN = 8351;
  {$EXTERNALSYM ERROR_DS_NAME_TYPE_UNKNOWN}

//
// MessageId: ERROR_DS_NOT_AN_OBJECT
//
// MessageText:
//
//  The name does not identify an object; the name identifies a phantom.
//

  ERROR_DS_NOT_AN_OBJECT = 8352;
  {$EXTERNALSYM ERROR_DS_NOT_AN_OBJECT}

//
// MessageId: ERROR_DS_SEC_DESC_TOO_SHORT
//
// MessageText:
//
//  The security descriptor is too short.
//

  ERROR_DS_SEC_DESC_TOO_SHORT = 8353;
  {$EXTERNALSYM ERROR_DS_SEC_DESC_TOO_SHORT}

//
// MessageId: ERROR_DS_SEC_DESC_INVALID
//
// MessageText:
//
//  The security descriptor is invalid.
//

  ERROR_DS_SEC_DESC_INVALID = 8354;
  {$EXTERNALSYM ERROR_DS_SEC_DESC_INVALID}

//
// MessageId: ERROR_DS_NO_DELETED_NAME
//
// MessageText:
//
//  Failed to create name for deleted object.
//

  ERROR_DS_NO_DELETED_NAME = 8355;
  {$EXTERNALSYM ERROR_DS_NO_DELETED_NAME}

//
// MessageId: ERROR_DS_SUBREF_MUST_HAVE_PARENT
//
// MessageText:
//
//  The parent of a new subref must exist.
//

  ERROR_DS_SUBREF_MUST_HAVE_PARENT = 8356;
  {$EXTERNALSYM ERROR_DS_SUBREF_MUST_HAVE_PARENT}

//
// MessageId: ERROR_DS_NCNAME_MUST_BE_NC
//
// MessageText:
//
//  The object must be a naming context.
//

  ERROR_DS_NCNAME_MUST_BE_NC = 8357;
  {$EXTERNALSYM ERROR_DS_NCNAME_MUST_BE_NC}

//
// MessageId: ERROR_DS_CANT_ADD_SYSTEM_ONLY
//
// MessageText:
//
//  It is not permitted to add an attribute which is owned by the system.
//

  ERROR_DS_CANT_ADD_SYSTEM_ONLY = 8358;
  {$EXTERNALSYM ERROR_DS_CANT_ADD_SYSTEM_ONLY}

//
// MessageId: ERROR_DS_CLASS_MUST_BE_CONCRETE
//
// MessageText:
//
//  The class of the object must be structural; you cannot instantiate an abstract class.
//

  ERROR_DS_CLASS_MUST_BE_CONCRETE = 8359;
  {$EXTERNALSYM ERROR_DS_CLASS_MUST_BE_CONCRETE}

//
// MessageId: ERROR_DS_INVALID_DMD
//
// MessageText:
//
//  The schema object could not be found.
//

  ERROR_DS_INVALID_DMD = 8360;
  {$EXTERNALSYM ERROR_DS_INVALID_DMD}

//
// MessageId: ERROR_DS_OBJ_GUID_EXISTS
//
// MessageText:
//
//  A local object with this GUID (dead or alive) already exists.
//

  ERROR_DS_OBJ_GUID_EXISTS = 8361;
  {$EXTERNALSYM ERROR_DS_OBJ_GUID_EXISTS}

//
// MessageId: ERROR_DS_NOT_ON_BACKLINK
//
// MessageText:
//
//  The operation cannot be performed on a back link.
//

  ERROR_DS_NOT_ON_BACKLINK = 8362;
  {$EXTERNALSYM ERROR_DS_NOT_ON_BACKLINK}

//
// MessageId: ERROR_DS_NO_CROSSREF_FOR_NC
//
// MessageText:
//
//  The cross reference for the specified naming context could not be found.
//

  ERROR_DS_NO_CROSSREF_FOR_NC = 8363;
  {$EXTERNALSYM ERROR_DS_NO_CROSSREF_FOR_NC}

//
// MessageId: ERROR_DS_SHUTTING_DOWN
//
// MessageText:
//
//  The operation could not be performed because the directory service is shutting down.
//

  ERROR_DS_SHUTTING_DOWN = 8364;
  {$EXTERNALSYM ERROR_DS_SHUTTING_DOWN}

//
// MessageId: ERROR_DS_UNKNOWN_OPERATION
//
// MessageText:
//
//  The directory service request is invalid.
//

  ERROR_DS_UNKNOWN_OPERATION = 8365;
  {$EXTERNALSYM ERROR_DS_UNKNOWN_OPERATION}

//
// MessageId: ERROR_DS_INVALID_ROLE_OWNER
//
// MessageText:
//
//  The role owner attribute could not be read.
//

  ERROR_DS_INVALID_ROLE_OWNER = 8366;
  {$EXTERNALSYM ERROR_DS_INVALID_ROLE_OWNER}

//
// MessageId: ERROR_DS_COULDNT_CONTACT_FSMO
//
// MessageText:
//
//  The requested FSMO operation failed. The current FSMO holder could not be contacted.
//

  ERROR_DS_COULDNT_CONTACT_FSMO = 8367;
  {$EXTERNALSYM ERROR_DS_COULDNT_CONTACT_FSMO}

//
// MessageId: ERROR_DS_CROSS_NC_DN_RENAME
//
// MessageText:
//
//  Modification of a DN across a naming context is not permitted.
//

  ERROR_DS_CROSS_NC_DN_RENAME = 8368;
  {$EXTERNALSYM ERROR_DS_CROSS_NC_DN_RENAME}

//
// MessageId: ERROR_DS_CANT_MOD_SYSTEM_ONLY
//
// MessageText:
//
//  The attribute cannot be modified because it is owned by the system.
//

  ERROR_DS_CANT_MOD_SYSTEM_ONLY = 8369;
  {$EXTERNALSYM ERROR_DS_CANT_MOD_SYSTEM_ONLY}

//
// MessageId: ERROR_DS_REPLICATOR_ONLY
//
// MessageText:
//
//  Only the replicator can perform this function.
//

  ERROR_DS_REPLICATOR_ONLY = 8370;
  {$EXTERNALSYM ERROR_DS_REPLICATOR_ONLY}

//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_DEFINED
//
// MessageText:
//
//  The specified class is not defined.
//

  ERROR_DS_OBJ_CLASS_NOT_DEFINED = 8371;
  {$EXTERNALSYM ERROR_DS_OBJ_CLASS_NOT_DEFINED}

//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_SUBCLASS
//
// MessageText:
//
//  The specified class is not a subclass.
//

  ERROR_DS_OBJ_CLASS_NOT_SUBCLASS = 8372;
  {$EXTERNALSYM ERROR_DS_OBJ_CLASS_NOT_SUBCLASS}

//
// MessageId: ERROR_DS_NAME_REFERENCE_INVALID
//
// MessageText:
//
//  The name reference is invalid.
//

  ERROR_DS_NAME_REFERENCE_INVALID = 8373;
  {$EXTERNALSYM ERROR_DS_NAME_REFERENCE_INVALID}

//
// MessageId: ERROR_DS_CROSS_REF_EXISTS
//
// MessageText:
//
//  A cross reference already exists.
//

  ERROR_DS_CROSS_REF_EXISTS = 8374;
  {$EXTERNALSYM ERROR_DS_CROSS_REF_EXISTS}

//
// MessageId: ERROR_DS_CANT_DEL_MASTER_CROSSREF
//
// MessageText:
//
//  It is not permitted to delete a master cross reference.
//

  ERROR_DS_CANT_DEL_MASTER_CROSSREF = 8375;
  {$EXTERNALSYM ERROR_DS_CANT_DEL_MASTER_CROSSREF}

//
// MessageId: ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD
//
// MessageText:
//
//  Subtree notifications are only supported on NC heads.
//

  ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD = 8376;
  {$EXTERNALSYM ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD}

//
// MessageId: ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX
//
// MessageText:
//
//  Notification filter is too complex.
//

  ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX = 8377;
  {$EXTERNALSYM ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX}

//
// MessageId: ERROR_DS_DUP_RDN
//
// MessageText:
//
//  Schema update failed: duplicate RDN.
//

  ERROR_DS_DUP_RDN = 8378;
  {$EXTERNALSYM ERROR_DS_DUP_RDN}

//
// MessageId: ERROR_DS_DUP_OID
//
// MessageText:
//
//  Schema update failed: duplicate OID.
//

  ERROR_DS_DUP_OID = 8379;
  {$EXTERNALSYM ERROR_DS_DUP_OID}

//
// MessageId: ERROR_DS_DUP_MAPI_ID
//
// MessageText:
//
//  Schema update failed: duplicate MAPI identifier.
//

  ERROR_DS_DUP_MAPI_ID = 8380;
  {$EXTERNALSYM ERROR_DS_DUP_MAPI_ID}

//
// MessageId: ERROR_DS_DUP_SCHEMA_ID_GUID
//
// MessageText:
//
//  Schema update failed: duplicate schema-id GUID.
//

  ERROR_DS_DUP_SCHEMA_ID_GUID = 8381;
  {$EXTERNALSYM ERROR_DS_DUP_SCHEMA_ID_GUID}

//
// MessageId: ERROR_DS_DUP_LDAP_DISPLAY_NAME
//
// MessageText:
//
//  Schema update failed: duplicate LDAP display name.
//

  ERROR_DS_DUP_LDAP_DISPLAY_NAME = 8382;
  {$EXTERNALSYM ERROR_DS_DUP_LDAP_DISPLAY_NAME}

//
// MessageId: ERROR_DS_SEMANTIC_ATT_TEST
//
// MessageText:
//
//  Schema update failed: range-lower less than range upper.
//

  ERROR_DS_SEMANTIC_ATT_TEST = 8383;
  {$EXTERNALSYM ERROR_DS_SEMANTIC_ATT_TEST}

//
// MessageId: ERROR_DS_SYNTAX_MISMATCH
//
// MessageText:
//
//  Schema update failed: syntax mismatch.
//

  ERROR_DS_SYNTAX_MISMATCH = 8384;
  {$EXTERNALSYM ERROR_DS_SYNTAX_MISMATCH}

//
// MessageId: ERROR_DS_EXISTS_IN_MUST_HAVE
//
// MessageText:
//
//  Schema deletion failed: attribute is used in must-contain.
//

  ERROR_DS_EXISTS_IN_MUST_HAVE = 8385;
  {$EXTERNALSYM ERROR_DS_EXISTS_IN_MUST_HAVE}

//
// MessageId: ERROR_DS_EXISTS_IN_MAY_HAVE
//
// MessageText:
//
//  Schema deletion failed: attribute is used in may-contain.
//

  ERROR_DS_EXISTS_IN_MAY_HAVE = 8386;
  {$EXTERNALSYM ERROR_DS_EXISTS_IN_MAY_HAVE}

//
// MessageId: ERROR_DS_NONEXISTENT_MAY_HAVE
//
// MessageText:
//
//  Schema update failed: attribute in may-contain does not exist.
//

  ERROR_DS_NONEXISTENT_MAY_HAVE = 8387;
  {$EXTERNALSYM ERROR_DS_NONEXISTENT_MAY_HAVE}

//
// MessageId: ERROR_DS_NONEXISTENT_MUST_HAVE
//
// MessageText:
//
//  Schema update failed: attribute in must-contain does not exist.
//

  ERROR_DS_NONEXISTENT_MUST_HAVE = 8388;
  {$EXTERNALSYM ERROR_DS_NONEXISTENT_MUST_HAVE}

//
// MessageId: ERROR_DS_AUX_CLS_TEST_FAIL
//
// MessageText:
//
//  Schema update failed: class in aux-class list does not exist or is not an auxiliary class.
//

  ERROR_DS_AUX_CLS_TEST_FAIL = 8389;
  {$EXTERNALSYM ERROR_DS_AUX_CLS_TEST_FAIL}

//
// MessageId: ERROR_DS_NONEXISTENT_POSS_SUP
//
// MessageText:
//
//  Schema update failed: class in poss-superiors does not exist.
//

  ERROR_DS_NONEXISTENT_POSS_SUP = 8390;
  {$EXTERNALSYM ERROR_DS_NONEXISTENT_POSS_SUP}

//
// MessageId: ERROR_DS_SUB_CLS_TEST_FAIL
//
// MessageText:
//
//  Schema update failed: class in subclassof list does not exist or does not satisfy hierarchy rules.
//

  ERROR_DS_SUB_CLS_TEST_FAIL = 8391;
  {$EXTERNALSYM ERROR_DS_SUB_CLS_TEST_FAIL}

//
// MessageId: ERROR_DS_BAD_RDN_ATT_ID_SYNTAX
//
// MessageText:
//
//  Schema update failed: Rdn-Att-Id has wrong syntax.
//

  ERROR_DS_BAD_RDN_ATT_ID_SYNTAX = 8392;
  {$EXTERNALSYM ERROR_DS_BAD_RDN_ATT_ID_SYNTAX}

//
// MessageId: ERROR_DS_EXISTS_IN_AUX_CLS
//
// MessageText:
//
//  Schema deletion failed: class is used as auxiliary class.
//

  ERROR_DS_EXISTS_IN_AUX_CLS = 8393;
  {$EXTERNALSYM ERROR_DS_EXISTS_IN_AUX_CLS}

//
// MessageId: ERROR_DS_EXISTS_IN_SUB_CLS
//
// MessageText:
//
//  Schema deletion failed: class is used as sub class.
//

  ERROR_DS_EXISTS_IN_SUB_CLS = 8394;
  {$EXTERNALSYM ERROR_DS_EXISTS_IN_SUB_CLS}

//
// MessageId: ERROR_DS_EXISTS_IN_POSS_SUP
//
// MessageText:
//
//  Schema deletion failed: class is used as poss superior.
//

  ERROR_DS_EXISTS_IN_POSS_SUP = 8395;
  {$EXTERNALSYM ERROR_DS_EXISTS_IN_POSS_SUP}

//
// MessageId: ERROR_DS_RECALCSCHEMA_FAILED
//
// MessageText:
//
//  Schema update failed in recalculating validation cache.
//

  ERROR_DS_RECALCSCHEMA_FAILED = 8396;
  {$EXTERNALSYM ERROR_DS_RECALCSCHEMA_FAILED}

//
// MessageId: ERROR_DS_TREE_DELETE_NOT_FINISHED
//
// MessageText:
//
//  The tree deletion is not finished.  The request must be made again to continue deleting the tree.
//

  ERROR_DS_TREE_DELETE_NOT_FINISHED = 8397;
  {$EXTERNALSYM ERROR_DS_TREE_DELETE_NOT_FINISHED}

//
// MessageId: ERROR_DS_CANT_DELETE
//
// MessageText:
//
//  The requested delete operation could not be performed.
//

  ERROR_DS_CANT_DELETE = 8398;
  {$EXTERNALSYM ERROR_DS_CANT_DELETE}

//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_ID
//
// MessageText:
//
//  Cannot read the governs class identifier for the schema record.
//

  ERROR_DS_ATT_SCHEMA_REQ_ID = 8399;
  {$EXTERNALSYM ERROR_DS_ATT_SCHEMA_REQ_ID}

//
// MessageId: ERROR_DS_BAD_ATT_SCHEMA_SYNTAX
//
// MessageText:
//
//  The attribute schema has bad syntax.
//

  ERROR_DS_BAD_ATT_SCHEMA_SYNTAX = 8400;
  {$EXTERNALSYM ERROR_DS_BAD_ATT_SCHEMA_SYNTAX}

//
// MessageId: ERROR_DS_CANT_CACHE_ATT
//
// MessageText:
//
//  The attribute could not be cached.
//

  ERROR_DS_CANT_CACHE_ATT = 8401;
  {$EXTERNALSYM ERROR_DS_CANT_CACHE_ATT}

//
// MessageId: ERROR_DS_CANT_CACHE_CLASS
//
// MessageText:
//
//  The class could not be cached.
//

  ERROR_DS_CANT_CACHE_CLASS = 8402;
  {$EXTERNALSYM ERROR_DS_CANT_CACHE_CLASS}

//
// MessageId: ERROR_DS_CANT_REMOVE_ATT_CACHE
//
// MessageText:
//
//  The attribute could not be removed from the cache.
//

  ERROR_DS_CANT_REMOVE_ATT_CACHE = 8403;
  {$EXTERNALSYM ERROR_DS_CANT_REMOVE_ATT_CACHE}

//
// MessageId: ERROR_DS_CANT_REMOVE_CLASS_CACHE
//
// MessageText:
//
//  The class could not be removed from the cache.
//

  ERROR_DS_CANT_REMOVE_CLASS_CACHE = 8404;
  {$EXTERNALSYM ERROR_DS_CANT_REMOVE_CLASS_CACHE}

//
// MessageId: ERROR_DS_CANT_RETRIEVE_DN
//
// MessageText:
//
//  The distinguished name attribute could not be read.
//

  ERROR_DS_CANT_RETRIEVE_DN = 8405;
  {$EXTERNALSYM ERROR_DS_CANT_RETRIEVE_DN}

//
// MessageId: ERROR_DS_MISSING_SUPREF
//
// MessageText:
//
//  A required subref is missing.
//

  ERROR_DS_MISSING_SUPREF = 8406;
  {$EXTERNALSYM ERROR_DS_MISSING_SUPREF}

//
// MessageId: ERROR_DS_CANT_RETRIEVE_INSTANCE
//
// MessageText:
//
//  The instance type attribute could not be retrieved.
//

  ERROR_DS_CANT_RETRIEVE_INSTANCE = 8407;
  {$EXTERNALSYM ERROR_DS_CANT_RETRIEVE_INSTANCE}

//
// MessageId: ERROR_DS_CODE_INCONSISTENCY
//
// MessageText:
//
//  An internal error has occurred.
//

  ERROR_DS_CODE_INCONSISTENCY = 8408;
  {$EXTERNALSYM ERROR_DS_CODE_INCONSISTENCY}

//
// MessageId: ERROR_DS_DATABASE_ERROR
//
// MessageText:
//
//  A database error has occurred.
//

  ERROR_DS_DATABASE_ERROR = 8409;
  {$EXTERNALSYM ERROR_DS_DATABASE_ERROR}

//
// MessageId: ERROR_DS_GOVERNSID_MISSING
//
// MessageText:
//
//  The attribute GOVERNSID is missing.
//

  ERROR_DS_GOVERNSID_MISSING = 8410;
  {$EXTERNALSYM ERROR_DS_GOVERNSID_MISSING}

//
// MessageId: ERROR_DS_MISSING_EXPECTED_ATT
//
// MessageText:
//
//  An expected attribute is missing.
//

  ERROR_DS_MISSING_EXPECTED_ATT = 8411;
  {$EXTERNALSYM ERROR_DS_MISSING_EXPECTED_ATT}

//
// MessageId: ERROR_DS_NCNAME_MISSING_CR_REF
//
// MessageText:
//
//  The specified naming context is missing a cross reference.
//

  ERROR_DS_NCNAME_MISSING_CR_REF = 8412;
  {$EXTERNALSYM ERROR_DS_NCNAME_MISSING_CR_REF}

//
// MessageId: ERROR_DS_SECURITY_CHECKING_ERROR
//
// MessageText:
//
//  A security checking error has occurred.
//

  ERROR_DS_SECURITY_CHECKING_ERROR = 8413;
  {$EXTERNALSYM ERROR_DS_SECURITY_CHECKING_ERROR}

//
// MessageId: ERROR_DS_SCHEMA_NOT_LOADED
//
// MessageText:
//
//  The schema is not loaded.
//

  ERROR_DS_SCHEMA_NOT_LOADED = 8414;
  {$EXTERNALSYM ERROR_DS_SCHEMA_NOT_LOADED}

//
// MessageId: ERROR_DS_SCHEMA_ALLOC_FAILED
//
// MessageText:
//
//  Schema allocation failed. Please check if the machine is running low on memory.
//

  ERROR_DS_SCHEMA_ALLOC_FAILED = 8415;
  {$EXTERNALSYM ERROR_DS_SCHEMA_ALLOC_FAILED}

//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_SYNTAX
//
// MessageText:
//
//  Failed to obtain the required syntax for the attribute schema.
//

  ERROR_DS_ATT_SCHEMA_REQ_SYNTAX = 8416;
  {$EXTERNALSYM ERROR_DS_ATT_SCHEMA_REQ_SYNTAX}

//
// MessageId: ERROR_DS_GCVERIFY_ERROR
//
// MessageText:
//
//  The global catalog verification failed. The global catalog is not available or does not support the operation. Some part of the directory is currently not available.
//

  ERROR_DS_GCVERIFY_ERROR = 8417;
  {$EXTERNALSYM ERROR_DS_GCVERIFY_ERROR}

//
// MessageId: ERROR_DS_DRA_SCHEMA_MISMATCH
//
// MessageText:
//
//  The replication operation failed because of a schema mismatch between the servers involved.
//

  ERROR_DS_DRA_SCHEMA_MISMATCH = 8418;
  {$EXTERNALSYM ERROR_DS_DRA_SCHEMA_MISMATCH}

//
// MessageId: ERROR_DS_CANT_FIND_DSA_OBJ
//
// MessageText:
//
//  The DSA object could not be found.
//

  ERROR_DS_CANT_FIND_DSA_OBJ = 8419;
  {$EXTERNALSYM ERROR_DS_CANT_FIND_DSA_OBJ}

//
// MessageId: ERROR_DS_CANT_FIND_EXPECTED_NC
//
// MessageText:
//
//  The naming context could not be found.
//

  ERROR_DS_CANT_FIND_EXPECTED_NC = 8420;
  {$EXTERNALSYM ERROR_DS_CANT_FIND_EXPECTED_NC}

//
// MessageId: ERROR_DS_CANT_FIND_NC_IN_CACHE
//
// MessageText:
//
//  The naming context could not be found in the cache.
//

  ERROR_DS_CANT_FIND_NC_IN_CACHE = 8421;
  {$EXTERNALSYM ERROR_DS_CANT_FIND_NC_IN_CACHE}

//
// MessageId: ERROR_DS_CANT_RETRIEVE_CHILD
//
// MessageText:
//
//  The child object could not be retrieved.
//

  ERROR_DS_CANT_RETRIEVE_CHILD = 8422;
  {$EXTERNALSYM ERROR_DS_CANT_RETRIEVE_CHILD}

//
// MessageId: ERROR_DS_SECURITY_ILLEGAL_MODIFY
//
// MessageText:
//
//  The modification was not permitted for security reasons.
//

  ERROR_DS_SECURITY_ILLEGAL_MODIFY = 8423;
  {$EXTERNALSYM ERROR_DS_SECURITY_ILLEGAL_MODIFY}

//
// MessageId: ERROR_DS_CANT_REPLACE_HIDDEN_REC
//
// MessageText:
//
//  The operation cannot replace the hidden record.
//

  ERROR_DS_CANT_REPLACE_HIDDEN_REC = 8424;
  {$EXTERNALSYM ERROR_DS_CANT_REPLACE_HIDDEN_REC}

//
// MessageId: ERROR_DS_BAD_HIERARCHY_FILE
//
// MessageText:
//
//  The hierarchy file is invalid.
//

  ERROR_DS_BAD_HIERARCHY_FILE = 8425;
  {$EXTERNALSYM ERROR_DS_BAD_HIERARCHY_FILE}

//
// MessageId: ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED
//
// MessageText:
//
//  The attempt to build the hierarchy table failed.
//

  ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED = 8426;
  {$EXTERNALSYM ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED}

//
// MessageId: ERROR_DS_CONFIG_PARAM_MISSING
//
// MessageText:
//
//  The directory configuration parameter is missing from the registry.
//

  ERROR_DS_CONFIG_PARAM_MISSING = 8427;
  {$EXTERNALSYM ERROR_DS_CONFIG_PARAM_MISSING}

//
// MessageId: ERROR_DS_COUNTING_AB_INDICES_FAILED
//
// MessageText:
//
//  The attempt to count the address book indices failed.
//

  ERROR_DS_COUNTING_AB_INDICES_FAILED = 8428;
  {$EXTERNALSYM ERROR_DS_COUNTING_AB_INDICES_FAILED}

//
// MessageId: ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED
//
// MessageText:
//
//  The allocation of the hierarchy table failed.
//

  ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED = 8429;
  {$EXTERNALSYM ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED}

//
// MessageId: ERROR_DS_INTERNAL_FAILURE
//
// MessageText:
//
//  The directory service encountered an internal failure.
//

  ERROR_DS_INTERNAL_FAILURE = 8430;
  {$EXTERNALSYM ERROR_DS_INTERNAL_FAILURE}

//
// MessageId: ERROR_DS_UNKNOWN_ERROR
//
// MessageText:
//
//  The directory service encountered an unknown failure.
//

  ERROR_DS_UNKNOWN_ERROR = 8431;
  {$EXTERNALSYM ERROR_DS_UNKNOWN_ERROR}

//
// MessageId: ERROR_DS_ROOT_REQUIRES_CLASS_TOP
//
// MessageText:
//
//  A root object requires a class of 'top'.
//

  ERROR_DS_ROOT_REQUIRES_CLASS_TOP = 8432;
  {$EXTERNALSYM ERROR_DS_ROOT_REQUIRES_CLASS_TOP}

//
// MessageId: ERROR_DS_REFUSING_FSMO_ROLES
//
// MessageText:
//
//  This directory server is shutting down, and cannot take ownership of new floating single-master operation roles.
//

  ERROR_DS_REFUSING_FSMO_ROLES = 8433;
  {$EXTERNALSYM ERROR_DS_REFUSING_FSMO_ROLES}

//
// MessageId: ERROR_DS_MISSING_FSMO_SETTINGS
//
// MessageText:
//
//  The directory service is missing mandatory configuration information, and is unable to determine the ownership of floating single-master operation roles.
//

  ERROR_DS_MISSING_FSMO_SETTINGS = 8434;
  {$EXTERNALSYM ERROR_DS_MISSING_FSMO_SETTINGS}

//
// MessageId: ERROR_DS_UNABLE_TO_SURRENDER_ROLES
//
// MessageText:
//
//  The directory service was unable to transfer ownership of one or more floating single-master operation roles to other servers.
//

  ERROR_DS_UNABLE_TO_SURRENDER_ROLES = 8435;
  {$EXTERNALSYM ERROR_DS_UNABLE_TO_SURRENDER_ROLES}

//
// MessageId: ERROR_DS_DRA_GENERIC
//
// MessageText:
//
//  The replication operation failed.
//

  ERROR_DS_DRA_GENERIC = 8436;
  {$EXTERNALSYM ERROR_DS_DRA_GENERIC}

//
// MessageId: ERROR_DS_DRA_INVALID_PARAMETER
//
// MessageText:
//
//  An invalid parameter was specified for this replication operation.
//

  ERROR_DS_DRA_INVALID_PARAMETER = 8437;
  {$EXTERNALSYM ERROR_DS_DRA_INVALID_PARAMETER}

//
// MessageId: ERROR_DS_DRA_BUSY
//
// MessageText:
//
//  The directory service is too busy to complete the replication operation at this time.
//

  ERROR_DS_DRA_BUSY = 8438;
  {$EXTERNALSYM ERROR_DS_DRA_BUSY}

//
// MessageId: ERROR_DS_DRA_BAD_DN
//
// MessageText:
//
//  The distinguished name specified for this replication operation is invalid.
//

  ERROR_DS_DRA_BAD_DN = 8439;
  {$EXTERNALSYM ERROR_DS_DRA_BAD_DN}

//
// MessageId: ERROR_DS_DRA_BAD_NC
//
// MessageText:
//
//  The naming context specified for this replication operation is invalid.
//

  ERROR_DS_DRA_BAD_NC = 8440;
  {$EXTERNALSYM ERROR_DS_DRA_BAD_NC}

//
// MessageId: ERROR_DS_DRA_DN_EXISTS
//
// MessageText:
//
//  The distinguished name specified for this replication operation already exists.
//

  ERROR_DS_DRA_DN_EXISTS = 8441;
  {$EXTERNALSYM ERROR_DS_DRA_DN_EXISTS}

//
// MessageId: ERROR_DS_DRA_INTERNAL_ERROR
//
// MessageText:
//
//  The replication system encountered an internal error.
//

  ERROR_DS_DRA_INTERNAL_ERROR = 8442;
  {$EXTERNALSYM ERROR_DS_DRA_INTERNAL_ERROR}

//
// MessageId: ERROR_DS_DRA_INCONSISTENT_DIT
//
// MessageText:
//
//  The replication operation encountered a database inconsistency.
//

  ERROR_DS_DRA_INCONSISTENT_DIT = 8443;
  {$EXTERNALSYM ERROR_DS_DRA_INCONSISTENT_DIT}

//
// MessageId: ERROR_DS_DRA_CONNECTION_FAILED
//
// MessageText:
//
//  The server specified for this replication operation could not be contacted.
//

  ERROR_DS_DRA_CONNECTION_FAILED = 8444;
  {$EXTERNALSYM ERROR_DS_DRA_CONNECTION_FAILED}

//
// MessageId: ERROR_DS_DRA_BAD_INSTANCE_TYPE
//
// MessageText:
//
//  The replication operation encountered an object with an invalid instance type.
//

  ERROR_DS_DRA_BAD_INSTANCE_TYPE = 8445;
  {$EXTERNALSYM ERROR_DS_DRA_BAD_INSTANCE_TYPE}

//
// MessageId: ERROR_DS_DRA_OUT_OF_MEM
//
// MessageText:
//
//  The replication operation failed to allocate memory.
//

  ERROR_DS_DRA_OUT_OF_MEM = 8446;
  {$EXTERNALSYM ERROR_DS_DRA_OUT_OF_MEM}

//
// MessageId: ERROR_DS_DRA_MAIL_PROBLEM
//
// MessageText:
//
//  The replication operation encountered an error with the mail system.
//

  ERROR_DS_DRA_MAIL_PROBLEM = 8447;
  {$EXTERNALSYM ERROR_DS_DRA_MAIL_PROBLEM}

//
// MessageId: ERROR_DS_DRA_REF_ALREADY_EXISTS
//
// MessageText:
//
//  The replication reference information for the target server already exists.
//

  ERROR_DS_DRA_REF_ALREADY_EXISTS = 8448;
  {$EXTERNALSYM ERROR_DS_DRA_REF_ALREADY_EXISTS}

//
// MessageId: ERROR_DS_DRA_REF_NOT_FOUND
//
// MessageText:
//
//  The replication reference information for the target server does not exist.
//

  ERROR_DS_DRA_REF_NOT_FOUND = 8449;
  {$EXTERNALSYM ERROR_DS_DRA_REF_NOT_FOUND}

//
// MessageId: ERROR_DS_DRA_OBJ_IS_REP_SOURCE
//
// MessageText:
//
//  The naming context cannot be removed because it is replicated to another server.
//

  ERROR_DS_DRA_OBJ_IS_REP_SOURCE = 8450;
  {$EXTERNALSYM ERROR_DS_DRA_OBJ_IS_REP_SOURCE}

//
// MessageId: ERROR_DS_DRA_DB_ERROR
//
// MessageText:
//
//  The replication operation encountered a database error.
//

  ERROR_DS_DRA_DB_ERROR = 8451;
  {$EXTERNALSYM ERROR_DS_DRA_DB_ERROR}

//
// MessageId: ERROR_DS_DRA_NO_REPLICA
//
// MessageText:
//
//  The naming context is in the process of being removed or is not replicated from the specified server.
//

  ERROR_DS_DRA_NO_REPLICA = 8452;
  {$EXTERNALSYM ERROR_DS_DRA_NO_REPLICA}

//
// MessageId: ERROR_DS_DRA_ACCESS_DENIED
//
// MessageText:
//
//  Replication access was denied.
//

  ERROR_DS_DRA_ACCESS_DENIED = 8453;
  {$EXTERNALSYM ERROR_DS_DRA_ACCESS_DENIED}

//
// MessageId: ERROR_DS_DRA_NOT_SUPPORTED
//
// MessageText:
//
//  The requested operation is not supported by this version of the directory service.
//

  ERROR_DS_DRA_NOT_SUPPORTED = 8454;
  {$EXTERNALSYM ERROR_DS_DRA_NOT_SUPPORTED}

//
// MessageId: ERROR_DS_DRA_RPC_CANCELLED
//
// MessageText:
//
//  The replication remote procedure call was cancelled.
//

  ERROR_DS_DRA_RPC_CANCELLED = 8455;
  {$EXTERNALSYM ERROR_DS_DRA_RPC_CANCELLED}

//
// MessageId: ERROR_DS_DRA_SOURCE_DISABLED
//
// MessageText:
//
//  The source server is currently rejecting replication requests.
//

  ERROR_DS_DRA_SOURCE_DISABLED = 8456;
  {$EXTERNALSYM ERROR_DS_DRA_SOURCE_DISABLED}

//
// MessageId: ERROR_DS_DRA_SINK_DISABLED
//
// MessageText:
//
//  The destination server is currently rejecting replication requests.
//

  ERROR_DS_DRA_SINK_DISABLED = 8457;
  {$EXTERNALSYM ERROR_DS_DRA_SINK_DISABLED}

//
// MessageId: ERROR_DS_DRA_NAME_COLLISION
//
// MessageText:
//
//  The replication operation failed due to a collision of object names.
//

  ERROR_DS_DRA_NAME_COLLISION = 8458;
  {$EXTERNALSYM ERROR_DS_DRA_NAME_COLLISION}

//
// MessageId: ERROR_DS_DRA_SOURCE_REINSTALLED
//
// MessageText:
//
//  The replication source has been reinstalled.
//

  ERROR_DS_DRA_SOURCE_REINSTALLED = 8459;
  {$EXTERNALSYM ERROR_DS_DRA_SOURCE_REINSTALLED}

//
// MessageId: ERROR_DS_DRA_MISSING_PARENT
//
// MessageText:
//
//  The replication operation failed because a required parent object is missing.
//

  ERROR_DS_DRA_MISSING_PARENT = 8460;
  {$EXTERNALSYM ERROR_DS_DRA_MISSING_PARENT}

//
// MessageId: ERROR_DS_DRA_PREEMPTED
//
// MessageText:
//
//  The replication operation was preempted.
//

  ERROR_DS_DRA_PREEMPTED = 8461;
  {$EXTERNALSYM ERROR_DS_DRA_PREEMPTED}

//
// MessageId: ERROR_DS_DRA_ABANDON_SYNC
//
// MessageText:
//
//  The replication synchronization attempt was abandoned because of a lack of updates.
//

  ERROR_DS_DRA_ABANDON_SYNC = 8462;
  {$EXTERNALSYM ERROR_DS_DRA_ABANDON_SYNC}

//
// MessageId: ERROR_DS_DRA_SHUTDOWN
//
// MessageText:
//
//  The replication operation was terminated because the system is shutting down.
//

  ERROR_DS_DRA_SHUTDOWN = 8463;
  {$EXTERNALSYM ERROR_DS_DRA_SHUTDOWN}

//
// MessageId: ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET
//
// MessageText:
//
//  The replication synchronization attempt failed as the destination partial attribute set is not a subset of source partial attribute set.
//

  ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET = 8464;
  {$EXTERNALSYM ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET}

//
// MessageId: ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA
//
// MessageText:
//
//  The replication synchronization attempt failed because a master replica attempted to sync from a partial replica.
//

  ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA = 8465;
  {$EXTERNALSYM ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA}

//
// MessageId: ERROR_DS_DRA_EXTN_CONNECTION_FAILED
//
// MessageText:
//
//  The server specified for this replication operation was contacted, but that server was unable to contact an additional server needed to complete the operation.
//

  ERROR_DS_DRA_EXTN_CONNECTION_FAILED = 8466;
  {$EXTERNALSYM ERROR_DS_DRA_EXTN_CONNECTION_FAILED}

//
// MessageId: ERROR_DS_INSTALL_SCHEMA_MISMATCH
//
// MessageText:
//
//  A schema mismatch is detected between the source and the build used during a replica install. The replica cannot be installed.
//

  ERROR_DS_INSTALL_SCHEMA_MISMATCH = 8467;
  {$EXTERNALSYM ERROR_DS_INSTALL_SCHEMA_MISMATCH}

//
// MessageId: ERROR_DS_DUP_LINK_ID
//
// MessageText:
//
//  Schema update failed: An attribute with the same link identifier already exists.
//

  ERROR_DS_DUP_LINK_ID = 8468;
  {$EXTERNALSYM ERROR_DS_DUP_LINK_ID}

//
// MessageId: ERROR_DS_NAME_ERROR_RESOLVING
//
// MessageText:
//
//  Name translation: Generic processing error.
//

  ERROR_DS_NAME_ERROR_RESOLVING = 8469;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_RESOLVING}

//
// MessageId: ERROR_DS_NAME_ERROR_NOT_FOUND
//
// MessageText:
//
//  Name translation: Could not find the name or insufficient right to see name.
//

  ERROR_DS_NAME_ERROR_NOT_FOUND = 8470;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_NOT_FOUND}

//
// MessageId: ERROR_DS_NAME_ERROR_NOT_UNIQUE
//
// MessageText:
//
//  Name translation: Input name mapped to more than one output name.
//

  ERROR_DS_NAME_ERROR_NOT_UNIQUE = 8471;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_NOT_UNIQUE}

//
// MessageId: ERROR_DS_NAME_ERROR_NO_MAPPING
//
// MessageText:
//
//  Name translation: Input name found, but not the associated output format.
//

  ERROR_DS_NAME_ERROR_NO_MAPPING = 8472;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_NO_MAPPING}

//
// MessageId: ERROR_DS_NAME_ERROR_DOMAIN_ONLY
//
// MessageText:
//
//  Name translation: Unable to resolve completely, only the domain was found.
//

  ERROR_DS_NAME_ERROR_DOMAIN_ONLY = 8473;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_DOMAIN_ONLY}

//
// MessageId: ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING
//
// MessageText:
//
//  Name translation: Unable to perform purely syntactical mapping at the client without going out to the wire.
//

  ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING = 8474;
  {$EXTERNALSYM ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING}

//
// MessageId: ERROR_DS_CONSTRUCTED_ATT_MOD
//
// MessageText:
//
//  Modification of a constructed att is not allowed.
//

  ERROR_DS_CONSTRUCTED_ATT_MOD = 8475;
  {$EXTERNALSYM ERROR_DS_CONSTRUCTED_ATT_MOD}

//
// MessageId: ERROR_DS_WRONG_OM_OBJ_CLASS
//
// MessageText:
//
//  The OM-Object-Class specified is incorrect for an attribute with the specified syntax.
//

  ERROR_DS_WRONG_OM_OBJ_CLASS = 8476;
  {$EXTERNALSYM ERROR_DS_WRONG_OM_OBJ_CLASS}

//
// MessageId: ERROR_DS_DRA_REPL_PENDING
//
// MessageText:
//
//  The replication request has been posted; waiting for reply.
//

  ERROR_DS_DRA_REPL_PENDING = 8477;
  {$EXTERNALSYM ERROR_DS_DRA_REPL_PENDING}

//
// MessageId: ERROR_DS_DS_REQUIRED
//
// MessageText:
//
//  The requested operation requires a directory service, and none was available.
//

  ERROR_DS_DS_REQUIRED = 8478;
  {$EXTERNALSYM ERROR_DS_DS_REQUIRED}

//
// MessageId: ERROR_DS_INVALID_LDAP_DISPLAY_NAME
//
// MessageText:
//
//  The LDAP display name of the class or attribute contains non-ASCII characters.
//

  ERROR_DS_INVALID_LDAP_DISPLAY_NAME = 8479;
  {$EXTERNALSYM ERROR_DS_INVALID_LDAP_DISPLAY_NAME}

//
// MessageId: ERROR_DS_NON_BASE_SEARCH
//
// MessageText:
//
//  The requested search operation is only supported for base searches.
//

  ERROR_DS_NON_BASE_SEARCH = 8480;
  {$EXTERNALSYM ERROR_DS_NON_BASE_SEARCH}

//
// MessageId: ERROR_DS_CANT_RETRIEVE_ATTS
//
// MessageText:
//
//  The search failed to retrieve attributes from the database.
//

  ERROR_DS_CANT_RETRIEVE_ATTS = 8481;
  {$EXTERNALSYM ERROR_DS_CANT_RETRIEVE_ATTS}

//
// MessageId: ERROR_DS_BACKLINK_WITHOUT_LINK
//
// MessageText:
//
//  The schema update operation tried to add a backward link attribute that has no corresponding forward link.
//

  ERROR_DS_BACKLINK_WITHOUT_LINK = 8482;
  {$EXTERNALSYM ERROR_DS_BACKLINK_WITHOUT_LINK}

//
// MessageId: ERROR_DS_EPOCH_MISMATCH
//
// MessageText:
//
//  Source and destination of a cross-domain move do not agree on the object's epoch number.  Either source or destination does not have the latest version of the object.
//

  ERROR_DS_EPOCH_MISMATCH = 8483;
  {$EXTERNALSYM ERROR_DS_EPOCH_MISMATCH}

//
// MessageId: ERROR_DS_SRC_NAME_MISMATCH
//
// MessageText:
//
//  Source and destination of a cross-domain move do not agree on the object's current name.  Either source or destination does not have the latest version of the object.
//

  ERROR_DS_SRC_NAME_MISMATCH = 8484;
  {$EXTERNALSYM ERROR_DS_SRC_NAME_MISMATCH}

//
// MessageId: ERROR_DS_SRC_AND_DST_NC_IDENTICAL
//
// MessageText:
//
//  Source and destination for the cross-domain move operation are identical.  Caller should use local move operation instead of cross-domain move operation.
//

  ERROR_DS_SRC_AND_DST_NC_IDENTICAL = 8485;
  {$EXTERNALSYM ERROR_DS_SRC_AND_DST_NC_IDENTICAL}

//
// MessageId: ERROR_DS_DST_NC_MISMATCH
//
// MessageText:
//
//  Source and destination for a cross-domain move are not in agreement on the naming contexts in the forest.  Either source or destination does not have the latest version of the Partitions container.
//

  ERROR_DS_DST_NC_MISMATCH = 8486;
  {$EXTERNALSYM ERROR_DS_DST_NC_MISMATCH}

//
// MessageId: ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC
//
// MessageText:
//
//  Destination of a cross-domain move is not authoritative for the destination naming context.
//

  ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC = 8487;
  {$EXTERNALSYM ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC}

//
// MessageId: ERROR_DS_SRC_GUID_MISMATCH
//
// MessageText:
//
//  Source and destination of a cross-domain move do not agree on the identity of the source object.  Either source or destination does not have the latest version of the source object.
//

  ERROR_DS_SRC_GUID_MISMATCH = 8488;
  {$EXTERNALSYM ERROR_DS_SRC_GUID_MISMATCH}

//
// MessageId: ERROR_DS_CANT_MOVE_DELETED_OBJECT
//
// MessageText:
//
//  Object being moved across-domains is already known to be deleted by the destination server.  The source server does not have the latest version of the source object.
//

  ERROR_DS_CANT_MOVE_DELETED_OBJECT = 8489;
  {$EXTERNALSYM ERROR_DS_CANT_MOVE_DELETED_OBJECT}

//
// MessageId: ERROR_DS_PDC_OPERATION_IN_PROGRESS
//
// MessageText:
//
//  Another operation which requires exclusive access to the PDC FSMO is already in progress.
//

  ERROR_DS_PDC_OPERATION_IN_PROGRESS = 8490;
  {$EXTERNALSYM ERROR_DS_PDC_OPERATION_IN_PROGRESS}

//
// MessageId: ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD
//
// MessageText:
//
//  A cross-domain move operation failed such that two versions of the moved object exist - one each in the source and destination domains.  The destination object needs to be removed to restore the system to a consistent state.
//

  ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD = 8491;
  {$EXTERNALSYM ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD}

//
// MessageId: ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION
//
// MessageText:
//
//  This object may not be moved across domain boundaries either because cross-domain moves for this class are disallowed, or the object has some special characteristics, eg: trust account or restricted RID, which prevent its move.
//

  ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION = 8492;
  {$EXTERNALSYM ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION}

//
// MessageId: ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS
//
// MessageText:
//
//  Can't move objects with memberships across domain boundaries as once moved, this would violate the membership conditions of the account group.  Remove the object from any account group memberships and retry.
//

  ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS = 8493;
  {$EXTERNALSYM ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS}

//
// MessageId: ERROR_DS_NC_MUST_HAVE_NC_PARENT
//
// MessageText:
//
//  A naming context head must be the immediate child of another naming context head, not of an interior node.
//

  ERROR_DS_NC_MUST_HAVE_NC_PARENT = 8494;
  {$EXTERNALSYM ERROR_DS_NC_MUST_HAVE_NC_PARENT}

//
// MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE
//
// MessageText:
//
//  The directory cannot validate the proposed naming context name because it does not hold a replica of the naming context above the proposed naming context.  Please ensure that the domain naming master role is held by a server that is configured as a global catalog server, and that the server is up to date with its replication partners.
//

  ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE = 8495;
  {$EXTERNALSYM ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE}

//
// MessageId: ERROR_DS_DST_DOMAIN_NOT_NATIVE
//
// MessageText:
//
//  Destination domain must be in native mode.
//

  ERROR_DS_DST_DOMAIN_NOT_NATIVE = 8496;
  {$EXTERNALSYM ERROR_DS_DST_DOMAIN_NOT_NATIVE}

//
// MessageId: ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER
//
// MessageText:
//
//  The operation can not be performed because the server does not have an infrastructure container in the domain of interest.
//

  ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER = 8497;
  {$EXTERNALSYM ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER}

//
// MessageId: ERROR_DS_CANT_MOVE_ACCOUNT_GROUP
//
// MessageText:
//
//  Cross-domain move of account groups is not allowed.
//

  ERROR_DS_CANT_MOVE_ACCOUNT_GROUP = 8498;
  {$EXTERNALSYM ERROR_DS_CANT_MOVE_ACCOUNT_GROUP}

//
// MessageId: ERROR_DS_CANT_MOVE_RESOURCE_GROUP
//
// MessageText:
//
//  Cross-domain move of resource groups is not allowed.
//

  ERROR_DS_CANT_MOVE_RESOURCE_GROUP = 8499;
  {$EXTERNALSYM ERROR_DS_CANT_MOVE_RESOURCE_GROUP}

//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG
//
// MessageText:
//
//  The search flags for the attribute are invalid. The ANR bit is valid only on attributes of Unicode or Teletex strings.
//

  ERROR_DS_INVALID_SEARCH_FLAG = 8500;
  {$EXTERNALSYM ERROR_DS_INVALID_SEARCH_FLAG}

//
// MessageId: ERROR_DS_NO_TREE_DELETE_ABOVE_NC
//
// MessageText:
//
//  Tree deletions starting at an object which has an NC head as a descendant are not allowed.
//

  ERROR_DS_NO_TREE_DELETE_ABOVE_NC = 8501;
  {$EXTERNALSYM ERROR_DS_NO_TREE_DELETE_ABOVE_NC}

//
// MessageId: ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE
//
// MessageText:
//
//  The directory service failed to lock a tree in preparation for a tree deletion because the tree was in use.
//

  ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE = 8502;
  {$EXTERNALSYM ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE}

//
// MessageId: ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE
//
// MessageText:
//
//  The directory service failed to identify the list of objects to delete while attempting a tree deletion.
//

  ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE = 8503;
  {$EXTERNALSYM ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE}

//
// MessageId: ERROR_DS_SAM_INIT_FAILURE
//
// MessageText:
//
//  Security Accounts Manager initialization failed because of the following error: %1.
//  Error Status: 0x%2. Click OK to shut down the system and reboot into Directory Services Restore Mode. Check the event log for detailed information.
//

  ERROR_DS_SAM_INIT_FAILURE = 8504;
  {$EXTERNALSYM ERROR_DS_SAM_INIT_FAILURE}

//
// MessageId: ERROR_DS_SENSITIVE_GROUP_VIOLATION
//
// MessageText:
//
//  Only an administrator can modify the membership list of an administrative group.
//

  ERROR_DS_SENSITIVE_GROUP_VIOLATION = 8505;
  {$EXTERNALSYM ERROR_DS_SENSITIVE_GROUP_VIOLATION}

//
// MessageId: ERROR_DS_CANT_MOD_PRIMARYGROUPID
//
// MessageText:
//
//  Cannot change the primary group ID of a domain controller account.
//

  ERROR_DS_CANT_MOD_PRIMARYGROUPID = 8506;
  {$EXTERNALSYM ERROR_DS_CANT_MOD_PRIMARYGROUPID}

//
// MessageId: ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD
//
// MessageText:
//
//  An attempt is made to modify the base schema.
//

  ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD = 8507;
  {$EXTERNALSYM ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD}

//
// MessageId: ERROR_DS_NONSAFE_SCHEMA_CHANGE
//
// MessageText:
//
//  Adding a new mandatory attribute to an existing class, deleting a mandatory attribute from an existing class, or adding an optional attribute to the special class Top that is not a backlink attribute (directly or through inheritance, for example, by adding or deleting an auxiliary class) is not allowed.
//

  ERROR_DS_NONSAFE_SCHEMA_CHANGE = 8508;
  {$EXTERNALSYM ERROR_DS_NONSAFE_SCHEMA_CHANGE}

//
// MessageId: ERROR_DS_SCHEMA_UPDATE_DISALLOWED
//
// MessageText:
//
//  Schema update is not allowed on this DC. Either the registry key is not set or the DC is not the schema FSMO Role Owner.
//

  ERROR_DS_SCHEMA_UPDATE_DISALLOWED = 8509;
  {$EXTERNALSYM ERROR_DS_SCHEMA_UPDATE_DISALLOWED}

//
// MessageId: ERROR_DS_CANT_CREATE_UNDER_SCHEMA
//
// MessageText:
//
//  An object of this class cannot be created under the schema container. You can only create attribute-schema and class-schema objects under the schema container.
//

  ERROR_DS_CANT_CREATE_UNDER_SCHEMA = 8510;
  {$EXTERNALSYM ERROR_DS_CANT_CREATE_UNDER_SCHEMA}

//
// MessageId: ERROR_DS_INSTALL_NO_SRC_SCH_VERSION
//
// MessageText:
//
//  The replica/child install failed to get the objectVersion attribute on the schema container on the source DC. Either the attribute is missing on the schema container or the credentials supplied do not have permission to read it.
//

  ERROR_DS_INSTALL_NO_SRC_SCH_VERSION = 8511;
  {$EXTERNALSYM ERROR_DS_INSTALL_NO_SRC_SCH_VERSION}

//
// MessageId: ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE
//
// MessageText:
//
//  The replica/child install failed to read the objectVersion attribute in the SCHEMA section of the file schema.ini in the system32 directory.
//

  ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE = 8512;
  {$EXTERNALSYM ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE}

//
// MessageId: ERROR_DS_INVALID_GROUP_TYPE
//
// MessageText:
//
//  The specified group type is invalid.
//

  ERROR_DS_INVALID_GROUP_TYPE = 8513;
  {$EXTERNALSYM ERROR_DS_INVALID_GROUP_TYPE}

//
// MessageId: ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
//  You cannot nest global groups in a mixed domain if the group is security-enabled.
//

  ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN = 8514;
  {$EXTERNALSYM ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN}

//
// MessageId: ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
//  You cannot nest local groups in a mixed domain if the group is security-enabled.
//

  ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN = 8515;
  {$EXTERNALSYM ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN}

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
//  A global group cannot have a local group as a member.
//

  ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER = 8516;
  {$EXTERNALSYM ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER}

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
//  A global group cannot have a universal group as a member.
//

  ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER = 8517;
  {$EXTERNALSYM ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER}

//
// MessageId: ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
//  A universal group cannot have a local group as a member.
//

  ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER = 8518;
  {$EXTERNALSYM ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER}

//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
//
// MessageText:
//
//  A global group cannot have a cross-domain member.
//

  ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER = 8519;
  {$EXTERNALSYM ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER}

//
// MessageId: ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
//
// MessageText:
//
//  A local group cannot have another cross domain local group as a member.
//

  ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER = 8520;
  {$EXTERNALSYM ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER}

//
// MessageId: ERROR_DS_HAVE_PRIMARY_MEMBERS
//
// MessageText:
//
//  A group with primary members cannot change to a security-disabled group.
//

  ERROR_DS_HAVE_PRIMARY_MEMBERS = 8521;
  {$EXTERNALSYM ERROR_DS_HAVE_PRIMARY_MEMBERS}

//
// MessageId: ERROR_DS_STRING_SD_CONVERSION_FAILED
//
// MessageText:
//
//  The schema cache load failed to convert the string default SD on a class-schema object.
//

  ERROR_DS_STRING_SD_CONVERSION_FAILED = 8522;
  {$EXTERNALSYM ERROR_DS_STRING_SD_CONVERSION_FAILED}

//
// MessageId: ERROR_DS_NAMING_MASTER_GC
//
// MessageText:
//
//  Only DSAs configured to be Global Catalog servers should be allowed to hold the Domain Naming Master FSMO role.
//

  ERROR_DS_NAMING_MASTER_GC = 8523;
  {$EXTERNALSYM ERROR_DS_NAMING_MASTER_GC}

//
// MessageId: ERROR_DS_DNS_LOOKUP_FAILURE
//
// MessageText:
//
//  The DSA operation is unable to proceed because of a DNS lookup failure.
//

  ERROR_DS_DNS_LOOKUP_FAILURE = 8524;
  {$EXTERNALSYM ERROR_DS_DNS_LOOKUP_FAILURE}

//
// MessageId: ERROR_DS_COULDNT_UPDATE_SPNS
//
// MessageText:
//
//  While processing a change to the DNS Host Name for an object, the Service Principal Name values could not be kept in sync.
//

  ERROR_DS_COULDNT_UPDATE_SPNS = 8525;
  {$EXTERNALSYM ERROR_DS_COULDNT_UPDATE_SPNS}

//
// MessageId: ERROR_DS_CANT_RETRIEVE_SD
//
// MessageText:
//
//  The Security Descriptor attribute could not be read.
//

  ERROR_DS_CANT_RETRIEVE_SD = 8526;
  {$EXTERNALSYM ERROR_DS_CANT_RETRIEVE_SD}

//
// MessageId: ERROR_DS_KEY_NOT_UNIQUE
//
// MessageText:
//
//  The object requested was not found, but an object with that key was found.
//

  ERROR_DS_KEY_NOT_UNIQUE = 8527;
  {$EXTERNALSYM ERROR_DS_KEY_NOT_UNIQUE}

//
// MessageId: ERROR_DS_WRONG_LINKED_ATT_SYNTAX
//
// MessageText:
//
//  The syntax of the linked attribute being added is incorrect. Forward links can only have syntax 2.5.5.1, 2.5.5.7, and 2.5.5.14, and backlinks can only have syntax 2.5.5.1
//

  ERROR_DS_WRONG_LINKED_ATT_SYNTAX = 8528;
  {$EXTERNALSYM ERROR_DS_WRONG_LINKED_ATT_SYNTAX}

//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD
//
// MessageText:
//
//  Security Account Manager needs to get the boot password.
//

  ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD = 8529;
  {$EXTERNALSYM ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD}

//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY
//
// MessageText:
//
//  Security Account Manager needs to get the boot key from floppy disk.
//

  ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY = 8530;
  {$EXTERNALSYM ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY}

//
// MessageId: ERROR_DS_CANT_START
//
// MessageText:
//
//  Directory Service cannot start.
//

  ERROR_DS_CANT_START = 8531;
  {$EXTERNALSYM ERROR_DS_CANT_START}

//
// MessageId: ERROR_DS_INIT_FAILURE
//
// MessageText:
//
//  Directory Services could not start.
//

  ERROR_DS_INIT_FAILURE = 8532;
  {$EXTERNALSYM ERROR_DS_INIT_FAILURE}

//
// MessageId: ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION
//
// MessageText:
//
//  The connection between client and server requires packet privacy or better.
//

  ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION = 8533;
  {$EXTERNALSYM ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION}

//
// MessageId: ERROR_DS_SOURCE_DOMAIN_IN_FOREST
//
// MessageText:
//
//  The source domain may not be in the same forest as destination.
//

  ERROR_DS_SOURCE_DOMAIN_IN_FOREST = 8534;
  {$EXTERNALSYM ERROR_DS_SOURCE_DOMAIN_IN_FOREST}

//
// MessageId: ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST
//
// MessageText:
//
//  The destination domain must be in the forest.
//

  ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST = 8535;
  {$EXTERNALSYM ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST}

//
// MessageId: ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED
//
// MessageText:
//
//  The operation requires that destination domain auditing be enabled.
//

  ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED = 8536;
  {$EXTERNALSYM ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED}

//
// MessageId: ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN
//
// MessageText:
//
//  The operation couldn't locate a DC for the source domain.
//

  ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN = 8537;
  {$EXTERNALSYM ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN}

//
// MessageId: ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER
//
// MessageText:
//
//  The source object must be a group or user.
//

  ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER = 8538;
  {$EXTERNALSYM ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER}

//
// MessageId: ERROR_DS_SRC_SID_EXISTS_IN_FOREST
//
// MessageText:
//
//  The source object's SID already exists in destination forest.
//

  ERROR_DS_SRC_SID_EXISTS_IN_FOREST = 8539;
  {$EXTERNALSYM ERROR_DS_SRC_SID_EXISTS_IN_FOREST}

//
// MessageId: ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH
//
// MessageText:
//
//  The source and destination object must be of the same type.
//

  ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH = 8540;
  {$EXTERNALSYM ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH}

//
// MessageId: ERROR_SAM_INIT_FAILURE
//
// MessageText:
//
//  Security Accounts Manager initialization failed because of the following error: %1.
//  Error Status: 0x%2. Click OK to shut down the system and reboot into Safe Mode. Check the event log for detailed information.
//

  ERROR_SAM_INIT_FAILURE = 8541;
  {$EXTERNALSYM ERROR_SAM_INIT_FAILURE}

//
// MessageId: ERROR_DS_DRA_SCHEMA_INFO_SHIP
//
// MessageText:
//
//  Schema information could not be included in the replication request.
//

  ERROR_DS_DRA_SCHEMA_INFO_SHIP = 8542;
  {$EXTERNALSYM ERROR_DS_DRA_SCHEMA_INFO_SHIP}

//
// MessageId: ERROR_DS_DRA_SCHEMA_CONFLICT
//
// MessageText:
//
//  The replication operation could not be completed due to a schema
//  incompatibility.
//

  ERROR_DS_DRA_SCHEMA_CONFLICT = 8543;
  {$EXTERNALSYM ERROR_DS_DRA_SCHEMA_CONFLICT}

//
// MessageId: ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT
//
// MessageText:
//
//  The replication operation could not be completed due to a previous schema incompatibility.
//

  ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT = 8544;
  {$EXTERNALSYM ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT}

//
// MessageId: ERROR_DS_DRA_OBJ_NC_MISMATCH
//
// MessageText:
//
//  The replication update could not be applied because either the source or the destination has not yet received information regarding a recent cross-domain move operation.
//

  ERROR_DS_DRA_OBJ_NC_MISMATCH = 8545;
  {$EXTERNALSYM ERROR_DS_DRA_OBJ_NC_MISMATCH}

//
// MessageId: ERROR_DS_NC_STILL_HAS_DSAS
//
// MessageText:
//
//  The requested domain could not be deleted because there exist domain controllers that still host this domain.
//

  ERROR_DS_NC_STILL_HAS_DSAS = 8546;
  {$EXTERNALSYM ERROR_DS_NC_STILL_HAS_DSAS}

//
// MessageId: ERROR_DS_GC_REQUIRED
//
// MessageText:
//
//  The requested operation can be performed only on a global catalog server.
//

  ERROR_DS_GC_REQUIRED = 8547;
  {$EXTERNALSYM ERROR_DS_GC_REQUIRED}

//
// MessageId: ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
//
// MessageText:
//
//  A local group can only be a member of other local groups in the same domain.
//

  ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY = 8548;
  {$EXTERNALSYM ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY}

//
// MessageId: ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS
//
// MessageText:
//
//  Foreign security principals cannot be members of universal groups.
//

  ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS = 8549;
  {$EXTERNALSYM ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS}

//
// MessageId: ERROR_DS_CANT_ADD_TO_GC
//
// MessageText:
//
//  The attribute is not allowed to be replicated to the GC because of security reasons.
//

  ERROR_DS_CANT_ADD_TO_GC = 8550;
  {$EXTERNALSYM ERROR_DS_CANT_ADD_TO_GC}

//
// MessageId: ERROR_DS_NO_CHECKPOINT_WITH_PDC
//
// MessageText:
//
//  The checkpoint with the PDC could not be taken because there too many modifications being processed currently.
//

  ERROR_DS_NO_CHECKPOINT_WITH_PDC = 8551;
  {$EXTERNALSYM ERROR_DS_NO_CHECKPOINT_WITH_PDC}

//
// MessageId: ERROR_DS_SOURCE_AUDITING_NOT_ENABLED
//
// MessageText:
//
//  The operation requires that source domain auditing be enabled.
//

  ERROR_DS_SOURCE_AUDITING_NOT_ENABLED = 8552;
  {$EXTERNALSYM ERROR_DS_SOURCE_AUDITING_NOT_ENABLED}

//
// MessageId: ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC
//
// MessageText:
//
//  Security principal objects can only be created inside domain naming contexts.
//

  ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC = 8553;
  {$EXTERNALSYM ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC}

//
// MessageId: ERROR_DS_INVALID_NAME_FOR_SPN
//
// MessageText:
//
//  A Service Principal Name (SPN) could not be constructed because the provided hostname is not in the necessary format.
//

  ERROR_DS_INVALID_NAME_FOR_SPN = 8554;
  {$EXTERNALSYM ERROR_DS_INVALID_NAME_FOR_SPN}

//
// MessageId: ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS
//
// MessageText:
//
//  A Filter was passed that uses constructed attributes.
//

  ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS = 8555;
  {$EXTERNALSYM ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS}

//
// MessageId: ERROR_DS_UNICODEPWD_NOT_IN_QUOTES
//
// MessageText:
//
//  The unicodePwd attribute value must be enclosed in double quotes.
//

  ERROR_DS_UNICODEPWD_NOT_IN_QUOTES = 8556;
  {$EXTERNALSYM ERROR_DS_UNICODEPWD_NOT_IN_QUOTES}

//
// MessageId: ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
//
// MessageText:
//
//  Your computer could not be joined to the domain. You have exceeded the maximum number of computer accounts you are allowed to create in this domain. Contact your system administrator to have this limit reset or increased.
//

  ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED = 8557;
  {$EXTERNALSYM ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED}

//
// MessageId: ERROR_DS_MUST_BE_RUN_ON_DST_DC
//
// MessageText:
//
//  For security reasons, the operation must be run on the destination DC.
//

  ERROR_DS_MUST_BE_RUN_ON_DST_DC = 8558;
  {$EXTERNALSYM ERROR_DS_MUST_BE_RUN_ON_DST_DC}

//
// MessageId: ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER
//
// MessageText:
//
//  For security reasons, the source DC must be Service Pack 4 or greater.
//

  ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER = 8559;
  {$EXTERNALSYM ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER}

//
// MessageId: ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ
//
// MessageText:
//
//  Critical Directory Service System objects cannot be deleted during tree delete operations.  The tree delete may have been partially performed.
//

  ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ = 8560;
  {$EXTERNALSYM ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ}

///////////////////////////////////////////////////
//                                                /
//     End of Active Directory Error Codes        /
//                                                /
//                  8000 to  8999                 /
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//                  DNS Error Codes              //
//                                               //
//                   9000 to 9999                //
///////////////////////////////////////////////////

// =============================
// Facility DNS Error Messages
// =============================

//
//  DNS response codes.
//


  DNS_ERROR_RESPONSE_CODES_BASE = 9000;
  {$EXTERNALSYM DNS_ERROR_RESPONSE_CODES_BASE}


  DNS_ERROR_RCODE_NO_ERROR = NO_ERROR;
  {$EXTERNALSYM DNS_ERROR_RCODE_NO_ERROR}


  DNS_ERROR_MASK = $00002328; // 9000 or DNS_ERROR_RESPONSE_CODES_BASE
  {$EXTERNALSYM DNS_ERROR_MASK}

// DNS_ERROR_RCODE_FORMAT_ERROR          0x00002329
//
// MessageId: DNS_ERROR_RCODE_FORMAT_ERROR
//
// MessageText:
//
//  DNS server unable to interpret format.
//

  DNS_ERROR_RCODE_FORMAT_ERROR = 9001;
  {$EXTERNALSYM DNS_ERROR_RCODE_FORMAT_ERROR}

// DNS_ERROR_RCODE_SERVER_FAILURE        0x0000232a
//
// MessageId: DNS_ERROR_RCODE_SERVER_FAILURE
//
// MessageText:
//
//  DNS server failure.
//

  DNS_ERROR_RCODE_SERVER_FAILURE = 9002;
  {$EXTERNALSYM DNS_ERROR_RCODE_SERVER_FAILURE}

// DNS_ERROR_RCODE_NAME_ERROR            0x0000232b
//
// MessageId: DNS_ERROR_RCODE_NAME_ERROR
//
// MessageText:
//
//  DNS name does not exist.
//

  DNS_ERROR_RCODE_NAME_ERROR = 9003;
  {$EXTERNALSYM DNS_ERROR_RCODE_NAME_ERROR}

// DNS_ERROR_RCODE_NOT_IMPLEMENTED       0x0000232c
//
// MessageId: DNS_ERROR_RCODE_NOT_IMPLEMENTED
//
// MessageText:
//
//  DNS request not supported by name server.
//

  DNS_ERROR_RCODE_NOT_IMPLEMENTED = 9004;
  {$EXTERNALSYM DNS_ERROR_RCODE_NOT_IMPLEMENTED}

// DNS_ERROR_RCODE_REFUSED               0x0000232d
//
// MessageId: DNS_ERROR_RCODE_REFUSED
//
// MessageText:
//
//  DNS operation refused.
//

  DNS_ERROR_RCODE_REFUSED = 9005;
  {$EXTERNALSYM DNS_ERROR_RCODE_REFUSED}

// DNS_ERROR_RCODE_YXDOMAIN              0x0000232e
//
// MessageId: DNS_ERROR_RCODE_YXDOMAIN
//
// MessageText:
//
//  DNS name that ought not exist, does exist.
//

  DNS_ERROR_RCODE_YXDOMAIN = 9006;
  {$EXTERNALSYM DNS_ERROR_RCODE_YXDOMAIN}

// DNS_ERROR_RCODE_YXRRSET               0x0000232f
//
// MessageId: DNS_ERROR_RCODE_YXRRSET
//
// MessageText:
//
//  DNS RR set that ought not exist, does exist.
//

  DNS_ERROR_RCODE_YXRRSET = 9007;
  {$EXTERNALSYM DNS_ERROR_RCODE_YXRRSET}

// DNS_ERROR_RCODE_NXRRSET               0x00002330
//
// MessageId: DNS_ERROR_RCODE_NXRRSET
//
// MessageText:
//
//  DNS RR set that ought to exist, does not exist.
//

  DNS_ERROR_RCODE_NXRRSET = 9008;
  {$EXTERNALSYM DNS_ERROR_RCODE_NXRRSET}

// DNS_ERROR_RCODE_NOTAUTH               0x00002331
//
// MessageId: DNS_ERROR_RCODE_NOTAUTH
//
// MessageText:
//
//  DNS server not authoritative for zone.
//

  DNS_ERROR_RCODE_NOTAUTH = 9009;
  {$EXTERNALSYM DNS_ERROR_RCODE_NOTAUTH}

// DNS_ERROR_RCODE_NOTZONE               0x00002332
//
// MessageId: DNS_ERROR_RCODE_NOTZONE
//
// MessageText:
//
//  DNS name in update or prereq is not in zone.
//

  DNS_ERROR_RCODE_NOTZONE = 9010;
  {$EXTERNALSYM DNS_ERROR_RCODE_NOTZONE}

// DNS_ERROR_RCODE_BADSIG                0x00002338
//
// MessageId: DNS_ERROR_RCODE_BADSIG
//
// MessageText:
//
//  DNS signature failed to verify.
//

  DNS_ERROR_RCODE_BADSIG = 9016;
  {$EXTERNALSYM DNS_ERROR_RCODE_BADSIG}

// DNS_ERROR_RCODE_BADKEY                0x00002339
//
// MessageId: DNS_ERROR_RCODE_BADKEY
//
// MessageText:
//
//  DNS bad key.
//

  DNS_ERROR_RCODE_BADKEY = 9017;
  {$EXTERNALSYM DNS_ERROR_RCODE_BADKEY}

// DNS_ERROR_RCODE_BADTIME               0x0000233a
//
// MessageId: DNS_ERROR_RCODE_BADTIME
//
// MessageText:
//
//  DNS signature validity expired.
//

  DNS_ERROR_RCODE_BADTIME = 9018;
  {$EXTERNALSYM DNS_ERROR_RCODE_BADTIME}


  DNS_ERROR_RCODE_LAST = DNS_ERROR_RCODE_BADTIME;
  {$EXTERNALSYM DNS_ERROR_RCODE_LAST}


//
//  Packet format
//


  DNS_ERROR_PACKET_FMT_BASE = 9500;
  {$EXTERNALSYM DNS_ERROR_PACKET_FMT_BASE}

// DNS_INFO_NO_RECORDS                   0x0000251d
//
// MessageId: DNS_INFO_NO_RECORDS
//
// MessageText:
//
//  No records found for given DNS query.
//

  DNS_INFO_NO_RECORDS = 9501;
  {$EXTERNALSYM DNS_INFO_NO_RECORDS}

// DNS_ERROR_BAD_PACKET                  0x0000251e
//
// MessageId: DNS_ERROR_BAD_PACKET
//
// MessageText:
//
//  Bad DNS packet.
//

  DNS_ERROR_BAD_PACKET = 9502;
  {$EXTERNALSYM DNS_ERROR_BAD_PACKET}

// DNS_ERROR_NO_PACKET                   0x0000251f
//
// MessageId: DNS_ERROR_NO_PACKET
//
// MessageText:
//
//  No DNS packet.
//

  DNS_ERROR_NO_PACKET = 9503;
  {$EXTERNALSYM DNS_ERROR_NO_PACKET}

// DNS_ERROR_RCODE                       0x00002520
//
// MessageId: DNS_ERROR_RCODE
//
// MessageText:
//
//  DNS error, check rcode.
//

  DNS_ERROR_RCODE = 9504;
  {$EXTERNALSYM DNS_ERROR_RCODE}

// DNS_ERROR_UNSECURE_PACKET             0x00002521
//
// MessageId: DNS_ERROR_UNSECURE_PACKET
//
// MessageText:
//
//  Unsecured DNS packet.
//

  DNS_ERROR_UNSECURE_PACKET = 9505;
  {$EXTERNALSYM DNS_ERROR_UNSECURE_PACKET}


  DNS_STATUS_PACKET_UNSECURE = DNS_ERROR_UNSECURE_PACKET;
  {$EXTERNALSYM DNS_STATUS_PACKET_UNSECURE}


//
//  General API errors
//


  DNS_ERROR_NO_MEMORY = ERROR_OUTOFMEMORY;
  {$EXTERNALSYM DNS_ERROR_NO_MEMORY}

  DNS_ERROR_INVALID_NAME = ERROR_INVALID_NAME;
  {$EXTERNALSYM DNS_ERROR_INVALID_NAME}

  DNS_ERROR_INVALID_DATA = ERROR_INVALID_DATA;
  {$EXTERNALSYM DNS_ERROR_INVALID_DATA}


  DNS_ERROR_GENERAL_API_BASE = 9550;
  {$EXTERNALSYM DNS_ERROR_GENERAL_API_BASE}

// DNS_ERROR_INVALID_TYPE                0x0000254f
//
// MessageId: DNS_ERROR_INVALID_TYPE
//
// MessageText:
//
//  Invalid DNS type.
//

  DNS_ERROR_INVALID_TYPE = 9551;
  {$EXTERNALSYM DNS_ERROR_INVALID_TYPE}

// DNS_ERROR_INVALID_IP_ADDRESS          0x00002550
//
// MessageId: DNS_ERROR_INVALID_IP_ADDRESS
//
// MessageText:
//
//  Invalid IP address.
//

  DNS_ERROR_INVALID_IP_ADDRESS = 9552;
  {$EXTERNALSYM DNS_ERROR_INVALID_IP_ADDRESS}

// DNS_ERROR_INVALID_PROPERTY            0x00002551
//
// MessageId: DNS_ERROR_INVALID_PROPERTY
//
// MessageText:
//
//  Invalid property.
//

  DNS_ERROR_INVALID_PROPERTY = 9553;
  {$EXTERNALSYM DNS_ERROR_INVALID_PROPERTY}

// DNS_ERROR_TRY_AGAIN_LATER             0x00002552
//
// MessageId: DNS_ERROR_TRY_AGAIN_LATER
//
// MessageText:
//
//  Try DNS operation again later.
//

  DNS_ERROR_TRY_AGAIN_LATER = 9554;
  {$EXTERNALSYM DNS_ERROR_TRY_AGAIN_LATER}

// DNS_ERROR_NOT_UNIQUE                  0x00002553
//
// MessageId: DNS_ERROR_NOT_UNIQUE
//
// MessageText:
//
//  Record for given name and type is not unique.
//

  DNS_ERROR_NOT_UNIQUE = 9555;
  {$EXTERNALSYM DNS_ERROR_NOT_UNIQUE}

// DNS_ERROR_NON_RFC_NAME                0x00002554
//
// MessageId: DNS_ERROR_NON_RFC_NAME
//
// MessageText:
//
//  DNS name does not comply with RFC specifications.
//

  DNS_ERROR_NON_RFC_NAME = 9556;
  {$EXTERNALSYM DNS_ERROR_NON_RFC_NAME}

// DNS_STATUS_FQDN                       0x00002555
//
// MessageId: DNS_STATUS_FQDN
//
// MessageText:
//
//  DNS name is a fully-qualified DNS name.
//

  DNS_STATUS_FQDN = 9557;
  {$EXTERNALSYM DNS_STATUS_FQDN}

// DNS_STATUS_DOTTED_NAME                0x00002556
//
// MessageId: DNS_STATUS_DOTTED_NAME
//
// MessageText:
//
//  DNS name is dotted (multi-label).
//

  DNS_STATUS_DOTTED_NAME = 9558;
  {$EXTERNALSYM DNS_STATUS_DOTTED_NAME}

// DNS_STATUS_SINGLE_PART_NAME           0x00002557
//
// MessageId: DNS_STATUS_SINGLE_PART_NAME
//
// MessageText:
//
//  DNS name is a single-part name.
//

  DNS_STATUS_SINGLE_PART_NAME = 9559;
  {$EXTERNALSYM DNS_STATUS_SINGLE_PART_NAME}

// DNS_ERROR_INVALID_NAME_CHAR           0x00002558
//
// MessageId: DNS_ERROR_INVALID_NAME_CHAR
//
// MessageText:
//
//  DNS name contains an invalid character.
//

  DNS_ERROR_INVALID_NAME_CHAR = 9560;
  {$EXTERNALSYM DNS_ERROR_INVALID_NAME_CHAR}

// DNS_ERROR_NUMERIC_NAME                0x00002559
//
// MessageId: DNS_ERROR_NUMERIC_NAME
//
// MessageText:
//
//  DNS name is entirely numeric.
//

  DNS_ERROR_NUMERIC_NAME = 9561;
  {$EXTERNALSYM DNS_ERROR_NUMERIC_NAME}


//
//  Zone errors
//


  DNS_ERROR_ZONE_BASE = 9600;
  {$EXTERNALSYM DNS_ERROR_ZONE_BASE}

// DNS_ERROR_ZONE_DOES_NOT_EXIST         0x00002581
//
// MessageId: DNS_ERROR_ZONE_DOES_NOT_EXIST
//
// MessageText:
//
//  DNS zone does not exist.
//

  DNS_ERROR_ZONE_DOES_NOT_EXIST = 9601;
  {$EXTERNALSYM DNS_ERROR_ZONE_DOES_NOT_EXIST}

// DNS_ERROR_NO_ZONE_INFO                0x00002582
//
// MessageId: DNS_ERROR_NO_ZONE_INFO
//
// MessageText:
//
//  DNS zone information not available.
//

  DNS_ERROR_NO_ZONE_INFO = 9602;
  {$EXTERNALSYM DNS_ERROR_NO_ZONE_INFO}

// DNS_ERROR_INVALID_ZONE_OPERATION      0x00002583
//
// MessageId: DNS_ERROR_INVALID_ZONE_OPERATION
//
// MessageText:
//
//  Invalid operation for DNS zone.
//

  DNS_ERROR_INVALID_ZONE_OPERATION = 9603;
  {$EXTERNALSYM DNS_ERROR_INVALID_ZONE_OPERATION}

// DNS_ERROR_ZONE_CONFIGURATION_ERROR    0x00002584
//
// MessageId: DNS_ERROR_ZONE_CONFIGURATION_ERROR
//
// MessageText:
//
//  Invalid DNS zone configuration.
//

  DNS_ERROR_ZONE_CONFIGURATION_ERROR = 9604;
  {$EXTERNALSYM DNS_ERROR_ZONE_CONFIGURATION_ERROR}

// DNS_ERROR_ZONE_HAS_NO_SOA_RECORD      0x00002585
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_SOA_RECORD
//
// MessageText:
//
//  DNS zone has no start of authority (SOA) record.
//

  DNS_ERROR_ZONE_HAS_NO_SOA_RECORD = 9605;
  {$EXTERNALSYM DNS_ERROR_ZONE_HAS_NO_SOA_RECORD}

// DNS_ERROR_ZONE_HAS_NO_NS_RECORDS      0x00002586
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_NS_RECORDS
//
// MessageText:
//
//  DNS zone has no Name Server (NS) record.
//

  DNS_ERROR_ZONE_HAS_NO_NS_RECORDS = 9606;
  {$EXTERNALSYM DNS_ERROR_ZONE_HAS_NO_NS_RECORDS}

// DNS_ERROR_ZONE_LOCKED                 0x00002587
//
// MessageId: DNS_ERROR_ZONE_LOCKED
//
// MessageText:
//
//  DNS zone is locked.
//

  DNS_ERROR_ZONE_LOCKED = 9607;
  {$EXTERNALSYM DNS_ERROR_ZONE_LOCKED}

// DNS_ERROR_ZONE_CREATION_FAILED        0x00002588
//
// MessageId: DNS_ERROR_ZONE_CREATION_FAILED
//
// MessageText:
//
//  DNS zone creation failed.
//

  DNS_ERROR_ZONE_CREATION_FAILED = 9608;
  {$EXTERNALSYM DNS_ERROR_ZONE_CREATION_FAILED}

// DNS_ERROR_ZONE_ALREADY_EXISTS         0x00002589
//
// MessageId: DNS_ERROR_ZONE_ALREADY_EXISTS
//
// MessageText:
//
//  DNS zone already exists.
//

  DNS_ERROR_ZONE_ALREADY_EXISTS = 9609;
  {$EXTERNALSYM DNS_ERROR_ZONE_ALREADY_EXISTS}

// DNS_ERROR_AUTOZONE_ALREADY_EXISTS     0x0000258a
//
// MessageId: DNS_ERROR_AUTOZONE_ALREADY_EXISTS
//
// MessageText:
//
//  DNS automatic zone already exists.
//

  DNS_ERROR_AUTOZONE_ALREADY_EXISTS = 9610;
  {$EXTERNALSYM DNS_ERROR_AUTOZONE_ALREADY_EXISTS}

// DNS_ERROR_INVALID_ZONE_TYPE           0x0000258b
//
// MessageId: DNS_ERROR_INVALID_ZONE_TYPE
//
// MessageText:
//
//  Invalid DNS zone type.
//

  DNS_ERROR_INVALID_ZONE_TYPE = 9611;
  {$EXTERNALSYM DNS_ERROR_INVALID_ZONE_TYPE}

// DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP 0x0000258c
//
// MessageId: DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP
//
// MessageText:
//
//  Secondary DNS zone requires master IP address.
//

  DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP = 9612;
  {$EXTERNALSYM DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP}

// DNS_ERROR_ZONE_NOT_SECONDARY          0x0000258d
//
// MessageId: DNS_ERROR_ZONE_NOT_SECONDARY
//
// MessageText:
//
//  DNS zone not secondary.
//

  DNS_ERROR_ZONE_NOT_SECONDARY = 9613;
  {$EXTERNALSYM DNS_ERROR_ZONE_NOT_SECONDARY}

// DNS_ERROR_NEED_SECONDARY_ADDRESSES    0x0000258e
//
// MessageId: DNS_ERROR_NEED_SECONDARY_ADDRESSES
//
// MessageText:
//
//  Need secondary IP address.
//

  DNS_ERROR_NEED_SECONDARY_ADDRESSES = 9614;
  {$EXTERNALSYM DNS_ERROR_NEED_SECONDARY_ADDRESSES}

// DNS_ERROR_WINS_INIT_FAILED            0x0000258f
//
// MessageId: DNS_ERROR_WINS_INIT_FAILED
//
// MessageText:
//
//  WINS initialization failed.
//

  DNS_ERROR_WINS_INIT_FAILED = 9615;
  {$EXTERNALSYM DNS_ERROR_WINS_INIT_FAILED}

// DNS_ERROR_NEED_WINS_SERVERS           0x00002590
//
// MessageId: DNS_ERROR_NEED_WINS_SERVERS
//
// MessageText:
//
//  Need WINS servers.
//

  DNS_ERROR_NEED_WINS_SERVERS = 9616;
  {$EXTERNALSYM DNS_ERROR_NEED_WINS_SERVERS}

// DNS_ERROR_NBSTAT_INIT_FAILED          0x00002591
//
// MessageId: DNS_ERROR_NBSTAT_INIT_FAILED
//
// MessageText:
//
//  NBTSTAT initialization call failed.
//

  DNS_ERROR_NBSTAT_INIT_FAILED = 9617;
  {$EXTERNALSYM DNS_ERROR_NBSTAT_INIT_FAILED}

// DNS_ERROR_SOA_DELETE_INVALID          0x00002592
//
// MessageId: DNS_ERROR_SOA_DELETE_INVALID
//
// MessageText:
//
//  Invalid delete of start of authority (SOA)
//

  DNS_ERROR_SOA_DELETE_INVALID = 9618;
  {$EXTERNALSYM DNS_ERROR_SOA_DELETE_INVALID}


//
//  Datafile errors
//


  DNS_ERROR_DATAFILE_BASE = 9650;
  {$EXTERNALSYM DNS_ERROR_DATAFILE_BASE}

// DNS                                   0x000025b3
//
// MessageId: DNS_ERROR_PRIMARY_REQUIRES_DATAFILE
//
// MessageText:
//
//  Primary DNS zone requires datafile.
//

  DNS_ERROR_PRIMARY_REQUIRES_DATAFILE = 9651;
  {$EXTERNALSYM DNS_ERROR_PRIMARY_REQUIRES_DATAFILE}

// DNS                                   0x000025b4
//
// MessageId: DNS_ERROR_INVALID_DATAFILE_NAME
//
// MessageText:
//
//  Invalid datafile name for DNS zone.
//

  DNS_ERROR_INVALID_DATAFILE_NAME = 9652;
  {$EXTERNALSYM DNS_ERROR_INVALID_DATAFILE_NAME}

// DNS                                   0x000025b5
//
// MessageId: DNS_ERROR_DATAFILE_OPEN_FAILURE
//
// MessageText:
//
//  Failed to open datafile for DNS zone.
//

  DNS_ERROR_DATAFILE_OPEN_FAILURE = 9653;
  {$EXTERNALSYM DNS_ERROR_DATAFILE_OPEN_FAILURE}

// DNS                                   0x000025b6
//
// MessageId: DNS_ERROR_FILE_WRITEBACK_FAILED
//
// MessageText:
//
//  Failed to write datafile for DNS zone.
//

  DNS_ERROR_FILE_WRITEBACK_FAILED = 9654;
  {$EXTERNALSYM DNS_ERROR_FILE_WRITEBACK_FAILED}

// DNS                                   0x000025b7
//
// MessageId: DNS_ERROR_DATAFILE_PARSING
//
// MessageText:
//
//  Failure while reading datafile for DNS zone.
//

  DNS_ERROR_DATAFILE_PARSING = 9655;
  {$EXTERNALSYM DNS_ERROR_DATAFILE_PARSING}


//
//  Database errors
//


  DNS_ERROR_DATABASE_BASE = 9700;
  {$EXTERNALSYM DNS_ERROR_DATABASE_BASE}

// DNS_ERROR_RECORD_DOES_NOT_EXIST       0x000025e5
//
// MessageId: DNS_ERROR_RECORD_DOES_NOT_EXIST
//
// MessageText:
//
//  DNS record does not exist.
//

  DNS_ERROR_RECORD_DOES_NOT_EXIST = 9701;
  {$EXTERNALSYM DNS_ERROR_RECORD_DOES_NOT_EXIST}

// DNS_ERROR_RECORD_FORMAT               0x000025e6
//
// MessageId: DNS_ERROR_RECORD_FORMAT
//
// MessageText:
//
//  DNS record format error.
//

  DNS_ERROR_RECORD_FORMAT = 9702;
  {$EXTERNALSYM DNS_ERROR_RECORD_FORMAT}

// DNS_ERROR_NODE_CREATION_FAILED        0x000025e7
//
// MessageId: DNS_ERROR_NODE_CREATION_FAILED
//
// MessageText:
//
//  Node creation failure in DNS.
//

  DNS_ERROR_NODE_CREATION_FAILED = 9703;
  {$EXTERNALSYM DNS_ERROR_NODE_CREATION_FAILED}

// DNS_ERROR_UNKNOWN_RECORD_TYPE         0x000025e8
//
// MessageId: DNS_ERROR_UNKNOWN_RECORD_TYPE
//
// MessageText:
//
//  Unknown DNS record type.
//

  DNS_ERROR_UNKNOWN_RECORD_TYPE = 9704;
  {$EXTERNALSYM DNS_ERROR_UNKNOWN_RECORD_TYPE}

// DNS_ERROR_RECORD_TIMED_OUT            0x000025e9
//
// MessageId: DNS_ERROR_RECORD_TIMED_OUT
//
// MessageText:
//
//  DNS record timed out.
//

  DNS_ERROR_RECORD_TIMED_OUT = 9705;
  {$EXTERNALSYM DNS_ERROR_RECORD_TIMED_OUT}

// DNS_ERROR_NAME_NOT_IN_ZONE            0x000025ea
//
// MessageId: DNS_ERROR_NAME_NOT_IN_ZONE
//
// MessageText:
//
//  Name not in DNS zone.
//

  DNS_ERROR_NAME_NOT_IN_ZONE = 9706;
  {$EXTERNALSYM DNS_ERROR_NAME_NOT_IN_ZONE}

// DNS_ERROR_CNAME_LOOP                  0x000025eb
//
// MessageId: DNS_ERROR_CNAME_LOOP
//
// MessageText:
//
//  CNAME loop detected.
//

  DNS_ERROR_CNAME_LOOP = 9707;
  {$EXTERNALSYM DNS_ERROR_CNAME_LOOP}

// DNS_ERROR_NODE_IS_CNAME               0x000025ec
//
// MessageId: DNS_ERROR_NODE_IS_CNAME
//
// MessageText:
//
//  Node is a CNAME DNS record.
//

  DNS_ERROR_NODE_IS_CNAME = 9708;
  {$EXTERNALSYM DNS_ERROR_NODE_IS_CNAME}

// DNS_ERROR_CNAME_COLLISION             0x000025ed
//
// MessageId: DNS_ERROR_CNAME_COLLISION
//
// MessageText:
//
//  A CNAME record already exists for given name.
//

  DNS_ERROR_CNAME_COLLISION = 9709;
  {$EXTERNALSYM DNS_ERROR_CNAME_COLLISION}

// DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT    0x000025ee
//
// MessageId: DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT
//
// MessageText:
//
//  Record only at DNS zone root.
//

  DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT = 9710;
  {$EXTERNALSYM DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT}

// DNS_ERROR_RECORD_ALREADY_EXISTS       0x000025ef
//
// MessageId: DNS_ERROR_RECORD_ALREADY_EXISTS
//
// MessageText:
//
//  DNS record already exists.
//

  DNS_ERROR_RECORD_ALREADY_EXISTS = 9711;
  {$EXTERNALSYM DNS_ERROR_RECORD_ALREADY_EXISTS}

// DNS_ERROR_SECONDARY_DATA              0x000025f0
//
// MessageId: DNS_ERROR_SECONDARY_DATA
//
// MessageText:
//
//  Secondary DNS zone data error.
//

  DNS_ERROR_SECONDARY_DATA = 9712;
  {$EXTERNALSYM DNS_ERROR_SECONDARY_DATA}

// DNS_ERROR_NO_CREATE_CACHE_DATA        0x000025f1
//
// MessageId: DNS_ERROR_NO_CREATE_CACHE_DATA
//
// MessageText:
//
//  Could not create DNS cache data.
//

  DNS_ERROR_NO_CREATE_CACHE_DATA = 9713;
  {$EXTERNALSYM DNS_ERROR_NO_CREATE_CACHE_DATA}

// DNS_ERROR_NAME_DOES_NOT_EXIST         0x000025f2
//
// MessageId: DNS_ERROR_NAME_DOES_NOT_EXIST
//
// MessageText:
//
//  DNS name does not exist.
//

  DNS_ERROR_NAME_DOES_NOT_EXIST = 9714;
  {$EXTERNALSYM DNS_ERROR_NAME_DOES_NOT_EXIST}

// DNS_WARNING_PTR_CREATE_FAILED         0x000025f3
//
// MessageId: DNS_WARNING_PTR_CREATE_FAILED
//
// MessageText:
//
//  Could not create pointer (PTR) record.
//

  DNS_WARNING_PTR_CREATE_FAILED = 9715;
  {$EXTERNALSYM DNS_WARNING_PTR_CREATE_FAILED}

// DNS_WARNING_DOMAIN_UNDELETED          0x000025f4
//
// MessageId: DNS_WARNING_DOMAIN_UNDELETED
//
// MessageText:
//
//  DNS domain was undeleted.
//

  DNS_WARNING_DOMAIN_UNDELETED = 9716;
  {$EXTERNALSYM DNS_WARNING_DOMAIN_UNDELETED}

// DNS_ERROR_DS_UNAVAILABLE              0x000025f5
//
// MessageId: DNS_ERROR_DS_UNAVAILABLE
//
// MessageText:
//
//  The directory service is unavailable.
//

  DNS_ERROR_DS_UNAVAILABLE = 9717;
  {$EXTERNALSYM DNS_ERROR_DS_UNAVAILABLE}

// DNS_ERROR_DS_ZONE_ALREADY_EXISTS      0x000025f6
//
// MessageId: DNS_ERROR_DS_ZONE_ALREADY_EXISTS
//
// MessageText:
//
//  DNS zone already exists in the directory service.
//

  DNS_ERROR_DS_ZONE_ALREADY_EXISTS = 9718;
  {$EXTERNALSYM DNS_ERROR_DS_ZONE_ALREADY_EXISTS}

// DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE      0x000025f7
//
// MessageId: DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE
//
// MessageText:
//
//  DNS server not creating or reading the boot file for the directory service integrated DNS zone.
//

  DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE = 9719;
  {$EXTERNALSYM DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE}


//
//  Operation errors
//


  DNS_ERROR_OPERATION_BASE = 9750;
  {$EXTERNALSYM DNS_ERROR_OPERATION_BASE}

// DNS_INFO_AXFR_COMPLETE                0x00002617
//
// MessageId: DNS_INFO_AXFR_COMPLETE
//
// MessageText:
//
//  DNS AXFR (zone transfer) complete.
//

  DNS_INFO_AXFR_COMPLETE = 9751;
  {$EXTERNALSYM DNS_INFO_AXFR_COMPLETE}

// DNS_ERROR_AXFR                        0x00002618
//
// MessageId: DNS_ERROR_AXFR
//
// MessageText:
//
//  DNS zone transfer failed.
//

  DNS_ERROR_AXFR = 9752;
  {$EXTERNALSYM DNS_ERROR_AXFR}

// DNS_INFO_ADDED_LOCAL_WINS             0x00002619
//
// MessageId: DNS_INFO_ADDED_LOCAL_WINS
//
// MessageText:
//
//  Added local WINS server.
//

  DNS_INFO_ADDED_LOCAL_WINS = 9753;
  {$EXTERNALSYM DNS_INFO_ADDED_LOCAL_WINS}


//
//  Secure update
//


  DNS_ERROR_SECURE_BASE = 9800;
  {$EXTERNALSYM DNS_ERROR_SECURE_BASE}

// DNS_STATUS_CONTINUE_NEEDED            0x00002649
//
// MessageId: DNS_STATUS_CONTINUE_NEEDED
//
// MessageText:
//
//  Secure update call needs to continue update request.
//

  DNS_STATUS_CONTINUE_NEEDED = 9801;
  {$EXTERNALSYM DNS_STATUS_CONTINUE_NEEDED}


//
//  Setup errors
//


  DNS_ERROR_SETUP_BASE = 9850;
  {$EXTERNALSYM DNS_ERROR_SETUP_BASE}

// DNS_ERROR_NO_TCPIP                    0x0000267b
//
// MessageId: DNS_ERROR_NO_TCPIP
//
// MessageText:
//
//  TCP/IP network protocol not installed.
//

  DNS_ERROR_NO_TCPIP = 9851;
  {$EXTERNALSYM DNS_ERROR_NO_TCPIP}

// DNS_ERROR_NO_DNS_SERVERS              0x0000267c
//
// MessageId: DNS_ERROR_NO_DNS_SERVERS
//
// MessageText:
//
//  No DNS servers configured for local system.
//

  DNS_ERROR_NO_DNS_SERVERS = 9852;
  {$EXTERNALSYM DNS_ERROR_NO_DNS_SERVERS}

///////////////////////////////////////////////////
//                                               //
//             End of DNS Error Codes            //
//                                               //
//                  9000 to 9999                 //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//               WinSock Error Codes             //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////

//
// WinSock error codes are also defined in WinSock.h
// and WinSock2.h, hence the IFDEF
//

  WSABASEERR = 10000;
  {$EXTERNALSYM WSABASEERR}

//
// MessageId: WSAEINTR
//
// MessageText:
//
//  A blocking operation was interrupted by a call to WSACancelBlockingCall.
//

  WSAEINTR = 10004;
  {$EXTERNALSYM WSAEINTR}

//
// MessageId: WSAEBADF
//
// MessageText:
//
//  The file handle supplied is not valid.
//

  WSAEBADF = 10009;
  {$EXTERNALSYM WSAEBADF}

//
// MessageId: WSAEACCES
//
// MessageText:
//
//  An attempt was made to access a socket in a way forbidden by its access permissions.
//

  WSAEACCES = 10013;
  {$EXTERNALSYM WSAEACCES}

//
// MessageId: WSAEFAULT
//
// MessageText:
//
//  The system detected an invalid pointer address in attempting to use a pointer argument in a call.
//

  WSAEFAULT = 10014;
  {$EXTERNALSYM WSAEFAULT}

//
// MessageId: WSAEINVAL
//
// MessageText:
//
//  An invalid argument was supplied.
//

  WSAEINVAL = 10022;
  {$EXTERNALSYM WSAEINVAL}

//
// MessageId: WSAEMFILE
//
// MessageText:
//
//  Too many open sockets.
//

  WSAEMFILE = 10024;
  {$EXTERNALSYM WSAEMFILE}

//
// MessageId: WSAEWOULDBLOCK
//
// MessageText:
//
//  A non-blocking socket operation could not be completed immediately.
//

  WSAEWOULDBLOCK = 10035;
  {$EXTERNALSYM WSAEWOULDBLOCK}

//
// MessageId: WSAEINPROGRESS
//
// MessageText:
//
//  A blocking operation is currently executing.
//

  WSAEINPROGRESS = 10036;
  {$EXTERNALSYM WSAEINPROGRESS}

//
// MessageId: WSAEALREADY
//
// MessageText:
//
//  An operation was attempted on a non-blocking socket that already had an operation in progress.
//

  WSAEALREADY = 10037;
  {$EXTERNALSYM WSAEALREADY}

//
// MessageId: WSAENOTSOCK
//
// MessageText:
//
//  An operation was attempted on something that is not a socket.
//

  WSAENOTSOCK = 10038;
  {$EXTERNALSYM WSAENOTSOCK}

//
// MessageId: WSAEDESTADDRREQ
//
// MessageText:
//
//  A required address was omitted from an operation on a socket.
//

  WSAEDESTADDRREQ = 10039;
  {$EXTERNALSYM WSAEDESTADDRREQ}

//
// MessageId: WSAEMSGSIZE
//
// MessageText:
//
//  A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram into was smaller than the datagram itself.
//

  WSAEMSGSIZE = 10040;
  {$EXTERNALSYM WSAEMSGSIZE}

//
// MessageId: WSAEPROTOTYPE
//
// MessageText:
//
//  A protocol was specified in the socket function call that does not support the semantics of the socket type requested.
//

  WSAEPROTOTYPE = 10041;
  {$EXTERNALSYM WSAEPROTOTYPE}

//
// MessageId: WSAENOPROTOOPT
//
// MessageText:
//
//  An unknown, invalid, or unsupported option or level was specified in a getsockopt or setsockopt call.
//

  WSAENOPROTOOPT = 10042;
  {$EXTERNALSYM WSAENOPROTOOPT}

//
// MessageId: WSAEPROTONOSUPPORT
//
// MessageText:
//
//  The requested protocol has not been configured into the system, or no implementation for it exists.
//

  WSAEPROTONOSUPPORT = 10043;
  {$EXTERNALSYM WSAEPROTONOSUPPORT}

//
// MessageId: WSAESOCKTNOSUPPORT
//
// MessageText:
//
//  The support for the specified socket type does not exist in this address family.
//

  WSAESOCKTNOSUPPORT = 10044;
  {$EXTERNALSYM WSAESOCKTNOSUPPORT}

//
// MessageId: WSAEOPNOTSUPP
//
// MessageText:
//
//  The attempted operation is not supported for the type of object referenced.
//

  WSAEOPNOTSUPP = 10045;
  {$EXTERNALSYM WSAEOPNOTSUPP}

//
// MessageId: WSAEPFNOSUPPORT
//
// MessageText:
//
//  The protocol family has not been configured into the system or no implementation for it exists.
//

  WSAEPFNOSUPPORT = 10046;
  {$EXTERNALSYM WSAEPFNOSUPPORT}

//
// MessageId: WSAEAFNOSUPPORT
//
// MessageText:
//
//  An address incompatible with the requested protocol was used.
//

  WSAEAFNOSUPPORT = 10047;
  {$EXTERNALSYM WSAEAFNOSUPPORT}

//
// MessageId: WSAEADDRINUSE
//
// MessageText:
//
//  Only one usage of each socket address (protocol/network address/port)
//  is normally permitted.
//

  WSAEADDRINUSE = 10048;
  {$EXTERNALSYM WSAEADDRINUSE}

//
// MessageId: WSAEADDRNOTAVAIL
//
// MessageText:
//
//  The requested address is not valid in its context.
//

  WSAEADDRNOTAVAIL = 10049;
  {$EXTERNALSYM WSAEADDRNOTAVAIL}

//
// MessageId: WSAENETDOWN
//
// MessageText:
//
//  A socket operation encountered a dead network.
//

  WSAENETDOWN = 10050;
  {$EXTERNALSYM WSAENETDOWN}

//
// MessageId: WSAENETUNREACH
//
// MessageText:
//
//  A socket operation was attempted to an unreachable network.
//

  WSAENETUNREACH = 10051;
  {$EXTERNALSYM WSAENETUNREACH}

//
// MessageId: WSAENETRESET
//
// MessageText:
//
//  The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress.
//

  WSAENETRESET = 10052;
  {$EXTERNALSYM WSAENETRESET}

//
// MessageId: WSAECONNABORTED
//
// MessageText:
//
//  An established connection was aborted by the software in your host machine.
//

  WSAECONNABORTED = 10053;
  {$EXTERNALSYM WSAECONNABORTED}

//
// MessageId: WSAECONNRESET
//
// MessageText:
//
//  An existing connection was forcibly closed by the remote host.
//

  WSAECONNRESET = 10054;
  {$EXTERNALSYM WSAECONNRESET}

//
// MessageId: WSAENOBUFS
//
// MessageText:
//
//  An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
//

  WSAENOBUFS = 10055;
  {$EXTERNALSYM WSAENOBUFS}

//
// MessageId: WSAEISCONN
//
// MessageText:
//
//  A connect request was made on an already connected socket.
//

  WSAEISCONN = 10056;
  {$EXTERNALSYM WSAEISCONN}

//
// MessageId: WSAENOTCONN
//
// MessageText:
//
//  A request to send or receive data was disallowed because the socket is not connected and (when sending on a datagram socket using a sendto call) no address was supplied.
//

  WSAENOTCONN = 10057;
  {$EXTERNALSYM WSAENOTCONN}

//
// MessageId: WSAESHUTDOWN
//
// MessageText:
//
//  A request to send or receive data was disallowed because the socket had already been shut down in that direction with a previous shutdown call.
//

  WSAESHUTDOWN = 10058;
  {$EXTERNALSYM WSAESHUTDOWN}

//
// MessageId: WSAETOOMANYREFS
//
// MessageText:
//
//  Too many references to some kernel object.
//

  WSAETOOMANYREFS = 10059;
  {$EXTERNALSYM WSAETOOMANYREFS}

//
// MessageId: WSAETIMEDOUT
//
// MessageText:
//
//  A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
//

  WSAETIMEDOUT = 10060;
  {$EXTERNALSYM WSAETIMEDOUT}

//
// MessageId: WSAECONNREFUSED
//
// MessageText:
//
//  No connection could be made because the target machine actively refused it.
//

  WSAECONNREFUSED = 10061;
  {$EXTERNALSYM WSAECONNREFUSED}

//
// MessageId: WSAELOOP
//
// MessageText:
//
//  Cannot translate name.
//

  WSAELOOP = 10062;
  {$EXTERNALSYM WSAELOOP}

//
// MessageId: WSAENAMETOOLONG
//
// MessageText:
//
//  Name component or name was too long.
//

  WSAENAMETOOLONG = 10063;
  {$EXTERNALSYM WSAENAMETOOLONG}

//
// MessageId: WSAEHOSTDOWN
//
// MessageText:
//
//  A socket operation failed because the destination host was down.
//

  WSAEHOSTDOWN = 10064;
  {$EXTERNALSYM WSAEHOSTDOWN}

//
// MessageId: WSAEHOSTUNREACH
//
// MessageText:
//
//  A socket operation was attempted to an unreachable host.
//

  WSAEHOSTUNREACH = 10065;
  {$EXTERNALSYM WSAEHOSTUNREACH}

//
// MessageId: WSAENOTEMPTY
//
// MessageText:
//
//  Cannot remove a directory that is not empty.
//

  WSAENOTEMPTY = 10066;
  {$EXTERNALSYM WSAENOTEMPTY}

//
// MessageId: WSAEPROCLIM
//
// MessageText:
//
//  A Windows Sockets implementation may have a limit on the number of applications that may use it simultaneously.
//

  WSAEPROCLIM = 10067;
  {$EXTERNALSYM WSAEPROCLIM}

//
// MessageId: WSAEUSERS
//
// MessageText:
//
//  Ran out of quota.
//

  WSAEUSERS = 10068;
  {$EXTERNALSYM WSAEUSERS}

//
// MessageId: WSAEDQUOT
//
// MessageText:
//
//  Ran out of disk quota.
//

  WSAEDQUOT = 10069;
  {$EXTERNALSYM WSAEDQUOT}

//
// MessageId: WSAESTALE
//
// MessageText:
//
//  File handle reference is no longer available.
//

  WSAESTALE = 10070;
  {$EXTERNALSYM WSAESTALE}

//
// MessageId: WSAEREMOTE
//
// MessageText:
//
//  Item is not available locally.
//

  WSAEREMOTE = 10071;
  {$EXTERNALSYM WSAEREMOTE}

//
// MessageId: WSASYSNOTREADY
//
// MessageText:
//
//  WSAStartup cannot function at this time because the underlying system it uses to provide network services is currently unavailable.
//

  WSASYSNOTREADY = 10091;
  {$EXTERNALSYM WSASYSNOTREADY}

//
// MessageId: WSAVERNOTSUPPORTED
//
// MessageText:
//
//  The Windows Sockets version requested is not supported.
//

  WSAVERNOTSUPPORTED = 10092;
  {$EXTERNALSYM WSAVERNOTSUPPORTED}

//
// MessageId: WSANOTINITIALISED
//
// MessageText:
//
//  Either the application has not called WSAStartup, or WSAStartup failed.
//

  WSANOTINITIALISED = 10093;
  {$EXTERNALSYM WSANOTINITIALISED}

//
// MessageId: WSAEDISCON
//
// MessageText:
//
//  Returned by WSARecv or WSARecvFrom to indicate the remote party has initiated a graceful shutdown sequence.
//

  WSAEDISCON = 10101;
  {$EXTERNALSYM WSAEDISCON}

//
// MessageId: WSAENOMORE
//
// MessageText:
//
//  No more results can be returned by WSALookupServiceNext.
//

  WSAENOMORE = 10102;
  {$EXTERNALSYM WSAENOMORE}

//
// MessageId: WSAECANCELLED
//
// MessageText:
//
//  A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//

  WSAECANCELLED = 10103;
  {$EXTERNALSYM WSAECANCELLED}

//
// MessageId: WSAEINVALIDPROCTABLE
//
// MessageText:
//
//  The procedure call table is invalid.
//

  WSAEINVALIDPROCTABLE = 10104;
  {$EXTERNALSYM WSAEINVALIDPROCTABLE}

//
// MessageId: WSAEINVALIDPROVIDER
//
// MessageText:
//
//  The requested service provider is invalid.
//

  WSAEINVALIDPROVIDER = 10105;
  {$EXTERNALSYM WSAEINVALIDPROVIDER}

//
// MessageId: WSAEPROVIDERFAILEDINIT
//
// MessageText:
//
//  The requested service provider could not be loaded or initialized.
//

  WSAEPROVIDERFAILEDINIT = 10106;
  {$EXTERNALSYM WSAEPROVIDERFAILEDINIT}

//
// MessageId: WSASYSCALLFAILURE
//
// MessageText:
//
//  A system call that should never fail has failed.
//

  WSASYSCALLFAILURE = 10107;
  {$EXTERNALSYM WSASYSCALLFAILURE}

//
// MessageId: WSASERVICE_NOT_FOUND
//
// MessageText:
//
//  No such service is known. The service cannot be found in the specified name space.
//

  WSASERVICE_NOT_FOUND = 10108;
  {$EXTERNALSYM WSASERVICE_NOT_FOUND}

//
// MessageId: WSATYPE_NOT_FOUND
//
// MessageText:
//
//  The specified class was not found.
//

  WSATYPE_NOT_FOUND = 10109;
  {$EXTERNALSYM WSATYPE_NOT_FOUND}

//
// MessageId: WSA_E_NO_MORE
//
// MessageText:
//
//  No more results can be returned by WSALookupServiceNext.
//

  WSA_E_NO_MORE = 10110;
  {$EXTERNALSYM WSA_E_NO_MORE}

//
// MessageId: WSA_E_CANCELLED
//
// MessageText:
//
//  A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//

  WSA_E_CANCELLED = 10111;
  {$EXTERNALSYM WSA_E_CANCELLED}

//
// MessageId: WSAEREFUSED
//
// MessageText:
//
//  A database query failed because it was actively refused.
//

  WSAEREFUSED = 10112;
  {$EXTERNALSYM WSAEREFUSED}

//
// MessageId: WSAHOST_NOT_FOUND
//
// MessageText:
//
//  No such host is known.
//

  WSAHOST_NOT_FOUND = 11001;
  {$EXTERNALSYM WSAHOST_NOT_FOUND}

//
// MessageId: WSATRY_AGAIN
//
// MessageText:
//
//  This is usually a temporary error during hostname resolution and means that the local server did not receive a response from an authoritative server.
//

  WSATRY_AGAIN = 11002;
  {$EXTERNALSYM WSATRY_AGAIN}

//
// MessageId: WSANO_RECOVERY
//
// MessageText:
//
//  A non-recoverable error occurred during a database lookup.
//

  WSANO_RECOVERY = 11003;
  {$EXTERNALSYM WSANO_RECOVERY}

//
// MessageId: WSANO_DATA
//
// MessageText:
//
//  The requested name is valid and was found in the database, but it does not have the correct associated data being resolved for.
//

  WSANO_DATA = 11004;
  {$EXTERNALSYM WSANO_DATA}

//
// MessageId: WSA_QOS_RECEIVERS
//
// MessageText:
//
//  At least one reserve has arrived.
//

  WSA_QOS_RECEIVERS = 11005;
  {$EXTERNALSYM WSA_QOS_RECEIVERS}

//
// MessageId: WSA_QOS_SENDERS
//
// MessageText:
//
//  At least one path has arrived.
//

  WSA_QOS_SENDERS = 11006;
  {$EXTERNALSYM WSA_QOS_SENDERS}

//
// MessageId: WSA_QOS_NO_SENDERS
//
// MessageText:
//
//  There are no senders.
//

  WSA_QOS_NO_SENDERS = 11007;
  {$EXTERNALSYM WSA_QOS_NO_SENDERS}

//
// MessageId: WSA_QOS_NO_RECEIVERS
//
// MessageText:
//
//  There are no receivers.
//

  WSA_QOS_NO_RECEIVERS = 11008;
  {$EXTERNALSYM WSA_QOS_NO_RECEIVERS}

//
// MessageId: WSA_QOS_REQUEST_CONFIRMED
//
// MessageText:
//
//  Reserve has been confirmed.
//

  WSA_QOS_REQUEST_CONFIRMED = 11009;
  {$EXTERNALSYM WSA_QOS_REQUEST_CONFIRMED}

//
// MessageId: WSA_QOS_ADMISSION_FAILURE
//
// MessageText:
//
//  Error due to lack of resources.
//

  WSA_QOS_ADMISSION_FAILURE = 11010;
  {$EXTERNALSYM WSA_QOS_ADMISSION_FAILURE}

//
// MessageId: WSA_QOS_POLICY_FAILURE
//
// MessageText:
//
//  Rejected for administrative reasons - bad credentials.
//

  WSA_QOS_POLICY_FAILURE = 11011;
  {$EXTERNALSYM WSA_QOS_POLICY_FAILURE}

//
// MessageId: WSA_QOS_BAD_STYLE
//
// MessageText:
//
//  Unknown or conflicting style.
//

  WSA_QOS_BAD_STYLE = 11012;
  {$EXTERNALSYM WSA_QOS_BAD_STYLE}

//
// MessageId: WSA_QOS_BAD_OBJECT
//
// MessageText:
//
//  Problem with some part of the filterspec or providerspecific buffer in general.
//

  WSA_QOS_BAD_OBJECT = 11013;
  {$EXTERNALSYM WSA_QOS_BAD_OBJECT}

//
// MessageId: WSA_QOS_TRAFFIC_CTRL_ERROR
//
// MessageText:
//
//  Problem with some part of the flowspec.
//

  WSA_QOS_TRAFFIC_CTRL_ERROR = 11014;
  {$EXTERNALSYM WSA_QOS_TRAFFIC_CTRL_ERROR}

//
// MessageId: WSA_QOS_GENERIC_ERROR
//
// MessageText:
//
//  General QOS error.
//

  WSA_QOS_GENERIC_ERROR = 11015;
  {$EXTERNALSYM WSA_QOS_GENERIC_ERROR}

//
// MessageId: WSA_QOS_ESERVICETYPE
//
// MessageText:
//
//  An invalid or unrecognized service type was found in the flowspec.
//

  WSA_QOS_ESERVICETYPE = 11016;
  {$EXTERNALSYM WSA_QOS_ESERVICETYPE}

//
// MessageId: WSA_QOS_EFLOWSPEC
//
// MessageText:
//
//  An invalid or inconsistent flowspec was found in the QOS structure.
//

  WSA_QOS_EFLOWSPEC = 11017;
  {$EXTERNALSYM WSA_QOS_EFLOWSPEC}

//
// MessageId: WSA_QOS_EPROVSPECBUF
//
// MessageText:
//
//  Invalid QOS provider-specific buffer.
//

  WSA_QOS_EPROVSPECBUF = 11018;
  {$EXTERNALSYM WSA_QOS_EPROVSPECBUF}

//
// MessageId: WSA_QOS_EFILTERSTYLE
//
// MessageText:
//
//  An invalid QOS filter style was used.
//

  WSA_QOS_EFILTERSTYLE = 11019;
  {$EXTERNALSYM WSA_QOS_EFILTERSTYLE}

//
// MessageId: WSA_QOS_EFILTERTYPE
//
// MessageText:
//
//  An invalid QOS filter type was used.
//

  WSA_QOS_EFILTERTYPE = 11020;
  {$EXTERNALSYM WSA_QOS_EFILTERTYPE}

//
// MessageId: WSA_QOS_EFILTERCOUNT
//
// MessageText:
//
//  An incorrect number of QOS FILTERSPECs were specified in the FLOWDESCRIPTOR.
//

  WSA_QOS_EFILTERCOUNT = 11021;
  {$EXTERNALSYM WSA_QOS_EFILTERCOUNT}

//
// MessageId: WSA_QOS_EOBJLENGTH
//
// MessageText:
//
//  An object with an invalid ObjectLength field was specified in the QOS provider-specific buffer.
//

  WSA_QOS_EOBJLENGTH = 11022;
  {$EXTERNALSYM WSA_QOS_EOBJLENGTH}

//
// MessageId: WSA_QOS_EFLOWCOUNT
//
// MessageText:
//
//  An incorrect number of flow descriptors was specified in the QOS structure.
//

  WSA_QOS_EFLOWCOUNT = 11023;
  {$EXTERNALSYM WSA_QOS_EFLOWCOUNT}

//
// MessageId: WSA_QOS_EUNKOWNPSOBJ
//
// MessageText:
//
//  An unrecognized object was found in the QOS provider-specific buffer.
//

  WSA_QOS_EUNKOWNPSOBJ = 11024;
  {$EXTERNALSYM WSA_QOS_EUNKOWNPSOBJ}

//
// MessageId: WSA_QOS_EPOLICYOBJ
//
// MessageText:
//
//  An invalid policy object was found in the QOS provider-specific buffer.
//

  WSA_QOS_EPOLICYOBJ = 11025;
  {$EXTERNALSYM WSA_QOS_EPOLICYOBJ}

//
// MessageId: WSA_QOS_EFLOWDESC
//
// MessageText:
//
//  An invalid QOS flow descriptor was found in the flow descriptor list.
//

  WSA_QOS_EFLOWDESC = 11026;
  {$EXTERNALSYM WSA_QOS_EFLOWDESC}

//
// MessageId: WSA_QOS_EPSFLOWSPEC
//
// MessageText:
//
//  An invalid or inconsistent flowspec was found in the QOS provider specific buffer.
//

  WSA_QOS_EPSFLOWSPEC = 11027;
  {$EXTERNALSYM WSA_QOS_EPSFLOWSPEC}

//
// MessageId: WSA_QOS_EPSFILTERSPEC
//
// MessageText:
//
//  An invalid FILTERSPEC was found in the QOS provider-specific buffer.
//

  WSA_QOS_EPSFILTERSPEC = 11028;
  {$EXTERNALSYM WSA_QOS_EPSFILTERSPEC}

//
// MessageId: WSA_QOS_ESDMODEOBJ
//
// MessageText:
//
//  An invalid shape discard mode object was found in the QOS provider specific buffer.
//

  WSA_QOS_ESDMODEOBJ = 11029;
  {$EXTERNALSYM WSA_QOS_ESDMODEOBJ}

//
// MessageId: WSA_QOS_ESHAPERATEOBJ
//
// MessageText:
//
//  An invalid shaping rate object was found in the QOS provider-specific buffer.
//

  WSA_QOS_ESHAPERATEOBJ = 11030;
  {$EXTERNALSYM WSA_QOS_ESHAPERATEOBJ}

//
// MessageId: WSA_QOS_RESERVED_PETYPE
//
// MessageText:
//
//  A reserved policy element was found in the QOS provider-specific buffer.
//

  WSA_QOS_RESERVED_PETYPE = 11031;
  {$EXTERNALSYM WSA_QOS_RESERVED_PETYPE}

///////////////////////////////////////////////////
//                                               //
//           End of WinSock Error Codes          //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////


////////////////////////////////////
//                                //
//     COM Error Codes            //
//                                //
////////////////////////////////////

//
// The return value of COM functions and methods is an HRESULT.
// This is not a handle to anything, but is merely a 32-bit value
// with several fields encoded in the value.  The parts of an
// HRESULT are shown below.
//
// Many of the macros and functions below were orginally defined to
// operate on SCODEs.  SCODEs are no longer used.  The macros are
// still present for compatibility and easy porting of Win16 code.
// Newly written code should use the HRESULT macros and functions.
//

//
//  HRESULTs are 32 bit values layed out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +-+-+-+-+-+---------------------+-------------------------------+
//  |S|R|C|N|r|    Facility         |               Code            |
//  +-+-+-+-+-+---------------------+-------------------------------+
//
//  where
//
//      S - Severity - indicates success/fail
//
//          0 - Success
//          1 - Fail (COERROR)
//
//      R - reserved portion of the facility code, corresponds to NT's
//              second severity bit.
//
//      C - reserved portion of the facility code, corresponds to NT's
//              C field.
//
//      N - reserved portion of the facility code. Used to indicate a
//              mapped NT status value.
//
//      r - reserved portion of the facility code. Reserved for internal
//              use. Used to indicate HRESULT values that are not status
//              values, but are instead message ids for display strings.
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//

//
// Severity values
//

  SEVERITY_SUCCESS = 0;
  {$EXTERNALSYM SEVERITY_SUCCESS}
  SEVERITY_ERROR   = 1;
  {$EXTERNALSYM SEVERITY_ERROR}

//
// Generic test for success on any status value (non-negative numbers
// indicate success).
//

function SUCCEEDED(Status: HRESULT): BOOL;
{$EXTERNALSYM SUCCEEDED}

//
// and the inverse
//

function FAILED(Status: HRESULT): BOOL;
{$EXTERNALSYM FAILED}

//
// Generic test for error on any status value.
//

function IS_ERROR(Status: HRESULT): BOOL;
{$EXTERNALSYM IS_ERROR}

//
// Return the code
//

function HRESULT_CODE(hr: HRESULT): DWORD;
{$EXTERNALSYM HRESULT_CODE}

function SCODE_CODE(sc: LONG): DWORD;
{$EXTERNALSYM SCODE_CODE}

//
//  Return the facility
//

function HRESULT_FACILITY(hr: HRESULT): DWORD;
{$EXTERNALSYM HRESULT_FACILITY}

function SCODE_FACILITY(sc: LONG): DWORD;
{$EXTERNALSYM SCODE_FACILITY}

//
//  Return the severity
//

function HRESULT_SEVERITY(hr: HRESULT): DWORD;
{$EXTERNALSYM HRESULT_SEVERITY}

function SCODE_SEVERITY(sc: LONG): DWORD;
{$EXTERNALSYM SCODE_SEVERITY}

//
// Create an HRESULT value from component pieces
//

function MAKE_HRESULT(sev, fac, code: DWORD): HRESULT;
{$EXTERNALSYM MAKE_HRESULT}

//
// Map a WIN32 error value into a HRESULT
// Note: This assumes that WIN32 errors fall in the range -32k to 32k.
//
// Define bits here so macros are guaranteed to work

const
  FACILITY_NT_BIT                = $10000000;
  {$EXTERNALSYM FACILITY_NT_BIT}

function HRESULT_FROM_WIN32(x: DWORD): HRESULT;
{$EXTERNALSYM HRESULT_FROM_WIN32}

//
// Map an NT status value into a HRESULT
//

function HRESULT_FROM_NT(x: NTSTATUS): HRESULT;
{$EXTERNALSYM HRESULT_FROM_NT}

// ---------------------- HRESULT value definitions -----------------
//
// HRESULT definitions
//

const
  NOERROR = 0;
  {$EXTERNALSYM NOERROR}

//
// Error definitions follow
//

//
// Codes 0x4000-0x40ff are reserved for OLE
//
//
// Error codes
//
//
// MessageId: E_UNEXPECTED
//
// MessageText:
//
//  Catastrophic failure
//

  E_UNEXPECTED = HRESULT($8000FFFF);
  {$EXTERNALSYM E_UNEXPECTED}

//
// MessageId: E_NOTIMPL
//
// MessageText:
//
//  Not implemented
//

  E_NOTIMPL = HRESULT($80004001);
  {$EXTERNALSYM E_NOTIMPL}

//
// MessageId: E_OUTOFMEMORY
//
// MessageText:
//
//  Ran out of memory
//

  E_OUTOFMEMORY = HRESULT($8007000E);
  {$EXTERNALSYM E_OUTOFMEMORY}

//
// MessageId: E_INVALIDARG
//
// MessageText:
//
//  One or more arguments are invalid
//

  E_INVALIDARG = HRESULT($80070057);
  {$EXTERNALSYM E_INVALIDARG}

//
// MessageId: E_NOINTERFACE
//
// MessageText:
//
//  No such interface supported
//

  E_NOINTERFACE = HRESULT($80004002);
  {$EXTERNALSYM E_NOINTERFACE}

//
// MessageId: E_POINTER
//
// MessageText:
//
//  Invalid pointer
//

  E_POINTER = HRESULT($80004003);
  {$EXTERNALSYM E_POINTER}

//
// MessageId: E_HANDLE
//
// MessageText:
//
//  Invalid handle
//

  E_HANDLE = HRESULT($80070006);
  {$EXTERNALSYM E_HANDLE}

//
// MessageId: E_ABORT
//
// MessageText:
//
//  Operation aborted
//

  E_ABORT = HRESULT($80004004);
  {$EXTERNALSYM E_ABORT}

//
// MessageId: E_FAIL
//
// MessageText:
//
//  Unspecified error
//

  E_FAIL = HRESULT($80004005);
  {$EXTERNALSYM E_FAIL}

//
// MessageId: E_ACCESSDENIED
//
// MessageText:
//
//  General access denied error
//

  E_ACCESSDENIED = HRESULT($80070005);
  {$EXTERNALSYM E_ACCESSDENIED}

//
// MessageId: E_PENDING
//
// MessageText:
//
//  The data necessary to complete this operation is not yet available.
//

  E_PENDING = HRESULT($8000000A);
  {$EXTERNALSYM E_PENDING}

//
// MessageId: CO_E_INIT_TLS
//
// MessageText:
//
//  Thread local storage failure
//

  CO_E_INIT_TLS = HRESULT($80004006);
  {$EXTERNALSYM CO_E_INIT_TLS}

//
// MessageId: CO_E_INIT_SHARED_ALLOCATOR
//
// MessageText:
//
//  Get shared memory allocator failure
//

  CO_E_INIT_SHARED_ALLOCATOR = HRESULT($80004007);
  {$EXTERNALSYM CO_E_INIT_SHARED_ALLOCATOR}

//
// MessageId: CO_E_INIT_MEMORY_ALLOCATOR
//
// MessageText:
//
//  Get memory allocator failure
//

  CO_E_INIT_MEMORY_ALLOCATOR = HRESULT($80004008);
  {$EXTERNALSYM CO_E_INIT_MEMORY_ALLOCATOR}

//
// MessageId: CO_E_INIT_CLASS_CACHE
//
// MessageText:
//
//  Unable to initialize class cache
//

  CO_E_INIT_CLASS_CACHE = HRESULT($80004009);
  {$EXTERNALSYM CO_E_INIT_CLASS_CACHE}

//
// MessageId: CO_E_INIT_RPC_CHANNEL
//
// MessageText:
//
//  Unable to initialize RPC services
//

  CO_E_INIT_RPC_CHANNEL = HRESULT($8000400A);
  {$EXTERNALSYM CO_E_INIT_RPC_CHANNEL}

//
// MessageId: CO_E_INIT_TLS_SET_CHANNEL_CONTROL
//
// MessageText:
//
//  Cannot set thread local storage channel control
//

  CO_E_INIT_TLS_SET_CHANNEL_CONTROL = HRESULT($8000400B);
  {$EXTERNALSYM CO_E_INIT_TLS_SET_CHANNEL_CONTROL}

//
// MessageId: CO_E_INIT_TLS_CHANNEL_CONTROL
//
// MessageText:
//
//  Could not allocate thread local storage channel control
//

  CO_E_INIT_TLS_CHANNEL_CONTROL = HRESULT($8000400C);
  {$EXTERNALSYM CO_E_INIT_TLS_CHANNEL_CONTROL}

//
// MessageId: CO_E_INIT_UNACCEPTED_USER_ALLOCATOR
//
// MessageText:
//
//  The user supplied memory allocator is unacceptable
//

  CO_E_INIT_UNACCEPTED_USER_ALLOCATOR = HRESULT($8000400D);
  {$EXTERNALSYM CO_E_INIT_UNACCEPTED_USER_ALLOCATOR}

//
// MessageId: CO_E_INIT_SCM_MUTEX_EXISTS
//
// MessageText:
//
//  The OLE service mutex already exists
//

  CO_E_INIT_SCM_MUTEX_EXISTS = HRESULT($8000400E);
  {$EXTERNALSYM CO_E_INIT_SCM_MUTEX_EXISTS}

//
// MessageId: CO_E_INIT_SCM_FILE_MAPPING_EXISTS
//
// MessageText:
//
//  The OLE service file mapping already exists
//

  CO_E_INIT_SCM_FILE_MAPPING_EXISTS = HRESULT($8000400F);
  {$EXTERNALSYM CO_E_INIT_SCM_FILE_MAPPING_EXISTS}

//
// MessageId: CO_E_INIT_SCM_MAP_VIEW_OF_FILE
//
// MessageText:
//
//  Unable to map view of file for OLE service
//

  CO_E_INIT_SCM_MAP_VIEW_OF_FILE = HRESULT($80004010);
  {$EXTERNALSYM CO_E_INIT_SCM_MAP_VIEW_OF_FILE}

//
// MessageId: CO_E_INIT_SCM_EXEC_FAILURE
//
// MessageText:
//
//  Failure attempting to launch OLE service
//

  CO_E_INIT_SCM_EXEC_FAILURE = HRESULT($80004011);
  {$EXTERNALSYM CO_E_INIT_SCM_EXEC_FAILURE}

//
// MessageId: CO_E_INIT_ONLY_SINGLE_THREADED
//
// MessageText:
//
//  There was an attempt to call CoInitialize a second time while single threaded
//

  CO_E_INIT_ONLY_SINGLE_THREADED = HRESULT($80004012);
  {$EXTERNALSYM CO_E_INIT_ONLY_SINGLE_THREADED}

//
// MessageId: CO_E_CANT_REMOTE
//
// MessageText:
//
//  A Remote activation was necessary but was not allowed
//

  CO_E_CANT_REMOTE = HRESULT($80004013);
  {$EXTERNALSYM CO_E_CANT_REMOTE}

//
// MessageId: CO_E_BAD_SERVER_NAME
//
// MessageText:
//
//  A Remote activation was necessary but the server name provided was invalid
//

  CO_E_BAD_SERVER_NAME = HRESULT($80004014);
  {$EXTERNALSYM CO_E_BAD_SERVER_NAME}

//
// MessageId: CO_E_WRONG_SERVER_IDENTITY
//
// MessageText:
//
//  The class is configured to run as a security id different from the caller
//

  CO_E_WRONG_SERVER_IDENTITY = HRESULT($80004015);
  {$EXTERNALSYM CO_E_WRONG_SERVER_IDENTITY}

//
// MessageId: CO_E_OLE1DDE_DISABLED
//
// MessageText:
//
//  Use of Ole1 services requiring DDE windows is disabled
//

  CO_E_OLE1DDE_DISABLED = HRESULT($80004016);
  {$EXTERNALSYM CO_E_OLE1DDE_DISABLED}

//
// MessageId: CO_E_RUNAS_SYNTAX
//
// MessageText:
//
//  A RunAs specification must be <domain name>\<user name> or simply <user name>
//

  CO_E_RUNAS_SYNTAX = HRESULT($80004017);
  {$EXTERNALSYM CO_E_RUNAS_SYNTAX}

//
// MessageId: CO_E_CREATEPROCESS_FAILURE
//
// MessageText:
//
//  The server process could not be started.  The pathname may be incorrect.
//

  CO_E_CREATEPROCESS_FAILURE = HRESULT($80004018);
  {$EXTERNALSYM CO_E_CREATEPROCESS_FAILURE}

//
// MessageId: CO_E_RUNAS_CREATEPROCESS_FAILURE
//
// MessageText:
//
//  The server process could not be started as the configured identity.  The pathname may be incorrect or unavailable.
//

  CO_E_RUNAS_CREATEPROCESS_FAILURE = HRESULT($80004019);
  {$EXTERNALSYM CO_E_RUNAS_CREATEPROCESS_FAILURE}

//
// MessageId: CO_E_RUNAS_LOGON_FAILURE
//
// MessageText:
//
//  The server process could not be started because the configured identity is incorrect.  Check the username and password.
//

  CO_E_RUNAS_LOGON_FAILURE = HRESULT($8000401A);
  {$EXTERNALSYM CO_E_RUNAS_LOGON_FAILURE}

//
// MessageId: CO_E_LAUNCH_PERMSSION_DENIED
//
// MessageText:
//
//  The client is not allowed to launch this server.
//

  CO_E_LAUNCH_PERMSSION_DENIED = HRESULT($8000401B);
  {$EXTERNALSYM CO_E_LAUNCH_PERMSSION_DENIED}

//
// MessageId: CO_E_START_SERVICE_FAILURE
//
// MessageText:
//
//  The service providing this server could not be started.
//

  CO_E_START_SERVICE_FAILURE = HRESULT($8000401C);
  {$EXTERNALSYM CO_E_START_SERVICE_FAILURE}

//
// MessageId: CO_E_REMOTE_COMMUNICATION_FAILURE
//
// MessageText:
//
//  This computer was unable to communicate with the computer providing the server.
//

  CO_E_REMOTE_COMMUNICATION_FAILURE = HRESULT($8000401D);
  {$EXTERNALSYM CO_E_REMOTE_COMMUNICATION_FAILURE}

//
// MessageId: CO_E_SERVER_START_TIMEOUT
//
// MessageText:
//
//  The server did not respond after being launched.
//

  CO_E_SERVER_START_TIMEOUT = HRESULT($8000401E);
  {$EXTERNALSYM CO_E_SERVER_START_TIMEOUT}

//
// MessageId: CO_E_CLSREG_INCONSISTENT
//
// MessageText:
//
//  The registration information for this server is inconsistent or incomplete.
//

  CO_E_CLSREG_INCONSISTENT = HRESULT($8000401F);
  {$EXTERNALSYM CO_E_CLSREG_INCONSISTENT}

//
// MessageId: CO_E_IIDREG_INCONSISTENT
//
// MessageText:
//
//  The registration information for this interface is inconsistent or incomplete.
//

  CO_E_IIDREG_INCONSISTENT = HRESULT($80004020);
  {$EXTERNALSYM CO_E_IIDREG_INCONSISTENT}

//
// MessageId: CO_E_NOT_SUPPORTED
//
// MessageText:
//
//  The operation attempted is not supported.
//

  CO_E_NOT_SUPPORTED = HRESULT($80004021);
  {$EXTERNALSYM CO_E_NOT_SUPPORTED}

//
// MessageId: CO_E_RELOAD_DLL
//
// MessageText:
//
//  A dll must be loaded.
//

  CO_E_RELOAD_DLL = HRESULT($80004022);
  {$EXTERNALSYM CO_E_RELOAD_DLL}

//
// MessageId: CO_E_MSI_ERROR
//
// MessageText:
//
//  A Microsoft Software Installer error was encountered.
//

  CO_E_MSI_ERROR = HRESULT($80004023);
  {$EXTERNALSYM CO_E_MSI_ERROR}

//
// MessageId: CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT
//
// MessageText:
//
//  The specified activation could not occur in the client context as specified.
//

  CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT = HRESULT($80004024);
  {$EXTERNALSYM CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT}

//
// Success codes
//

  S_OK    = HRESULT($00000000);
  {$EXTERNALSYM S_OK}
  S_FALSE = HRESULT($00000001);
  {$EXTERNALSYM S_FALSE}

// ******************
// FACILITY_ITF
// ******************

//
// Codes 0x0-0x01ff are reserved for the OLE group of
// interfaces.
//


//
// Generic OLE errors that may be returned by many inerfaces
//

  OLE_E_FIRST = HRESULT($80040000);
  {$EXTERNALSYM OLE_E_FIRST}
  OLE_E_LAST  = HRESULT($800400FF);
  {$EXTERNALSYM OLE_E_LAST}
  OLE_S_FIRST = HRESULT($00040000);
  {$EXTERNALSYM OLE_S_FIRST}
  OLE_S_LAST  = HRESULT($000400FF);
  {$EXTERNALSYM OLE_S_LAST}

//
// Old OLE errors
//
//
// MessageId: OLE_E_OLEVERB
//
// MessageText:
//
//  Invalid OLEVERB structure
//

  OLE_E_OLEVERB = HRESULT($80040000);
  {$EXTERNALSYM OLE_E_OLEVERB}

//
// MessageId: OLE_E_ADVF
//
// MessageText:
//
//  Invalid advise flags
//

  OLE_E_ADVF = HRESULT($80040001);
  {$EXTERNALSYM OLE_E_ADVF}

//
// MessageId: OLE_E_ENUM_NOMORE
//
// MessageText:
//
//  Can't enumerate any more, because the associated data is missing
//

  OLE_E_ENUM_NOMORE = HRESULT($80040002);
  {$EXTERNALSYM OLE_E_ENUM_NOMORE}

//
// MessageId: OLE_E_ADVISENOTSUPPORTED
//
// MessageText:
//
//  This implementation doesn't take advises
//

  OLE_E_ADVISENOTSUPPORTED = HRESULT($80040003);
  {$EXTERNALSYM OLE_E_ADVISENOTSUPPORTED}

//
// MessageId: OLE_E_NOCONNECTION
//
// MessageText:
//
//  There is no connection for this connection ID
//

  OLE_E_NOCONNECTION = HRESULT($80040004);
  {$EXTERNALSYM OLE_E_NOCONNECTION}

//
// MessageId: OLE_E_NOTRUNNING
//
// MessageText:
//
//  Need to run the object to perform this operation
//

  OLE_E_NOTRUNNING = HRESULT($80040005);
  {$EXTERNALSYM OLE_E_NOTRUNNING}

//
// MessageId: OLE_E_NOCACHE
//
// MessageText:
//
//  There is no cache to operate on
//

  OLE_E_NOCACHE = HRESULT($80040006);
  {$EXTERNALSYM OLE_E_NOCACHE}

//
// MessageId: OLE_E_BLANK
//
// MessageText:
//
//  Uninitialized object
//

  OLE_E_BLANK = HRESULT($80040007);
  {$EXTERNALSYM OLE_E_BLANK}

//
// MessageId: OLE_E_CLASSDIFF
//
// MessageText:
//
//  Linked object's source class has changed
//

  OLE_E_CLASSDIFF = HRESULT($80040008);
  {$EXTERNALSYM OLE_E_CLASSDIFF}

//
// MessageId: OLE_E_CANT_GETMONIKER
//
// MessageText:
//
//  Not able to get the moniker of the object
//

  OLE_E_CANT_GETMONIKER = HRESULT($80040009);
  {$EXTERNALSYM OLE_E_CANT_GETMONIKER}

//
// MessageId: OLE_E_CANT_BINDTOSOURCE
//
// MessageText:
//
//  Not able to bind to the source
//

  OLE_E_CANT_BINDTOSOURCE = HRESULT($8004000A);
  {$EXTERNALSYM OLE_E_CANT_BINDTOSOURCE}

//
// MessageId: OLE_E_STATIC
//
// MessageText:
//
//  Object is static; operation not allowed
//

  OLE_E_STATIC = HRESULT($8004000B);
  {$EXTERNALSYM OLE_E_STATIC}

//
// MessageId: OLE_E_PROMPTSAVECANCELLED
//
// MessageText:
//
//  User canceled out of save dialog
//

  OLE_E_PROMPTSAVECANCELLED = HRESULT($8004000C);
  {$EXTERNALSYM OLE_E_PROMPTSAVECANCELLED}

//
// MessageId: OLE_E_INVALIDRECT
//
// MessageText:
//
//  Invalid rectangle
//

  OLE_E_INVALIDRECT = HRESULT($8004000D);
  {$EXTERNALSYM OLE_E_INVALIDRECT}

//
// MessageId: OLE_E_WRONGCOMPOBJ
//
// MessageText:
//
//  compobj.dll is too old for the ole2.dll initialized
//

  OLE_E_WRONGCOMPOBJ = HRESULT($8004000E);
  {$EXTERNALSYM OLE_E_WRONGCOMPOBJ}

//
// MessageId: OLE_E_INVALIDHWND
//
// MessageText:
//
//  Invalid window handle
//

  OLE_E_INVALIDHWND = HRESULT($8004000F);
  {$EXTERNALSYM OLE_E_INVALIDHWND}

//
// MessageId: OLE_E_NOT_INPLACEACTIVE
//
// MessageText:
//
//  Object is not in any of the inplace active states
//

  OLE_E_NOT_INPLACEACTIVE = HRESULT($80040010);
  {$EXTERNALSYM OLE_E_NOT_INPLACEACTIVE}

//
// MessageId: OLE_E_CANTCONVERT
//
// MessageText:
//
//  Not able to convert object
//

  OLE_E_CANTCONVERT = HRESULT($80040011);
  {$EXTERNALSYM OLE_E_CANTCONVERT}

//
// MessageId: OLE_E_NOSTORAGE
//
// MessageText:
//
//  Not able to perform the operation because object is not given storage yet
//

  OLE_E_NOSTORAGE = HRESULT($80040012);
  {$EXTERNALSYM OLE_E_NOSTORAGE}

//
// MessageId: DV_E_FORMATETC
//
// MessageText:
//
//  Invalid FORMATETC structure
//

  DV_E_FORMATETC = HRESULT($80040064);
  {$EXTERNALSYM DV_E_FORMATETC}

//
// MessageId: DV_E_DVTARGETDEVICE
//
// MessageText:
//
//  Invalid DVTARGETDEVICE structure
//

  DV_E_DVTARGETDEVICE = HRESULT($80040065);
  {$EXTERNALSYM DV_E_DVTARGETDEVICE}

//
// MessageId: DV_E_STGMEDIUM
//
// MessageText:
//
//  Invalid STDGMEDIUM structure
//

  DV_E_STGMEDIUM = HRESULT($80040066);
  {$EXTERNALSYM DV_E_STGMEDIUM}

//
// MessageId: DV_E_STATDATA
//
// MessageText:
//
//  Invalid STATDATA structure
//

  DV_E_STATDATA = HRESULT($80040067);
  {$EXTERNALSYM DV_E_STATDATA}

//
// MessageId: DV_E_LINDEX
//
// MessageText:
//
//  Invalid lindex
//

  DV_E_LINDEX = HRESULT($80040068);
  {$EXTERNALSYM DV_E_LINDEX}

//
// MessageId: DV_E_TYMED
//
// MessageText:
//
//  Invalid tymed
//

  DV_E_TYMED = HRESULT($80040069);
  {$EXTERNALSYM DV_E_TYMED}

//
// MessageId: DV_E_CLIPFORMAT
//
// MessageText:
//
//  Invalid clipboard format
//

  DV_E_CLIPFORMAT = HRESULT($8004006A);
  {$EXTERNALSYM DV_E_CLIPFORMAT}

//
// MessageId: DV_E_DVASPECT
//
// MessageText:
//
//  Invalid aspect(s)
//

  DV_E_DVASPECT = HRESULT($8004006B);
  {$EXTERNALSYM DV_E_DVASPECT}

//
// MessageId: DV_E_DVTARGETDEVICE_SIZE
//
// MessageText:
//
//  tdSize parameter of the DVTARGETDEVICE structure is invalid
//

  DV_E_DVTARGETDEVICE_SIZE = HRESULT($8004006C);
  {$EXTERNALSYM DV_E_DVTARGETDEVICE_SIZE}

//
// MessageId: DV_E_NOIVIEWOBJECT
//
// MessageText:
//
//  Object doesn't support IViewObject interface
//

  DV_E_NOIVIEWOBJECT = HRESULT($8004006D);
  {$EXTERNALSYM DV_E_NOIVIEWOBJECT}

  DRAGDROP_E_FIRST = DWORD($80040100);
  {$EXTERNALSYM DRAGDROP_E_FIRST}
  DRAGDROP_E_LAST  = DWORD($8004010F);
  {$EXTERNALSYM DRAGDROP_E_LAST}
  DRAGDROP_S_FIRST = $00040100;
  {$EXTERNALSYM DRAGDROP_S_FIRST}
  DRAGDROP_S_LAST  = $0004010F;
  {$EXTERNALSYM DRAGDROP_S_LAST}

//
// MessageId: DRAGDROP_E_NOTREGISTERED
//
// MessageText:
//
//  Trying to revoke a drop target that has not been registered
//

  DRAGDROP_E_NOTREGISTERED = HRESULT($80040100);
  {$EXTERNALSYM DRAGDROP_E_NOTREGISTERED}

//
// MessageId: DRAGDROP_E_ALREADYREGISTERED
//
// MessageText:
//
//  This window has already been registered as a drop target
//

  DRAGDROP_E_ALREADYREGISTERED = HRESULT($80040101);
  {$EXTERNALSYM DRAGDROP_E_ALREADYREGISTERED}

//
// MessageId: DRAGDROP_E_INVALIDHWND
//
// MessageText:
//
//  Invalid window handle
//

  DRAGDROP_E_INVALIDHWND = HRESULT($80040102);
  {$EXTERNALSYM DRAGDROP_E_INVALIDHWND}

  CLASSFACTORY_E_FIRST = DWORD($80040110);
  {$EXTERNALSYM CLASSFACTORY_E_FIRST}
  CLASSFACTORY_E_LAST  = DWORD($8004011F);
  {$EXTERNALSYM CLASSFACTORY_E_LAST}
  CLASSFACTORY_S_FIRST = $00040110;
  {$EXTERNALSYM CLASSFACTORY_S_FIRST}
  CLASSFACTORY_S_LAST  = $0004011F;
  {$EXTERNALSYM CLASSFACTORY_S_LAST}

//
// MessageId: CLASS_E_NOAGGREGATION
//
// MessageText:
//
//  Class does not support aggregation (or class object is remote)
//

  CLASS_E_NOAGGREGATION = HRESULT($80040110);
  {$EXTERNALSYM CLASS_E_NOAGGREGATION}

//
// MessageId: CLASS_E_CLASSNOTAVAILABLE
//
// MessageText:
//
//  ClassFactory cannot supply requested class
//

  CLASS_E_CLASSNOTAVAILABLE = HRESULT($80040111);
  {$EXTERNALSYM CLASS_E_CLASSNOTAVAILABLE}

//
// MessageId: CLASS_E_NOTLICENSED
//
// MessageText:
//
//  Class is not licensed for use
//

  CLASS_E_NOTLICENSED = HRESULT($80040112);
  {$EXTERNALSYM CLASS_E_NOTLICENSED}

  MARSHAL_E_FIRST = DWORD($80040120);
  {$EXTERNALSYM MARSHAL_E_FIRST}
  MARSHAL_E_LAST  = DWORD($8004012F);
  {$EXTERNALSYM MARSHAL_E_LAST}
  MARSHAL_S_FIRST = $00040120;
  {$EXTERNALSYM MARSHAL_S_FIRST}
  MARSHAL_S_LAST  = $0004012F;
  {$EXTERNALSYM MARSHAL_S_LAST}
  DATA_E_FIRST    = DWORD($80040130);
  {$EXTERNALSYM DATA_E_FIRST}
  DATA_E_LAST     = DWORD($8004013F);
  {$EXTERNALSYM DATA_E_LAST}
  DATA_S_FIRST    = $00040130;
  {$EXTERNALSYM DATA_S_FIRST}
  DATA_S_LAST     = $0004013F;
  {$EXTERNALSYM DATA_S_LAST}
  VIEW_E_FIRST    = DWORD($80040140);
  {$EXTERNALSYM VIEW_E_FIRST}
  VIEW_E_LAST     = DWORD($8004014F);
  {$EXTERNALSYM VIEW_E_LAST}
  VIEW_S_FIRST    = $00040140;
  {$EXTERNALSYM VIEW_S_FIRST}
  VIEW_S_LAST     = $0004014F;
  {$EXTERNALSYM VIEW_S_LAST}

//
// MessageId: VIEW_E_DRAW
//
// MessageText:
//
//  Error drawing view
//

  VIEW_E_DRAW = HRESULT($80040140);
  {$EXTERNALSYM VIEW_E_DRAW}

  REGDB_E_FIRST    = DWORD($80040150);
  {$EXTERNALSYM REGDB_E_FIRST}
  REGDB_E_LAST     = DWORD($8004015F);
  {$EXTERNALSYM REGDB_E_LAST}
  REGDB_S_FIRST    = $00040150;
  {$EXTERNALSYM REGDB_S_FIRST}
  REGDB_S_LAST     = $0004015F;
  {$EXTERNALSYM REGDB_S_LAST}

//
// MessageId: REGDB_E_READREGDB
//
// MessageText:
//
//  Could not read key from registry
//

  REGDB_E_READREGDB = HRESULT($80040150);
  {$EXTERNALSYM REGDB_E_READREGDB}

//
// MessageId: REGDB_E_WRITEREGDB
//
// MessageText:
//
//  Could not write key to registry
//

  REGDB_E_WRITEREGDB = HRESULT($80040151);
  {$EXTERNALSYM REGDB_E_WRITEREGDB}

//
// MessageId: REGDB_E_KEYMISSING
//
// MessageText:
//
//  Could not find the key in the registry
//

  REGDB_E_KEYMISSING = HRESULT($80040152);
  {$EXTERNALSYM REGDB_E_KEYMISSING}

//
// MessageId: REGDB_E_INVALIDVALUE
//
// MessageText:
//
//  Invalid value for registry
//

  REGDB_E_INVALIDVALUE = HRESULT($80040153);
  {$EXTERNALSYM REGDB_E_INVALIDVALUE}

//
// MessageId: REGDB_E_CLASSNOTREG
//
// MessageText:
//
//  Class not registered
//

  REGDB_E_CLASSNOTREG = HRESULT($80040154);
  {$EXTERNALSYM REGDB_E_CLASSNOTREG}

//
// MessageId: REGDB_E_IIDNOTREG
//
// MessageText:
//
//  Interface not registered
//

  REGDB_E_IIDNOTREG = HRESULT($80040155);
  {$EXTERNALSYM REGDB_E_IIDNOTREG}

//
// MessageId: REGDB_E_BADTHREADINGMODEL
//
// MessageText:
//
//  Threading model entry is not valid
//

  REGDB_E_BADTHREADINGMODEL = HRESULT($80040156);
  {$EXTERNALSYM REGDB_E_BADTHREADINGMODEL}

  CAT_E_FIRST    = DWORD($80040160);
  {$EXTERNALSYM CAT_E_FIRST}
  CAT_E_LAST     = DWORD($80040161);
  {$EXTERNALSYM CAT_E_LAST}

//
// MessageId: CAT_E_CATIDNOEXIST
//
// MessageText:
//
//  CATID does not exist
//

  CAT_E_CATIDNOEXIST = HRESULT($80040160);
  {$EXTERNALSYM CAT_E_CATIDNOEXIST}

//
// MessageId: CAT_E_NODESCRIPTION
//
// MessageText:
//
//  Description not found
//

  CAT_E_NODESCRIPTION = HRESULT($80040161);
  {$EXTERNALSYM CAT_E_NODESCRIPTION}

////////////////////////////////////
//                                //
//     Class Store Error Codes    //
//                                //
////////////////////////////////////

  CS_E_FIRST    = DWORD($80040164);
  {$EXTERNALSYM CS_E_FIRST}
  CS_E_LAST     = DWORD($8004016F);
  {$EXTERNALSYM CS_E_LAST}

//
// MessageId: CS_E_PACKAGE_NOTFOUND
//
// MessageText:
//
//  No package in the software installation data in the Active Directory meets this criteria.
//

  CS_E_PACKAGE_NOTFOUND = HRESULT($80040164);
  {$EXTERNALSYM CS_E_PACKAGE_NOTFOUND}

//
// MessageId: CS_E_NOT_DELETABLE
//
// MessageText:
//
//  Deleting this will break the referential integrity of the software installation data in the Active Directory.
//

  CS_E_NOT_DELETABLE = HRESULT($80040165);
  {$EXTERNALSYM CS_E_NOT_DELETABLE}

//
// MessageId: CS_E_CLASS_NOTFOUND
//
// MessageText:
//
//  The CLSID was not found in the software installation data in the Active Directory.
//

  CS_E_CLASS_NOTFOUND = HRESULT($80040166);
  {$EXTERNALSYM CS_E_CLASS_NOTFOUND}

//
// MessageId: CS_E_INVALID_VERSION
//
// MessageText:
//
//  The software installation data in the Active Directory is corrupt.
//

  CS_E_INVALID_VERSION = HRESULT($80040167);
  {$EXTERNALSYM CS_E_INVALID_VERSION}

//
// MessageId: CS_E_NO_CLASSSTORE
//
// MessageText:
//
//  There is no software installation data in the Active Directory.
//

  CS_E_NO_CLASSSTORE = HRESULT($80040168);
  {$EXTERNALSYM CS_E_NO_CLASSSTORE}

//
// MessageId: CS_E_OBJECT_NOTFOUND
//
// MessageText:
//
//  There is no software installation data object in the Active Directory.
//

  CS_E_OBJECT_NOTFOUND = HRESULT($80040169);
  {$EXTERNALSYM CS_E_OBJECT_NOTFOUND}

//
// MessageId: CS_E_OBJECT_ALREADY_EXISTS
//
// MessageText:
//
//  The software installation data object in the Active Directory already exists.
//

  CS_E_OBJECT_ALREADY_EXISTS = HRESULT($8004016A);
  {$EXTERNALSYM CS_E_OBJECT_ALREADY_EXISTS}

//
// MessageId: CS_E_INVALID_PATH
//
// MessageText:
//
//  The path to the software installation data in the Active Directory is not correct.
//

  CS_E_INVALID_PATH = HRESULT($8004016B);
  {$EXTERNALSYM CS_E_INVALID_PATH}

//
// MessageId: CS_E_NETWORK_ERROR
//
// MessageText:
//
//  A network error interrupted the operation.
//

  CS_E_NETWORK_ERROR = HRESULT($8004016C);
  {$EXTERNALSYM CS_E_NETWORK_ERROR}

//
// MessageId: CS_E_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
//  The size of this object exceeds the maximum size set by the Administrator.
//

  CS_E_ADMIN_LIMIT_EXCEEDED = HRESULT($8004016D);
  {$EXTERNALSYM CS_E_ADMIN_LIMIT_EXCEEDED}

//
// MessageId: CS_E_SCHEMA_MISMATCH
//
// MessageText:
//
//  The schema for the software installation data in the Active Directory does not match the required schema.
//

  CS_E_SCHEMA_MISMATCH = HRESULT($8004016E);
  {$EXTERNALSYM CS_E_SCHEMA_MISMATCH}

//
// MessageId: CS_E_INTERNAL_ERROR
//
// MessageText:
//
//  An error occurred in the software installation data in the Active Directory.
//

  CS_E_INTERNAL_ERROR = HRESULT($8004016F);
  {$EXTERNALSYM CS_E_INTERNAL_ERROR}

  CACHE_E_FIRST    = DWORD($80040170);
  {$EXTERNALSYM CACHE_E_FIRST}
  CACHE_E_LAST     = DWORD($8004017F);
  {$EXTERNALSYM CACHE_E_LAST}
  CACHE_S_FIRST    = $00040170;
  {$EXTERNALSYM CACHE_S_FIRST}
  CACHE_S_LAST     = $0004017F;
  {$EXTERNALSYM CACHE_S_LAST}

//
// MessageId: CACHE_E_NOCACHE_UPDATED
//
// MessageText:
//
//  Cache not updated
//

  CACHE_E_NOCACHE_UPDATED = HRESULT($80040170);
  {$EXTERNALSYM CACHE_E_NOCACHE_UPDATED}

  OLEOBJ_E_FIRST    = DWORD($80040180);
  {$EXTERNALSYM OLEOBJ_E_FIRST}
  OLEOBJ_E_LAST     = DWORD($8004018F);
  {$EXTERNALSYM OLEOBJ_E_LAST}
  OLEOBJ_S_FIRST    = $00040180;
  {$EXTERNALSYM OLEOBJ_S_FIRST}
  OLEOBJ_S_LAST     = $0004018F;
  {$EXTERNALSYM OLEOBJ_S_LAST}

//
// MessageId: OLEOBJ_E_NOVERBS
//
// MessageText:
//
//  No verbs for OLE object
//

  OLEOBJ_E_NOVERBS = HRESULT($80040180);
  {$EXTERNALSYM OLEOBJ_E_NOVERBS}

//
// MessageId: OLEOBJ_E_INVALIDVERB
//
// MessageText:
//
//  Invalid verb for OLE object
//

  OLEOBJ_E_INVALIDVERB = HRESULT($80040181);
  {$EXTERNALSYM OLEOBJ_E_INVALIDVERB}

  CLIENTSITE_E_FIRST    = DWORD($80040190);
  {$EXTERNALSYM CLIENTSITE_E_FIRST}
  CLIENTSITE_E_LAST     = DWORD($8004019F);
  {$EXTERNALSYM CLIENTSITE_E_LAST}
  CLIENTSITE_S_FIRST    = $00040190;
  {$EXTERNALSYM CLIENTSITE_S_FIRST}
  CLIENTSITE_S_LAST     = $0004019F;
  {$EXTERNALSYM CLIENTSITE_S_LAST}

//
// MessageId: INPLACE_E_NOTUNDOABLE
//
// MessageText:
//
//  Undo is not available
//

  INPLACE_E_NOTUNDOABLE = HRESULT($800401A0);
  {$EXTERNALSYM INPLACE_E_NOTUNDOABLE}

//
// MessageId: INPLACE_E_NOTOOLSPACE
//
// MessageText:
//
//  Space for tools is not available
//

  INPLACE_E_NOTOOLSPACE = HRESULT($800401A1);
  {$EXTERNALSYM INPLACE_E_NOTOOLSPACE}

  INPLACE_E_FIRST    = DWORD($800401A0);
  {$EXTERNALSYM INPLACE_E_FIRST}
  INPLACE_E_LAST     = DWORD($800401AF);
  {$EXTERNALSYM INPLACE_E_LAST}
  INPLACE_S_FIRST    = $000401A0;
  {$EXTERNALSYM INPLACE_S_FIRST}
  INPLACE_S_LAST     = $000401AF;
  {$EXTERNALSYM INPLACE_S_LAST}
  ENUM_E_FIRST       = DWORD($800401B0);
  {$EXTERNALSYM ENUM_E_FIRST}
  ENUM_E_LAST        = DWORD($800401BF);
  {$EXTERNALSYM ENUM_E_LAST}
  ENUM_S_FIRST       = $000401B0;
  {$EXTERNALSYM ENUM_S_FIRST}
  ENUM_S_LAST        = $000401BF;
  {$EXTERNALSYM ENUM_S_LAST}
  CONVERT10_E_FIRST  = DWORD($800401C0);
  {$EXTERNALSYM CONVERT10_E_FIRST}
  CONVERT10_E_LAST   = DWORD($800401CF);
  {$EXTERNALSYM CONVERT10_E_LAST}
  CONVERT10_S_FIRST  = $000401C0;
  {$EXTERNALSYM CONVERT10_S_FIRST}
  CONVERT10_S_LAST   = $000401CF;
  {$EXTERNALSYM CONVERT10_S_LAST}

//
// MessageId: CONVERT10_E_OLESTREAM_GET
//
// MessageText:
//
//  OLESTREAM Get method failed
//

  CONVERT10_E_OLESTREAM_GET = HRESULT($800401C0);
  {$EXTERNALSYM CONVERT10_E_OLESTREAM_GET}

//
// MessageId: CONVERT10_E_OLESTREAM_PUT
//
// MessageText:
//
//  OLESTREAM Put method failed
//

  CONVERT10_E_OLESTREAM_PUT = HRESULT($800401C1);
  {$EXTERNALSYM CONVERT10_E_OLESTREAM_PUT}

//
// MessageId: CONVERT10_E_OLESTREAM_FMT
//
// MessageText:
//
//  Contents of the OLESTREAM not in correct format
//

  CONVERT10_E_OLESTREAM_FMT = HRESULT($800401C2);
  {$EXTERNALSYM CONVERT10_E_OLESTREAM_FMT}

//
// MessageId: CONVERT10_E_OLESTREAM_BITMAP_TO_DIB
//
// MessageText:
//
//  There was an error in a Windows GDI call while converting the bitmap to a DIB
//

  CONVERT10_E_OLESTREAM_BITMAP_TO_DIB = HRESULT($800401C3);
  {$EXTERNALSYM CONVERT10_E_OLESTREAM_BITMAP_TO_DIB}

//
// MessageId: CONVERT10_E_STG_FMT
//
// MessageText:
//
//  Contents of the IStorage not in correct format
//

  CONVERT10_E_STG_FMT = HRESULT($800401C4);
  {$EXTERNALSYM CONVERT10_E_STG_FMT}

//
// MessageId: CONVERT10_E_STG_NO_STD_STREAM
//
// MessageText:
//
//  Contents of IStorage is missing one of the standard streams
//

  CONVERT10_E_STG_NO_STD_STREAM = HRESULT($800401C5);
  {$EXTERNALSYM CONVERT10_E_STG_NO_STD_STREAM}

//
// MessageId: CONVERT10_E_STG_DIB_TO_BITMAP
//
// MessageText:
//
//  There was an error in a Windows GDI call while converting the DIB to a bitmap.
//  
//

  CONVERT10_E_STG_DIB_TO_BITMAP = HRESULT($800401C6);
  {$EXTERNALSYM CONVERT10_E_STG_DIB_TO_BITMAP}

  CLIPBRD_E_FIRST       = DWORD($800401D0);
  {$EXTERNALSYM CLIPBRD_E_FIRST}
  CLIPBRD_E_LAST        = DWORD($800401DF);
  {$EXTERNALSYM CLIPBRD_E_LAST}
  CLIPBRD_S_FIRST       = $000401D0;
  {$EXTERNALSYM CLIPBRD_S_FIRST}
  CLIPBRD_S_LAST        = $000401DF;
  {$EXTERNALSYM CLIPBRD_S_LAST}

//
// MessageId: CLIPBRD_E_CANT_OPEN
//
// MessageText:
//
//  OpenClipboard Failed
//

  CLIPBRD_E_CANT_OPEN = HRESULT($800401D0);
  {$EXTERNALSYM CLIPBRD_E_CANT_OPEN}

//
// MessageId: CLIPBRD_E_CANT_EMPTY
//
// MessageText:
//
//  EmptyClipboard Failed
//

  CLIPBRD_E_CANT_EMPTY = HRESULT($800401D1);
  {$EXTERNALSYM CLIPBRD_E_CANT_EMPTY}

//
// MessageId: CLIPBRD_E_CANT_SET
//
// MessageText:
//
//  SetClipboard Failed
//

  CLIPBRD_E_CANT_SET = HRESULT($800401D2);
  {$EXTERNALSYM CLIPBRD_E_CANT_SET}

//
// MessageId: CLIPBRD_E_BAD_DATA
//
// MessageText:
//
//  Data on clipboard is invalid
//

  CLIPBRD_E_BAD_DATA = HRESULT($800401D3);
  {$EXTERNALSYM CLIPBRD_E_BAD_DATA}

//
// MessageId: CLIPBRD_E_CANT_CLOSE
//
// MessageText:
//
//  CloseClipboard Failed
//

  CLIPBRD_E_CANT_CLOSE = HRESULT($800401D4);
  {$EXTERNALSYM CLIPBRD_E_CANT_CLOSE}

  MK_E_FIRST       = DWORD($800401E0);
  {$EXTERNALSYM MK_E_FIRST}
  MK_E_LAST        = DWORD($800401EF);
  {$EXTERNALSYM MK_E_LAST}
  MK_S_FIRST       = $000401E0;
  {$EXTERNALSYM MK_S_FIRST}
  MK_S_LAST        = $000401EF;
  {$EXTERNALSYM MK_S_LAST}

//
// MessageId: MK_E_CONNECTMANUALLY
//
// MessageText:
//
//  Moniker needs to be connected manually
//

  MK_E_CONNECTMANUALLY = HRESULT($800401E0);
  {$EXTERNALSYM MK_E_CONNECTMANUALLY}

//
// MessageId: MK_E_EXCEEDEDDEADLINE
//
// MessageText:
//
//  Operation exceeded deadline
//

  MK_E_EXCEEDEDDEADLINE = HRESULT($800401E1);
  {$EXTERNALSYM MK_E_EXCEEDEDDEADLINE}

//
// MessageId: MK_E_NEEDGENERIC
//
// MessageText:
//
//  Moniker needs to be generic
//

  MK_E_NEEDGENERIC = HRESULT($800401E2);
  {$EXTERNALSYM MK_E_NEEDGENERIC}

//
// MessageId: MK_E_UNAVAILABLE
//
// MessageText:
//
//  Operation unavailable
//

  MK_E_UNAVAILABLE = HRESULT($800401E3);
  {$EXTERNALSYM MK_E_UNAVAILABLE}

//
// MessageId: MK_E_SYNTAX
//
// MessageText:
//
//  Invalid syntax
//

  MK_E_SYNTAX = HRESULT($800401E4);
  {$EXTERNALSYM MK_E_SYNTAX}

//
// MessageId: MK_E_NOOBJECT
//
// MessageText:
//
//  No object for moniker
//

  MK_E_NOOBJECT = HRESULT($800401E5);
  {$EXTERNALSYM MK_E_NOOBJECT}

//
// MessageId: MK_E_INVALIDEXTENSION
//
// MessageText:
//
//  Bad extension for file
//

  MK_E_INVALIDEXTENSION = HRESULT($800401E6);
  {$EXTERNALSYM MK_E_INVALIDEXTENSION}

//
// MessageId: MK_E_INTERMEDIATEINTERFACENOTSUPPORTED
//
// MessageText:
//
//  Intermediate operation failed
//

  MK_E_INTERMEDIATEINTERFACENOTSUPPORTED = HRESULT($800401E7);
  {$EXTERNALSYM MK_E_INTERMEDIATEINTERFACENOTSUPPORTED}

//
// MessageId: MK_E_NOTBINDABLE
//
// MessageText:
//
//  Moniker is not bindable
//

  MK_E_NOTBINDABLE = HRESULT($800401E8);
  {$EXTERNALSYM MK_E_NOTBINDABLE}

//
// MessageId: MK_E_NOTBOUND
//
// MessageText:
//
//  Moniker is not bound
//

  MK_E_NOTBOUND = HRESULT($800401E9);
  {$EXTERNALSYM MK_E_NOTBOUND}

//
// MessageId: MK_E_CANTOPENFILE
//
// MessageText:
//
//  Moniker cannot open file
//

  MK_E_CANTOPENFILE = HRESULT($800401EA);
  {$EXTERNALSYM MK_E_CANTOPENFILE}

//
// MessageId: MK_E_MUSTBOTHERUSER
//
// MessageText:
//
//  User input required for operation to succeed
//

  MK_E_MUSTBOTHERUSER = HRESULT($800401EB);
  {$EXTERNALSYM MK_E_MUSTBOTHERUSER}

//
// MessageId: MK_E_NOINVERSE
//
// MessageText:
//
//  Moniker class has no inverse
//

  MK_E_NOINVERSE = HRESULT($800401EC);
  {$EXTERNALSYM MK_E_NOINVERSE}

//
// MessageId: MK_E_NOSTORAGE
//
// MessageText:
//
//  Moniker does not refer to storage
//

  MK_E_NOSTORAGE = HRESULT($800401ED);
  {$EXTERNALSYM MK_E_NOSTORAGE}

//
// MessageId: MK_E_NOPREFIX
//
// MessageText:
//
//  No common prefix
//

  MK_E_NOPREFIX = HRESULT($800401EE);
  {$EXTERNALSYM MK_E_NOPREFIX}

//
// MessageId: MK_E_ENUMERATION_FAILED
//
// MessageText:
//
//  Moniker could not be enumerated
//

  MK_E_ENUMERATION_FAILED = HRESULT($800401EF);
  {$EXTERNALSYM MK_E_ENUMERATION_FAILED}

  CO_E_FIRST       = DWORD($800401F0);
  {$EXTERNALSYM CO_E_FIRST}
  CO_E_LAST        = DWORD($800401FF);
  {$EXTERNALSYM CO_E_LAST}
  CO_S_FIRST       = $000401F0;
  {$EXTERNALSYM CO_S_FIRST}
  CO_S_LAST        = $000401FF;
  {$EXTERNALSYM CO_S_LAST}

//
// MessageId: CO_E_NOTINITIALIZED
//
// MessageText:
//
//  CoInitialize has not been called.
//

  CO_E_NOTINITIALIZED = HRESULT($800401F0);
  {$EXTERNALSYM CO_E_NOTINITIALIZED}

//
// MessageId: CO_E_ALREADYINITIALIZED
//
// MessageText:
//
//  CoInitialize has already been called.
//

  CO_E_ALREADYINITIALIZED = HRESULT($800401F1);
  {$EXTERNALSYM CO_E_ALREADYINITIALIZED}

//
// MessageId: CO_E_CANTDETERMINECLASS
//
// MessageText:
//
//  Class of object cannot be determined
//

  CO_E_CANTDETERMINECLASS = HRESULT($800401F2);
  {$EXTERNALSYM CO_E_CANTDETERMINECLASS}

//
// MessageId: CO_E_CLASSSTRING
//
// MessageText:
//
//  Invalid class string
//

  CO_E_CLASSSTRING = HRESULT($800401F3);
  {$EXTERNALSYM CO_E_CLASSSTRING}

//
// MessageId: CO_E_IIDSTRING
//
// MessageText:
//
//  Invalid interface string
//

  CO_E_IIDSTRING = HRESULT($800401F4);
  {$EXTERNALSYM CO_E_IIDSTRING}

//
// MessageId: CO_E_APPNOTFOUND
//
// MessageText:
//
//  Application not found
//

  CO_E_APPNOTFOUND = HRESULT($800401F5);
  {$EXTERNALSYM CO_E_APPNOTFOUND}

//
// MessageId: CO_E_APPSINGLEUSE
//
// MessageText:
//
//  Application cannot be run more than once
//

  CO_E_APPSINGLEUSE = HRESULT($800401F6);
  {$EXTERNALSYM CO_E_APPSINGLEUSE}

//
// MessageId: CO_E_ERRORINAPP
//
// MessageText:
//
//  Some error in application program
//

  CO_E_ERRORINAPP = HRESULT($800401F7);
  {$EXTERNALSYM CO_E_ERRORINAPP}

//
// MessageId: CO_E_DLLNOTFOUND
//
// MessageText:
//
//  DLL for class not found
//

  CO_E_DLLNOTFOUND = HRESULT($800401F8);
  {$EXTERNALSYM CO_E_DLLNOTFOUND}

//
// MessageId: CO_E_ERRORINDLL
//
// MessageText:
//
//  Error in the DLL
//

  CO_E_ERRORINDLL = HRESULT($800401F9);
  {$EXTERNALSYM CO_E_ERRORINDLL}

//
// MessageId: CO_E_WRONGOSFORAPP
//
// MessageText:
//
//  Wrong OS or OS version for application
//

  CO_E_WRONGOSFORAPP = HRESULT($800401FA);
  {$EXTERNALSYM CO_E_WRONGOSFORAPP}

//
// MessageId: CO_E_OBJNOTREG
//
// MessageText:
//
//  Object is not registered
//

  CO_E_OBJNOTREG = HRESULT($800401FB);
  {$EXTERNALSYM CO_E_OBJNOTREG}

//
// MessageId: CO_E_OBJISREG
//
// MessageText:
//
//  Object is already registered
//

  CO_E_OBJISREG = HRESULT($800401FC);
  {$EXTERNALSYM CO_E_OBJISREG}

//
// MessageId: CO_E_OBJNOTCONNECTED
//
// MessageText:
//
//  Object is not connected to server
//

  CO_E_OBJNOTCONNECTED = HRESULT($800401FD);
  {$EXTERNALSYM CO_E_OBJNOTCONNECTED}

//
// MessageId: CO_E_APPDIDNTREG
//
// MessageText:
//
//  Application was launched but it didn't register a class factory
//

  CO_E_APPDIDNTREG = HRESULT($800401FE);
  {$EXTERNALSYM CO_E_APPDIDNTREG}

//
// MessageId: CO_E_RELEASED
//
// MessageText:
//
//  Object has been released
//

  CO_E_RELEASED = HRESULT($800401FF);
  {$EXTERNALSYM CO_E_RELEASED}

  EVENT_E_FIRST       = DWORD($80040200);
  {$EXTERNALSYM EVENT_E_FIRST}
  EVENT_E_LAST        = DWORD($8004021F);
  {$EXTERNALSYM EVENT_E_LAST}
  EVENT_S_FIRST       = $00040200;
  {$EXTERNALSYM EVENT_S_FIRST}
  EVENT_S_LAST        = $0004021F;
  {$EXTERNALSYM EVENT_S_LAST}

//
// MessageId: EVENT_S_SOME_SUBSCRIBERS_FAILED
//
// MessageText:
//
//  An event was able to invoke some but not all of the subscribers
//

  EVENT_S_SOME_SUBSCRIBERS_FAILED = HRESULT($00040200);
  {$EXTERNALSYM EVENT_S_SOME_SUBSCRIBERS_FAILED}

//
// MessageId: EVENT_E_ALL_SUBSCRIBERS_FAILED
//
// MessageText:
//
//  An event was unable to invoke any of the subscribers
//

  EVENT_E_ALL_SUBSCRIBERS_FAILED = HRESULT($80040201);
  {$EXTERNALSYM EVENT_E_ALL_SUBSCRIBERS_FAILED}

//
// MessageId: EVENT_S_NOSUBSCRIBERS
//
// MessageText:
//
//  An event was delivered but there were no subscribers
//

  EVENT_S_NOSUBSCRIBERS = HRESULT($00040202);
  {$EXTERNALSYM EVENT_S_NOSUBSCRIBERS}

//
// MessageId: EVENT_E_QUERYSYNTAX
//
// MessageText:
//
//  A syntax error occurred trying to evaluate a query string
//

  EVENT_E_QUERYSYNTAX = HRESULT($80040203);
  {$EXTERNALSYM EVENT_E_QUERYSYNTAX}

//
// MessageId: EVENT_E_QUERYFIELD
//
// MessageText:
//
//  An invalid field name was used in a query string
//

  EVENT_E_QUERYFIELD = HRESULT($80040204);
  {$EXTERNALSYM EVENT_E_QUERYFIELD}

//
// MessageId: EVENT_E_INTERNALEXCEPTION
//
// MessageText:
//
//  An unexpected exception was raised
//

  EVENT_E_INTERNALEXCEPTION = HRESULT($80040205);
  {$EXTERNALSYM EVENT_E_INTERNALEXCEPTION}

//
// MessageId: EVENT_E_INTERNALERROR
//
// MessageText:
//
//  An unexpected internal error was detected
//

  EVENT_E_INTERNALERROR = HRESULT($80040206);
  {$EXTERNALSYM EVENT_E_INTERNALERROR}

//
// MessageId: EVENT_E_INVALID_PER_USER_SID
//
// MessageText:
//
//  The owner SID on a per-user subscription doesn't exist
//

  EVENT_E_INVALID_PER_USER_SID = HRESULT($80040207);
  {$EXTERNALSYM EVENT_E_INVALID_PER_USER_SID}

//
// MessageId: EVENT_E_USER_EXCEPTION
//
// MessageText:
//
//  A user-supplied component or subscriber raised an exception
//

  EVENT_E_USER_EXCEPTION = HRESULT($80040208);
  {$EXTERNALSYM EVENT_E_USER_EXCEPTION}

//
// MessageId: EVENT_E_TOO_MANY_METHODS
//
// MessageText:
//
//  An interface has too many methods to fire events from
//

  EVENT_E_TOO_MANY_METHODS = HRESULT($80040209);
  {$EXTERNALSYM EVENT_E_TOO_MANY_METHODS}

//
// MessageId: EVENT_E_MISSING_EVENTCLASS
//
// MessageText:
//
//  A subscription cannot be stored unless its event class already exists
//

  EVENT_E_MISSING_EVENTCLASS = HRESULT($8004020A);
  {$EXTERNALSYM EVENT_E_MISSING_EVENTCLASS}

//
// MessageId: EVENT_E_NOT_ALL_REMOVED
//
// MessageText:
//
//  Not all the objects requested could be removed
//

  EVENT_E_NOT_ALL_REMOVED = HRESULT($8004020B);
  {$EXTERNALSYM EVENT_E_NOT_ALL_REMOVED}

//
// MessageId: EVENT_E_COMPLUS_NOT_INSTALLED
//
// MessageText:
//
//  COM+ is required for this operation, but is not installed
//

  EVENT_E_COMPLUS_NOT_INSTALLED = HRESULT($8004020C);
  {$EXTERNALSYM EVENT_E_COMPLUS_NOT_INSTALLED}

  CONTEXT_E_FIRST       = DWORD($8004E000);
  {$EXTERNALSYM CONTEXT_E_FIRST}
  CONTEXT_E_LAST        = DWORD($8004E02F);
  {$EXTERNALSYM CONTEXT_E_LAST}
  CONTEXT_S_FIRST       = $0004E000;
  {$EXTERNALSYM CONTEXT_S_FIRST}
  CONTEXT_S_LAST        = $0004E02F;
  {$EXTERNALSYM CONTEXT_S_LAST}

//
// MessageId: CONTEXT_E_ABORTED
//
// MessageText:
//
//  The root transaction wanted to commit, but transaction aborted
//

  CONTEXT_E_ABORTED = HRESULT($8004E002);
  {$EXTERNALSYM CONTEXT_E_ABORTED}

//
// MessageId: CONTEXT_E_ABORTING
//
// MessageText:
//
//  You made a method call on a COM+ component that has a transaction that has already aborted or in the process of aborting.
//

  CONTEXT_E_ABORTING = HRESULT($8004E003);
  {$EXTERNALSYM CONTEXT_E_ABORTING}

//
// MessageId: CONTEXT_E_NOCONTEXT
//
// MessageText:
//
//  There is no MTS object context
//

  CONTEXT_E_NOCONTEXT = HRESULT($8004E004);
  {$EXTERNALSYM CONTEXT_E_NOCONTEXT}

//
// MessageId: CONTEXT_E_SYNCH_TIMEOUT
//
// MessageText:
//
//  The component is configured to use synchronization and a thread has timed out waiting to enter the context.
//

  CONTEXT_E_SYNCH_TIMEOUT = HRESULT($8004E006);
  {$EXTERNALSYM CONTEXT_E_SYNCH_TIMEOUT}

//
// MessageId: CONTEXT_E_OLDREF
//
// MessageText:
//
//  You made a method call on a COM+ component that has a transaction that has already committed or aborted.
//

  CONTEXT_E_OLDREF = HRESULT($8004E007);
  {$EXTERNALSYM CONTEXT_E_OLDREF}

//
// MessageId: CONTEXT_E_ROLENOTFOUND
//
// MessageText:
//
//  The specified role was not configured for the application
//

  CONTEXT_E_ROLENOTFOUND = HRESULT($8004E00C);
  {$EXTERNALSYM CONTEXT_E_ROLENOTFOUND}

//
// MessageId: CONTEXT_E_TMNOTAVAILABLE
//
// MessageText:
//
//  COM+ was unable to talk to the Microsoft Distributed Transaction Coordinator
//

  CONTEXT_E_TMNOTAVAILABLE = HRESULT($8004E00F);
  {$EXTERNALSYM CONTEXT_E_TMNOTAVAILABLE}

//
// MessageId: CO_E_ACTIVATIONFAILED
//
// MessageText:
//
//  An unexpected error occurred during COM+ Activation.
//

  CO_E_ACTIVATIONFAILED = HRESULT($8004E021);
  {$EXTERNALSYM CO_E_ACTIVATIONFAILED}

//
// MessageId: CO_E_ACTIVATIONFAILED_EVENTLOGGED
//
// MessageText:
//
//  COM+ Activation failed. Check the event log for more information
//

  CO_E_ACTIVATIONFAILED_EVENTLOGGED = HRESULT($8004E022);
  {$EXTERNALSYM CO_E_ACTIVATIONFAILED_EVENTLOGGED}

//
// MessageId: CO_E_ACTIVATIONFAILED_CATALOGERROR
//
// MessageText:
//
//  COM+ Activation failed due to a catalog or configuration error.
//

  CO_E_ACTIVATIONFAILED_CATALOGERROR = HRESULT($8004E023);
  {$EXTERNALSYM CO_E_ACTIVATIONFAILED_CATALOGERROR}

//
// MessageId: CO_E_ACTIVATIONFAILED_TIMEOUT
//
// MessageText:
//
//  COM+ activation failed because the activation could not be completed in the specified amount of time.
//

  CO_E_ACTIVATIONFAILED_TIMEOUT = HRESULT($8004E024);
  {$EXTERNALSYM CO_E_ACTIVATIONFAILED_TIMEOUT}

//
// MessageId: CO_E_INITIALIZATIONFAILED
//
// MessageText:
//
//  COM+ Activation failed because an initialization function failed.  Check the event log for more information.
//

  CO_E_INITIALIZATIONFAILED = HRESULT($8004E025);
  {$EXTERNALSYM CO_E_INITIALIZATIONFAILED}

//
// MessageId: CONTEXT_E_NOJIT
//
// MessageText:
//
//  The requested operation requires that JIT be in the current context and it is not
//

  CONTEXT_E_NOJIT = HRESULT($8004E026);
  {$EXTERNALSYM CONTEXT_E_NOJIT}

//
// MessageId: CONTEXT_E_NOTRANSACTION
//
// MessageText:
//
//  The requested operation requires that the current context have a Transaction, and it does not
//

  CONTEXT_E_NOTRANSACTION = HRESULT($8004E027);
  {$EXTERNALSYM CONTEXT_E_NOTRANSACTION}

//
// MessageId: CO_E_THREADINGMODEL_CHANGED
//
// MessageText:
//
//  The components threading model has changed after install into a COM+ Application.  Please re-install component.
//

  CO_E_THREADINGMODEL_CHANGED = HRESULT($8004E028);
  {$EXTERNALSYM CO_E_THREADINGMODEL_CHANGED}

//
// Old OLE Success Codes
//
//
// MessageId: OLE_S_USEREG
//
// MessageText:
//
//  Use the registry database to provide the requested information
//

  OLE_S_USEREG = HRESULT($00040000);
  {$EXTERNALSYM OLE_S_USEREG}

//
// MessageId: OLE_S_STATIC
//
// MessageText:
//
//  Success, but static
//

  OLE_S_STATIC = HRESULT($00040001);
  {$EXTERNALSYM OLE_S_STATIC}

//
// MessageId: OLE_S_MAC_CLIPFORMAT
//
// MessageText:
//
//  Macintosh clipboard format
//

  OLE_S_MAC_CLIPFORMAT = HRESULT($00040002);
  {$EXTERNALSYM OLE_S_MAC_CLIPFORMAT}

//
// MessageId: DRAGDROP_S_DROP
//
// MessageText:
//
//  Successful drop took place
//

  DRAGDROP_S_DROP = HRESULT($00040100);
  {$EXTERNALSYM DRAGDROP_S_DROP}

//
// MessageId: DRAGDROP_S_CANCEL
//
// MessageText:
//
//  Drag-drop operation canceled
//

  DRAGDROP_S_CANCEL = HRESULT($00040101);
  {$EXTERNALSYM DRAGDROP_S_CANCEL}

//
// MessageId: DRAGDROP_S_USEDEFAULTCURSORS
//
// MessageText:
//
//  Use the default cursor
//

  DRAGDROP_S_USEDEFAULTCURSORS = HRESULT($00040102);
  {$EXTERNALSYM DRAGDROP_S_USEDEFAULTCURSORS}

//
// MessageId: DATA_S_SAMEFORMATETC
//
// MessageText:
//
//  Data has same FORMATETC
//

  DATA_S_SAMEFORMATETC = HRESULT($00040130);
  {$EXTERNALSYM DATA_S_SAMEFORMATETC}

//
// MessageId: VIEW_S_ALREADY_FROZEN
//
// MessageText:
//
//  View is already frozen
//

  VIEW_S_ALREADY_FROZEN = HRESULT($00040140);
  {$EXTERNALSYM VIEW_S_ALREADY_FROZEN}

//
// MessageId: CACHE_S_FORMATETC_NOTSUPPORTED
//
// MessageText:
//
//  FORMATETC not supported
//

  CACHE_S_FORMATETC_NOTSUPPORTED = HRESULT($00040170);
  {$EXTERNALSYM CACHE_S_FORMATETC_NOTSUPPORTED}

//
// MessageId: CACHE_S_SAMECACHE
//
// MessageText:
//
//  Same cache
//

  CACHE_S_SAMECACHE = HRESULT($00040171);
  {$EXTERNALSYM CACHE_S_SAMECACHE}

//
// MessageId: CACHE_S_SOMECACHES_NOTUPDATED
//
// MessageText:
//
//  Some cache(s) not updated
//

  CACHE_S_SOMECACHES_NOTUPDATED = HRESULT($00040172);
  {$EXTERNALSYM CACHE_S_SOMECACHES_NOTUPDATED}

//
// MessageId: OLEOBJ_S_INVALIDVERB
//
// MessageText:
//
//  Invalid verb for OLE object
//

  OLEOBJ_S_INVALIDVERB = HRESULT($00040180);
  {$EXTERNALSYM OLEOBJ_S_INVALIDVERB}

//
// MessageId: OLEOBJ_S_CANNOT_DOVERB_NOW
//
// MessageText:
//
//  Verb number is valid but verb cannot be done now
//

  OLEOBJ_S_CANNOT_DOVERB_NOW = HRESULT($00040181);
  {$EXTERNALSYM OLEOBJ_S_CANNOT_DOVERB_NOW}

//
// MessageId: OLEOBJ_S_INVALIDHWND
//
// MessageText:
//
//  Invalid window handle passed
//

  OLEOBJ_S_INVALIDHWND = HRESULT($00040182);
  {$EXTERNALSYM OLEOBJ_S_INVALIDHWND}

//
// MessageId: INPLACE_S_TRUNCATED
//
// MessageText:
//
//  Message is too long; some of it had to be truncated before displaying
//

  INPLACE_S_TRUNCATED = HRESULT($000401A0);
  {$EXTERNALSYM INPLACE_S_TRUNCATED}

//
// MessageId: CONVERT10_S_NO_PRESENTATION
//
// MessageText:
//
//  Unable to convert OLESTREAM to IStorage
//

  CONVERT10_S_NO_PRESENTATION = HRESULT($000401C0);
  {$EXTERNALSYM CONVERT10_S_NO_PRESENTATION}

//
// MessageId: MK_S_REDUCED_TO_SELF
//
// MessageText:
//
//  Moniker reduced to itself
//

  MK_S_REDUCED_TO_SELF = HRESULT($000401E2);
  {$EXTERNALSYM MK_S_REDUCED_TO_SELF}

//
// MessageId: MK_S_ME
//
// MessageText:
//
//  Common prefix is this moniker
//

  MK_S_ME = HRESULT($000401E4);
  {$EXTERNALSYM MK_S_ME}

//
// MessageId: MK_S_HIM
//
// MessageText:
//
//  Common prefix is input moniker
//

  MK_S_HIM = HRESULT($000401E5);
  {$EXTERNALSYM MK_S_HIM}

//
// MessageId: MK_S_US
//
// MessageText:
//
//  Common prefix is both monikers
//

  MK_S_US = HRESULT($000401E6);
  {$EXTERNALSYM MK_S_US}

//
// MessageId: MK_S_MONIKERALREADYREGISTERED
//
// MessageText:
//
//  Moniker is already registered in running object table
//

  MK_S_MONIKERALREADYREGISTERED = HRESULT($000401E7);
  {$EXTERNALSYM MK_S_MONIKERALREADYREGISTERED}

//
// Task Scheduler errors
//
//
// MessageId: SCHED_S_TASK_READY
//
// MessageText:
//
//  The task is ready to run at its next scheduled time.
//

  SCHED_S_TASK_READY = HRESULT($00041300);
  {$EXTERNALSYM SCHED_S_TASK_READY}

//
// MessageId: SCHED_S_TASK_RUNNING
//
// MessageText:
//
//  The task is currently running.
//

  SCHED_S_TASK_RUNNING = HRESULT($00041301);
  {$EXTERNALSYM SCHED_S_TASK_RUNNING}

//
// MessageId: SCHED_S_TASK_DISABLED
//
// MessageText:
//
//  The task will not run at the scheduled times because it has been disabled.
//

  SCHED_S_TASK_DISABLED = HRESULT($00041302);
  {$EXTERNALSYM SCHED_S_TASK_DISABLED}

//
// MessageId: SCHED_S_TASK_HAS_NOT_RUN
//
// MessageText:
//
//  The task has not yet run.
//

  SCHED_S_TASK_HAS_NOT_RUN = HRESULT($00041303);
  {$EXTERNALSYM SCHED_S_TASK_HAS_NOT_RUN}

//
// MessageId: SCHED_S_TASK_NO_MORE_RUNS
//
// MessageText:
//
//  There are no more runs scheduled for this task.
//

  SCHED_S_TASK_NO_MORE_RUNS = HRESULT($00041304);
  {$EXTERNALSYM SCHED_S_TASK_NO_MORE_RUNS}

//
// MessageId: SCHED_S_TASK_NOT_SCHEDULED
//
// MessageText:
//
//  One or more of the properties that are needed to run this task on a schedule have not been set.
//

  SCHED_S_TASK_NOT_SCHEDULED = HRESULT($00041305);
  {$EXTERNALSYM SCHED_S_TASK_NOT_SCHEDULED}

//
// MessageId: SCHED_S_TASK_TERMINATED
//
// MessageText:
//
//  The last run of the task was terminated by the user.
//

  SCHED_S_TASK_TERMINATED = HRESULT($00041306);
  {$EXTERNALSYM SCHED_S_TASK_TERMINATED}

//
// MessageId: SCHED_S_TASK_NO_VALID_TRIGGERS
//
// MessageText:
//
//  Either the task has no triggers or the existing triggers are disabled or not set.
//

  SCHED_S_TASK_NO_VALID_TRIGGERS = HRESULT($00041307);
  {$EXTERNALSYM SCHED_S_TASK_NO_VALID_TRIGGERS}

//
// MessageId: SCHED_S_EVENT_TRIGGER
//
// MessageText:
//
//  Event triggers don't have set run times.
//

  SCHED_S_EVENT_TRIGGER = HRESULT($00041308);
  {$EXTERNALSYM SCHED_S_EVENT_TRIGGER}

//
// MessageId: SCHED_E_TRIGGER_NOT_FOUND
//
// MessageText:
//
//  Trigger not found.
//

  SCHED_E_TRIGGER_NOT_FOUND = HRESULT($80041309);
  {$EXTERNALSYM SCHED_E_TRIGGER_NOT_FOUND}

//
// MessageId: SCHED_E_TASK_NOT_READY
//
// MessageText:
//
//  One or more of the properties that are needed to run this task have not been set.
//

  SCHED_E_TASK_NOT_READY = HRESULT($8004130A);
  {$EXTERNALSYM SCHED_E_TASK_NOT_READY}

//
// MessageId: SCHED_E_TASK_NOT_RUNNING
//
// MessageText:
//
//  There is no running instance of the task to terminate.
//

  SCHED_E_TASK_NOT_RUNNING = HRESULT($8004130B);
  {$EXTERNALSYM SCHED_E_TASK_NOT_RUNNING}

//
// MessageId: SCHED_E_SERVICE_NOT_INSTALLED
//
// MessageText:
//
//  The Task Scheduler Service is not installed on this computer.
//

  SCHED_E_SERVICE_NOT_INSTALLED = HRESULT($8004130C);
  {$EXTERNALSYM SCHED_E_SERVICE_NOT_INSTALLED}

//
// MessageId: SCHED_E_CANNOT_OPEN_TASK
//
// MessageText:
//
//  The task object could not be opened.
//

  SCHED_E_CANNOT_OPEN_TASK = HRESULT($8004130D);
  {$EXTERNALSYM SCHED_E_CANNOT_OPEN_TASK}

//
// MessageId: SCHED_E_INVALID_TASK
//
// MessageText:
//
//  The object is either an invalid task object or is not a task object.
//

  SCHED_E_INVALID_TASK = HRESULT($8004130E);
  {$EXTERNALSYM SCHED_E_INVALID_TASK}

//
// MessageId: SCHED_E_ACCOUNT_INFORMATION_NOT_SET
//
// MessageText:
//
//  No account information could be found in the Task Scheduler security database for the task indicated.
//

  SCHED_E_ACCOUNT_INFORMATION_NOT_SET = HRESULT($8004130F);
  {$EXTERNALSYM SCHED_E_ACCOUNT_INFORMATION_NOT_SET}

//
// MessageId: SCHED_E_ACCOUNT_NAME_NOT_FOUND
//
// MessageText:
//
//  Unable to establish existence of the account specified.
//

  SCHED_E_ACCOUNT_NAME_NOT_FOUND = HRESULT($80041310);
  {$EXTERNALSYM SCHED_E_ACCOUNT_NAME_NOT_FOUND}

//
// MessageId: SCHED_E_ACCOUNT_DBASE_CORRUPT
//
// MessageText:
//
//  Corruption was detected in the Task Scheduler security database; the database has been reset.
//

  SCHED_E_ACCOUNT_DBASE_CORRUPT = HRESULT($80041311);
  {$EXTERNALSYM SCHED_E_ACCOUNT_DBASE_CORRUPT}

//
// MessageId: SCHED_E_NO_SECURITY_SERVICES
//
// MessageText:
//
//  Task Scheduler security services are available only on Windows NT.
//

  SCHED_E_NO_SECURITY_SERVICES = HRESULT($80041312);
  {$EXTERNALSYM SCHED_E_NO_SECURITY_SERVICES}

//
// MessageId: SCHED_E_UNKNOWN_OBJECT_VERSION
//
// MessageText:
//
//  The task object version is either unsupported or invalid.
//

  SCHED_E_UNKNOWN_OBJECT_VERSION = HRESULT($80041313);
  {$EXTERNALSYM SCHED_E_UNKNOWN_OBJECT_VERSION}

//
// MessageId: SCHED_E_UNSUPPORTED_ACCOUNT_OPTION
//
// MessageText:
//
//  The task has been configured with an unsupported combination of account settings and run time options.
//

  SCHED_E_UNSUPPORTED_ACCOUNT_OPTION = HRESULT($80041314);
  {$EXTERNALSYM SCHED_E_UNSUPPORTED_ACCOUNT_OPTION}

//
// MessageId: SCHED_E_SERVICE_NOT_RUNNING
//
// MessageText:
//
//  The Task Scheduler Service is not running.
//

  SCHED_E_SERVICE_NOT_RUNNING = HRESULT($80041315);
  {$EXTERNALSYM SCHED_E_SERVICE_NOT_RUNNING}

// ******************
// FACILITY_WINDOWS
// ******************
//
// Codes 0x0-0x01ff are reserved for the OLE group of
// interfaces.
//
//
// MessageId: CO_E_CLASS_CREATE_FAILED
//
// MessageText:
//
//  Attempt to create a class object failed
//

  CO_E_CLASS_CREATE_FAILED = HRESULT($80080001);
  {$EXTERNALSYM CO_E_CLASS_CREATE_FAILED}

//
// MessageId: CO_E_SCM_ERROR
//
// MessageText:
//
//  OLE service could not bind object
//

  CO_E_SCM_ERROR = HRESULT($80080002);
  {$EXTERNALSYM CO_E_SCM_ERROR}

//
// MessageId: CO_E_SCM_RPC_FAILURE
//
// MessageText:
//
//  RPC communication failed with OLE service
//

  CO_E_SCM_RPC_FAILURE = HRESULT($80080003);
  {$EXTERNALSYM CO_E_SCM_RPC_FAILURE}

//
// MessageId: CO_E_BAD_PATH
//
// MessageText:
//
//  Bad path to object
//

  CO_E_BAD_PATH = HRESULT($80080004);
  {$EXTERNALSYM CO_E_BAD_PATH}

//
// MessageId: CO_E_SERVER_EXEC_FAILURE
//
// MessageText:
//
//  Server execution failed
//

  CO_E_SERVER_EXEC_FAILURE = HRESULT($80080005);
  {$EXTERNALSYM CO_E_SERVER_EXEC_FAILURE}

//
// MessageId: CO_E_OBJSRV_RPC_FAILURE
//
// MessageText:
//
//  OLE service could not communicate with the object server
//

  CO_E_OBJSRV_RPC_FAILURE = HRESULT($80080006);
  {$EXTERNALSYM CO_E_OBJSRV_RPC_FAILURE}

//
// MessageId: MK_E_NO_NORMALIZED
//
// MessageText:
//
//  Moniker path could not be normalized
//

  MK_E_NO_NORMALIZED = HRESULT($80080007);
  {$EXTERNALSYM MK_E_NO_NORMALIZED}

//
// MessageId: CO_E_SERVER_STOPPING
//
// MessageText:
//
//  Object server is stopping when OLE service contacts it
//

  CO_E_SERVER_STOPPING = HRESULT($80080008);
  {$EXTERNALSYM CO_E_SERVER_STOPPING}

//
// MessageId: MEM_E_INVALID_ROOT
//
// MessageText:
//
//  An invalid root block pointer was specified
//

  MEM_E_INVALID_ROOT = HRESULT($80080009);
  {$EXTERNALSYM MEM_E_INVALID_ROOT}

//
// MessageId: MEM_E_INVALID_LINK
//
// MessageText:
//
//  An allocation chain contained an invalid link pointer
//

  MEM_E_INVALID_LINK = HRESULT($80080010);
  {$EXTERNALSYM MEM_E_INVALID_LINK}

//
// MessageId: MEM_E_INVALID_SIZE
//
// MessageText:
//
//  The requested allocation size was too large
//

  MEM_E_INVALID_SIZE = HRESULT($80080011);
  {$EXTERNALSYM MEM_E_INVALID_SIZE}

//
// MessageId: CO_S_NOTALLINTERFACES
//
// MessageText:
//
//  Not all the requested interfaces were available
//

  CO_S_NOTALLINTERFACES = HRESULT($00080012);
  {$EXTERNALSYM CO_S_NOTALLINTERFACES}

// ******************
// FACILITY_DISPATCH
// ******************
//
// MessageId: DISP_E_UNKNOWNINTERFACE
//
// MessageText:
//
//  Unknown interface.
//

  DISP_E_UNKNOWNINTERFACE = HRESULT($80020001);
  {$EXTERNALSYM DISP_E_UNKNOWNINTERFACE}

//
// MessageId: DISP_E_MEMBERNOTFOUND
//
// MessageText:
//
//  Member not found.
//

  DISP_E_MEMBERNOTFOUND = HRESULT($80020003);
  {$EXTERNALSYM DISP_E_MEMBERNOTFOUND}

//
// MessageId: DISP_E_PARAMNOTFOUND
//
// MessageText:
//
//  Parameter not found.
//

  DISP_E_PARAMNOTFOUND = HRESULT($80020004);
  {$EXTERNALSYM DISP_E_PARAMNOTFOUND}

//
// MessageId: DISP_E_TYPEMISMATCH
//
// MessageText:
//
//  Type mismatch.
//

  DISP_E_TYPEMISMATCH = HRESULT($80020005);
  {$EXTERNALSYM DISP_E_TYPEMISMATCH}

//
// MessageId: DISP_E_UNKNOWNNAME
//
// MessageText:
//
//  Unknown name.
//

  DISP_E_UNKNOWNNAME = HRESULT($80020006);
  {$EXTERNALSYM DISP_E_UNKNOWNNAME}

//
// MessageId: DISP_E_NONAMEDARGS
//
// MessageText:
//
//  No named arguments.
//

  DISP_E_NONAMEDARGS = HRESULT($80020007);
  {$EXTERNALSYM DISP_E_NONAMEDARGS}

//
// MessageId: DISP_E_BADVARTYPE
//
// MessageText:
//
//  Bad variable type.
//

  DISP_E_BADVARTYPE = HRESULT($80020008);
  {$EXTERNALSYM DISP_E_BADVARTYPE}

//
// MessageId: DISP_E_EXCEPTION
//
// MessageText:
//
//  Exception occurred.
//

  DISP_E_EXCEPTION = HRESULT($80020009);
  {$EXTERNALSYM DISP_E_EXCEPTION}

//
// MessageId: DISP_E_OVERFLOW
//
// MessageText:
//
//  Out of present range.
//

  DISP_E_OVERFLOW = HRESULT($8002000A);
  {$EXTERNALSYM DISP_E_OVERFLOW}

//
// MessageId: DISP_E_BADINDEX
//
// MessageText:
//
//  Invalid index.
//

  DISP_E_BADINDEX = HRESULT($8002000B);
  {$EXTERNALSYM DISP_E_BADINDEX}

//
// MessageId: DISP_E_UNKNOWNLCID
//
// MessageText:
//
//  Unknown language.
//

  DISP_E_UNKNOWNLCID = HRESULT($8002000C);
  {$EXTERNALSYM DISP_E_UNKNOWNLCID}

//
// MessageId: DISP_E_ARRAYISLOCKED
//
// MessageText:
//
//  Memory is locked.
//

  DISP_E_ARRAYISLOCKED = HRESULT($8002000D);
  {$EXTERNALSYM DISP_E_ARRAYISLOCKED}

//
// MessageId: DISP_E_BADPARAMCOUNT
//
// MessageText:
//
//  Invalid number of parameters.
//

  DISP_E_BADPARAMCOUNT = HRESULT($8002000E);
  {$EXTERNALSYM DISP_E_BADPARAMCOUNT}

//
// MessageId: DISP_E_PARAMNOTOPTIONAL
//
// MessageText:
//
//  Parameter not optional.
//

  DISP_E_PARAMNOTOPTIONAL = HRESULT($8002000F);
  {$EXTERNALSYM DISP_E_PARAMNOTOPTIONAL}

//
// MessageId: DISP_E_BADCALLEE
//
// MessageText:
//
//  Invalid callee.
//

  DISP_E_BADCALLEE = HRESULT($80020010);
  {$EXTERNALSYM DISP_E_BADCALLEE}

//
// MessageId: DISP_E_NOTACOLLECTION
//
// MessageText:
//
//  Does not support a collection.
//

  DISP_E_NOTACOLLECTION = HRESULT($80020011);
  {$EXTERNALSYM DISP_E_NOTACOLLECTION}

//
// MessageId: DISP_E_DIVBYZERO
//
// MessageText:
//
//  Division by zero.
//

  DISP_E_DIVBYZERO = HRESULT($80020012);
  {$EXTERNALSYM DISP_E_DIVBYZERO}

//
// MessageId: DISP_E_BUFFERTOOSMALL
//
// MessageText:
//
//  Buffer too small
//

  DISP_E_BUFFERTOOSMALL = HRESULT($80020013);
  {$EXTERNALSYM DISP_E_BUFFERTOOSMALL}

//
// MessageId: TYPE_E_BUFFERTOOSMALL
//
// MessageText:
//
//  Buffer too small.
//

  TYPE_E_BUFFERTOOSMALL = HRESULT($80028016);
  {$EXTERNALSYM TYPE_E_BUFFERTOOSMALL}

//
// MessageId: TYPE_E_FIELDNOTFOUND
//
// MessageText:
//
//  Field name not defined in the record.
//

  TYPE_E_FIELDNOTFOUND = HRESULT($80028017);
  {$EXTERNALSYM TYPE_E_FIELDNOTFOUND}

//
// MessageId: TYPE_E_INVDATAREAD
//
// MessageText:
//
//  Old format or invalid type library.
//

  TYPE_E_INVDATAREAD = HRESULT($80028018);
  {$EXTERNALSYM TYPE_E_INVDATAREAD}

//
// MessageId: TYPE_E_UNSUPFORMAT
//
// MessageText:
//
//  Old format or invalid type library.
//

  TYPE_E_UNSUPFORMAT = HRESULT($80028019);
  {$EXTERNALSYM TYPE_E_UNSUPFORMAT}

//
// MessageId: TYPE_E_REGISTRYACCESS
//
// MessageText:
//
//  Error accessing the OLE registry.
//

  TYPE_E_REGISTRYACCESS = HRESULT($8002801C);
  {$EXTERNALSYM TYPE_E_REGISTRYACCESS}

//
// MessageId: TYPE_E_LIBNOTREGISTERED
//
// MessageText:
//
//  Library not registered.
//

  TYPE_E_LIBNOTREGISTERED = HRESULT($8002801D);
  {$EXTERNALSYM TYPE_E_LIBNOTREGISTERED}

//
// MessageId: TYPE_E_UNDEFINEDTYPE
//
// MessageText:
//
//  Bound to unknown type.
//

  TYPE_E_UNDEFINEDTYPE = HRESULT($80028027);
  {$EXTERNALSYM TYPE_E_UNDEFINEDTYPE}

//
// MessageId: TYPE_E_QUALIFIEDNAMEDISALLOWED
//
// MessageText:
//
//  Qualified name disallowed.
//

  TYPE_E_QUALIFIEDNAMEDISALLOWED = HRESULT($80028028);
  {$EXTERNALSYM TYPE_E_QUALIFIEDNAMEDISALLOWED}

//
// MessageId: TYPE_E_INVALIDSTATE
//
// MessageText:
//
//  Invalid forward reference, or reference to uncompiled type.
//

  TYPE_E_INVALIDSTATE = HRESULT($80028029);
  {$EXTERNALSYM TYPE_E_INVALIDSTATE}

//
// MessageId: TYPE_E_WRONGTYPEKIND
//
// MessageText:
//
//  Type mismatch.
//

  TYPE_E_WRONGTYPEKIND = HRESULT($8002802A);
  {$EXTERNALSYM TYPE_E_WRONGTYPEKIND}

//
// MessageId: TYPE_E_ELEMENTNOTFOUND
//
// MessageText:
//
//  Element not found.
//

  TYPE_E_ELEMENTNOTFOUND = HRESULT($8002802B);
  {$EXTERNALSYM TYPE_E_ELEMENTNOTFOUND}

//
// MessageId: TYPE_E_AMBIGUOUSNAME
//
// MessageText:
//
//  Ambiguous name.
//

  TYPE_E_AMBIGUOUSNAME = HRESULT($8002802C);
  {$EXTERNALSYM TYPE_E_AMBIGUOUSNAME}

//
// MessageId: TYPE_E_NAMECONFLICT
//
// MessageText:
//
//  Name already exists in the library.
//

  TYPE_E_NAMECONFLICT = HRESULT($8002802D);
  {$EXTERNALSYM TYPE_E_NAMECONFLICT}

//
// MessageId: TYPE_E_UNKNOWNLCID
//
// MessageText:
//
//  Unknown LCID.
//

  TYPE_E_UNKNOWNLCID = HRESULT($8002802E);
  {$EXTERNALSYM TYPE_E_UNKNOWNLCID}

//
// MessageId: TYPE_E_DLLFUNCTIONNOTFOUND
//
// MessageText:
//
//  Function not defined in specified DLL.
//

  TYPE_E_DLLFUNCTIONNOTFOUND = HRESULT($8002802F);
  {$EXTERNALSYM TYPE_E_DLLFUNCTIONNOTFOUND}

//
// MessageId: TYPE_E_BADMODULEKIND
//
// MessageText:
//
//  Wrong module kind for the operation.
//

  TYPE_E_BADMODULEKIND = HRESULT($800288BD);
  {$EXTERNALSYM TYPE_E_BADMODULEKIND}

//
// MessageId: TYPE_E_SIZETOOBIG
//
// MessageText:
//
//  Size may not exceed 64K.
//

  TYPE_E_SIZETOOBIG = HRESULT($800288C5);
  {$EXTERNALSYM TYPE_E_SIZETOOBIG}

//
// MessageId: TYPE_E_DUPLICATEID
//
// MessageText:
//
//  Duplicate ID in inheritance hierarchy.
//

  TYPE_E_DUPLICATEID = HRESULT($800288C6);
  {$EXTERNALSYM TYPE_E_DUPLICATEID}

//
// MessageId: TYPE_E_INVALIDID
//
// MessageText:
//
//  Incorrect inheritance depth in standard OLE hmember.
//

  TYPE_E_INVALIDID = HRESULT($800288CF);
  {$EXTERNALSYM TYPE_E_INVALIDID}

//
// MessageId: TYPE_E_TYPEMISMATCH
//
// MessageText:
//
//  Type mismatch.
//

  TYPE_E_TYPEMISMATCH = HRESULT($80028CA0);
  {$EXTERNALSYM TYPE_E_TYPEMISMATCH}

//
// MessageId: TYPE_E_OUTOFBOUNDS
//
// MessageText:
//
//  Invalid number of arguments.
//

  TYPE_E_OUTOFBOUNDS = HRESULT($80028CA1);
  {$EXTERNALSYM TYPE_E_OUTOFBOUNDS}

//
// MessageId: TYPE_E_IOERROR
//
// MessageText:
//
//  I/O Error.
//

  TYPE_E_IOERROR = HRESULT($80028CA2);
  {$EXTERNALSYM TYPE_E_IOERROR}

//
// MessageId: TYPE_E_CANTCREATETMPFILE
//
// MessageText:
//
//  Error creating unique tmp file.
//

  TYPE_E_CANTCREATETMPFILE = HRESULT($80028CA3);
  {$EXTERNALSYM TYPE_E_CANTCREATETMPFILE}

//
// MessageId: TYPE_E_CANTLOADLIBRARY
//
// MessageText:
//
//  Error loading type library/DLL.
//

  TYPE_E_CANTLOADLIBRARY = HRESULT($80029C4A);
  {$EXTERNALSYM TYPE_E_CANTLOADLIBRARY}

//
// MessageId: TYPE_E_INCONSISTENTPROPFUNCS
//
// MessageText:
//
//  Inconsistent property functions.
//

  TYPE_E_INCONSISTENTPROPFUNCS = HRESULT($80029C83);
  {$EXTERNALSYM TYPE_E_INCONSISTENTPROPFUNCS}

//
// MessageId: TYPE_E_CIRCULARTYPE
//
// MessageText:
//
//  Circular dependency between types/modules.
//

  TYPE_E_CIRCULARTYPE = HRESULT($80029C84);
  {$EXTERNALSYM TYPE_E_CIRCULARTYPE}

// ******************
// FACILITY_STORAGE
// ******************
//
// MessageId: STG_E_INVALIDFUNCTION
//
// MessageText:
//
//  Unable to perform requested operation.
//

  STG_E_INVALIDFUNCTION = HRESULT($80030001);
  {$EXTERNALSYM STG_E_INVALIDFUNCTION}

//
// MessageId: STG_E_FILENOTFOUND
//
// MessageText:
//
//  %1 could not be found.
//

  STG_E_FILENOTFOUND = HRESULT($80030002);
  {$EXTERNALSYM STG_E_FILENOTFOUND}

//
// MessageId: STG_E_PATHNOTFOUND
//
// MessageText:
//
//  The path %1 could not be found.
//

  STG_E_PATHNOTFOUND = HRESULT($80030003);
  {$EXTERNALSYM STG_E_PATHNOTFOUND}

//
// MessageId: STG_E_TOOMANYOPENFILES
//
// MessageText:
//
//  There are insufficient resources to open another file.
//

  STG_E_TOOMANYOPENFILES = HRESULT($80030004);
  {$EXTERNALSYM STG_E_TOOMANYOPENFILES}

//
// MessageId: STG_E_ACCESSDENIED
//
// MessageText:
//
//  Access Denied.
//

  STG_E_ACCESSDENIED = HRESULT($80030005);
  {$EXTERNALSYM STG_E_ACCESSDENIED}

//
// MessageId: STG_E_INVALIDHANDLE
//
// MessageText:
//
//  Attempted an operation on an invalid object.
//

  STG_E_INVALIDHANDLE = HRESULT($80030006);
  {$EXTERNALSYM STG_E_INVALIDHANDLE}

//
// MessageId: STG_E_INSUFFICIENTMEMORY
//
// MessageText:
//
//  There is insufficient memory available to complete operation.
//

  STG_E_INSUFFICIENTMEMORY = HRESULT($80030008);
  {$EXTERNALSYM STG_E_INSUFFICIENTMEMORY}

//
// MessageId: STG_E_INVALIDPOINTER
//
// MessageText:
//
//  Invalid pointer error.
//

  STG_E_INVALIDPOINTER = HRESULT($80030009);
  {$EXTERNALSYM STG_E_INVALIDPOINTER}

//
// MessageId: STG_E_NOMOREFILES
//
// MessageText:
//
//  There are no more entries to return.
//

  STG_E_NOMOREFILES = HRESULT($80030012);
  {$EXTERNALSYM STG_E_NOMOREFILES}

//
// MessageId: STG_E_DISKISWRITEPROTECTED
//
// MessageText:
//
//  Disk is write-protected.
//

  STG_E_DISKISWRITEPROTECTED = HRESULT($80030013);
  {$EXTERNALSYM STG_E_DISKISWRITEPROTECTED}

//
// MessageId: STG_E_SEEKERROR
//
// MessageText:
//
//  An error occurred during a seek operation.
//

  STG_E_SEEKERROR = HRESULT($80030019);
  {$EXTERNALSYM STG_E_SEEKERROR}

//
// MessageId: STG_E_WRITEFAULT
//
// MessageText:
//
//  A disk error occurred during a write operation.
//

  STG_E_WRITEFAULT = HRESULT($8003001D);
  {$EXTERNALSYM STG_E_WRITEFAULT}

//
// MessageId: STG_E_READFAULT
//
// MessageText:
//
//  A disk error occurred during a read operation.
//

  STG_E_READFAULT = HRESULT($8003001E);
  {$EXTERNALSYM STG_E_READFAULT}

//
// MessageId: STG_E_SHAREVIOLATION
//
// MessageText:
//
//  A share violation has occurred.
//

  STG_E_SHAREVIOLATION = HRESULT($80030020);
  {$EXTERNALSYM STG_E_SHAREVIOLATION}

//
// MessageId: STG_E_LOCKVIOLATION
//
// MessageText:
//
//  A lock violation has occurred.
//

  STG_E_LOCKVIOLATION = HRESULT($80030021);
  {$EXTERNALSYM STG_E_LOCKVIOLATION}

//
// MessageId: STG_E_FILEALREADYEXISTS
//
// MessageText:
//
//  %1 already exists.
//

  STG_E_FILEALREADYEXISTS = HRESULT($80030050);
  {$EXTERNALSYM STG_E_FILEALREADYEXISTS}

//
// MessageId: STG_E_INVALIDPARAMETER
//
// MessageText:
//
//  Invalid parameter error.
//

  STG_E_INVALIDPARAMETER = HRESULT($80030057);
  {$EXTERNALSYM STG_E_INVALIDPARAMETER}

//
// MessageId: STG_E_MEDIUMFULL
//
// MessageText:
//
//  There is insufficient disk space to complete operation.
//

  STG_E_MEDIUMFULL = HRESULT($80030070);
  {$EXTERNALSYM STG_E_MEDIUMFULL}

//
// MessageId: STG_E_PROPSETMISMATCHED
//
// MessageText:
//
//  Illegal write of non-simple property to simple property set.
//

  STG_E_PROPSETMISMATCHED = HRESULT($800300F0);
  {$EXTERNALSYM STG_E_PROPSETMISMATCHED}

//
// MessageId: STG_E_ABNORMALAPIEXIT
//
// MessageText:
//
//  An API call exited abnormally.
//

  STG_E_ABNORMALAPIEXIT = HRESULT($800300FA);
  {$EXTERNALSYM STG_E_ABNORMALAPIEXIT}

//
// MessageId: STG_E_INVALIDHEADER
//
// MessageText:
//
//  The file %1 is not a valid compound file.
//

  STG_E_INVALIDHEADER = HRESULT($800300FB);
  {$EXTERNALSYM STG_E_INVALIDHEADER}

//
// MessageId: STG_E_INVALIDNAME
//
// MessageText:
//
//  The name %1 is not valid.
//

  STG_E_INVALIDNAME = HRESULT($800300FC);
  {$EXTERNALSYM STG_E_INVALIDNAME}

//
// MessageId: STG_E_UNKNOWN
//
// MessageText:
//
//  An unexpected error occurred.
//

  STG_E_UNKNOWN = HRESULT($800300FD);
  {$EXTERNALSYM STG_E_UNKNOWN}

//
// MessageId: STG_E_UNIMPLEMENTEDFUNCTION
//
// MessageText:
//
//  That function is not implemented.
//

  STG_E_UNIMPLEMENTEDFUNCTION = HRESULT($800300FE);
  {$EXTERNALSYM STG_E_UNIMPLEMENTEDFUNCTION}

//
// MessageId: STG_E_INVALIDFLAG
//
// MessageText:
//
//  Invalid flag error.
//

  STG_E_INVALIDFLAG = HRESULT($800300FF);
  {$EXTERNALSYM STG_E_INVALIDFLAG}

//
// MessageId: STG_E_INUSE
//
// MessageText:
//
//  Attempted to use an object that is busy.
//

  STG_E_INUSE = HRESULT($80030100);
  {$EXTERNALSYM STG_E_INUSE}

//
// MessageId: STG_E_NOTCURRENT
//
// MessageText:
//
//  The storage has been changed since the last commit.
//

  STG_E_NOTCURRENT = HRESULT($80030101);
  {$EXTERNALSYM STG_E_NOTCURRENT}

//
// MessageId: STG_E_REVERTED
//
// MessageText:
//
//  Attempted to use an object that has ceased to exist.
//

  STG_E_REVERTED = HRESULT($80030102);
  {$EXTERNALSYM STG_E_REVERTED}

//
// MessageId: STG_E_CANTSAVE
//
// MessageText:
//
//  Can't save.
//

  STG_E_CANTSAVE = HRESULT($80030103);
  {$EXTERNALSYM STG_E_CANTSAVE}

//
// MessageId: STG_E_OLDFORMAT
//
// MessageText:
//
//  The compound file %1 was produced with an incompatible version of storage.
//

  STG_E_OLDFORMAT = HRESULT($80030104);
  {$EXTERNALSYM STG_E_OLDFORMAT}

//
// MessageId: STG_E_OLDDLL
//
// MessageText:
//
//  The compound file %1 was produced with a newer version of storage.
//

  STG_E_OLDDLL = HRESULT($80030105);
  {$EXTERNALSYM STG_E_OLDDLL}

//
// MessageId: STG_E_SHAREREQUIRED
//
// MessageText:
//
//  Share.exe or equivalent is required for operation.
//

  STG_E_SHAREREQUIRED = HRESULT($80030106);
  {$EXTERNALSYM STG_E_SHAREREQUIRED}

//
// MessageId: STG_E_NOTFILEBASEDSTORAGE
//
// MessageText:
//
//  Illegal operation called on non-file based storage.
//

  STG_E_NOTFILEBASEDSTORAGE = HRESULT($80030107);
  {$EXTERNALSYM STG_E_NOTFILEBASEDSTORAGE}

//
// MessageId: STG_E_EXTANTMARSHALLINGS
//
// MessageText:
//
//  Illegal operation called on object with extant marshallings.
//

  STG_E_EXTANTMARSHALLINGS = HRESULT($80030108);
  {$EXTERNALSYM STG_E_EXTANTMARSHALLINGS}

//
// MessageId: STG_E_DOCFILECORRUPT
//
// MessageText:
//
//  The docfile has been corrupted.
//

  STG_E_DOCFILECORRUPT = HRESULT($80030109);
  {$EXTERNALSYM STG_E_DOCFILECORRUPT}

//
// MessageId: STG_E_BADBASEADDRESS
//
// MessageText:
//
//  OLE32.DLL has been loaded at the wrong address.
//

  STG_E_BADBASEADDRESS = HRESULT($80030110);
  {$EXTERNALSYM STG_E_BADBASEADDRESS}

//
// MessageId: STG_E_DOCFILETOOLARGE
//
// MessageText:
//
//  The compound file is too large for the current implementation
//

  STG_E_DOCFILETOOLARGE = HRESULT($80030111);
  {$EXTERNALSYM STG_E_DOCFILETOOLARGE}

//
// MessageId: STG_E_NOTSIMPLEFORMAT
//
// MessageText:
//
//  The compound file was not created with the STGM_SIMPLE flag
//

  STG_E_NOTSIMPLEFORMAT = HRESULT($80030112);
  {$EXTERNALSYM STG_E_NOTSIMPLEFORMAT}

//
// MessageId: STG_E_INCOMPLETE
//
// MessageText:
//
//  The file download was aborted abnormally.  The file is incomplete.
//

  STG_E_INCOMPLETE = HRESULT($80030201);
  {$EXTERNALSYM STG_E_INCOMPLETE}

//
// MessageId: STG_E_TERMINATED
//
// MessageText:
//
//  The file download has been terminated.
//

  STG_E_TERMINATED = HRESULT($80030202);
  {$EXTERNALSYM STG_E_TERMINATED}

//
// MessageId: STG_S_CONVERTED
//
// MessageText:
//
//  The underlying file was converted to compound file format.
//

  STG_S_CONVERTED = HRESULT($00030200);
  {$EXTERNALSYM STG_S_CONVERTED}

//
// MessageId: STG_S_BLOCK
//
// MessageText:
//
//  The storage operation should block until more data is available.
//

  STG_S_BLOCK = HRESULT($00030201);
  {$EXTERNALSYM STG_S_BLOCK}

//
// MessageId: STG_S_RETRYNOW
//
// MessageText:
//
//  The storage operation should retry immediately.
//

  STG_S_RETRYNOW = HRESULT($00030202);
  {$EXTERNALSYM STG_S_RETRYNOW}

//
// MessageId: STG_S_MONITORING
//
// MessageText:
//
//  The notified event sink will not influence the storage operation.
//

  STG_S_MONITORING = HRESULT($00030203);
  {$EXTERNALSYM STG_S_MONITORING}

//
// MessageId: STG_S_MULTIPLEOPENS
//
// MessageText:
//
//  Multiple opens prevent consolidated. (commit succeeded).
//

  STG_S_MULTIPLEOPENS = HRESULT($00030204);
  {$EXTERNALSYM STG_S_MULTIPLEOPENS}

//
// MessageId: STG_S_CONSOLIDATIONFAILED
//
// MessageText:
//
//  Consolidation of the storage file failed. (commit succeeded).
//

  STG_S_CONSOLIDATIONFAILED = HRESULT($00030205);
  {$EXTERNALSYM STG_S_CONSOLIDATIONFAILED}

//
// MessageId: STG_S_CANNOTCONSOLIDATE
//
// MessageText:
//
//  Consolidation of the storage file is inappropriate. (commit succeeded).
//

  STG_S_CANNOTCONSOLIDATE = HRESULT($00030206);
  {$EXTERNALSYM STG_S_CANNOTCONSOLIDATE}

// ******************
// FACILITY_RPC
// ******************
//
// Codes 0x0-0x11 are propagated from 16 bit OLE.
//
//
// MessageId: RPC_E_CALL_REJECTED
//
// MessageText:
//
//  Call was rejected by callee.
//

  RPC_E_CALL_REJECTED = HRESULT($80010001);
  {$EXTERNALSYM RPC_E_CALL_REJECTED}

//
// MessageId: RPC_E_CALL_CANCELED
//
// MessageText:
//
//  Call was canceled by the message filter.
//

  RPC_E_CALL_CANCELED = HRESULT($80010002);
  {$EXTERNALSYM RPC_E_CALL_CANCELED}

//
// MessageId: RPC_E_CANTPOST_INSENDCALL
//
// MessageText:
//
//  The caller is dispatching an intertask SendMessage call and cannot call out via PostMessage.
//

  RPC_E_CANTPOST_INSENDCALL = HRESULT($80010003);
  {$EXTERNALSYM RPC_E_CANTPOST_INSENDCALL}

//
// MessageId: RPC_E_CANTCALLOUT_INASYNCCALL
//
// MessageText:
//
//  The caller is dispatching an asynchronous call and cannot make an outgoing call on behalf of this call.
//

  RPC_E_CANTCALLOUT_INASYNCCALL = HRESULT($80010004);
  {$EXTERNALSYM RPC_E_CANTCALLOUT_INASYNCCALL}

//
// MessageId: RPC_E_CANTCALLOUT_INEXTERNALCALL
//
// MessageText:
//
//  It is illegal to call out while inside message filter.
//

  RPC_E_CANTCALLOUT_INEXTERNALCALL = HRESULT($80010005);
  {$EXTERNALSYM RPC_E_CANTCALLOUT_INEXTERNALCALL}

//
// MessageId: RPC_E_CONNECTION_TERMINATED
//
// MessageText:
//
//  The connection terminated or is in a bogus state and cannot be used any more. Other connections are still valid.
//

  RPC_E_CONNECTION_TERMINATED = HRESULT($80010006);
  {$EXTERNALSYM RPC_E_CONNECTION_TERMINATED}

//
// MessageId: RPC_E_SERVER_DIED
//
// MessageText:
//
//  The callee (server [not server application]) is not available and disappeared; all connections are invalid. The call may have executed.
//

  RPC_E_SERVER_DIED = HRESULT($80010007);
  {$EXTERNALSYM RPC_E_SERVER_DIED}

//
// MessageId: RPC_E_CLIENT_DIED
//
// MessageText:
//
//  The caller (client) disappeared while the callee (server) was processing a call.
//

  RPC_E_CLIENT_DIED = HRESULT($80010008);
  {$EXTERNALSYM RPC_E_CLIENT_DIED}

//
// MessageId: RPC_E_INVALID_DATAPACKET
//
// MessageText:
//
//  The data packet with the marshalled parameter data is incorrect.
//

  RPC_E_INVALID_DATAPACKET = HRESULT($80010009);
  {$EXTERNALSYM RPC_E_INVALID_DATAPACKET}

//
// MessageId: RPC_E_CANTTRANSMIT_CALL
//
// MessageText:
//
//  The call was not transmitted properly; the message queue was full and was not emptied after yielding.
//

  RPC_E_CANTTRANSMIT_CALL = HRESULT($8001000A);
  {$EXTERNALSYM RPC_E_CANTTRANSMIT_CALL}

//
// MessageId: RPC_E_CLIENT_CANTMARSHAL_DATA
//
// MessageText:
//
//  The client (caller) cannot marshall the parameter data - low memory, etc.
//

  RPC_E_CLIENT_CANTMARSHAL_DATA = HRESULT($8001000B);
  {$EXTERNALSYM RPC_E_CLIENT_CANTMARSHAL_DATA}

//
// MessageId: RPC_E_CLIENT_CANTUNMARSHAL_DATA
//
// MessageText:
//
//  The client (caller) cannot unmarshall the return data - low memory, etc.
//

  RPC_E_CLIENT_CANTUNMARSHAL_DATA = HRESULT($8001000C);
  {$EXTERNALSYM RPC_E_CLIENT_CANTUNMARSHAL_DATA}

//
// MessageId: RPC_E_SERVER_CANTMARSHAL_DATA
//
// MessageText:
//
//  The server (callee) cannot marshall the return data - low memory, etc.
//

  RPC_E_SERVER_CANTMARSHAL_DATA = HRESULT($8001000D);
  {$EXTERNALSYM RPC_E_SERVER_CANTMARSHAL_DATA}

//
// MessageId: RPC_E_SERVER_CANTUNMARSHAL_DATA
//
// MessageText:
//
//  The server (callee) cannot unmarshall the parameter data - low memory, etc.
//

  RPC_E_SERVER_CANTUNMARSHAL_DATA = HRESULT($8001000E);
  {$EXTERNALSYM RPC_E_SERVER_CANTUNMARSHAL_DATA}

//
// MessageId: RPC_E_INVALID_DATA
//
// MessageText:
//
//  Received data is invalid; could be server or client data.
//

  RPC_E_INVALID_DATA = HRESULT($8001000F);
  {$EXTERNALSYM RPC_E_INVALID_DATA}

//
// MessageId: RPC_E_INVALID_PARAMETER
//
// MessageText:
//
//  A particular parameter is invalid and cannot be (un)marshalled.
//

  RPC_E_INVALID_PARAMETER = HRESULT($80010010);
  {$EXTERNALSYM RPC_E_INVALID_PARAMETER}

//
// MessageId: RPC_E_CANTCALLOUT_AGAIN
//
// MessageText:
//
//  There is no second outgoing call on same channel in DDE conversation.
//

  RPC_E_CANTCALLOUT_AGAIN = HRESULT($80010011);
  {$EXTERNALSYM RPC_E_CANTCALLOUT_AGAIN}

//
// MessageId: RPC_E_SERVER_DIED_DNE
//
// MessageText:
//
//  The callee (server [not server application]) is not available and disappeared; all connections are invalid. The call did not execute.
//

  RPC_E_SERVER_DIED_DNE = HRESULT($80010012);
  {$EXTERNALSYM RPC_E_SERVER_DIED_DNE}

//
// MessageId: RPC_E_SYS_CALL_FAILED
//
// MessageText:
//
//  System call failed.
//

  RPC_E_SYS_CALL_FAILED = HRESULT($80010100);
  {$EXTERNALSYM RPC_E_SYS_CALL_FAILED}

//
// MessageId: RPC_E_OUT_OF_RESOURCES
//
// MessageText:
//
//  Could not allocate some required resource (memory, events, ...)
//

  RPC_E_OUT_OF_RESOURCES = HRESULT($80010101);
  {$EXTERNALSYM RPC_E_OUT_OF_RESOURCES}

//
// MessageId: RPC_E_ATTEMPTED_MULTITHREAD
//
// MessageText:
//
//  Attempted to make calls on more than one thread in single threaded mode.
//

  RPC_E_ATTEMPTED_MULTITHREAD = HRESULT($80010102);
  {$EXTERNALSYM RPC_E_ATTEMPTED_MULTITHREAD}

//
// MessageId: RPC_E_NOT_REGISTERED
//
// MessageText:
//
//  The requested interface is not registered on the server object.
//

  RPC_E_NOT_REGISTERED = HRESULT($80010103);
  {$EXTERNALSYM RPC_E_NOT_REGISTERED}

//
// MessageId: RPC_E_FAULT
//
// MessageText:
//
//  RPC could not call the server or could not return the results of calling the server.
//

  RPC_E_FAULT = HRESULT($80010104);
  {$EXTERNALSYM RPC_E_FAULT}

//
// MessageId: RPC_E_SERVERFAULT
//
// MessageText:
//
//  The server threw an exception.
//

  RPC_E_SERVERFAULT = HRESULT($80010105);
  {$EXTERNALSYM RPC_E_SERVERFAULT}

//
// MessageId: RPC_E_CHANGED_MODE
//
// MessageText:
//
//  Cannot change thread mode after it is set.
//

  RPC_E_CHANGED_MODE = HRESULT($80010106);
  {$EXTERNALSYM RPC_E_CHANGED_MODE}

//
// MessageId: RPC_E_INVALIDMETHOD
//
// MessageText:
//
//  The method called does not exist on the server.
//

  RPC_E_INVALIDMETHOD = HRESULT($80010107);
  {$EXTERNALSYM RPC_E_INVALIDMETHOD}

//
// MessageId: RPC_E_DISCONNECTED
//
// MessageText:
//
//  The object invoked has disconnected from its clients.
//

  RPC_E_DISCONNECTED = HRESULT($80010108);
  {$EXTERNALSYM RPC_E_DISCONNECTED}

//
// MessageId: RPC_E_RETRY
//
// MessageText:
//
//  The object invoked chose not to process the call now.  Try again later.
//

  RPC_E_RETRY = HRESULT($80010109);
  {$EXTERNALSYM RPC_E_RETRY}

//
// MessageId: RPC_E_SERVERCALL_RETRYLATER
//
// MessageText:
//
//  The message filter indicated that the application is busy.
//

  RPC_E_SERVERCALL_RETRYLATER = HRESULT($8001010A);
  {$EXTERNALSYM RPC_E_SERVERCALL_RETRYLATER}

//
// MessageId: RPC_E_SERVERCALL_REJECTED
//
// MessageText:
//
//  The message filter rejected the call.
//

  RPC_E_SERVERCALL_REJECTED = HRESULT($8001010B);
  {$EXTERNALSYM RPC_E_SERVERCALL_REJECTED}

//
// MessageId: RPC_E_INVALID_CALLDATA
//
// MessageText:
//
//  A call control interfaces was called with invalid data.
//

  RPC_E_INVALID_CALLDATA = HRESULT($8001010C);
  {$EXTERNALSYM RPC_E_INVALID_CALLDATA}

//
// MessageId: RPC_E_CANTCALLOUT_ININPUTSYNCCALL
//
// MessageText:
//
//  An outgoing call cannot be made since the application is dispatching an input-synchronous call.
//

  RPC_E_CANTCALLOUT_ININPUTSYNCCALL = HRESULT($8001010D);
  {$EXTERNALSYM RPC_E_CANTCALLOUT_ININPUTSYNCCALL}

//
// MessageId: RPC_E_WRONG_THREAD
//
// MessageText:
//
//  The application called an interface that was marshalled for a different thread.
//

  RPC_E_WRONG_THREAD = HRESULT($8001010E);
  {$EXTERNALSYM RPC_E_WRONG_THREAD}

//
// MessageId: RPC_E_THREAD_NOT_INIT
//
// MessageText:
//
//  CoInitialize has not been called on the current thread.
//

  RPC_E_THREAD_NOT_INIT = HRESULT($8001010F);
  {$EXTERNALSYM RPC_E_THREAD_NOT_INIT}

//
// MessageId: RPC_E_VERSION_MISMATCH
//
// MessageText:
//
//  The version of OLE on the client and server machines does not match.
//

  RPC_E_VERSION_MISMATCH = HRESULT($80010110);
  {$EXTERNALSYM RPC_E_VERSION_MISMATCH}

//
// MessageId: RPC_E_INVALID_HEADER
//
// MessageText:
//
//  OLE received a packet with an invalid header.
//

  RPC_E_INVALID_HEADER = HRESULT($80010111);
  {$EXTERNALSYM RPC_E_INVALID_HEADER}

//
// MessageId: RPC_E_INVALID_EXTENSION
//
// MessageText:
//
//  OLE received a packet with an invalid extension.
//

  RPC_E_INVALID_EXTENSION = HRESULT($80010112);
  {$EXTERNALSYM RPC_E_INVALID_EXTENSION}

//
// MessageId: RPC_E_INVALID_IPID
//
// MessageText:
//
//  The requested object or interface does not exist.
//

  RPC_E_INVALID_IPID = HRESULT($80010113);
  {$EXTERNALSYM RPC_E_INVALID_IPID}

//
// MessageId: RPC_E_INVALID_OBJECT
//
// MessageText:
//
//  The requested object does not exist.
//

  RPC_E_INVALID_OBJECT = HRESULT($80010114);
  {$EXTERNALSYM RPC_E_INVALID_OBJECT}

//
// MessageId: RPC_S_CALLPENDING
//
// MessageText:
//
//  OLE has sent a request and is waiting for a reply.
//

  RPC_S_CALLPENDING = HRESULT($80010115);
  {$EXTERNALSYM RPC_S_CALLPENDING}

//
// MessageId: RPC_S_WAITONTIMER
//
// MessageText:
//
//  OLE is waiting before retrying a request.
//

  RPC_S_WAITONTIMER = HRESULT($80010116);
  {$EXTERNALSYM RPC_S_WAITONTIMER}

//
// MessageId: RPC_E_CALL_COMPLETE
//
// MessageText:
//
//  Call context cannot be accessed after call completed.
//

  RPC_E_CALL_COMPLETE = HRESULT($80010117);
  {$EXTERNALSYM RPC_E_CALL_COMPLETE}

//
// MessageId: RPC_E_UNSECURE_CALL
//
// MessageText:
//
//  Impersonate on unsecure calls is not supported.
//

  RPC_E_UNSECURE_CALL = HRESULT($80010118);
  {$EXTERNALSYM RPC_E_UNSECURE_CALL}

//
// MessageId: RPC_E_TOO_LATE
//
// MessageText:
//
//  Security must be initialized before any interfaces are marshalled or unmarshalled. It cannot be changed once initialized.
//

  RPC_E_TOO_LATE = HRESULT($80010119);
  {$EXTERNALSYM RPC_E_TOO_LATE}

//
// MessageId: RPC_E_NO_GOOD_SECURITY_PACKAGES
//
// MessageText:
//
//  No security packages are installed on this machine or the user is not logged on or there are no compatible security packages between the client and server.
//

  RPC_E_NO_GOOD_SECURITY_PACKAGES = HRESULT($8001011A);
  {$EXTERNALSYM RPC_E_NO_GOOD_SECURITY_PACKAGES}

//
// MessageId: RPC_E_ACCESS_DENIED
//
// MessageText:
//
//  Access is denied.
//

  RPC_E_ACCESS_DENIED = HRESULT($8001011B);
  {$EXTERNALSYM RPC_E_ACCESS_DENIED}

//
// MessageId: RPC_E_REMOTE_DISABLED
//
// MessageText:
//
//  Remote calls are not allowed for this process.
//

  RPC_E_REMOTE_DISABLED = HRESULT($8001011C);
  {$EXTERNALSYM RPC_E_REMOTE_DISABLED}

//
// MessageId: RPC_E_INVALID_OBJREF
//
// MessageText:
//
//  The marshaled interface data packet (OBJREF) has an invalid or unknown format.
//

  RPC_E_INVALID_OBJREF = HRESULT($8001011D);
  {$EXTERNALSYM RPC_E_INVALID_OBJREF}

//
// MessageId: RPC_E_NO_CONTEXT
//
// MessageText:
//
//  No context is associated with this call. This happens for some custom marshalled calls and on the client side of the call.
//

  RPC_E_NO_CONTEXT = HRESULT($8001011E);
  {$EXTERNALSYM RPC_E_NO_CONTEXT}

//
// MessageId: RPC_E_TIMEOUT
//
// MessageText:
//
//  This operation returned because the timeout period expired.
//

  RPC_E_TIMEOUT = HRESULT($8001011F);
  {$EXTERNALSYM RPC_E_TIMEOUT}

//
// MessageId: RPC_E_NO_SYNC
//
// MessageText:
//
//  There are no synchronize objects to wait on.
//

  RPC_E_NO_SYNC = HRESULT($80010120);
  {$EXTERNALSYM RPC_E_NO_SYNC}

//
// MessageId: RPC_E_FULLSIC_REQUIRED
//
// MessageText:
//
//  Full subject issuer chain SSL principal name expected from the server.
//

  RPC_E_FULLSIC_REQUIRED = HRESULT($80010121);
  {$EXTERNALSYM RPC_E_FULLSIC_REQUIRED}

//
// MessageId: RPC_E_INVALID_STD_NAME
//
// MessageText:
//
//  Principal name is not a valid MSSTD name.
//

  RPC_E_INVALID_STD_NAME = HRESULT($80010122);
  {$EXTERNALSYM RPC_E_INVALID_STD_NAME}

//
// MessageId: CO_E_FAILEDTOIMPERSONATE
//
// MessageText:
//
//  Unable to impersonate DCOM client
//

  CO_E_FAILEDTOIMPERSONATE = HRESULT($80010123);
  {$EXTERNALSYM CO_E_FAILEDTOIMPERSONATE}

//
// MessageId: CO_E_FAILEDTOGETSECCTX
//
// MessageText:
//
//  Unable to obtain server's security context
//

  CO_E_FAILEDTOGETSECCTX = HRESULT($80010124);
  {$EXTERNALSYM CO_E_FAILEDTOGETSECCTX}

//
// MessageId: CO_E_FAILEDTOOPENTHREADTOKEN
//
// MessageText:
//
//  Unable to open the access token of the current thread
//

  CO_E_FAILEDTOOPENTHREADTOKEN = HRESULT($80010125);
  {$EXTERNALSYM CO_E_FAILEDTOOPENTHREADTOKEN}

//
// MessageId: CO_E_FAILEDTOGETTOKENINFO
//
// MessageText:
//
//  Unable to obtain user info from an access token
//

  CO_E_FAILEDTOGETTOKENINFO = HRESULT($80010126);
  {$EXTERNALSYM CO_E_FAILEDTOGETTOKENINFO}

//
// MessageId: CO_E_TRUSTEEDOESNTMATCHCLIENT
//
// MessageText:
//
//  The client who called IAccessControl::IsAccessPermitted was not the trustee provided to the method
//

  CO_E_TRUSTEEDOESNTMATCHCLIENT = HRESULT($80010127);
  {$EXTERNALSYM CO_E_TRUSTEEDOESNTMATCHCLIENT}

//
// MessageId: CO_E_FAILEDTOQUERYCLIENTBLANKET
//
// MessageText:
//
//  Unable to obtain the client's security blanket
//

  CO_E_FAILEDTOQUERYCLIENTBLANKET = HRESULT($80010128);
  {$EXTERNALSYM CO_E_FAILEDTOQUERYCLIENTBLANKET}

//
// MessageId: CO_E_FAILEDTOSETDACL
//
// MessageText:
//
//  Unable to set a discretionary ACL into a security descriptor
//

  CO_E_FAILEDTOSETDACL = HRESULT($80010129);
  {$EXTERNALSYM CO_E_FAILEDTOSETDACL}

//
// MessageId: CO_E_ACCESSCHECKFAILED
//
// MessageText:
//
//  The system function, AccessCheck, returned false
//

  CO_E_ACCESSCHECKFAILED = HRESULT($8001012A);
  {$EXTERNALSYM CO_E_ACCESSCHECKFAILED}

//
// MessageId: CO_E_NETACCESSAPIFAILED
//
// MessageText:
//
//  Either NetAccessDel or NetAccessAdd returned an error code.
//

  CO_E_NETACCESSAPIFAILED = HRESULT($8001012B);
  {$EXTERNALSYM CO_E_NETACCESSAPIFAILED}

//
// MessageId: CO_E_WRONGTRUSTEENAMESYNTAX
//
// MessageText:
//
//  One of the trustee strings provided by the user did not conform to the <Domain>\<Name> syntax and it was not the "*" string
//

  CO_E_WRONGTRUSTEENAMESYNTAX = HRESULT($8001012C);
  {$EXTERNALSYM CO_E_WRONGTRUSTEENAMESYNTAX}

//
// MessageId: CO_E_INVALIDSID
//
// MessageText:
//
//  One of the security identifiers provided by the user was invalid
//

  CO_E_INVALIDSID = HRESULT($8001012D);
  {$EXTERNALSYM CO_E_INVALIDSID}

//
// MessageId: CO_E_CONVERSIONFAILED
//
// MessageText:
//
//  Unable to convert a wide character trustee string to a multibyte trustee string
//

  CO_E_CONVERSIONFAILED = HRESULT($8001012E);
  {$EXTERNALSYM CO_E_CONVERSIONFAILED}

//
// MessageId: CO_E_NOMATCHINGSIDFOUND
//
// MessageText:
//
//  Unable to find a security identifier that corresponds to a trustee string provided by the user
//

  CO_E_NOMATCHINGSIDFOUND = HRESULT($8001012F);
  {$EXTERNALSYM CO_E_NOMATCHINGSIDFOUND}

//
// MessageId: CO_E_LOOKUPACCSIDFAILED
//
// MessageText:
//
//  The system function, LookupAccountSID, failed
//

  CO_E_LOOKUPACCSIDFAILED = HRESULT($80010130);
  {$EXTERNALSYM CO_E_LOOKUPACCSIDFAILED}

//
// MessageId: CO_E_NOMATCHINGNAMEFOUND
//
// MessageText:
//
//  Unable to find a trustee name that corresponds to a security identifier provided by the user
//

  CO_E_NOMATCHINGNAMEFOUND = HRESULT($80010131);
  {$EXTERNALSYM CO_E_NOMATCHINGNAMEFOUND}

//
// MessageId: CO_E_LOOKUPACCNAMEFAILED
//
// MessageText:
//
//  The system function, LookupAccountName, failed
//

  CO_E_LOOKUPACCNAMEFAILED = HRESULT($80010132);
  {$EXTERNALSYM CO_E_LOOKUPACCNAMEFAILED}

//
// MessageId: CO_E_SETSERLHNDLFAILED
//
// MessageText:
//
//  Unable to set or reset a serialization handle
//

  CO_E_SETSERLHNDLFAILED = HRESULT($80010133);
  {$EXTERNALSYM CO_E_SETSERLHNDLFAILED}

//
// MessageId: CO_E_FAILEDTOGETWINDIR
//
// MessageText:
//
//  Unable to obtain the Windows directory
//

  CO_E_FAILEDTOGETWINDIR = HRESULT($80010134);
  {$EXTERNALSYM CO_E_FAILEDTOGETWINDIR}

//
// MessageId: CO_E_PATHTOOLONG
//
// MessageText:
//
//  Path too long
//

  CO_E_PATHTOOLONG = HRESULT($80010135);
  {$EXTERNALSYM CO_E_PATHTOOLONG}

//
// MessageId: CO_E_FAILEDTOGENUUID
//
// MessageText:
//
//  Unable to generate a uuid.
//

  CO_E_FAILEDTOGENUUID = HRESULT($80010136);
  {$EXTERNALSYM CO_E_FAILEDTOGENUUID}

//
// MessageId: CO_E_FAILEDTOCREATEFILE
//
// MessageText:
//
//  Unable to create file
//

  CO_E_FAILEDTOCREATEFILE = HRESULT($80010137);
  {$EXTERNALSYM CO_E_FAILEDTOCREATEFILE}

//
// MessageId: CO_E_FAILEDTOCLOSEHANDLE
//
// MessageText:
//
//  Unable to close a serialization handle or a file handle.
//

  CO_E_FAILEDTOCLOSEHANDLE = HRESULT($80010138);
  {$EXTERNALSYM CO_E_FAILEDTOCLOSEHANDLE}

//
// MessageId: CO_E_EXCEEDSYSACLLIMIT
//
// MessageText:
//
//  The number of ACEs in an ACL exceeds the system limit.
//

  CO_E_EXCEEDSYSACLLIMIT = HRESULT($80010139);
  {$EXTERNALSYM CO_E_EXCEEDSYSACLLIMIT}

//
// MessageId: CO_E_ACESINWRONGORDER
//
// MessageText:
//
//  Not all the DENY_ACCESS ACEs are arranged in front of the GRANT_ACCESS ACEs in the stream.
//

  CO_E_ACESINWRONGORDER = HRESULT($8001013A);
  {$EXTERNALSYM CO_E_ACESINWRONGORDER}

//
// MessageId: CO_E_INCOMPATIBLESTREAMVERSION
//
// MessageText:
//
//  The version of ACL format in the stream is not supported by this implementation of IAccessControl
//

  CO_E_INCOMPATIBLESTREAMVERSION = HRESULT($8001013B);
  {$EXTERNALSYM CO_E_INCOMPATIBLESTREAMVERSION}

//
// MessageId: CO_E_FAILEDTOOPENPROCESSTOKEN
//
// MessageText:
//
//  Unable to open the access token of the server process
//

  CO_E_FAILEDTOOPENPROCESSTOKEN = HRESULT($8001013C);
  {$EXTERNALSYM CO_E_FAILEDTOOPENPROCESSTOKEN}

//
// MessageId: CO_E_DECODEFAILED
//
// MessageText:
//
//  Unable to decode the ACL in the stream provided by the user
//

  CO_E_DECODEFAILED = HRESULT($8001013D);
  {$EXTERNALSYM CO_E_DECODEFAILED}

//
// MessageId: CO_E_ACNOTINITIALIZED
//
// MessageText:
//
//  The COM IAccessControl object is not initialized
//

  CO_E_ACNOTINITIALIZED = HRESULT($8001013F);
  {$EXTERNALSYM CO_E_ACNOTINITIALIZED}

//
// MessageId: CO_E_CANCEL_DISABLED
//
// MessageText:
//
//  Call Cancellation is disabled
//

  CO_E_CANCEL_DISABLED = HRESULT($80010140);
  {$EXTERNALSYM CO_E_CANCEL_DISABLED}

//
// MessageId: RPC_E_UNEXPECTED
//
// MessageText:
//
//  An internal error occurred.
//

  RPC_E_UNEXPECTED = HRESULT($8001FFFF);
  {$EXTERNALSYM RPC_E_UNEXPECTED}


 /////////////////
 //
 //  FACILITY_SSPI
 //
 /////////////////

//
// MessageId: NTE_BAD_UID
//
// MessageText:
//
//  Bad UID.
//

  NTE_BAD_UID = HRESULT($80090001);
  {$EXTERNALSYM NTE_BAD_UID}

//
// MessageId: NTE_BAD_HASH
//
// MessageText:
//
//  Bad Hash.
//

  NTE_BAD_HASH = HRESULT($80090002);
  {$EXTERNALSYM NTE_BAD_HASH}

//
// MessageId: NTE_BAD_KEY
//
// MessageText:
//
//  Bad Key.
//

  NTE_BAD_KEY = HRESULT($80090003);
  {$EXTERNALSYM NTE_BAD_KEY}

//
// MessageId: NTE_BAD_LEN
//
// MessageText:
//
//  Bad Length.
//

  NTE_BAD_LEN = HRESULT($80090004);
  {$EXTERNALSYM NTE_BAD_LEN}

//
// MessageId: NTE_BAD_DATA
//
// MessageText:
//
//  Bad Data.
//

  NTE_BAD_DATA = HRESULT($80090005);
  {$EXTERNALSYM NTE_BAD_DATA}

//
// MessageId: NTE_BAD_SIGNATURE
//
// MessageText:
//
//  Invalid Signature.
//

  NTE_BAD_SIGNATURE = HRESULT($80090006);
  {$EXTERNALSYM NTE_BAD_SIGNATURE}

//
// MessageId: NTE_BAD_VER
//
// MessageText:
//
//  Bad Version of provider.
//

  NTE_BAD_VER = HRESULT($80090007);
  {$EXTERNALSYM NTE_BAD_VER}

//
// MessageId: NTE_BAD_ALGID
//
// MessageText:
//
//  Invalid algorithm specified.
//

  NTE_BAD_ALGID = HRESULT($80090008);
  {$EXTERNALSYM NTE_BAD_ALGID}

//
// MessageId: NTE_BAD_FLAGS
//
// MessageText:
//
//  Invalid flags specified.
//

  NTE_BAD_FLAGS = HRESULT($80090009);
  {$EXTERNALSYM NTE_BAD_FLAGS}

//
// MessageId: NTE_BAD_TYPE
//
// MessageText:
//
//  Invalid type specified.
//

  NTE_BAD_TYPE = HRESULT($8009000A);
  {$EXTERNALSYM NTE_BAD_TYPE}

//
// MessageId: NTE_BAD_KEY_STATE
//
// MessageText:
//
//  Key not valid for use in specified state.
//

  NTE_BAD_KEY_STATE = HRESULT($8009000B);
  {$EXTERNALSYM NTE_BAD_KEY_STATE}

//
// MessageId: NTE_BAD_HASH_STATE
//
// MessageText:
//
//  Hash not valid for use in specified state.
//

  NTE_BAD_HASH_STATE = HRESULT($8009000C);
  {$EXTERNALSYM NTE_BAD_HASH_STATE}

//
// MessageId: NTE_NO_KEY
//
// MessageText:
//
//  Key does not exist.
//

  NTE_NO_KEY = HRESULT($8009000D);
  {$EXTERNALSYM NTE_NO_KEY}

//
// MessageId: NTE_NO_MEMORY
//
// MessageText:
//
//  Insufficient memory available for the operation.
//

  NTE_NO_MEMORY = HRESULT($8009000E);
  {$EXTERNALSYM NTE_NO_MEMORY}

//
// MessageId: NTE_EXISTS
//
// MessageText:
//
//  Object already exists.
//

  NTE_EXISTS = HRESULT($8009000F);
  {$EXTERNALSYM NTE_EXISTS}

//
// MessageId: NTE_PERM
//
// MessageText:
//
//  Access denied.
//

  NTE_PERM = HRESULT($80090010);
  {$EXTERNALSYM NTE_PERM}

//
// MessageId: NTE_NOT_FOUND
//
// MessageText:
//
//  Object was not found.
//

  NTE_NOT_FOUND = HRESULT($80090011);
  {$EXTERNALSYM NTE_NOT_FOUND}

//
// MessageId: NTE_DOUBLE_ENCRYPT
//
// MessageText:
//
//  Data already encrypted.
//

  NTE_DOUBLE_ENCRYPT = HRESULT($80090012);
  {$EXTERNALSYM NTE_DOUBLE_ENCRYPT}

//
// MessageId: NTE_BAD_PROVIDER
//
// MessageText:
//
//  Invalid provider specified.
//

  NTE_BAD_PROVIDER = HRESULT($80090013);
  {$EXTERNALSYM NTE_BAD_PROVIDER}

//
// MessageId: NTE_BAD_PROV_TYPE
//
// MessageText:
//
//  Invalid provider type specified.
//

  NTE_BAD_PROV_TYPE = HRESULT($80090014);
  {$EXTERNALSYM NTE_BAD_PROV_TYPE}

//
// MessageId: NTE_BAD_PUBLIC_KEY
//
// MessageText:
//
//  Provider's public key is invalid.
//

  NTE_BAD_PUBLIC_KEY = HRESULT($80090015);
  {$EXTERNALSYM NTE_BAD_PUBLIC_KEY}

//
// MessageId: NTE_BAD_KEYSET
//
// MessageText:
//
//  Keyset does not exist
//

  NTE_BAD_KEYSET = HRESULT($80090016);
  {$EXTERNALSYM NTE_BAD_KEYSET}

//
// MessageId: NTE_PROV_TYPE_NOT_DEF
//
// MessageText:
//
//  Provider type not defined.
//

  NTE_PROV_TYPE_NOT_DEF = HRESULT($80090017);
  {$EXTERNALSYM NTE_PROV_TYPE_NOT_DEF}

//
// MessageId: NTE_PROV_TYPE_ENTRY_BAD
//
// MessageText:
//
//  Provider type as registered is invalid.
//

  NTE_PROV_TYPE_ENTRY_BAD = HRESULT($80090018);
  {$EXTERNALSYM NTE_PROV_TYPE_ENTRY_BAD}

//
// MessageId: NTE_KEYSET_NOT_DEF
//
// MessageText:
//
//  The keyset is not defined.
//

  NTE_KEYSET_NOT_DEF = HRESULT($80090019);
  {$EXTERNALSYM NTE_KEYSET_NOT_DEF}

//
// MessageId: NTE_KEYSET_ENTRY_BAD
//
// MessageText:
//
//  Keyset as registered is invalid.
//

  NTE_KEYSET_ENTRY_BAD = HRESULT($8009001A);
  {$EXTERNALSYM NTE_KEYSET_ENTRY_BAD}

//
// MessageId: NTE_PROV_TYPE_NO_MATCH
//
// MessageText:
//
//  Provider type does not match registered value.
//

  NTE_PROV_TYPE_NO_MATCH = HRESULT($8009001B);
  {$EXTERNALSYM NTE_PROV_TYPE_NO_MATCH}

//
// MessageId: NTE_SIGNATURE_FILE_BAD
//
// MessageText:
//
//  The digital signature file is corrupt.
//

  NTE_SIGNATURE_FILE_BAD = HRESULT($8009001C);
  {$EXTERNALSYM NTE_SIGNATURE_FILE_BAD}

//
// MessageId: NTE_PROVIDER_DLL_FAIL
//
// MessageText:
//
//  Provider DLL failed to initialize correctly.
//

  NTE_PROVIDER_DLL_FAIL = HRESULT($8009001D);
  {$EXTERNALSYM NTE_PROVIDER_DLL_FAIL}

//
// MessageId: NTE_PROV_DLL_NOT_FOUND
//
// MessageText:
//
//  Provider DLL could not be found.
//

  NTE_PROV_DLL_NOT_FOUND = HRESULT($8009001E);
  {$EXTERNALSYM NTE_PROV_DLL_NOT_FOUND}

//
// MessageId: NTE_BAD_KEYSET_PARAM
//
// MessageText:
//
//  The Keyset parameter is invalid.
//

  NTE_BAD_KEYSET_PARAM = HRESULT($8009001F);
  {$EXTERNALSYM NTE_BAD_KEYSET_PARAM}

//
// MessageId: NTE_FAIL
//
// MessageText:
//
//  An internal error occurred.
//

  NTE_FAIL = HRESULT($80090020);
  {$EXTERNALSYM NTE_FAIL}

//
// MessageId: NTE_SYS_ERR
//
// MessageText:
//
//  A base error occurred.
//

  NTE_SYS_ERR = HRESULT($80090021);
  {$EXTERNALSYM NTE_SYS_ERR}

//
// MessageId: NTE_SILENT_CONTEXT
//
// MessageText:
//
//  Provider could not perform the action since the context was acquired as silent.
//

  NTE_SILENT_CONTEXT = HRESULT($80090022);
  {$EXTERNALSYM NTE_SILENT_CONTEXT}

//
// MessageId: NTE_TOKEN_KEYSET_STORAGE_FULL
//
// MessageText:
//
//  The security token does not have storage space available for an additional container.
//

  NTE_TOKEN_KEYSET_STORAGE_FULL = HRESULT($80090023);
  {$EXTERNALSYM NTE_TOKEN_KEYSET_STORAGE_FULL}

//
// MessageId: NTE_TEMPORARY_PROFILE
//
// MessageText:
//
//  The profile for the user is a temporary profile.
//

  NTE_TEMPORARY_PROFILE = HRESULT($80090024);
  {$EXTERNALSYM NTE_TEMPORARY_PROFILE}

//
// MessageId: NTE_FIXEDPARAMETER
//
// MessageText:
//
//  The key parameters could not be set because the CSP uses fixed parameters.
//

  NTE_FIXEDPARAMETER = HRESULT($80090025);
  {$EXTERNALSYM NTE_FIXEDPARAMETER}

//
// MessageId: SEC_E_INSUFFICIENT_MEMORY
//
// MessageText:
//
//  Not enough memory is available to complete this request
//

  SEC_E_INSUFFICIENT_MEMORY = HRESULT($80090300);
  {$EXTERNALSYM SEC_E_INSUFFICIENT_MEMORY}

//
// MessageId: SEC_E_INVALID_HANDLE
//
// MessageText:
//
//  The handle specified is invalid
//

  SEC_E_INVALID_HANDLE = HRESULT($80090301);
  {$EXTERNALSYM SEC_E_INVALID_HANDLE}

//
// MessageId: SEC_E_UNSUPPORTED_FUNCTION
//
// MessageText:
//
//  The function requested is not supported
//

  SEC_E_UNSUPPORTED_FUNCTION = HRESULT($80090302);
  {$EXTERNALSYM SEC_E_UNSUPPORTED_FUNCTION}

//
// MessageId: SEC_E_TARGET_UNKNOWN
//
// MessageText:
//
//  The specified target is unknown or unreachable
//

  SEC_E_TARGET_UNKNOWN = HRESULT($80090303);
  {$EXTERNALSYM SEC_E_TARGET_UNKNOWN}

//
// MessageId: SEC_E_INTERNAL_ERROR
//
// MessageText:
//
//  The Local Security Authority cannot be contacted
//

  SEC_E_INTERNAL_ERROR = HRESULT($80090304);
  {$EXTERNALSYM SEC_E_INTERNAL_ERROR}

//
// MessageId: SEC_E_SECPKG_NOT_FOUND
//
// MessageText:
//
//  The requested security package does not exist
//

  SEC_E_SECPKG_NOT_FOUND = HRESULT($80090305);
  {$EXTERNALSYM SEC_E_SECPKG_NOT_FOUND}

//
// MessageId: SEC_E_NOT_OWNER
//
// MessageText:
//
//  The caller is not the owner of the desired credentials
//

  SEC_E_NOT_OWNER = HRESULT($80090306);
  {$EXTERNALSYM SEC_E_NOT_OWNER}

//
// MessageId: SEC_E_CANNOT_INSTALL
//
// MessageText:
//
//  The security package failed to initialize, and cannot be installed
//

  SEC_E_CANNOT_INSTALL = HRESULT($80090307);
  {$EXTERNALSYM SEC_E_CANNOT_INSTALL}

//
// MessageId: SEC_E_INVALID_TOKEN
//
// MessageText:
//
//  The token supplied to the function is invalid
//

  SEC_E_INVALID_TOKEN = HRESULT($80090308);
  {$EXTERNALSYM SEC_E_INVALID_TOKEN}

//
// MessageId: SEC_E_CANNOT_PACK
//
// MessageText:
//
//  The security package is not able to marshall the logon buffer, so the logon attempt has failed
//

  SEC_E_CANNOT_PACK = HRESULT($80090309);
  {$EXTERNALSYM SEC_E_CANNOT_PACK}

//
// MessageId: SEC_E_QOP_NOT_SUPPORTED
//
// MessageText:
//
//  The per-message Quality of Protection is not supported by the security package
//

  SEC_E_QOP_NOT_SUPPORTED = HRESULT($8009030A);
  {$EXTERNALSYM SEC_E_QOP_NOT_SUPPORTED}

//
// MessageId: SEC_E_NO_IMPERSONATION
//
// MessageText:
//
//  The security context does not allow impersonation of the client
//

  SEC_E_NO_IMPERSONATION = HRESULT($8009030B);
  {$EXTERNALSYM SEC_E_NO_IMPERSONATION}

//
// MessageId: SEC_E_LOGON_DENIED
//
// MessageText:
//
//  The logon attempt failed
//

  SEC_E_LOGON_DENIED = HRESULT($8009030C);
  {$EXTERNALSYM SEC_E_LOGON_DENIED}

//
// MessageId: SEC_E_UNKNOWN_CREDENTIALS
//
// MessageText:
//
//  The credentials supplied to the package were not recognized
//

  SEC_E_UNKNOWN_CREDENTIALS = HRESULT($8009030D);
  {$EXTERNALSYM SEC_E_UNKNOWN_CREDENTIALS}

//
// MessageId: SEC_E_NO_CREDENTIALS
//
// MessageText:
//
//  No credentials are available in the security package
//

  SEC_E_NO_CREDENTIALS = HRESULT($8009030E);
  {$EXTERNALSYM SEC_E_NO_CREDENTIALS}

//
// MessageId: SEC_E_MESSAGE_ALTERED
//
// MessageText:
//
//  The message or signature supplied for verification has been altered
//

  SEC_E_MESSAGE_ALTERED = HRESULT($8009030F);
  {$EXTERNALSYM SEC_E_MESSAGE_ALTERED}

//
// MessageId: SEC_E_OUT_OF_SEQUENCE
//
// MessageText:
//
//  The message supplied for verification is out of sequence
//

  SEC_E_OUT_OF_SEQUENCE = HRESULT($80090310);
  {$EXTERNALSYM SEC_E_OUT_OF_SEQUENCE}

//
// MessageId: SEC_E_NO_AUTHENTICATING_AUTHORITY
//
// MessageText:
//
//  No authority could be contacted for authentication.
//

  SEC_E_NO_AUTHENTICATING_AUTHORITY = HRESULT($80090311);
  {$EXTERNALSYM SEC_E_NO_AUTHENTICATING_AUTHORITY}

//
// MessageId: SEC_I_CONTINUE_NEEDED
//
// MessageText:
//
//  The function completed successfully, but must be called again to complete the context
//

  SEC_I_CONTINUE_NEEDED = HRESULT($00090312);
  {$EXTERNALSYM SEC_I_CONTINUE_NEEDED}

//
// MessageId: SEC_I_COMPLETE_NEEDED
//
// MessageText:
//
//  The function completed successfully, but CompleteToken must be called
//

  SEC_I_COMPLETE_NEEDED = HRESULT($00090313);
  {$EXTERNALSYM SEC_I_COMPLETE_NEEDED}

//
// MessageId: SEC_I_COMPLETE_AND_CONTINUE
//
// MessageText:
//
//  The function completed successfully, but both CompleteToken and this function must be called to complete the context
//

  SEC_I_COMPLETE_AND_CONTINUE = HRESULT($00090314);
  {$EXTERNALSYM SEC_I_COMPLETE_AND_CONTINUE}

//
// MessageId: SEC_I_LOCAL_LOGON
//
// MessageText:
//
//  The logon was completed, but no network authority was available. The logon was made using locally known information
//

  SEC_I_LOCAL_LOGON = HRESULT($00090315);
  {$EXTERNALSYM SEC_I_LOCAL_LOGON}

//
// MessageId: SEC_E_BAD_PKGID
//
// MessageText:
//
//  The requested security package does not exist
//

  SEC_E_BAD_PKGID = HRESULT($80090316);
  {$EXTERNALSYM SEC_E_BAD_PKGID}

//
// MessageId: SEC_E_CONTEXT_EXPIRED
//
// MessageText:
//
//  The context has expired and can no longer be used.
//

  SEC_E_CONTEXT_EXPIRED = HRESULT($80090317);
  {$EXTERNALSYM SEC_E_CONTEXT_EXPIRED}

//
// MessageId: SEC_E_INCOMPLETE_MESSAGE
//
// MessageText:
//
//  The supplied message is incomplete.  The signature was not verified.
//

  SEC_E_INCOMPLETE_MESSAGE = HRESULT($80090318);
  {$EXTERNALSYM SEC_E_INCOMPLETE_MESSAGE}

//
// MessageId: SEC_E_INCOMPLETE_CREDENTIALS
//
// MessageText:
//
//  The credentials supplied were not complete, and could not be verified. The context could not be initialized.
//

  SEC_E_INCOMPLETE_CREDENTIALS = HRESULT($80090320);
  {$EXTERNALSYM SEC_E_INCOMPLETE_CREDENTIALS}

//
// MessageId: SEC_E_BUFFER_TOO_SMALL
//
// MessageText:
//
//  The buffers supplied to a function was too small.
//

  SEC_E_BUFFER_TOO_SMALL = HRESULT($80090321);
  {$EXTERNALSYM SEC_E_BUFFER_TOO_SMALL}

//
// MessageId: SEC_I_INCOMPLETE_CREDENTIALS
//
// MessageText:
//
//  The credentials supplied were not complete, and could not be verified. Additional information can be returned from the context.
//

  SEC_I_INCOMPLETE_CREDENTIALS = HRESULT($00090320);
  {$EXTERNALSYM SEC_I_INCOMPLETE_CREDENTIALS}

//
// MessageId: SEC_I_RENEGOTIATE
//
// MessageText:
//
//  The context data must be renegotiated with the peer.
//

  SEC_I_RENEGOTIATE = HRESULT($00090321);
  {$EXTERNALSYM SEC_I_RENEGOTIATE}

//
// MessageId: SEC_E_WRONG_PRINCIPAL
//
// MessageText:
//
//  The target principal name is incorrect.
//

  SEC_E_WRONG_PRINCIPAL = HRESULT($80090322);
  {$EXTERNALSYM SEC_E_WRONG_PRINCIPAL}

//
// MessageId: SEC_I_NO_LSA_CONTEXT
//
// MessageText:
//
//  There is no LSA mode context associated with this context.
//

  SEC_I_NO_LSA_CONTEXT = HRESULT($00090323);
  {$EXTERNALSYM SEC_I_NO_LSA_CONTEXT}

//
// MessageId: SEC_E_TIME_SKEW
//
// MessageText:
//
//  The clocks on the client and server machines are skewed.
//

  SEC_E_TIME_SKEW = HRESULT($80090324);
  {$EXTERNALSYM SEC_E_TIME_SKEW}

//
// MessageId: SEC_E_UNTRUSTED_ROOT
//
// MessageText:
//
//  The certificate chain was issued by an untrusted authority.
//

  SEC_E_UNTRUSTED_ROOT = HRESULT($80090325);
  {$EXTERNALSYM SEC_E_UNTRUSTED_ROOT}

//
// MessageId: SEC_E_ILLEGAL_MESSAGE
//
// MessageText:
//
//  The message received was unexpected or badly formatted.
//

  SEC_E_ILLEGAL_MESSAGE = HRESULT($80090326);
  {$EXTERNALSYM SEC_E_ILLEGAL_MESSAGE}

//
// MessageId: SEC_E_CERT_UNKNOWN
//
// MessageText:
//
//  An unknown error occurred while processing the certificate.
//

  SEC_E_CERT_UNKNOWN = HRESULT($80090327);
  {$EXTERNALSYM SEC_E_CERT_UNKNOWN}

//
// MessageId: SEC_E_CERT_EXPIRED
//
// MessageText:
//
//  The received certificate has expired.
//

  SEC_E_CERT_EXPIRED = HRESULT($80090328);
  {$EXTERNALSYM SEC_E_CERT_EXPIRED}

//
// MessageId: SEC_E_ENCRYPT_FAILURE
//
// MessageText:
//
//  The specified data could not be encrypted.
//

  SEC_E_ENCRYPT_FAILURE = HRESULT($80090329);
  {$EXTERNALSYM SEC_E_ENCRYPT_FAILURE}

//
// MessageId: SEC_E_DECRYPT_FAILURE
//
// MessageText:
//
//  The specified data could not be decrypted.
//  
//

  SEC_E_DECRYPT_FAILURE = HRESULT($80090330);
  {$EXTERNALSYM SEC_E_DECRYPT_FAILURE}

//
// MessageId: SEC_E_ALGORITHM_MISMATCH
//
// MessageText:
//
//  The client and server cannot communicate, because they do not possess a common algorithm.
//

  SEC_E_ALGORITHM_MISMATCH = HRESULT($80090331);
  {$EXTERNALSYM SEC_E_ALGORITHM_MISMATCH}

//
// MessageId: SEC_E_SECURITY_QOS_FAILED
//
// MessageText:
//
//  The security context could not be established due to a failure in the requested quality of service (e.g. mutual authentication or delegation).
//

  SEC_E_SECURITY_QOS_FAILED = HRESULT($80090332);
  {$EXTERNALSYM SEC_E_SECURITY_QOS_FAILED}

//
// Provided for backwards compatibility
//

  SEC_E_NO_SPM  = SEC_E_INTERNAL_ERROR;
  {$EXTERNALSYM SEC_E_NO_SPM}
  SEC_E_NOT_SUPPORTED = SEC_E_UNSUPPORTED_FUNCTION;
  {$EXTERNALSYM SEC_E_NOT_SUPPORTED}

//
// MessageId: CRYPT_E_MSG_ERROR
//
// MessageText:
//
//  An error occurred while performing an operation on a cryptographic message.
//

  CRYPT_E_MSG_ERROR = HRESULT($80091001);
  {$EXTERNALSYM CRYPT_E_MSG_ERROR}

//
// MessageId: CRYPT_E_UNKNOWN_ALGO
//
// MessageText:
//
//  Unknown cryptographic algorithm.
//

  CRYPT_E_UNKNOWN_ALGO = HRESULT($80091002);
  {$EXTERNALSYM CRYPT_E_UNKNOWN_ALGO}

//
// MessageId: CRYPT_E_OID_FORMAT
//
// MessageText:
//
//  The object identifier is poorly formatted.
//

  CRYPT_E_OID_FORMAT = HRESULT($80091003);
  {$EXTERNALSYM CRYPT_E_OID_FORMAT}

//
// MessageId: CRYPT_E_INVALID_MSG_TYPE
//
// MessageText:
//
//  Invalid cryptographic message type.
//

  CRYPT_E_INVALID_MSG_TYPE = HRESULT($80091004);
  {$EXTERNALSYM CRYPT_E_INVALID_MSG_TYPE}

//
// MessageId: CRYPT_E_UNEXPECTED_ENCODING
//
// MessageText:
//
//  Unexpected cryptographic message encoding.
//

  CRYPT_E_UNEXPECTED_ENCODING = HRESULT($80091005);
  {$EXTERNALSYM CRYPT_E_UNEXPECTED_ENCODING}

//
// MessageId: CRYPT_E_AUTH_ATTR_MISSING
//
// MessageText:
//
//  The cryptographic message does not contain an expected authenticated attribute.
//

  CRYPT_E_AUTH_ATTR_MISSING = HRESULT($80091006);
  {$EXTERNALSYM CRYPT_E_AUTH_ATTR_MISSING}

//
// MessageId: CRYPT_E_HASH_VALUE
//
// MessageText:
//
//  The hash value is not correct.
//

  CRYPT_E_HASH_VALUE = HRESULT($80091007);
  {$EXTERNALSYM CRYPT_E_HASH_VALUE}

//
// MessageId: CRYPT_E_INVALID_INDEX
//
// MessageText:
//
//  The index value is not valid.
//

  CRYPT_E_INVALID_INDEX = HRESULT($80091008);
  {$EXTERNALSYM CRYPT_E_INVALID_INDEX}

//
// MessageId: CRYPT_E_ALREADY_DECRYPTED
//
// MessageText:
//
//  The content of the cryptographic message has already been decrypted.
//

  CRYPT_E_ALREADY_DECRYPTED = HRESULT($80091009);
  {$EXTERNALSYM CRYPT_E_ALREADY_DECRYPTED}

//
// MessageId: CRYPT_E_NOT_DECRYPTED
//
// MessageText:
//
//  The content of the cryptographic message has not been decrypted yet.
//

  CRYPT_E_NOT_DECRYPTED = HRESULT($8009100A);
  {$EXTERNALSYM CRYPT_E_NOT_DECRYPTED}

//
// MessageId: CRYPT_E_RECIPIENT_NOT_FOUND
//
// MessageText:
//
//  The enveloped-data message does not contain the specified recipient.
//

  CRYPT_E_RECIPIENT_NOT_FOUND = HRESULT($8009100B);
  {$EXTERNALSYM CRYPT_E_RECIPIENT_NOT_FOUND}

//
// MessageId: CRYPT_E_CONTROL_TYPE
//
// MessageText:
//
//  Invalid control type.
//

  CRYPT_E_CONTROL_TYPE = HRESULT($8009100C);
  {$EXTERNALSYM CRYPT_E_CONTROL_TYPE}

//
// MessageId: CRYPT_E_ISSUER_SERIALNUMBER
//
// MessageText:
//
//  Invalid issuer and/or serial number.
//

  CRYPT_E_ISSUER_SERIALNUMBER = HRESULT($8009100D);
  {$EXTERNALSYM CRYPT_E_ISSUER_SERIALNUMBER}

//
// MessageId: CRYPT_E_SIGNER_NOT_FOUND
//
// MessageText:
//
//  Cannot find the original signer.
//

  CRYPT_E_SIGNER_NOT_FOUND = HRESULT($8009100E);
  {$EXTERNALSYM CRYPT_E_SIGNER_NOT_FOUND}

//
// MessageId: CRYPT_E_ATTRIBUTES_MISSING
//
// MessageText:
//
//  The cryptographic message does not contain all of the requested attributes.
//

  CRYPT_E_ATTRIBUTES_MISSING = HRESULT($8009100F);
  {$EXTERNALSYM CRYPT_E_ATTRIBUTES_MISSING}

//
// MessageId: CRYPT_E_STREAM_MSG_NOT_READY
//
// MessageText:
//
//  The streamed cryptographic message is not ready to return data.
//

  CRYPT_E_STREAM_MSG_NOT_READY = HRESULT($80091010);
  {$EXTERNALSYM CRYPT_E_STREAM_MSG_NOT_READY}

//
// MessageId: CRYPT_E_STREAM_INSUFFICIENT_DATA
//
// MessageText:
//
//  The streamed cryptographic message requires more data to complete the decode operation.
//

  CRYPT_E_STREAM_INSUFFICIENT_DATA = HRESULT($80091011);
  {$EXTERNALSYM CRYPT_E_STREAM_INSUFFICIENT_DATA}

//
// MessageId: CRYPT_E_BAD_LEN
//
// MessageText:
//
//  The length specified for the output data was insufficient.
//

  CRYPT_E_BAD_LEN = HRESULT($80092001);
  {$EXTERNALSYM CRYPT_E_BAD_LEN}

//
// MessageId: CRYPT_E_BAD_ENCODE
//
// MessageText:
//
//  An error occurred during encode or decode operation.
//

  CRYPT_E_BAD_ENCODE = HRESULT($80092002);
  {$EXTERNALSYM CRYPT_E_BAD_ENCODE}

//
// MessageId: CRYPT_E_FILE_ERROR
//
// MessageText:
//
//  An error occurred while reading or writing to a file.
//

  CRYPT_E_FILE_ERROR = HRESULT($80092003);
  {$EXTERNALSYM CRYPT_E_FILE_ERROR}

//
// MessageId: CRYPT_E_NOT_FOUND
//
// MessageText:
//
//  Cannot find object or property.
//

  CRYPT_E_NOT_FOUND = HRESULT($80092004);
  {$EXTERNALSYM CRYPT_E_NOT_FOUND}

//
// MessageId: CRYPT_E_EXISTS
//
// MessageText:
//
//  The object or property already exists.
//

  CRYPT_E_EXISTS = HRESULT($80092005);
  {$EXTERNALSYM CRYPT_E_EXISTS}

//
// MessageId: CRYPT_E_NO_PROVIDER
//
// MessageText:
//
//  No provider was specified for the store or object.
//

  CRYPT_E_NO_PROVIDER = HRESULT($80092006);
  {$EXTERNALSYM CRYPT_E_NO_PROVIDER}

//
// MessageId: CRYPT_E_SELF_SIGNED
//
// MessageText:
//
//  The specified certificate is self signed.
//

  CRYPT_E_SELF_SIGNED = HRESULT($80092007);
  {$EXTERNALSYM CRYPT_E_SELF_SIGNED}

//
// MessageId: CRYPT_E_DELETED_PREV
//
// MessageText:
//
//  The previous certificate or CRL context was deleted.
//

  CRYPT_E_DELETED_PREV = HRESULT($80092008);
  {$EXTERNALSYM CRYPT_E_DELETED_PREV}

//
// MessageId: CRYPT_E_NO_MATCH
//
// MessageText:
//
//  Cannot find the requested object.
//

  CRYPT_E_NO_MATCH = HRESULT($80092009);
  {$EXTERNALSYM CRYPT_E_NO_MATCH}

//
// MessageId: CRYPT_E_UNEXPECTED_MSG_TYPE
//
// MessageText:
//
//  The certificate does not have a property that references a private key.
//

  CRYPT_E_UNEXPECTED_MSG_TYPE = HRESULT($8009200A);
  {$EXTERNALSYM CRYPT_E_UNEXPECTED_MSG_TYPE}

//
// MessageId: CRYPT_E_NO_KEY_PROPERTY
//
// MessageText:
//
//  Cannot find the certificate and private key for decryption.
//

  CRYPT_E_NO_KEY_PROPERTY = HRESULT($8009200B);
  {$EXTERNALSYM CRYPT_E_NO_KEY_PROPERTY}

//
// MessageId: CRYPT_E_NO_DECRYPT_CERT
//
// MessageText:
//
//  Cannot find the certificate and private key to use for decryption.
//

  CRYPT_E_NO_DECRYPT_CERT = HRESULT($8009200C);
  {$EXTERNALSYM CRYPT_E_NO_DECRYPT_CERT}

//
// MessageId: CRYPT_E_BAD_MSG
//
// MessageText:
//
//  Not a cryptographic message or the cryptographic message is not formatted correctly.
//

  CRYPT_E_BAD_MSG = HRESULT($8009200D);
  {$EXTERNALSYM CRYPT_E_BAD_MSG}

//
// MessageId: CRYPT_E_NO_SIGNER
//
// MessageText:
//
//  The signed cryptographic message does not have a signer for the specified signer index.
//

  CRYPT_E_NO_SIGNER = HRESULT($8009200E);
  {$EXTERNALSYM CRYPT_E_NO_SIGNER}

//
// MessageId: CRYPT_E_PENDING_CLOSE
//
// MessageText:
//
//  Final closure is pending until additional frees or closes.
//

  CRYPT_E_PENDING_CLOSE = HRESULT($8009200F);
  {$EXTERNALSYM CRYPT_E_PENDING_CLOSE}

//
// MessageId: CRYPT_E_REVOKED
//
// MessageText:
//
//  The certificate is revoked.
//

  CRYPT_E_REVOKED = HRESULT($80092010);
  {$EXTERNALSYM CRYPT_E_REVOKED}

//
// MessageId: CRYPT_E_NO_REVOCATION_DLL
//
// MessageText:
//
//  No Dll or exported function was found to verify revocation.
//

  CRYPT_E_NO_REVOCATION_DLL = HRESULT($80092011);
  {$EXTERNALSYM CRYPT_E_NO_REVOCATION_DLL}

//
// MessageId: CRYPT_E_NO_REVOCATION_CHECK
//
// MessageText:
//
//  The revocation function was unable to check revocation for the certificate.
//

  CRYPT_E_NO_REVOCATION_CHECK = HRESULT($80092012);
  {$EXTERNALSYM CRYPT_E_NO_REVOCATION_CHECK}

//
// MessageId: CRYPT_E_REVOCATION_OFFLINE
//
// MessageText:
//
//  The revocation function was unable to check revocation because the revocation server was offline.
//

  CRYPT_E_REVOCATION_OFFLINE = HRESULT($80092013);
  {$EXTERNALSYM CRYPT_E_REVOCATION_OFFLINE}

//
// MessageId: CRYPT_E_NOT_IN_REVOCATION_DATABASE
//
// MessageText:
//
//  The certificate is not in the revocation server's database.
//

  CRYPT_E_NOT_IN_REVOCATION_DATABASE = HRESULT($80092014);
  {$EXTERNALSYM CRYPT_E_NOT_IN_REVOCATION_DATABASE}

//
// MessageId: CRYPT_E_INVALID_NUMERIC_STRING
//
// MessageText:
//
//  The string contains a non-numeric character.
//

  CRYPT_E_INVALID_NUMERIC_STRING = HRESULT($80092020);
  {$EXTERNALSYM CRYPT_E_INVALID_NUMERIC_STRING}

//
// MessageId: CRYPT_E_INVALID_PRINTABLE_STRING
//
// MessageText:
//
//  The string contains a non-printable character.
//

  CRYPT_E_INVALID_PRINTABLE_STRING = HRESULT($80092021);
  {$EXTERNALSYM CRYPT_E_INVALID_PRINTABLE_STRING}

//
// MessageId: CRYPT_E_INVALID_IA5_STRING
//
// MessageText:
//
//  The string contains a character not in the 7 bit ASCII character set.
//

  CRYPT_E_INVALID_IA5_STRING = HRESULT($80092022);
  {$EXTERNALSYM CRYPT_E_INVALID_IA5_STRING}

//
// MessageId: CRYPT_E_INVALID_X500_STRING
//
// MessageText:
//
//  The string contains an invalid X500 name attribute key, oid, value or delimiter.
//

  CRYPT_E_INVALID_X500_STRING = HRESULT($80092023);
  {$EXTERNALSYM CRYPT_E_INVALID_X500_STRING}

//
// MessageId: CRYPT_E_NOT_CHAR_STRING
//
// MessageText:
//
//  The dwValueType for the CERT_NAME_VALUE is not one of the character strings.  Most likely it is either a CERT_RDN_ENCODED_BLOB or CERT_TDN_OCTED_STRING.
//

  CRYPT_E_NOT_CHAR_STRING = HRESULT($80092024);
  {$EXTERNALSYM CRYPT_E_NOT_CHAR_STRING}

//
// MessageId: CRYPT_E_FILERESIZED
//
// MessageText:
//
//  The Put operation can not continue.  The file needs to be resized.  However, there is already a signature present.  A complete signing operation must be done.
//

  CRYPT_E_FILERESIZED = HRESULT($80092025);
  {$EXTERNALSYM CRYPT_E_FILERESIZED}

//
// MessageId: CRYPT_E_SECURITY_SETTINGS
//
// MessageText:
//
//  The cryptographic operation failed due to a local security option setting.
//

  CRYPT_E_SECURITY_SETTINGS = HRESULT($80092026);
  {$EXTERNALSYM CRYPT_E_SECURITY_SETTINGS}

//
// MessageId: CRYPT_E_NO_VERIFY_USAGE_DLL
//
// MessageText:
//
//  No DLL or exported function was found to verify subject usage.
//

  CRYPT_E_NO_VERIFY_USAGE_DLL = HRESULT($80092027);
  {$EXTERNALSYM CRYPT_E_NO_VERIFY_USAGE_DLL}

//
// MessageId: CRYPT_E_NO_VERIFY_USAGE_CHECK
//
// MessageText:
//
//  The called function was unable to do a usage check on the subject.
//

  CRYPT_E_NO_VERIFY_USAGE_CHECK = HRESULT($80092028);
  {$EXTERNALSYM CRYPT_E_NO_VERIFY_USAGE_CHECK}

//
// MessageId: CRYPT_E_VERIFY_USAGE_OFFLINE
//
// MessageText:
//
//  Since the server was offline, the called function was unable to complete the usage check.
//

  CRYPT_E_VERIFY_USAGE_OFFLINE = HRESULT($80092029);
  {$EXTERNALSYM CRYPT_E_VERIFY_USAGE_OFFLINE}

//
// MessageId: CRYPT_E_NOT_IN_CTL
//
// MessageText:
//
//  The subject was not found in a Certificate Trust List (CTL).
//

  CRYPT_E_NOT_IN_CTL = HRESULT($8009202A);
  {$EXTERNALSYM CRYPT_E_NOT_IN_CTL}

//
// MessageId: CRYPT_E_NO_TRUSTED_SIGNER
//
// MessageText:
//
//  None of the signers of the cryptographic message or certificate trust list is trusted.
//

  CRYPT_E_NO_TRUSTED_SIGNER = HRESULT($8009202B);
  {$EXTERNALSYM CRYPT_E_NO_TRUSTED_SIGNER}

//
// MessageId: CRYPT_E_MISSING_PUBKEY_PARA
//
// MessageText:
//
//  The public key's algorithm parameters are missing.
//

  CRYPT_E_MISSING_PUBKEY_PARA = HRESULT($8009202C);
  {$EXTERNALSYM CRYPT_E_MISSING_PUBKEY_PARA}

//
// MessageId: CRYPT_E_OSS_ERROR
//
// MessageText:
//
//  OSS Certificate encode/decode error code base
//  
//  See asn1code.h for a definition of the OSS runtime errors. The OSS
//  error values are offset by CRYPT_E_OSS_ERROR.
//

  CRYPT_E_OSS_ERROR = HRESULT($80093000);
  {$EXTERNALSYM CRYPT_E_OSS_ERROR}

//
// MessageId: OSS_MORE_BUF
//
// MessageText:
//
//  OSS ASN.1 Error: Output Buffer is too small.
//

  OSS_MORE_BUF = HRESULT($80093001);
  {$EXTERNALSYM OSS_MORE_BUF}

//
// MessageId: OSS_NEGATIVE_UINTEGER
//
// MessageText:
//
//  OSS ASN.1 Error: Signed integer is encoded as a unsigned integer.
//

  OSS_NEGATIVE_UINTEGER = HRESULT($80093002);
  {$EXTERNALSYM OSS_NEGATIVE_UINTEGER}

//
// MessageId: OSS_PDU_RANGE
//
// MessageText:
//
//  OSS ASN.1 Error: Unknown ASN.1 data type.
//

  OSS_PDU_RANGE = HRESULT($80093003);
  {$EXTERNALSYM OSS_PDU_RANGE}

//
// MessageId: OSS_MORE_INPUT
//
// MessageText:
//
//  OSS ASN.1 Error: Output buffer is too small, the decoded data has been truncated.
//

  OSS_MORE_INPUT = HRESULT($80093004);
  {$EXTERNALSYM OSS_MORE_INPUT}

//
// MessageId: OSS_DATA_ERROR
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_DATA_ERROR = HRESULT($80093005);
  {$EXTERNALSYM OSS_DATA_ERROR}

//
// MessageId: OSS_BAD_ARG
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid argument.
//

  OSS_BAD_ARG = HRESULT($80093006);
  {$EXTERNALSYM OSS_BAD_ARG}

//
// MessageId: OSS_BAD_VERSION
//
// MessageText:
//
//  OSS ASN.1 Error: Encode/Decode version mismatch.
//

  OSS_BAD_VERSION = HRESULT($80093007);
  {$EXTERNALSYM OSS_BAD_VERSION}

//
// MessageId: OSS_OUT_MEMORY
//
// MessageText:
//
//  OSS ASN.1 Error: Out of memory.
//

  OSS_OUT_MEMORY = HRESULT($80093008);
  {$EXTERNALSYM OSS_OUT_MEMORY}

//
// MessageId: OSS_PDU_MISMATCH
//
// MessageText:
//
//  OSS ASN.1 Error: Encode/Decode Error.
//

  OSS_PDU_MISMATCH = HRESULT($80093009);
  {$EXTERNALSYM OSS_PDU_MISMATCH}

//
// MessageId: OSS_LIMITED
//
// MessageText:
//
//  OSS ASN.1 Error: Internal Error.
//

  OSS_LIMITED = HRESULT($8009300A);
  {$EXTERNALSYM OSS_LIMITED}

//
// MessageId: OSS_BAD_PTR
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_BAD_PTR = HRESULT($8009300B);
  {$EXTERNALSYM OSS_BAD_PTR}

//
// MessageId: OSS_BAD_TIME
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_BAD_TIME = HRESULT($8009300C);
  {$EXTERNALSYM OSS_BAD_TIME}

//
// MessageId: OSS_INDEFINITE_NOT_SUPPORTED
//
// MessageText:
//
//  OSS ASN.1 Error: Unsupported BER indefinite-length encoding.
//

  OSS_INDEFINITE_NOT_SUPPORTED = HRESULT($8009300D);
  {$EXTERNALSYM OSS_INDEFINITE_NOT_SUPPORTED}

//
// MessageId: OSS_MEM_ERROR
//
// MessageText:
//
//  OSS ASN.1 Error: Access violation.
//

  OSS_MEM_ERROR = HRESULT($8009300E);
  {$EXTERNALSYM OSS_MEM_ERROR}

//
// MessageId: OSS_BAD_TABLE
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_BAD_TABLE = HRESULT($8009300F);
  {$EXTERNALSYM OSS_BAD_TABLE}

//
// MessageId: OSS_TOO_LONG
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_TOO_LONG = HRESULT($80093010);
  {$EXTERNALSYM OSS_TOO_LONG}

//
// MessageId: OSS_CONSTRAINT_VIOLATED
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_CONSTRAINT_VIOLATED = HRESULT($80093011);
  {$EXTERNALSYM OSS_CONSTRAINT_VIOLATED}

//
// MessageId: OSS_FATAL_ERROR
//
// MessageText:
//
//  OSS ASN.1 Error: Internal Error.
//

  OSS_FATAL_ERROR = HRESULT($80093012);
  {$EXTERNALSYM OSS_FATAL_ERROR}

//
// MessageId: OSS_ACCESS_SERIALIZATION_ERROR
//
// MessageText:
//
//  OSS ASN.1 Error: Multi-threading conflict.
//

  OSS_ACCESS_SERIALIZATION_ERROR = HRESULT($80093013);
  {$EXTERNALSYM OSS_ACCESS_SERIALIZATION_ERROR}

//
// MessageId: OSS_NULL_TBL
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_NULL_TBL = HRESULT($80093014);
  {$EXTERNALSYM OSS_NULL_TBL}

//
// MessageId: OSS_NULL_FCN
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_NULL_FCN = HRESULT($80093015);
  {$EXTERNALSYM OSS_NULL_FCN}

//
// MessageId: OSS_BAD_ENCRULES
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_BAD_ENCRULES = HRESULT($80093016);
  {$EXTERNALSYM OSS_BAD_ENCRULES}

//
// MessageId: OSS_UNAVAIL_ENCRULES
//
// MessageText:
//
//  OSS ASN.1 Error: Encode/Decode function not implemented.
//

  OSS_UNAVAIL_ENCRULES = HRESULT($80093017);
  {$EXTERNALSYM OSS_UNAVAIL_ENCRULES}

//
// MessageId: OSS_CANT_OPEN_TRACE_WINDOW
//
// MessageText:
//
//  OSS ASN.1 Error: Trace file error.
//

  OSS_CANT_OPEN_TRACE_WINDOW = HRESULT($80093018);
  {$EXTERNALSYM OSS_CANT_OPEN_TRACE_WINDOW}

//
// MessageId: OSS_UNIMPLEMENTED
//
// MessageText:
//
//  OSS ASN.1 Error: Function not implemented.
//

  OSS_UNIMPLEMENTED = HRESULT($80093019);
  {$EXTERNALSYM OSS_UNIMPLEMENTED}

//
// MessageId: OSS_OID_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_OID_DLL_NOT_LINKED = HRESULT($8009301A);
  {$EXTERNALSYM OSS_OID_DLL_NOT_LINKED}

//
// MessageId: OSS_CANT_OPEN_TRACE_FILE
//
// MessageText:
//
//  OSS ASN.1 Error: Trace file error.
//

  OSS_CANT_OPEN_TRACE_FILE = HRESULT($8009301B);
  {$EXTERNALSYM OSS_CANT_OPEN_TRACE_FILE}

//
// MessageId: OSS_TRACE_FILE_ALREADY_OPEN
//
// MessageText:
//
//  OSS ASN.1 Error: Trace file error.
//

  OSS_TRACE_FILE_ALREADY_OPEN = HRESULT($8009301C);
  {$EXTERNALSYM OSS_TRACE_FILE_ALREADY_OPEN}

//
// MessageId: OSS_TABLE_MISMATCH
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_TABLE_MISMATCH = HRESULT($8009301D);
  {$EXTERNALSYM OSS_TABLE_MISMATCH}

//
// MessageId: OSS_TYPE_NOT_SUPPORTED
//
// MessageText:
//
//  OSS ASN.1 Error: Invalid data.
//

  OSS_TYPE_NOT_SUPPORTED = HRESULT($8009301E);
  {$EXTERNALSYM OSS_TYPE_NOT_SUPPORTED}

//
// MessageId: OSS_REAL_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_REAL_DLL_NOT_LINKED = HRESULT($8009301F);
  {$EXTERNALSYM OSS_REAL_DLL_NOT_LINKED}

//
// MessageId: OSS_REAL_CODE_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_REAL_CODE_NOT_LINKED = HRESULT($80093020);
  {$EXTERNALSYM OSS_REAL_CODE_NOT_LINKED}

//
// MessageId: OSS_OUT_OF_RANGE
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_OUT_OF_RANGE = HRESULT($80093021);
  {$EXTERNALSYM OSS_OUT_OF_RANGE}

//
// MessageId: OSS_COPIER_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_COPIER_DLL_NOT_LINKED = HRESULT($80093022);
  {$EXTERNALSYM OSS_COPIER_DLL_NOT_LINKED}

//
// MessageId: OSS_CONSTRAINT_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_CONSTRAINT_DLL_NOT_LINKED = HRESULT($80093023);
  {$EXTERNALSYM OSS_CONSTRAINT_DLL_NOT_LINKED}

//
// MessageId: OSS_COMPARATOR_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_COMPARATOR_DLL_NOT_LINKED = HRESULT($80093024);
  {$EXTERNALSYM OSS_COMPARATOR_DLL_NOT_LINKED}

//
// MessageId: OSS_COMPARATOR_CODE_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_COMPARATOR_CODE_NOT_LINKED = HRESULT($80093025);
  {$EXTERNALSYM OSS_COMPARATOR_CODE_NOT_LINKED}

//
// MessageId: OSS_MEM_MGR_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_MEM_MGR_DLL_NOT_LINKED = HRESULT($80093026);
  {$EXTERNALSYM OSS_MEM_MGR_DLL_NOT_LINKED}

//
// MessageId: OSS_PDV_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_PDV_DLL_NOT_LINKED = HRESULT($80093027);
  {$EXTERNALSYM OSS_PDV_DLL_NOT_LINKED}

//
// MessageId: OSS_PDV_CODE_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_PDV_CODE_NOT_LINKED = HRESULT($80093028);
  {$EXTERNALSYM OSS_PDV_CODE_NOT_LINKED}

//
// MessageId: OSS_API_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_API_DLL_NOT_LINKED = HRESULT($80093029);
  {$EXTERNALSYM OSS_API_DLL_NOT_LINKED}

//
// MessageId: OSS_BERDER_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_BERDER_DLL_NOT_LINKED = HRESULT($8009302A);
  {$EXTERNALSYM OSS_BERDER_DLL_NOT_LINKED}

//
// MessageId: OSS_PER_DLL_NOT_LINKED
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_PER_DLL_NOT_LINKED = HRESULT($8009302B);
  {$EXTERNALSYM OSS_PER_DLL_NOT_LINKED}

//
// MessageId: OSS_OPEN_TYPE_ERROR
//
// MessageText:
//
//  OSS ASN.1 Error: Program link error.
//

  OSS_OPEN_TYPE_ERROR = HRESULT($8009302C);
  {$EXTERNALSYM OSS_OPEN_TYPE_ERROR}

//
// MessageId: OSS_MUTEX_NOT_CREATED
//
// MessageText:
//
//  OSS ASN.1 Error: System resource error.
//

  OSS_MUTEX_NOT_CREATED = HRESULT($8009302D);
  {$EXTERNALSYM OSS_MUTEX_NOT_CREATED}

//
// MessageId: OSS_CANT_CLOSE_TRACE_FILE
//
// MessageText:
//
//  OSS ASN.1 Error: Trace file error.
//

  OSS_CANT_CLOSE_TRACE_FILE = HRESULT($8009302E);
  {$EXTERNALSYM OSS_CANT_CLOSE_TRACE_FILE}

//
// MessageId: CRYPT_E_ASN1_ERROR
//
// MessageText:
//
//  ASN1 Certificate encode/decode error code base.
//  
//  The ASN1 error values are offset by CRYPT_E_ASN1_ERROR.
//

  CRYPT_E_ASN1_ERROR = HRESULT($80093100);
  {$EXTERNALSYM CRYPT_E_ASN1_ERROR}

//
// MessageId: CRYPT_E_ASN1_INTERNAL
//
// MessageText:
//
//  ASN1 internal encode or decode error.
//

  CRYPT_E_ASN1_INTERNAL = HRESULT($80093101);
  {$EXTERNALSYM CRYPT_E_ASN1_INTERNAL}

//
// MessageId: CRYPT_E_ASN1_EOD
//
// MessageText:
//
//  ASN1 unexpected end of data.
//

  CRYPT_E_ASN1_EOD = HRESULT($80093102);
  {$EXTERNALSYM CRYPT_E_ASN1_EOD}

//
// MessageId: CRYPT_E_ASN1_CORRUPT
//
// MessageText:
//
//  ASN1 corrupted data.
//

  CRYPT_E_ASN1_CORRUPT = HRESULT($80093103);
  {$EXTERNALSYM CRYPT_E_ASN1_CORRUPT}

//
// MessageId: CRYPT_E_ASN1_LARGE
//
// MessageText:
//
//  ASN1 value too large.
//

  CRYPT_E_ASN1_LARGE = HRESULT($80093104);
  {$EXTERNALSYM CRYPT_E_ASN1_LARGE}

//
// MessageId: CRYPT_E_ASN1_CONSTRAINT
//
// MessageText:
//
//  ASN1 constraint violated.
//

  CRYPT_E_ASN1_CONSTRAINT = HRESULT($80093105);
  {$EXTERNALSYM CRYPT_E_ASN1_CONSTRAINT}

//
// MessageId: CRYPT_E_ASN1_MEMORY
//
// MessageText:
//
//  ASN1 out of memory.
//

  CRYPT_E_ASN1_MEMORY = HRESULT($80093106);
  {$EXTERNALSYM CRYPT_E_ASN1_MEMORY}

//
// MessageId: CRYPT_E_ASN1_OVERFLOW
//
// MessageText:
//
//  ASN1 buffer overflow.
//

  CRYPT_E_ASN1_OVERFLOW = HRESULT($80093107);
  {$EXTERNALSYM CRYPT_E_ASN1_OVERFLOW}

//
// MessageId: CRYPT_E_ASN1_BADPDU
//
// MessageText:
//
//  ASN1 function not supported for this PDU.
//

  CRYPT_E_ASN1_BADPDU = HRESULT($80093108);
  {$EXTERNALSYM CRYPT_E_ASN1_BADPDU}

//
// MessageId: CRYPT_E_ASN1_BADARGS
//
// MessageText:
//
//  ASN1 bad arguments to function call.
//

  CRYPT_E_ASN1_BADARGS = HRESULT($80093109);
  {$EXTERNALSYM CRYPT_E_ASN1_BADARGS}

//
// MessageId: CRYPT_E_ASN1_BADREAL
//
// MessageText:
//
//  ASN1 bad real value.
//

  CRYPT_E_ASN1_BADREAL = HRESULT($8009310A);
  {$EXTERNALSYM CRYPT_E_ASN1_BADREAL}

//
// MessageId: CRYPT_E_ASN1_BADTAG
//
// MessageText:
//
//  ASN1 bad tag value met.
//

  CRYPT_E_ASN1_BADTAG = HRESULT($8009310B);
  {$EXTERNALSYM CRYPT_E_ASN1_BADTAG}

//
// MessageId: CRYPT_E_ASN1_CHOICE
//
// MessageText:
//
//  ASN1 bad choice value.
//

  CRYPT_E_ASN1_CHOICE = HRESULT($8009310C);
  {$EXTERNALSYM CRYPT_E_ASN1_CHOICE}

//
// MessageId: CRYPT_E_ASN1_RULE
//
// MessageText:
//
//  ASN1 bad encoding rule.
//

  CRYPT_E_ASN1_RULE = HRESULT($8009310D);
  {$EXTERNALSYM CRYPT_E_ASN1_RULE}

//
// MessageId: CRYPT_E_ASN1_UTF8
//
// MessageText:
//
//  ASN1 bad unicode (UTF8).
//

  CRYPT_E_ASN1_UTF8 = HRESULT($8009310E);
  {$EXTERNALSYM CRYPT_E_ASN1_UTF8}

//
// MessageId: CRYPT_E_ASN1_PDU_TYPE
//
// MessageText:
//
//  ASN1 bad PDU type.
//

  CRYPT_E_ASN1_PDU_TYPE = HRESULT($80093133);
  {$EXTERNALSYM CRYPT_E_ASN1_PDU_TYPE}

//
// MessageId: CRYPT_E_ASN1_NYI
//
// MessageText:
//
//  ASN1 not yet implemented.
//

  CRYPT_E_ASN1_NYI = HRESULT($80093134);
  {$EXTERNALSYM CRYPT_E_ASN1_NYI}

//
// MessageId: CRYPT_E_ASN1_EXTENDED
//
// MessageText:
//
//  ASN1 skipped unknown extension(s).
//

  CRYPT_E_ASN1_EXTENDED = HRESULT($80093201);
  {$EXTERNALSYM CRYPT_E_ASN1_EXTENDED}

//
// MessageId: CRYPT_E_ASN1_NOEOD
//
// MessageText:
//
//  ASN1 end of data expected
//

  CRYPT_E_ASN1_NOEOD = HRESULT($80093202);
  {$EXTERNALSYM CRYPT_E_ASN1_NOEOD}

//
// MessageId: CERTSRV_E_BAD_REQUESTSUBJECT
//
// MessageText:
//
//  The request subject name is invalid or too long.
//

  CERTSRV_E_BAD_REQUESTSUBJECT = HRESULT($80094001);
  {$EXTERNALSYM CERTSRV_E_BAD_REQUESTSUBJECT}

//
// MessageId: CERTSRV_E_NO_REQUEST
//
// MessageText:
//
//  The request does not exist.
//

  CERTSRV_E_NO_REQUEST = HRESULT($80094002);
  {$EXTERNALSYM CERTSRV_E_NO_REQUEST}

//
// MessageId: CERTSRV_E_BAD_REQUESTSTATUS
//
// MessageText:
//
//  The request's current status does not allow this operation.
//

  CERTSRV_E_BAD_REQUESTSTATUS = HRESULT($80094003);
  {$EXTERNALSYM CERTSRV_E_BAD_REQUESTSTATUS}

//
// MessageId: CERTSRV_E_PROPERTY_EMPTY
//
// MessageText:
//
//  The requested property value is empty.
//

  CERTSRV_E_PROPERTY_EMPTY = HRESULT($80094004);
  {$EXTERNALSYM CERTSRV_E_PROPERTY_EMPTY}

//
// MessageId: CERTSRV_E_INVALID_CA_CERTIFICATE
//
// MessageText:
//
//  The certification authority's certificate contains invalid data.
//

  CERTSRV_E_INVALID_CA_CERTIFICATE = HRESULT($80094005);
  {$EXTERNALSYM CERTSRV_E_INVALID_CA_CERTIFICATE}

//
// MessageId: CERTSRV_E_SERVER_SUSPENDED
//
// MessageText:
//
//  Certificate service has been suspended for a database restore operation.
//

  CERTSRV_E_SERVER_SUSPENDED = HRESULT($80094006);
  {$EXTERNALSYM CERTSRV_E_SERVER_SUSPENDED}

//
// MessageId: CERTSRV_E_ENCODING_LENGTH
//
// MessageText:
//
//  The certificate contains an encoded length that is potentially incompatible with older enrollment software.
//

  CERTSRV_E_ENCODING_LENGTH = HRESULT($80094007);
  {$EXTERNALSYM CERTSRV_E_ENCODING_LENGTH}

//
// MessageId: CERTSRV_E_UNSUPPORTED_CERT_TYPE
//
// MessageText:
//
//  The requested certificate template is not supported by this CA.
//

  CERTSRV_E_UNSUPPORTED_CERT_TYPE = HRESULT($80094800);
  {$EXTERNALSYM CERTSRV_E_UNSUPPORTED_CERT_TYPE}

//
// MessageId: CERTSRV_E_NO_CERT_TYPE
//
// MessageText:
//
//  The request contains no certificate template information.
//

  CERTSRV_E_NO_CERT_TYPE = HRESULT($80094801);
  {$EXTERNALSYM CERTSRV_E_NO_CERT_TYPE}

//
// MessageId: TRUST_E_SYSTEM_ERROR
//
// MessageText:
//
//  A system-level error occurred while verifying trust.
//

  TRUST_E_SYSTEM_ERROR = HRESULT($80096001);
  {$EXTERNALSYM TRUST_E_SYSTEM_ERROR}

//
// MessageId: TRUST_E_NO_SIGNER_CERT
//
// MessageText:
//
//  The certificate for the signer of the message is invalid or not found.
//

  TRUST_E_NO_SIGNER_CERT = HRESULT($80096002);
  {$EXTERNALSYM TRUST_E_NO_SIGNER_CERT}

//
// MessageId: TRUST_E_COUNTER_SIGNER
//
// MessageText:
//
//  One of the counter signatures was invalid.
//

  TRUST_E_COUNTER_SIGNER = HRESULT($80096003);
  {$EXTERNALSYM TRUST_E_COUNTER_SIGNER}

//
// MessageId: TRUST_E_CERT_SIGNATURE
//
// MessageText:
//
//  The signature of the certificate can not be verified.
//

  TRUST_E_CERT_SIGNATURE = HRESULT($80096004);
  {$EXTERNALSYM TRUST_E_CERT_SIGNATURE}

//
// MessageId: TRUST_E_TIME_STAMP
//
// MessageText:
//
//  The timestamp signature and/or certificate could not be verified or is malformed.
//

  TRUST_E_TIME_STAMP = HRESULT($80096005);
  {$EXTERNALSYM TRUST_E_TIME_STAMP}

//
// MessageId: TRUST_E_BAD_DIGEST
//
// MessageText:
//
//  The digital signature of the object did not verify.
//

  TRUST_E_BAD_DIGEST = HRESULT($80096010);
  {$EXTERNALSYM TRUST_E_BAD_DIGEST}

//
// MessageId: TRUST_E_BASIC_CONSTRAINTS
//
// MessageText:
//
//  A certificate's basic constraint extension has not been observed.
//

  TRUST_E_BASIC_CONSTRAINTS = HRESULT($80096019);
  {$EXTERNALSYM TRUST_E_BASIC_CONSTRAINTS}

//
// MessageId: TRUST_E_FINANCIAL_CRITERIA
//
// MessageText:
//
//  The certificate does not meet or contain the Authenticode financial extensions.
//

  TRUST_E_FINANCIAL_CRITERIA = HRESULT($8009601E);
  {$EXTERNALSYM TRUST_E_FINANCIAL_CRITERIA}

//
//  Error codes for mssipotf.dll
//  Most of the error codes can only occur when an error occurs
//    during font file signing
//
//
//
// MessageId: MSSIPOTF_E_OUTOFMEMRANGE
//
// MessageText:
//
//  Tried to reference a part of the file outside the proper range.
//

  MSSIPOTF_E_OUTOFMEMRANGE = HRESULT($80097001);
  {$EXTERNALSYM MSSIPOTF_E_OUTOFMEMRANGE}

//
// MessageId: MSSIPOTF_E_CANTGETOBJECT
//
// MessageText:
//
//  Could not retrieve an object from the file.
//

  MSSIPOTF_E_CANTGETOBJECT = HRESULT($80097002);
  {$EXTERNALSYM MSSIPOTF_E_CANTGETOBJECT}

//
// MessageId: MSSIPOTF_E_NOHEADTABLE
//
// MessageText:
//
//  Could not find the head table in the file.
//

  MSSIPOTF_E_NOHEADTABLE = HRESULT($80097003);
  {$EXTERNALSYM MSSIPOTF_E_NOHEADTABLE}

//
// MessageId: MSSIPOTF_E_BAD_MAGICNUMBER
//
// MessageText:
//
//  The magic number in the head table is incorrect.
//

  MSSIPOTF_E_BAD_MAGICNUMBER = HRESULT($80097004);
  {$EXTERNALSYM MSSIPOTF_E_BAD_MAGICNUMBER}

//
// MessageId: MSSIPOTF_E_BAD_OFFSET_TABLE
//
// MessageText:
//
//  The offset table has incorrect values.
//

  MSSIPOTF_E_BAD_OFFSET_TABLE = HRESULT($80097005);
  {$EXTERNALSYM MSSIPOTF_E_BAD_OFFSET_TABLE}

//
// MessageId: MSSIPOTF_E_TABLE_TAGORDER
//
// MessageText:
//
//  Duplicate table tags or tags out of alphabetical order.
//

  MSSIPOTF_E_TABLE_TAGORDER = HRESULT($80097006);
  {$EXTERNALSYM MSSIPOTF_E_TABLE_TAGORDER}

//
// MessageId: MSSIPOTF_E_TABLE_LONGWORD
//
// MessageText:
//
//  A table does not start on a long word boundary.
//

  MSSIPOTF_E_TABLE_LONGWORD = HRESULT($80097007);
  {$EXTERNALSYM MSSIPOTF_E_TABLE_LONGWORD}

//
// MessageId: MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT
//
// MessageText:
//
//  First table does not appear after header information.
//

  MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT = HRESULT($80097008);
  {$EXTERNALSYM MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT}

//
// MessageId: MSSIPOTF_E_TABLES_OVERLAP
//
// MessageText:
//
//  Two or more tables overlap.
//

  MSSIPOTF_E_TABLES_OVERLAP = HRESULT($80097009);
  {$EXTERNALSYM MSSIPOTF_E_TABLES_OVERLAP}

//
// MessageId: MSSIPOTF_E_TABLE_PADBYTES
//
// MessageText:
//
//  Too many pad bytes between tables or pad bytes are not 0.
//

  MSSIPOTF_E_TABLE_PADBYTES = HRESULT($8009700A);
  {$EXTERNALSYM MSSIPOTF_E_TABLE_PADBYTES}

//
// MessageId: MSSIPOTF_E_FILETOOSMALL
//
// MessageText:
//
//  File is too small to contain the last table.
//

  MSSIPOTF_E_FILETOOSMALL = HRESULT($8009700B);
  {$EXTERNALSYM MSSIPOTF_E_FILETOOSMALL}

//
// MessageId: MSSIPOTF_E_TABLE_CHECKSUM
//
// MessageText:
//
//  A table checksum is incorrect.
//

  MSSIPOTF_E_TABLE_CHECKSUM = HRESULT($8009700C);
  {$EXTERNALSYM MSSIPOTF_E_TABLE_CHECKSUM}

//
// MessageId: MSSIPOTF_E_FILE_CHECKSUM
//
// MessageText:
//
//  The file checksum is incorrect.
//

  MSSIPOTF_E_FILE_CHECKSUM = HRESULT($8009700D);
  {$EXTERNALSYM MSSIPOTF_E_FILE_CHECKSUM}

//
// MessageId: MSSIPOTF_E_FAILED_POLICY
//
// MessageText:
//
//  The signature does not have the correct attributes for the policy.
//

  MSSIPOTF_E_FAILED_POLICY = HRESULT($80097010);
  {$EXTERNALSYM MSSIPOTF_E_FAILED_POLICY}

//
// MessageId: MSSIPOTF_E_FAILED_HINTS_CHECK
//
// MessageText:
//
//  The file did not pass the hints check.
//

  MSSIPOTF_E_FAILED_HINTS_CHECK = HRESULT($80097011);
  {$EXTERNALSYM MSSIPOTF_E_FAILED_HINTS_CHECK}

//
// MessageId: MSSIPOTF_E_NOT_OPENTYPE
//
// MessageText:
//
//  The file is not an OpenType file.
//

  MSSIPOTF_E_NOT_OPENTYPE = HRESULT($80097012);
  {$EXTERNALSYM MSSIPOTF_E_NOT_OPENTYPE}

//
// MessageId: MSSIPOTF_E_FILE
//
// MessageText:
//
//  Failed on a file operation (open, map, read, write).
//

  MSSIPOTF_E_FILE = HRESULT($80097013);
  {$EXTERNALSYM MSSIPOTF_E_FILE}

//
// MessageId: MSSIPOTF_E_CRYPT
//
// MessageText:
//
//  A call to a CryptoAPI function failed.
//

  MSSIPOTF_E_CRYPT = HRESULT($80097014);
  {$EXTERNALSYM MSSIPOTF_E_CRYPT}

//
// MessageId: MSSIPOTF_E_BADVERSION
//
// MessageText:
//
//  There is a bad version number in the file.
//

  MSSIPOTF_E_BADVERSION = HRESULT($80097015);
  {$EXTERNALSYM MSSIPOTF_E_BADVERSION}

//
// MessageId: MSSIPOTF_E_DSIG_STRUCTURE
//
// MessageText:
//
//  The structure of the DSIG table is incorrect.
//

  MSSIPOTF_E_DSIG_STRUCTURE = HRESULT($80097016);
  {$EXTERNALSYM MSSIPOTF_E_DSIG_STRUCTURE}

//
// MessageId: MSSIPOTF_E_PCONST_CHECK
//
// MessageText:
//
//  A check failed in a partially constant table.
//

  MSSIPOTF_E_PCONST_CHECK = HRESULT($80097017);
  {$EXTERNALSYM MSSIPOTF_E_PCONST_CHECK}

//
// MessageId: MSSIPOTF_E_STRUCTURE
//
// MessageText:
//
//  Some kind of structural error.
//

  MSSIPOTF_E_STRUCTURE = HRESULT($80097018);
  {$EXTERNALSYM MSSIPOTF_E_STRUCTURE}

  NTE_OP_OK = 0;
  {$EXTERNALSYM NTE_OP_OK}

//
// Note that additional FACILITY_SSPI errors are in issperr.h
//
// ******************
// FACILITY_CERT
// ******************
//
// MessageId: TRUST_E_PROVIDER_UNKNOWN
//
// MessageText:
//
//  Unknown trust provider.
//

  TRUST_E_PROVIDER_UNKNOWN = HRESULT($800B0001);
  {$EXTERNALSYM TRUST_E_PROVIDER_UNKNOWN}

//
// MessageId: TRUST_E_ACTION_UNKNOWN
//
// MessageText:
//
//  The trust verification action specified is not supported by the specified trust provider.
//

  TRUST_E_ACTION_UNKNOWN = HRESULT($800B0002);
  {$EXTERNALSYM TRUST_E_ACTION_UNKNOWN}

//
// MessageId: TRUST_E_SUBJECT_FORM_UNKNOWN
//
// MessageText:
//
//  The form specified for the subject is not one supported or known by the specified trust provider.
//

  TRUST_E_SUBJECT_FORM_UNKNOWN = HRESULT($800B0003);
  {$EXTERNALSYM TRUST_E_SUBJECT_FORM_UNKNOWN}

//
// MessageId: TRUST_E_SUBJECT_NOT_TRUSTED
//
// MessageText:
//
//  The subject is not trusted for the specified action.
//

  TRUST_E_SUBJECT_NOT_TRUSTED = HRESULT($800B0004);
  {$EXTERNALSYM TRUST_E_SUBJECT_NOT_TRUSTED}

//
// MessageId: DIGSIG_E_ENCODE
//
// MessageText:
//
//  Error due to problem in ASN.1 encoding process.
//

  DIGSIG_E_ENCODE = HRESULT($800B0005);
  {$EXTERNALSYM DIGSIG_E_ENCODE}

//
// MessageId: DIGSIG_E_DECODE
//
// MessageText:
//
//  Error due to problem in ASN.1 decoding process.
//

  DIGSIG_E_DECODE = HRESULT($800B0006);
  {$EXTERNALSYM DIGSIG_E_DECODE}

//
// MessageId: DIGSIG_E_EXTENSIBILITY
//
// MessageText:
//
//  Reading / writing Extensions where Attributes are appropriate, and visa versa.
//

  DIGSIG_E_EXTENSIBILITY = HRESULT($800B0007);
  {$EXTERNALSYM DIGSIG_E_EXTENSIBILITY}

//
// MessageId: DIGSIG_E_CRYPTO
//
// MessageText:
//
//  Unspecified cryptographic failure.
//

  DIGSIG_E_CRYPTO = HRESULT($800B0008);
  {$EXTERNALSYM DIGSIG_E_CRYPTO}

//
// MessageId: PERSIST_E_SIZEDEFINITE
//
// MessageText:
//
//  The size of the data could not be determined.
//

  PERSIST_E_SIZEDEFINITE = HRESULT($800B0009);
  {$EXTERNALSYM PERSIST_E_SIZEDEFINITE}

//
// MessageId: PERSIST_E_SIZEINDEFINITE
//
// MessageText:
//
//  The size of the indefinite-sized data could not be determined.
//

  PERSIST_E_SIZEINDEFINITE = HRESULT($800B000A);
  {$EXTERNALSYM PERSIST_E_SIZEINDEFINITE}

//
// MessageId: PERSIST_E_NOTSELFSIZING
//
// MessageText:
//
//  This object does not read and write self-sizing data.
//

  PERSIST_E_NOTSELFSIZING = HRESULT($800B000B);
  {$EXTERNALSYM PERSIST_E_NOTSELFSIZING}

//
// MessageId: TRUST_E_NOSIGNATURE
//
// MessageText:
//
//  No signature was present in the subject.
//

  TRUST_E_NOSIGNATURE = HRESULT($800B0100);
  {$EXTERNALSYM TRUST_E_NOSIGNATURE}

//
// MessageId: CERT_E_EXPIRED
//
// MessageText:
//
//  A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
//

  CERT_E_EXPIRED = HRESULT($800B0101);
  {$EXTERNALSYM CERT_E_EXPIRED}

//
// MessageId: CERT_E_VALIDITYPERIODNESTING
//
// MessageText:
//
//  The validity periods of the certification chain do not nest correctly.
//

  CERT_E_VALIDITYPERIODNESTING = HRESULT($800B0102);
  {$EXTERNALSYM CERT_E_VALIDITYPERIODNESTING}

//
// MessageId: CERT_E_ROLE
//
// MessageText:
//
//  A certificate that can only be used as an end-entity is being used as a CA or visa versa.
//

  CERT_E_ROLE = HRESULT($800B0103);
  {$EXTERNALSYM CERT_E_ROLE}

//
// MessageId: CERT_E_PATHLENCONST
//
// MessageText:
//
//  A path length constraint in the certification chain has been violated.
//

  CERT_E_PATHLENCONST = HRESULT($800B0104);
  {$EXTERNALSYM CERT_E_PATHLENCONST}

//
// MessageId: CERT_E_CRITICAL
//
// MessageText:
//
//  A certificate contains an unknown extension that is marked 'critical'.
//

  CERT_E_CRITICAL = HRESULT($800B0105);
  {$EXTERNALSYM CERT_E_CRITICAL}

//
// MessageId: CERT_E_PURPOSE
//
// MessageText:
//
//  A certificate being used for a purpose other than the ones specified by its CA.
//

  CERT_E_PURPOSE = HRESULT($800B0106);
  {$EXTERNALSYM CERT_E_PURPOSE}

//
// MessageId: CERT_E_ISSUERCHAINING
//
// MessageText:
//
//  A parent of a given certificate in fact did not issue that child certificate.
//

  CERT_E_ISSUERCHAINING = HRESULT($800B0107);
  {$EXTERNALSYM CERT_E_ISSUERCHAINING}

//
// MessageId: CERT_E_MALFORMED
//
// MessageText:
//
//  A certificate is missing or has an empty value for an important field, such as a subject or issuer name.
//

  CERT_E_MALFORMED = HRESULT($800B0108);
  {$EXTERNALSYM CERT_E_MALFORMED}

//
// MessageId: CERT_E_UNTRUSTEDROOT
//
// MessageText:
//
//  A certificate chain processed correctly, but terminated in a root certificate which is not trusted by the trust provider.
//

  CERT_E_UNTRUSTEDROOT = HRESULT($800B0109);
  {$EXTERNALSYM CERT_E_UNTRUSTEDROOT}

//
// MessageId: CERT_E_CHAINING
//
// MessageText:
//
//  An internal certificate chaining error has occurred.
//

  CERT_E_CHAINING = HRESULT($800B010A);
  {$EXTERNALSYM CERT_E_CHAINING}

//
// MessageId: TRUST_E_FAIL
//
// MessageText:
//
//  Generic trust failure.
//

  TRUST_E_FAIL = HRESULT($800B010B);
  {$EXTERNALSYM TRUST_E_FAIL}

//
// MessageId: CERT_E_REVOKED
//
// MessageText:
//
//  A certificate was explicitly revoked by its issuer.
//

  CERT_E_REVOKED = HRESULT($800B010C);
  {$EXTERNALSYM CERT_E_REVOKED}

//
// MessageId: CERT_E_UNTRUSTEDTESTROOT
//
// MessageText:
//
//  The certification path terminates with the test root which is not trusted with the current policy settings.
//

  CERT_E_UNTRUSTEDTESTROOT = HRESULT($800B010D);
  {$EXTERNALSYM CERT_E_UNTRUSTEDTESTROOT}

//
// MessageId: CERT_E_REVOCATION_FAILURE
//
// MessageText:
//
//  The revocation process could not continue - the certificate(s) could not be checked.
//

  CERT_E_REVOCATION_FAILURE = HRESULT($800B010E);
  {$EXTERNALSYM CERT_E_REVOCATION_FAILURE}

//
// MessageId: CERT_E_CN_NO_MATCH
//
// MessageText:
//
//  The certificate's CN name does not match the passed value.
//

  CERT_E_CN_NO_MATCH = HRESULT($800B010F);
  {$EXTERNALSYM CERT_E_CN_NO_MATCH}

//
// MessageId: CERT_E_WRONG_USAGE
//
// MessageText:
//
//  The certificate is not valid for the requested usage.
//

  CERT_E_WRONG_USAGE = HRESULT($800B0110);
  {$EXTERNALSYM CERT_E_WRONG_USAGE}

//
// MessageId: TRUST_E_EXPLICIT_DISTRUST
//
// MessageText:
//
//  The certificate was explicitly marked as untrusted by the user.
//

  TRUST_E_EXPLICIT_DISTRUST = HRESULT($800B0111);
  {$EXTERNALSYM TRUST_E_EXPLICIT_DISTRUST}

//
// MessageId: CERT_E_UNTRUSTEDCA
//
// MessageText:
//
//  A certification chain processed correctly, but one of the CA certificates is not trusted by the policy provider.
//

  CERT_E_UNTRUSTEDCA = HRESULT($800B0112);
  {$EXTERNALSYM CERT_E_UNTRUSTEDCA}

// *****************
// FACILITY_SETUPAPI
// *****************
//
// Since these error codes aren't in the standard Win32 range (i.e., 0-64K), define a
// macro to map either Win32 or SetupAPI error codes into an HRESULT.
//

function HRESULT_FROM_SETUPAPI(x: DWORD): HRESULT;
{$EXTERNALSYM HRESULT_FROM_SETUPAPI}

// MessageId: SPAPI_E_EXPECTED_SECTION_NAME
//
// MessageText:
//
//  A non-empty line was encountered in the INF before the start of a section.
//

const
  SPAPI_E_EXPECTED_SECTION_NAME = HRESULT($800F0000);
  {$EXTERNALSYM SPAPI_E_EXPECTED_SECTION_NAME}

//
// MessageId: SPAPI_E_BAD_SECTION_NAME_LINE
//
// MessageText:
//
//  A section name marker in the INF is not complete, or does not exist on a line by itself.
//

  SPAPI_E_BAD_SECTION_NAME_LINE = HRESULT($800F0001);
  {$EXTERNALSYM SPAPI_E_BAD_SECTION_NAME_LINE}

//
// MessageId: SPAPI_E_SECTION_NAME_TOO_LONG
//
// MessageText:
//
//  An INF section was encountered whose name exceeds the maximum section name length.
//

  SPAPI_E_SECTION_NAME_TOO_LONG = HRESULT($800F0002);
  {$EXTERNALSYM SPAPI_E_SECTION_NAME_TOO_LONG}

//
// MessageId: SPAPI_E_GENERAL_SYNTAX
//
// MessageText:
//
//  The syntax of the INF is invalid.
//

  SPAPI_E_GENERAL_SYNTAX = HRESULT($800F0003);
  {$EXTERNALSYM SPAPI_E_GENERAL_SYNTAX}

//
// MessageId: SPAPI_E_WRONG_INF_STYLE
//
// MessageText:
//
//  The style of the INF is different than what was requested.
//

  SPAPI_E_WRONG_INF_STYLE = HRESULT($800F0100);
  {$EXTERNALSYM SPAPI_E_WRONG_INF_STYLE}

//
// MessageId: SPAPI_E_SECTION_NOT_FOUND
//
// MessageText:
//
//  The required section was not found in the INF.
//

  SPAPI_E_SECTION_NOT_FOUND = HRESULT($800F0101);
  {$EXTERNALSYM SPAPI_E_SECTION_NOT_FOUND}

//
// MessageId: SPAPI_E_LINE_NOT_FOUND
//
// MessageText:
//
//  The required line was not found in the INF.
//

  SPAPI_E_LINE_NOT_FOUND = HRESULT($800F0102);
  {$EXTERNALSYM SPAPI_E_LINE_NOT_FOUND}

//
// MessageId: SPAPI_E_NO_BACKUP
//
// MessageText:
//
//  The files affected by the installation of this file queue have not been backed up for uninstall.
//

  SPAPI_E_NO_BACKUP = HRESULT($800F0103);
  {$EXTERNALSYM SPAPI_E_NO_BACKUP}

//
// MessageId: SPAPI_E_NO_ASSOCIATED_CLASS
//
// MessageText:
//
//  The INF or the device information set or element does not have an associated install class.
//

  SPAPI_E_NO_ASSOCIATED_CLASS = HRESULT($800F0200);
  {$EXTERNALSYM SPAPI_E_NO_ASSOCIATED_CLASS}

//
// MessageId: SPAPI_E_CLASS_MISMATCH
//
// MessageText:
//
//  The INF or the device information set or element does not match the specified install class.
//

  SPAPI_E_CLASS_MISMATCH = HRESULT($800F0201);
  {$EXTERNALSYM SPAPI_E_CLASS_MISMATCH}

//
// MessageId: SPAPI_E_DUPLICATE_FOUND
//
// MessageText:
//
//  An existing device was found that is a duplicate of the device being manually installed.
//

  SPAPI_E_DUPLICATE_FOUND = HRESULT($800F0202);
  {$EXTERNALSYM SPAPI_E_DUPLICATE_FOUND}

//
// MessageId: SPAPI_E_NO_DRIVER_SELECTED
//
// MessageText:
//
//  There is no driver selected for the device information set or element.
//

  SPAPI_E_NO_DRIVER_SELECTED = HRESULT($800F0203);
  {$EXTERNALSYM SPAPI_E_NO_DRIVER_SELECTED}

//
// MessageId: SPAPI_E_KEY_DOES_NOT_EXIST
//
// MessageText:
//
//  The requested device registry key does not exist.
//

  SPAPI_E_KEY_DOES_NOT_EXIST = HRESULT($800F0204);
  {$EXTERNALSYM SPAPI_E_KEY_DOES_NOT_EXIST}

//
// MessageId: SPAPI_E_INVALID_DEVINST_NAME
//
// MessageText:
//
//  The device instance name is invalid.
//

  SPAPI_E_INVALID_DEVINST_NAME = HRESULT($800F0205);
  {$EXTERNALSYM SPAPI_E_INVALID_DEVINST_NAME}

//
// MessageId: SPAPI_E_INVALID_CLASS
//
// MessageText:
//
//  The install class is not present or is invalid.
//

  SPAPI_E_INVALID_CLASS = HRESULT($800F0206);
  {$EXTERNALSYM SPAPI_E_INVALID_CLASS}

//
// MessageId: SPAPI_E_DEVINST_ALREADY_EXISTS
//
// MessageText:
//
//  The device instance cannot be created because it already exists.
//

  SPAPI_E_DEVINST_ALREADY_EXISTS = HRESULT($800F0207);
  {$EXTERNALSYM SPAPI_E_DEVINST_ALREADY_EXISTS}

//
// MessageId: SPAPI_E_DEVINFO_NOT_REGISTERED
//
// MessageText:
//
//  The operation cannot be performed on a device information element that has not been registered.
//

  SPAPI_E_DEVINFO_NOT_REGISTERED = HRESULT($800F0208);
  {$EXTERNALSYM SPAPI_E_DEVINFO_NOT_REGISTERED}

//
// MessageId: SPAPI_E_INVALID_REG_PROPERTY
//
// MessageText:
//
//  The device property code is invalid.
//

  SPAPI_E_INVALID_REG_PROPERTY = HRESULT($800F0209);
  {$EXTERNALSYM SPAPI_E_INVALID_REG_PROPERTY}

//
// MessageId: SPAPI_E_NO_INF
//
// MessageText:
//
//  The INF from which a driver list is to be built does not exist.
//

  SPAPI_E_NO_INF = HRESULT($800F020A);
  {$EXTERNALSYM SPAPI_E_NO_INF}

//
// MessageId: SPAPI_E_NO_SUCH_DEVINST
//
// MessageText:
//
//  The device instance does not exist in the hardware tree.
//

  SPAPI_E_NO_SUCH_DEVINST = HRESULT($800F020B);
  {$EXTERNALSYM SPAPI_E_NO_SUCH_DEVINST}

//
// MessageId: SPAPI_E_CANT_LOAD_CLASS_ICON
//
// MessageText:
//
//  The icon representing this install class cannot be loaded.
//

  SPAPI_E_CANT_LOAD_CLASS_ICON = HRESULT($800F020C);
  {$EXTERNALSYM SPAPI_E_CANT_LOAD_CLASS_ICON}

//
// MessageId: SPAPI_E_INVALID_CLASS_INSTALLER
//
// MessageText:
//
//  The class installer registry entry is invalid.
//

  SPAPI_E_INVALID_CLASS_INSTALLER = HRESULT($800F020D);
  {$EXTERNALSYM SPAPI_E_INVALID_CLASS_INSTALLER}

//
// MessageId: SPAPI_E_DI_DO_DEFAULT
//
// MessageText:
//
//  The class installer has indicated that the default action should be performed for this installation request.
//

  SPAPI_E_DI_DO_DEFAULT = HRESULT($800F020E);
  {$EXTERNALSYM SPAPI_E_DI_DO_DEFAULT}

//
// MessageId: SPAPI_E_DI_NOFILECOPY
//
// MessageText:
//
//  The operation does not require any files to be copied.
//

  SPAPI_E_DI_NOFILECOPY = HRESULT($800F020F);
  {$EXTERNALSYM SPAPI_E_DI_NOFILECOPY}

//
// MessageId: SPAPI_E_INVALID_HWPROFILE
//
// MessageText:
//
//  The specified hardware profile does not exist.
//

  SPAPI_E_INVALID_HWPROFILE = HRESULT($800F0210);
  {$EXTERNALSYM SPAPI_E_INVALID_HWPROFILE}

//
// MessageId: SPAPI_E_NO_DEVICE_SELECTED
//
// MessageText:
//
//  There is no device information element currently selected for this device information set.
//

  SPAPI_E_NO_DEVICE_SELECTED = HRESULT($800F0211);
  {$EXTERNALSYM SPAPI_E_NO_DEVICE_SELECTED}

//
// MessageId: SPAPI_E_DEVINFO_LIST_LOCKED
//
// MessageText:
//
//  The operation cannot be performed because the device information set is locked.
//

  SPAPI_E_DEVINFO_LIST_LOCKED = HRESULT($800F0212);
  {$EXTERNALSYM SPAPI_E_DEVINFO_LIST_LOCKED}

//
// MessageId: SPAPI_E_DEVINFO_DATA_LOCKED
//
// MessageText:
//
//  The operation cannot be performed because the device information element is locked.
//

  SPAPI_E_DEVINFO_DATA_LOCKED = HRESULT($800F0213);
  {$EXTERNALSYM SPAPI_E_DEVINFO_DATA_LOCKED}

//
// MessageId: SPAPI_E_DI_BAD_PATH
//
// MessageText:
//
//  The specified path does not contain any applicable device INFs.
//

  SPAPI_E_DI_BAD_PATH = HRESULT($800F0214);
  {$EXTERNALSYM SPAPI_E_DI_BAD_PATH}

//
// MessageId: SPAPI_E_NO_CLASSINSTALL_PARAMS
//
// MessageText:
//
//  No class installer parameters have been set for the device information set or element.
//

  SPAPI_E_NO_CLASSINSTALL_PARAMS = HRESULT($800F0215);
  {$EXTERNALSYM SPAPI_E_NO_CLASSINSTALL_PARAMS}

//
// MessageId: SPAPI_E_FILEQUEUE_LOCKED
//
// MessageText:
//
//  The operation cannot be performed because the file queue is locked.
//

  SPAPI_E_FILEQUEUE_LOCKED = HRESULT($800F0216);
  {$EXTERNALSYM SPAPI_E_FILEQUEUE_LOCKED}

//
// MessageId: SPAPI_E_BAD_SERVICE_INSTALLSECT
//
// MessageText:
//
//  A service installation section in this INF is invalid.
//

  SPAPI_E_BAD_SERVICE_INSTALLSECT = HRESULT($800F0217);
  {$EXTERNALSYM SPAPI_E_BAD_SERVICE_INSTALLSECT}

//
// MessageId: SPAPI_E_NO_CLASS_DRIVER_LIST
//
// MessageText:
//
//  There is no class driver list for the device information element.
//

  SPAPI_E_NO_CLASS_DRIVER_LIST = HRESULT($800F0218);
  {$EXTERNALSYM SPAPI_E_NO_CLASS_DRIVER_LIST}

//
// MessageId: SPAPI_E_NO_ASSOCIATED_SERVICE
//
// MessageText:
//
//  The installation failed because a function driver was not specified for this device instance.
//

  SPAPI_E_NO_ASSOCIATED_SERVICE = HRESULT($800F0219);
  {$EXTERNALSYM SPAPI_E_NO_ASSOCIATED_SERVICE}

//
// MessageId: SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE
//
// MessageText:
//
//  There is presently no default device interface designated for this interface class.
//

  SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE = HRESULT($800F021A);
  {$EXTERNALSYM SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE}

//
// MessageId: SPAPI_E_DEVICE_INTERFACE_ACTIVE
//
// MessageText:
//
//  The operation cannot be performed because the device interface is currently active.
//

  SPAPI_E_DEVICE_INTERFACE_ACTIVE = HRESULT($800F021B);
  {$EXTERNALSYM SPAPI_E_DEVICE_INTERFACE_ACTIVE}

//
// MessageId: SPAPI_E_DEVICE_INTERFACE_REMOVED
//
// MessageText:
//
//  The operation cannot be performed because the device interface has been removed from the system.
//

  SPAPI_E_DEVICE_INTERFACE_REMOVED = HRESULT($800F021C);
  {$EXTERNALSYM SPAPI_E_DEVICE_INTERFACE_REMOVED}

//
// MessageId: SPAPI_E_BAD_INTERFACE_INSTALLSECT
//
// MessageText:
//
//  An interface installation section in this INF is invalid.
//

  SPAPI_E_BAD_INTERFACE_INSTALLSECT = HRESULT($800F021D);
  {$EXTERNALSYM SPAPI_E_BAD_INTERFACE_INSTALLSECT}

//
// MessageId: SPAPI_E_NO_SUCH_INTERFACE_CLASS
//
// MessageText:
//
//  This interface class does not exist in the system.
//

  SPAPI_E_NO_SUCH_INTERFACE_CLASS = HRESULT($800F021E);
  {$EXTERNALSYM SPAPI_E_NO_SUCH_INTERFACE_CLASS}

//
// MessageId: SPAPI_E_INVALID_REFERENCE_STRING
//
// MessageText:
//
//  The reference string supplied for this interface device is invalid.
//

  SPAPI_E_INVALID_REFERENCE_STRING = HRESULT($800F021F);
  {$EXTERNALSYM SPAPI_E_INVALID_REFERENCE_STRING}

//
// MessageId: SPAPI_E_INVALID_MACHINENAME
//
// MessageText:
//
//  The specified machine name does not conform to UNC naming conventions.
//

  SPAPI_E_INVALID_MACHINENAME = HRESULT($800F0220);
  {$EXTERNALSYM SPAPI_E_INVALID_MACHINENAME}

//
// MessageId: SPAPI_E_REMOTE_COMM_FAILURE
//
// MessageText:
//
//  A general remote communication error occurred.
//

  SPAPI_E_REMOTE_COMM_FAILURE = HRESULT($800F0221);
  {$EXTERNALSYM SPAPI_E_REMOTE_COMM_FAILURE}

//
// MessageId: SPAPI_E_MACHINE_UNAVAILABLE
//
// MessageText:
//
//  The machine selected for remote communication is not available at this time.
//

  SPAPI_E_MACHINE_UNAVAILABLE = HRESULT($800F0222);
  {$EXTERNALSYM SPAPI_E_MACHINE_UNAVAILABLE}

//
// MessageId: SPAPI_E_NO_CONFIGMGR_SERVICES
//
// MessageText:
//
//  The Plug and Play service is not available on the remote machine.
//

  SPAPI_E_NO_CONFIGMGR_SERVICES = HRESULT($800F0223);
  {$EXTERNALSYM SPAPI_E_NO_CONFIGMGR_SERVICES}

//
// MessageId: SPAPI_E_INVALID_PROPPAGE_PROVIDER
//
// MessageText:
//
//  The property page provider registry entry is invalid.
//

  SPAPI_E_INVALID_PROPPAGE_PROVIDER = HRESULT($800F0224);
  {$EXTERNALSYM SPAPI_E_INVALID_PROPPAGE_PROVIDER}

//
// MessageId: SPAPI_E_NO_SUCH_DEVICE_INTERFACE
//
// MessageText:
//
//  The requested device interface is not present in the system.
//

  SPAPI_E_NO_SUCH_DEVICE_INTERFACE = HRESULT($800F0225);
  {$EXTERNALSYM SPAPI_E_NO_SUCH_DEVICE_INTERFACE}

//
// MessageId: SPAPI_E_DI_POSTPROCESSING_REQUIRED
//
// MessageText:
//
//  The device's co-installer has additional work to perform after installation is complete.
//

  SPAPI_E_DI_POSTPROCESSING_REQUIRED = HRESULT($800F0226);
  {$EXTERNALSYM SPAPI_E_DI_POSTPROCESSING_REQUIRED}

//
// MessageId: SPAPI_E_INVALID_COINSTALLER
//
// MessageText:
//
//  The device's co-installer is invalid.
//

  SPAPI_E_INVALID_COINSTALLER = HRESULT($800F0227);
  {$EXTERNALSYM SPAPI_E_INVALID_COINSTALLER}

//
// MessageId: SPAPI_E_NO_COMPAT_DRIVERS
//
// MessageText:
//
//  There are no compatible drivers for this device.
//

  SPAPI_E_NO_COMPAT_DRIVERS = HRESULT($800F0228);
  {$EXTERNALSYM SPAPI_E_NO_COMPAT_DRIVERS}

//
// MessageId: SPAPI_E_NO_DEVICE_ICON
//
// MessageText:
//
//  There is no icon that represents this device or device type.
//

  SPAPI_E_NO_DEVICE_ICON = HRESULT($800F0229);
  {$EXTERNALSYM SPAPI_E_NO_DEVICE_ICON}

//
// MessageId: SPAPI_E_INVALID_INF_LOGCONFIG
//
// MessageText:
//
//  A logical configuration specified in this INF is invalid.
//

  SPAPI_E_INVALID_INF_LOGCONFIG = HRESULT($800F022A);
  {$EXTERNALSYM SPAPI_E_INVALID_INF_LOGCONFIG}

//
// MessageId: SPAPI_E_DI_DONT_INSTALL
//
// MessageText:
//
//  The class installer has denied the request to install or upgrade this device.
//

  SPAPI_E_DI_DONT_INSTALL = HRESULT($800F022B);
  {$EXTERNALSYM SPAPI_E_DI_DONT_INSTALL}

//
// MessageId: SPAPI_E_INVALID_FILTER_DRIVER
//
// MessageText:
//
//  One of the filter drivers installed for this device is invalid.
//

  SPAPI_E_INVALID_FILTER_DRIVER = HRESULT($800F022C);
  {$EXTERNALSYM SPAPI_E_INVALID_FILTER_DRIVER}

//
// MessageId: SPAPI_E_NON_WINDOWS_NT_DRIVER
//
// MessageText:
//
//  The driver selected for this device does not support Windows 2000.
//

  SPAPI_E_NON_WINDOWS_NT_DRIVER = HRESULT($800F022D);
  {$EXTERNALSYM SPAPI_E_NON_WINDOWS_NT_DRIVER}

//
// MessageId: SPAPI_E_NON_WINDOWS_DRIVER
//
// MessageText:
//
//  The driver selected for this device does not support Windows.
//

  SPAPI_E_NON_WINDOWS_DRIVER = HRESULT($800F022E);
  {$EXTERNALSYM SPAPI_E_NON_WINDOWS_DRIVER}

//
// MessageId: SPAPI_E_NO_CATALOG_FOR_OEM_INF
//
// MessageText:
//
//  The third-party INF does not contain digital signature information.
//

  SPAPI_E_NO_CATALOG_FOR_OEM_INF = HRESULT($800F022F);
  {$EXTERNALSYM SPAPI_E_NO_CATALOG_FOR_OEM_INF}

//
// MessageId: SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE
//
// MessageText:
//
//  An invalid attempt was made to use a device installation file queue for verification of digital signatures relative to other platforms.
//

  SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE = HRESULT($800F0230);
  {$EXTERNALSYM SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE}

//
// MessageId: SPAPI_E_NOT_DISABLEABLE
//
// MessageText:
//
//  The device cannot be disabled.
//

  SPAPI_E_NOT_DISABLEABLE = HRESULT($800F0231);
  {$EXTERNALSYM SPAPI_E_NOT_DISABLEABLE}

//
// MessageId: SPAPI_E_CANT_REMOVE_DEVINST
//
// MessageText:
//
//  The device could not be dynamically removed.
//

  SPAPI_E_CANT_REMOVE_DEVINST = HRESULT($800F0232);
  {$EXTERNALSYM SPAPI_E_CANT_REMOVE_DEVINST}

//
// MessageId: SPAPI_E_ERROR_NOT_INSTALLED
//
// MessageText:
//
//  No installed components were detected.
//

  SPAPI_E_ERROR_NOT_INSTALLED = HRESULT($800F1000);
  {$EXTERNALSYM SPAPI_E_ERROR_NOT_INSTALLED}

// *****************
// FACILITY_SCARD
// *****************
//
// =============================
// Facility SCARD Error Messages
// =============================
//

  SCARD_S_SUCCESS = NO_ERROR;
  {$EXTERNALSYM SCARD_S_SUCCESS}

//
// MessageId: SCARD_F_INTERNAL_ERROR
//
// MessageText:
//
//  An internal consistency check failed.
//

  SCARD_F_INTERNAL_ERROR = HRESULT($80100001);
  {$EXTERNALSYM SCARD_F_INTERNAL_ERROR}

//
// MessageId: SCARD_E_CANCELLED
//
// MessageText:
//
//  The action was cancelled by an SCardCancel request.
//

  SCARD_E_CANCELLED = HRESULT($80100002);
  {$EXTERNALSYM SCARD_E_CANCELLED}

//
// MessageId: SCARD_E_INVALID_HANDLE
//
// MessageText:
//
//  The supplied handle was invalid.
//

  SCARD_E_INVALID_HANDLE = HRESULT($80100003);
  {$EXTERNALSYM SCARD_E_INVALID_HANDLE}

//
// MessageId: SCARD_E_INVALID_PARAMETER
//
// MessageText:
//
//  One or more of the supplied parameters could not be properly interpreted.
//

  SCARD_E_INVALID_PARAMETER = HRESULT($80100004);
  {$EXTERNALSYM SCARD_E_INVALID_PARAMETER}

//
// MessageId: SCARD_E_INVALID_TARGET
//
// MessageText:
//
//  Registry startup information is missing or invalid.
//

  SCARD_E_INVALID_TARGET = HRESULT($80100005);
  {$EXTERNALSYM SCARD_E_INVALID_TARGET}

//
// MessageId: SCARD_E_NO_MEMORY
//
// MessageText:
//
//  Not enough memory available to complete this command.
//

  SCARD_E_NO_MEMORY = HRESULT($80100006);
  {$EXTERNALSYM SCARD_E_NO_MEMORY}

//
// MessageId: SCARD_F_WAITED_TOO_LONG
//
// MessageText:
//
//  An internal consistency timer has expired.
//

  SCARD_F_WAITED_TOO_LONG = HRESULT($80100007);
  {$EXTERNALSYM SCARD_F_WAITED_TOO_LONG}

//
// MessageId: SCARD_E_INSUFFICIENT_BUFFER
//
// MessageText:
//
//  The data buffer to receive returned data is too small for the returned data.
//

  SCARD_E_INSUFFICIENT_BUFFER = HRESULT($80100008);
  {$EXTERNALSYM SCARD_E_INSUFFICIENT_BUFFER}

//
// MessageId: SCARD_E_UNKNOWN_READER
//
// MessageText:
//
//  The specified reader name is not recognized.
//

  SCARD_E_UNKNOWN_READER = HRESULT($80100009);
  {$EXTERNALSYM SCARD_E_UNKNOWN_READER}

//
// MessageId: SCARD_E_TIMEOUT
//
// MessageText:
//
//  The user-specified timeout value has expired.
//

  SCARD_E_TIMEOUT = HRESULT($8010000A);
  {$EXTERNALSYM SCARD_E_TIMEOUT}

//
// MessageId: SCARD_E_SHARING_VIOLATION
//
// MessageText:
//
//  The smart card cannot be accessed because of other connections outstanding.
//

  SCARD_E_SHARING_VIOLATION = HRESULT($8010000B);
  {$EXTERNALSYM SCARD_E_SHARING_VIOLATION}

//
// MessageId: SCARD_E_NO_SMARTCARD
//
// MessageText:
//
//  The operation requires a Smart Card, but no Smart Card is currently in the device.
//

  SCARD_E_NO_SMARTCARD = HRESULT($8010000C);
  {$EXTERNALSYM SCARD_E_NO_SMARTCARD}

//
// MessageId: SCARD_E_UNKNOWN_CARD
//
// MessageText:
//
//  The specified smart card name is not recognized.
//

  SCARD_E_UNKNOWN_CARD = HRESULT($8010000D);
  {$EXTERNALSYM SCARD_E_UNKNOWN_CARD}

//
// MessageId: SCARD_E_CANT_DISPOSE
//
// MessageText:
//
//  The system could not dispose of the media in the requested manner.
//

  SCARD_E_CANT_DISPOSE = HRESULT($8010000E);
  {$EXTERNALSYM SCARD_E_CANT_DISPOSE}

//
// MessageId: SCARD_E_PROTO_MISMATCH
//
// MessageText:
//
//  The requested protocols are incompatible with the protocol currently in use with the smart card.
//

  SCARD_E_PROTO_MISMATCH = HRESULT($8010000F);
  {$EXTERNALSYM SCARD_E_PROTO_MISMATCH}

//
// MessageId: SCARD_E_NOT_READY
//
// MessageText:
//
//  The reader or smart card is not ready to accept commands.
//

  SCARD_E_NOT_READY = HRESULT($80100010);
  {$EXTERNALSYM SCARD_E_NOT_READY}

//
// MessageId: SCARD_E_INVALID_VALUE
//
// MessageText:
//
//  One or more of the supplied parameters values could not be properly interpreted.
//

  SCARD_E_INVALID_VALUE = HRESULT($80100011);
  {$EXTERNALSYM SCARD_E_INVALID_VALUE}

//
// MessageId: SCARD_E_SYSTEM_CANCELLED
//
// MessageText:
//
//  The action was cancelled by the system, presumably to log off or shut down.
//

  SCARD_E_SYSTEM_CANCELLED = HRESULT($80100012);
  {$EXTERNALSYM SCARD_E_SYSTEM_CANCELLED}

//
// MessageId: SCARD_F_COMM_ERROR
//
// MessageText:
//
//  An internal communications error has been detected.
//

  SCARD_F_COMM_ERROR = HRESULT($80100013);
  {$EXTERNALSYM SCARD_F_COMM_ERROR}

//
// MessageId: SCARD_F_UNKNOWN_ERROR
//
// MessageText:
//
//  An internal error has been detected, but the source is unknown.
//

  SCARD_F_UNKNOWN_ERROR = HRESULT($80100014);
  {$EXTERNALSYM SCARD_F_UNKNOWN_ERROR}

//
// MessageId: SCARD_E_INVALID_ATR
//
// MessageText:
//
//  An ATR obtained from the registry is not a valid ATR string.
//

  SCARD_E_INVALID_ATR = HRESULT($80100015);
  {$EXTERNALSYM SCARD_E_INVALID_ATR}

//
// MessageId: SCARD_E_NOT_TRANSACTED
//
// MessageText:
//
//  An attempt was made to end a non-existent transaction.
//

  SCARD_E_NOT_TRANSACTED = HRESULT($80100016);
  {$EXTERNALSYM SCARD_E_NOT_TRANSACTED}

//
// MessageId: SCARD_E_READER_UNAVAILABLE
//
// MessageText:
//
//  The specified reader is not currently available for use.
//

  SCARD_E_READER_UNAVAILABLE = HRESULT($80100017);
  {$EXTERNALSYM SCARD_E_READER_UNAVAILABLE}

//
// MessageId: SCARD_P_SHUTDOWN
//
// MessageText:
//
//  The operation has been aborted to allow the server application to exit.
//

  SCARD_P_SHUTDOWN = HRESULT($80100018);
  {$EXTERNALSYM SCARD_P_SHUTDOWN}

//
// MessageId: SCARD_E_PCI_TOO_SMALL
//
// MessageText:
//
//  The PCI Receive buffer was too small.
//

  SCARD_E_PCI_TOO_SMALL = HRESULT($80100019);
  {$EXTERNALSYM SCARD_E_PCI_TOO_SMALL}

//
// MessageId: SCARD_E_READER_UNSUPPORTED
//
// MessageText:
//
//  The reader driver does not meet minimal requirements for support.
//

  SCARD_E_READER_UNSUPPORTED = HRESULT($8010001A);
  {$EXTERNALSYM SCARD_E_READER_UNSUPPORTED}

//
// MessageId: SCARD_E_DUPLICATE_READER
//
// MessageText:
//
//  The reader driver did not produce a unique reader name.
//

  SCARD_E_DUPLICATE_READER = HRESULT($8010001B);
  {$EXTERNALSYM SCARD_E_DUPLICATE_READER}

//
// MessageId: SCARD_E_CARD_UNSUPPORTED
//
// MessageText:
//
//  The smart card does not meet minimal requirements for support.
//

  SCARD_E_CARD_UNSUPPORTED = HRESULT($8010001C);
  {$EXTERNALSYM SCARD_E_CARD_UNSUPPORTED}

//
// MessageId: SCARD_E_NO_SERVICE
//
// MessageText:
//
//  The Smart card resource manager is not running.
//

  SCARD_E_NO_SERVICE = HRESULT($8010001D);
  {$EXTERNALSYM SCARD_E_NO_SERVICE}

//
// MessageId: SCARD_E_SERVICE_STOPPED
//
// MessageText:
//
//  The Smart card resource manager has shut down.
//

  SCARD_E_SERVICE_STOPPED = HRESULT($8010001E);
  {$EXTERNALSYM SCARD_E_SERVICE_STOPPED}

//
// MessageId: SCARD_E_UNEXPECTED
//
// MessageText:
//
//  An unexpected card error has occurred.
//

  SCARD_E_UNEXPECTED = HRESULT($8010001F);
  {$EXTERNALSYM SCARD_E_UNEXPECTED}

//
// MessageId: SCARD_E_ICC_INSTALLATION
//
// MessageText:
//
//  No Primary Provider can be found for the smart card.
//

  SCARD_E_ICC_INSTALLATION = HRESULT($80100020);
  {$EXTERNALSYM SCARD_E_ICC_INSTALLATION}

//
// MessageId: SCARD_E_ICC_CREATEORDER
//
// MessageText:
//
//  The requested order of object creation is not supported.
//

  SCARD_E_ICC_CREATEORDER = HRESULT($80100021);
  {$EXTERNALSYM SCARD_E_ICC_CREATEORDER}

//
// MessageId: SCARD_E_UNSUPPORTED_FEATURE
//
// MessageText:
//
//  This smart card does not support the requested feature.
//

  SCARD_E_UNSUPPORTED_FEATURE = HRESULT($80100022);
  {$EXTERNALSYM SCARD_E_UNSUPPORTED_FEATURE}

//
// MessageId: SCARD_E_DIR_NOT_FOUND
//
// MessageText:
//
//  The identified directory does not exist in the smart card.
//

  SCARD_E_DIR_NOT_FOUND = HRESULT($80100023);
  {$EXTERNALSYM SCARD_E_DIR_NOT_FOUND}

//
// MessageId: SCARD_E_FILE_NOT_FOUND
//
// MessageText:
//
//  The identified file does not exist in the smart card.
//

  SCARD_E_FILE_NOT_FOUND = HRESULT($80100024);
  {$EXTERNALSYM SCARD_E_FILE_NOT_FOUND}

//
// MessageId: SCARD_E_NO_DIR
//
// MessageText:
//
//  The supplied path does not represent a smart card directory.
//

  SCARD_E_NO_DIR = HRESULT($80100025);
  {$EXTERNALSYM SCARD_E_NO_DIR}

//
// MessageId: SCARD_E_NO_FILE
//
// MessageText:
//
//  The supplied path does not represent a smart card file.
//

  SCARD_E_NO_FILE = HRESULT($80100026);
  {$EXTERNALSYM SCARD_E_NO_FILE}

//
// MessageId: SCARD_E_NO_ACCESS
//
// MessageText:
//
//  Access is denied to this file.
//

  SCARD_E_NO_ACCESS = HRESULT($80100027);
  {$EXTERNALSYM SCARD_E_NO_ACCESS}

//
// MessageId: SCARD_E_WRITE_TOO_MANY
//
// MessageText:
//
//  An attempt was made to write more data than would fit in the target object.
//

  SCARD_E_WRITE_TOO_MANY = HRESULT($80100028);
  {$EXTERNALSYM SCARD_E_WRITE_TOO_MANY}

//
// MessageId: SCARD_E_BAD_SEEK
//
// MessageText:
//
//  There was an error trying to set the smart card file object pointer.
//

  SCARD_E_BAD_SEEK = HRESULT($80100029);
  {$EXTERNALSYM SCARD_E_BAD_SEEK}

//
// MessageId: SCARD_E_INVALID_CHV
//
// MessageText:
//
//  The supplied PIN is incorrect.
//

  SCARD_E_INVALID_CHV = HRESULT($8010002A);
  {$EXTERNALSYM SCARD_E_INVALID_CHV}

//
// MessageId: SCARD_E_UNKNOWN_RES_MNG
//
// MessageText:
//
//  An unrecognized error code was returned from a layered component.
//

  SCARD_E_UNKNOWN_RES_MNG = HRESULT($8010002B);
  {$EXTERNALSYM SCARD_E_UNKNOWN_RES_MNG}

//
// MessageId: SCARD_E_NO_SUCH_CERTIFICATE
//
// MessageText:
//
//  The requested certificate does not exist.
//

  SCARD_E_NO_SUCH_CERTIFICATE = HRESULT($8010002C);
  {$EXTERNALSYM SCARD_E_NO_SUCH_CERTIFICATE}

//
// MessageId: SCARD_E_CERTIFICATE_UNAVAILABLE
//
// MessageText:
//
//  The requested certificate could not be obtained.
//

  SCARD_E_CERTIFICATE_UNAVAILABLE = HRESULT($8010002D);
  {$EXTERNALSYM SCARD_E_CERTIFICATE_UNAVAILABLE}

//
// MessageId: SCARD_E_NO_READERS_AVAILABLE
//
// MessageText:
//
//  Cannot find a smart card reader.
//

  SCARD_E_NO_READERS_AVAILABLE = HRESULT($8010002E);
  {$EXTERNALSYM SCARD_E_NO_READERS_AVAILABLE}

//
// MessageId: SCARD_E_COMM_DATA_LOST
//
// MessageText:
//
//  A communications error with the smart card has been detected.  Retry the operation.
//

  SCARD_E_COMM_DATA_LOST = HRESULT($8010002F);
  {$EXTERNALSYM SCARD_E_COMM_DATA_LOST}

//
// These are warning codes.
//
//
// MessageId: SCARD_W_UNSUPPORTED_CARD
//
// MessageText:
//
//  The reader cannot communicate with the smart card, due to ATR configuration conflicts.
//

  SCARD_W_UNSUPPORTED_CARD = HRESULT($80100065);
  {$EXTERNALSYM SCARD_W_UNSUPPORTED_CARD}

//
// MessageId: SCARD_W_UNRESPONSIVE_CARD
//
// MessageText:
//
//  The smart card is not responding to a reset.
//

  SCARD_W_UNRESPONSIVE_CARD = HRESULT($80100066);
  {$EXTERNALSYM SCARD_W_UNRESPONSIVE_CARD}

//
// MessageId: SCARD_W_UNPOWERED_CARD
//
// MessageText:
//
//  Power has been removed from the smart card, so that further communication is not possible.
//

  SCARD_W_UNPOWERED_CARD = HRESULT($80100067);
  {$EXTERNALSYM SCARD_W_UNPOWERED_CARD}

//
// MessageId: SCARD_W_RESET_CARD
//
// MessageText:
//
//  The smart card has been reset, so any shared state information is invalid.
//

  SCARD_W_RESET_CARD = HRESULT($80100068);
  {$EXTERNALSYM SCARD_W_RESET_CARD}

//
// MessageId: SCARD_W_REMOVED_CARD
//
// MessageText:
//
//  The smart card has been removed, so that further communication is not possible.
//

  SCARD_W_REMOVED_CARD = HRESULT($80100069);
  {$EXTERNALSYM SCARD_W_REMOVED_CARD}

//
// MessageId: SCARD_W_SECURITY_VIOLATION
//
// MessageText:
//
//  Access was denied because of a security violation.
//

  SCARD_W_SECURITY_VIOLATION = HRESULT($8010006A);
  {$EXTERNALSYM SCARD_W_SECURITY_VIOLATION}

//
// MessageId: SCARD_W_WRONG_CHV
//
// MessageText:
//
//  The card cannot be accessed because the wrong PIN was presented.
//

  SCARD_W_WRONG_CHV = HRESULT($8010006B);
  {$EXTERNALSYM SCARD_W_WRONG_CHV}

//
// MessageId: SCARD_W_CHV_BLOCKED
//
// MessageText:
//
//  The card cannot be accessed because the maximum number of PIN entry attempts has been reached.
//

  SCARD_W_CHV_BLOCKED = HRESULT($8010006C);
  {$EXTERNALSYM SCARD_W_CHV_BLOCKED}

//
// MessageId: SCARD_W_EOF
//
// MessageText:
//
//  The end of the smart card file has been reached.
//

  SCARD_W_EOF = HRESULT($8010006D);
  {$EXTERNALSYM SCARD_W_EOF}

//
// MessageId: SCARD_W_CANCELLED_BY_USER
//
// MessageText:
//
//  The action was cancelled by the user.
//

  SCARD_W_CANCELLED_BY_USER = HRESULT($8010006E);
  {$EXTERNALSYM SCARD_W_CANCELLED_BY_USER}

// *****************
// FACILITY_COMPLUS
// *****************
//
// ===============================
// Facility COMPLUS Error Messages
// ===============================
//
//
// COMPLUS Admin errors
//
//
// MessageId: COMADMIN_E_OBJECTERRORS
//
// MessageText:
//
//  Errors occurred accessing one or more objects - the ErrorInfo collection may have more detail
//

  COMADMIN_E_OBJECTERRORS = HRESULT($80110401);
  {$EXTERNALSYM COMADMIN_E_OBJECTERRORS}

//
// MessageId: COMADMIN_E_OBJECTINVALID
//
// MessageText:
//
//  One or more of the object's properties are missing or invalid
//

  COMADMIN_E_OBJECTINVALID = HRESULT($80110402);
  {$EXTERNALSYM COMADMIN_E_OBJECTINVALID}

//
// MessageId: COMADMIN_E_KEYMISSING
//
// MessageText:
//
//  The object was not found in the catalog
//

  COMADMIN_E_KEYMISSING = HRESULT($80110403);
  {$EXTERNALSYM COMADMIN_E_KEYMISSING}

//
// MessageId: COMADMIN_E_ALREADYINSTALLED
//
// MessageText:
//
//  The object is already registered
//

  COMADMIN_E_ALREADYINSTALLED = HRESULT($80110404);
  {$EXTERNALSYM COMADMIN_E_ALREADYINSTALLED}

//
// MessageId: COMADMIN_E_APP_FILE_WRITEFAIL
//
// MessageText:
//
//  Error occurred writing to the application file
//

  COMADMIN_E_APP_FILE_WRITEFAIL = HRESULT($80110407);
  {$EXTERNALSYM COMADMIN_E_APP_FILE_WRITEFAIL}

//
// MessageId: COMADMIN_E_APP_FILE_READFAIL
//
// MessageText:
//
//  Error occurred reading the application file
//

  COMADMIN_E_APP_FILE_READFAIL = HRESULT($80110408);
  {$EXTERNALSYM COMADMIN_E_APP_FILE_READFAIL}

//
// MessageId: COMADMIN_E_APP_FILE_VERSION
//
// MessageText:
//
//  Invalid version number in application file
//

  COMADMIN_E_APP_FILE_VERSION = HRESULT($80110409);
  {$EXTERNALSYM COMADMIN_E_APP_FILE_VERSION}

//
// MessageId: COMADMIN_E_BADPATH
//
// MessageText:
//
//  The file path is invalid
//

  COMADMIN_E_BADPATH = HRESULT($8011040A);
  {$EXTERNALSYM COMADMIN_E_BADPATH}

//
// MessageId: COMADMIN_E_APPLICATIONEXISTS
//
// MessageText:
//
//  The application is already installed
//

  COMADMIN_E_APPLICATIONEXISTS = HRESULT($8011040B);
  {$EXTERNALSYM COMADMIN_E_APPLICATIONEXISTS}

//
// MessageId: COMADMIN_E_ROLEEXISTS
//
// MessageText:
//
//  The role already exists
//

  COMADMIN_E_ROLEEXISTS = HRESULT($8011040C);
  {$EXTERNALSYM COMADMIN_E_ROLEEXISTS}

//
// MessageId: COMADMIN_E_CANTCOPYFILE
//
// MessageText:
//
//  An error occurred copying the file
//

  COMADMIN_E_CANTCOPYFILE = HRESULT($8011040D);
  {$EXTERNALSYM COMADMIN_E_CANTCOPYFILE}

//
// MessageId: COMADMIN_E_NOUSER
//
// MessageText:
//
//  One or more users are not valid
//

  COMADMIN_E_NOUSER = HRESULT($8011040F);
  {$EXTERNALSYM COMADMIN_E_NOUSER}

//
// MessageId: COMADMIN_E_INVALIDUSERIDS
//
// MessageText:
//
//  One or more users in the application file are not valid
//

  COMADMIN_E_INVALIDUSERIDS = HRESULT($80110410);
  {$EXTERNALSYM COMADMIN_E_INVALIDUSERIDS}

//
// MessageId: COMADMIN_E_NOREGISTRYCLSID
//
// MessageText:
//
//  The component's CLSID is missing or corrupt
//

  COMADMIN_E_NOREGISTRYCLSID = HRESULT($80110411);
  {$EXTERNALSYM COMADMIN_E_NOREGISTRYCLSID}

//
// MessageId: COMADMIN_E_BADREGISTRYPROGID
//
// MessageText:
//
//  The component's progID is missing or corrupt
//

  COMADMIN_E_BADREGISTRYPROGID = HRESULT($80110412);
  {$EXTERNALSYM COMADMIN_E_BADREGISTRYPROGID}

//
// MessageId: COMADMIN_E_AUTHENTICATIONLEVEL
//
// MessageText:
//
//  Unable to set required authentication level for update request
//

  COMADMIN_E_AUTHENTICATIONLEVEL = HRESULT($80110413);
  {$EXTERNALSYM COMADMIN_E_AUTHENTICATIONLEVEL}

//
// MessageId: COMADMIN_E_USERPASSWDNOTVALID
//
// MessageText:
//
//  The identity or password set on the application is not valid
//

  COMADMIN_E_USERPASSWDNOTVALID = HRESULT($80110414);
  {$EXTERNALSYM COMADMIN_E_USERPASSWDNOTVALID}

//
// MessageId: COMADMIN_E_CLSIDORIIDMISMATCH
//
// MessageText:
//
//  Application file CLSIDs or IIDs do not match corresponding DLLs
//

  COMADMIN_E_CLSIDORIIDMISMATCH = HRESULT($80110418);
  {$EXTERNALSYM COMADMIN_E_CLSIDORIIDMISMATCH}

//
// MessageId: COMADMIN_E_REMOTEINTERFACE
//
// MessageText:
//
//  Interface information is either missing or changed
//

  COMADMIN_E_REMOTEINTERFACE = HRESULT($80110419);
  {$EXTERNALSYM COMADMIN_E_REMOTEINTERFACE}

//
// MessageId: COMADMIN_E_DLLREGISTERSERVER
//
// MessageText:
//
//  DllRegisterServer failed on component install
//

  COMADMIN_E_DLLREGISTERSERVER = HRESULT($8011041A);
  {$EXTERNALSYM COMADMIN_E_DLLREGISTERSERVER}

//
// MessageId: COMADMIN_E_NOSERVERSHARE
//
// MessageText:
//
//  No server file share available
//

  COMADMIN_E_NOSERVERSHARE = HRESULT($8011041B);
  {$EXTERNALSYM COMADMIN_E_NOSERVERSHARE}

//
// MessageId: COMADMIN_E_DLLLOADFAILED
//
// MessageText:
//
//  DLL could not be loaded
//

  COMADMIN_E_DLLLOADFAILED = HRESULT($8011041D);
  {$EXTERNALSYM COMADMIN_E_DLLLOADFAILED}

//
// MessageId: COMADMIN_E_BADREGISTRYLIBID
//
// MessageText:
//
//  The registered TypeLib ID is not valid
//

  COMADMIN_E_BADREGISTRYLIBID = HRESULT($8011041E);
  {$EXTERNALSYM COMADMIN_E_BADREGISTRYLIBID}

//
// MessageId: COMADMIN_E_APPDIRNOTFOUND
//
// MessageText:
//
//  Application install directory not found
//

  COMADMIN_E_APPDIRNOTFOUND = HRESULT($8011041F);
  {$EXTERNALSYM COMADMIN_E_APPDIRNOTFOUND}

//
// MessageId: COMADMIN_E_REGISTRARFAILED
//
// MessageText:
//
//  Errors occurred while in the component registrar
//

  COMADMIN_E_REGISTRARFAILED = HRESULT($80110423);
  {$EXTERNALSYM COMADMIN_E_REGISTRARFAILED}

//
// MessageId: COMADMIN_E_COMPFILE_DOESNOTEXIST
//
// MessageText:
//
//  The file does not exist
//

  COMADMIN_E_COMPFILE_DOESNOTEXIST = HRESULT($80110424);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_DOESNOTEXIST}

//
// MessageId: COMADMIN_E_COMPFILE_LOADDLLFAIL
//
// MessageText:
//
//  The DLL could not be loaded
//

  COMADMIN_E_COMPFILE_LOADDLLFAIL = HRESULT($80110425);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_LOADDLLFAIL}

//
// MessageId: COMADMIN_E_COMPFILE_GETCLASSOBJ
//
// MessageText:
//
//  GetClassObject failed in the DLL
//

  COMADMIN_E_COMPFILE_GETCLASSOBJ = HRESULT($80110426);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_GETCLASSOBJ}

//
// MessageId: COMADMIN_E_COMPFILE_CLASSNOTAVAIL
//
// MessageText:
//
//  The DLL does not support the components listed in the TypeLib
//

  COMADMIN_E_COMPFILE_CLASSNOTAVAIL = HRESULT($80110427);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_CLASSNOTAVAIL}

//
// MessageId: COMADMIN_E_COMPFILE_BADTLB
//
// MessageText:
//
//  The TypeLib could not be loaded
//

  COMADMIN_E_COMPFILE_BADTLB = HRESULT($80110428);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_BADTLB}

//
// MessageId: COMADMIN_E_COMPFILE_NOTINSTALLABLE
//
// MessageText:
//
//  The file does not contain components or component information
//

  COMADMIN_E_COMPFILE_NOTINSTALLABLE = HRESULT($80110429);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_NOTINSTALLABLE}

//
// MessageId: COMADMIN_E_NOTCHANGEABLE
//
// MessageText:
//
//  Changes to this object and its sub-objects have been disabled
//

  COMADMIN_E_NOTCHANGEABLE = HRESULT($8011042A);
  {$EXTERNALSYM COMADMIN_E_NOTCHANGEABLE}

//
// MessageId: COMADMIN_E_NOTDELETEABLE
//
// MessageText:
//
//  The delete function has been disabled for this object
//

  COMADMIN_E_NOTDELETEABLE = HRESULT($8011042B);
  {$EXTERNALSYM COMADMIN_E_NOTDELETEABLE}

//
// MessageId: COMADMIN_E_SESSION
//
// MessageText:
//
//  The server catalog version is not supported
//

  COMADMIN_E_SESSION = HRESULT($8011042C);
  {$EXTERNALSYM COMADMIN_E_SESSION}

//
// MessageId: COMADMIN_E_COMP_MOVE_LOCKED
//
// MessageText:
//
//  The component move was disallowed, because the source or destination application is either a system application or currently locked against changes
//

  COMADMIN_E_COMP_MOVE_LOCKED = HRESULT($8011042D);
  {$EXTERNALSYM COMADMIN_E_COMP_MOVE_LOCKED}

//
// MessageId: COMADMIN_E_COMP_MOVE_BAD_DEST
//
// MessageText:
//
//  The component move failed because the destination application no longer exists
//

  COMADMIN_E_COMP_MOVE_BAD_DEST = HRESULT($8011042E);
  {$EXTERNALSYM COMADMIN_E_COMP_MOVE_BAD_DEST}

//
// MessageId: COMADMIN_E_REGISTERTLB
//
// MessageText:
//
//  The system was unable to register the TypeLib
//

  COMADMIN_E_REGISTERTLB = HRESULT($80110430);
  {$EXTERNALSYM COMADMIN_E_REGISTERTLB}

//
// MessageId: COMADMIN_E_SYSTEMAPP
//
// MessageText:
//
//  This operation can not be performed on the system application
//

  COMADMIN_E_SYSTEMAPP = HRESULT($80110433);
  {$EXTERNALSYM COMADMIN_E_SYSTEMAPP}

//
// MessageId: COMADMIN_E_COMPFILE_NOREGISTRAR
//
// MessageText:
//
//  The component registrar referenced in this file is not available
//

  COMADMIN_E_COMPFILE_NOREGISTRAR = HRESULT($80110434);
  {$EXTERNALSYM COMADMIN_E_COMPFILE_NOREGISTRAR}

//
// MessageId: COMADMIN_E_COREQCOMPINSTALLED
//
// MessageText:
//
//  A component in the same DLL is already installed
//

  COMADMIN_E_COREQCOMPINSTALLED = HRESULT($80110435);
  {$EXTERNALSYM COMADMIN_E_COREQCOMPINSTALLED}

//
// MessageId: COMADMIN_E_SERVICENOTINSTALLED
//
// MessageText:
//
//  The service is not installed
//

  COMADMIN_E_SERVICENOTINSTALLED = HRESULT($80110436);
  {$EXTERNALSYM COMADMIN_E_SERVICENOTINSTALLED}

//
// MessageId: COMADMIN_E_PROPERTYSAVEFAILED
//
// MessageText:
//
//  One or more property settings are either invalid or in conflict with each other
//

  COMADMIN_E_PROPERTYSAVEFAILED = HRESULT($80110437);
  {$EXTERNALSYM COMADMIN_E_PROPERTYSAVEFAILED}

//
// MessageId: COMADMIN_E_OBJECTEXISTS
//
// MessageText:
//
//  The object you are attempting to add or rename already exists
//

  COMADMIN_E_OBJECTEXISTS = HRESULT($80110438);
  {$EXTERNALSYM COMADMIN_E_OBJECTEXISTS}

//
// MessageId: COMADMIN_E_REGFILE_CORRUPT
//
// MessageText:
//
//  The registration file is corrupt
//

  COMADMIN_E_REGFILE_CORRUPT = HRESULT($8011043B);
  {$EXTERNALSYM COMADMIN_E_REGFILE_CORRUPT}

//
// MessageId: COMADMIN_E_PROPERTY_OVERFLOW
//
// MessageText:
//
//  The property value is too large
//

  COMADMIN_E_PROPERTY_OVERFLOW = HRESULT($8011043C);
  {$EXTERNALSYM COMADMIN_E_PROPERTY_OVERFLOW}

//
// MessageId: COMADMIN_E_NOTINREGISTRY
//
// MessageText:
//
//  Object was not found in registry
//

  COMADMIN_E_NOTINREGISTRY = HRESULT($8011043E);
  {$EXTERNALSYM COMADMIN_E_NOTINREGISTRY}

//
// MessageId: COMADMIN_E_OBJECTNOTPOOLABLE
//
// MessageText:
//
//  This object is not poolable
//

  COMADMIN_E_OBJECTNOTPOOLABLE = HRESULT($8011043F);
  {$EXTERNALSYM COMADMIN_E_OBJECTNOTPOOLABLE}

//
// MessageId: COMADMIN_E_APPLID_MATCHES_CLSID
//
// MessageText:
//
//  A CLSID with the same GUID as the new application ID is already installed on this machine
//

  COMADMIN_E_APPLID_MATCHES_CLSID = HRESULT($80110446);
  {$EXTERNALSYM COMADMIN_E_APPLID_MATCHES_CLSID}

//
// MessageId: COMADMIN_E_ROLE_DOES_NOT_EXIST
//
// MessageText:
//
//  A role assigned to a component, interface, or method did not exist in the application
//

  COMADMIN_E_ROLE_DOES_NOT_EXIST = HRESULT($80110447);
  {$EXTERNALSYM COMADMIN_E_ROLE_DOES_NOT_EXIST}

//
// MessageId: COMADMIN_E_START_APP_NEEDS_COMPONENTS
//
// MessageText:
//
//  You must have components in an application in order to start the application
//

  COMADMIN_E_START_APP_NEEDS_COMPONENTS = HRESULT($80110448);
  {$EXTERNALSYM COMADMIN_E_START_APP_NEEDS_COMPONENTS}

//
// MessageId: COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM
//
// MessageText:
//
//  This operation is not enabled on this platform
//

  COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM = HRESULT($80110449);
  {$EXTERNALSYM COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM}

//
// MessageId: COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY
//
// MessageText:
//
//  Application Proxy is not exportable
//

  COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY = HRESULT($8011044A);
  {$EXTERNALSYM COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY}

//
// MessageId: COMADMIN_E_CAN_NOT_START_APP
//
// MessageText:
//
//  Failed to start application because it is either a library application or an application proxy
//

  COMADMIN_E_CAN_NOT_START_APP = HRESULT($8011044B);
  {$EXTERNALSYM COMADMIN_E_CAN_NOT_START_APP}

//
// MessageId: COMADMIN_E_CAN_NOT_EXPORT_SYS_APP
//
// MessageText:
//
//  System application is not exportable
//

  COMADMIN_E_CAN_NOT_EXPORT_SYS_APP = HRESULT($8011044C);
  {$EXTERNALSYM COMADMIN_E_CAN_NOT_EXPORT_SYS_APP}

//
// MessageId: COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT
//
// MessageText:
//
//  Can not subscribe to this component (the component may have been imported)
//

  COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT = HRESULT($8011044D);
  {$EXTERNALSYM COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT}

//
// MessageId: COMADMIN_E_OBJECT_PARENT_MISSING
//
// MessageText:
//
//  One of the objects being inserted or updated does not belong to a valid parent collection
//

  COMADMIN_E_OBJECT_PARENT_MISSING = HRESULT($80110808);
  {$EXTERNALSYM COMADMIN_E_OBJECT_PARENT_MISSING}

//
// MessageId: COMADMIN_E_OBJECT_DOES_NOT_EXIST
//
// MessageText:
//
//  One of the specified objects cannot be found
//

  COMADMIN_E_OBJECT_DOES_NOT_EXIST = HRESULT($80110809);
  {$EXTERNALSYM COMADMIN_E_OBJECT_DOES_NOT_EXIST}

//
// COMPLUS Queued component errors
//
//
// MessageId: COMQC_E_APPLICATION_NOT_QUEUED
//
// MessageText:
//
//  Only COM+ applications marked "queued" can be created using the "queue" moniker.
//

  COMQC_E_APPLICATION_NOT_QUEUED = HRESULT($80110600);
  {$EXTERNALSYM COMQC_E_APPLICATION_NOT_QUEUED}

//
// MessageId: COMQC_E_NO_QUEUEABLE_INTERFACES
//
// MessageText:
//
//  At least one interface must be marked 'queued" in order to create a queued component instance with the "queue" moniker.
//

  COMQC_E_NO_QUEUEABLE_INTERFACES = HRESULT($80110601);
  {$EXTERNALSYM COMQC_E_NO_QUEUEABLE_INTERFACES}

//
// MessageId: COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE
//
// MessageText:
//
//  MSMQ, which is required for the requested operation, is not installed.
//

  COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE = HRESULT($80110602);
  {$EXTERNALSYM COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE}

implementation

function SUCCEEDED(Status: HRESULT): BOOL;
begin
  Result := Status >= 0;
end;

function FAILED(Status: HRESULT): BOOL;
begin
  Result := Status < 0;
end;

function IS_ERROR(Status: HRESULT): BOOL;
begin
  Result := (Status shr 31) = SEVERITY_ERROR;
end;

function HRESULT_CODE(hr: HRESULT): DWORD;
begin
  Result := hr and $FFFF;
end;

function SCODE_CODE(sc: LONG): DWORD;
begin
  Result := sc and $FFFF;
end;

function HRESULT_FACILITY(hr: HRESULT): DWORD;
begin
  Result := (hr shr 16) and $1FFF;
end;

function SCODE_FACILITY(sc: LONG): DWORD;
begin
  Result := (sc shr 16) and $1FFF;
end;

function HRESULT_SEVERITY(hr: HRESULT): DWORD;
begin
  Result := (hr shr 31) and $1;
end;

function SCODE_SEVERITY(sc: LONG): DWORD;
begin
  Result := (sc shr 31) and $1;
end;

function MAKE_HRESULT(sev, fac, code: DWORD): HRESULT;
begin
  Result := HRESULT((sev shl 31) or (fac shl 16) or code);
end;

function HRESULT_FROM_WIN32(x: DWORD): HRESULT;
begin
  if HRESULT(x) <= 0 then
    Result := HRESULT(x)
  else
    Result := HRESULT((x and $0000FFFF) or (FACILITY_WIN32 shr 16) or $80000000);
end;

function HRESULT_FROM_NT(x: NTSTATUS): HRESULT;
begin
  Result := HRESULT(x or FACILITY_NT_BIT);
end;

function HRESULT_FROM_SETUPAPI(x: DWORD): HRESULT;
begin
  if (x and (APPLICATION_ERROR_MASK or ERROR_SEVERITY_ERROR)) =
    (APPLICATION_ERROR_MASK or ERROR_SEVERITY_ERROR) then
    Result := HRESULT((x and $0000FFFF) or (FACILITY_SETUPAPI shl 16) or $80000000)
  else
    Result := HRESULT_FROM_WIN32(x);
end;

end.
