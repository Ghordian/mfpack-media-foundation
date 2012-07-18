// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: PropIdl.pas
// Kind: Pascal Unit
// Release date: 27-06-2012
// Language: ENU
//
// Version: 1.0.0.1 
// Description: Requires Windows Vista or later. 
//              Structured Storage. 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony (maXcomX)
// EditDate: updt 100712b
//
// Remarks:
//          Delphi : The IUnknown entries of functions should be casted like this:
//                   IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: OaIdl translation
// =============================================================================
// Source: propidl.h
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

unit PropIdl;

  //{$MINENUMSIZE 4}
  //{$WEAKPACKAGEUNIT}

interface

uses
  Windows, ComObj, ObjIdl, OaIdl, Unknwn;

const
  IID_IPropertyStorage                 : TGUID = '{00000138-0000-0000-C000-000000000046}';
  IID_IPropertySetStorage              : TGUID = '{0000013A-0000-0000-C000-000000000046}';
  IID_IEnumSTATPROPSTG                 : TGUID = '{00000139-0000-0000-C000-000000000046}';
  IID_IEnumSTATPROPSETSTG              : TGUID = '{00000139-0000-0000-C000-000000000046}';


  {$EXTERNALSYM CCH_MAX_PROPSTG_NAME}
  CCH_MAX_PROPSTG_NAME                = 31;




type
  PVersionedstream = ^TVersionedstream;
  {$EXTERNALSYM tagVersionedStream}
  tagVersionedStream = record
    guidVersion: TGUID;
    pStream: PIStream;
  end;
  {$EXTERNALSYM VERSIONEDSTREAM}
  VERSIONEDSTREAM = tagVersionedStream;
  TVersionedstream = tagVersionedStream;

  {$EXTERNALSYM LPVERSIONEDSTREAM}
  LPVERSIONEDSTREAM = ^tagVersionedStream;

const
  // Flags for IPropertySetStorage.Create
  {$EXTERNALSYM PROPSETFLAG_DEFAULT}
  PROPSETFLAG_DEFAULT                 = (0);
  {$EXTERNALSYM PROPSETFLAG_NONSIMPLE}
  PROPSETFLAG_NONSIMPLE               = (1);
  {$EXTERNALSYM PROPSETFLAG_ANSI}
  PROPSETFLAG_ANSI                    = (2);

  // This flag is only supported on StgCreatePropStg & StgOpenPropStg
  {$EXTERNALSYM PROPSETFLAG_UNBUFFERED}
  PROPSETFLAG_UNBUFFERED              = (4);

  // This flag causes a version-1 property set to be created
  {$EXTERNALSYM PROPSETFLAG_CASE_SENSITIVE}
  PROPSETFLAG_CASE_SENSITIVE          = (8);


// Flags for the reservied PID_BEHAVIOR property
  {$EXTERNALSYM PROPSET_BEHAVIOR_CASE_SENSITIVE}
  PROPSET_BEHAVIOR_CASE_SENSITIVE     = (1);

type
// This is the PROPVARIANT definition for marshaling.
  PPropvariant = ^TPropvariant;
  {$EXTERNALSYM PROPVARIANT}
  PROPVARIANT = tag_inner_PROPVARIANT;
  TPropvariant = tag_inner_PROPVARIANT;

  PCac = ^TCac;
  {$EXTERNALSYM tagCAC}
  tagCAC = record
    cElems: ULONG;
    pElems: PAnsiChar;
  end;
  {$EXTERNALSYM CAC}
  CAC = tagCAC;
  TCac = tagCAC;

  PCaub = ^TCaub;
  {$EXTERNALSYM tagCAUB}
  tagCAUB = record
    cElems: ULONG;
    pElems: PUCHAR;
  end;
  {$EXTERNALSYM CAUB}
  CAUB = tagCAUB;
  TCaub = tagCAUB;

  PCai = ^TCai;
  {$EXTERNALSYM tagCAI}
  tagCAI = record
    cElems: ULONG;
    pElems: PSHORT;
  end;
  {$EXTERNALSYM CAI}
  CAI = tagCAI;
  TCai = tagCAI;

  PCaui = ^TCaui;
  {$EXTERNALSYM tagCAUI}
  tagCAUI = record
    cElems: ULONG;
    pElems: PUSHORT;
  end;
  {$EXTERNALSYM CAUI}
  CAUI = tagCAUI;
  TCaui = tagCAUI;

  PCal = ^TCal;
  {$EXTERNALSYM tagCAL}
  tagCAL = record
    cElems: ULONG;
    pElems: PLONG;
  end;
  {$EXTERNALSYM CAL}
  CAL = tagCAL;
  TCal = tagCAL;

  PCaul = ^TCaul;
  {$EXTERNALSYM tagCAUL}
  tagCAUL = record
    cElems: ULONG;
    pElems: PULONG;
  end;
  {$EXTERNALSYM CAUL}
  CAUL = tagCAUL;
  TCaul = tagCAUL;

  PCaflt = ^TCaflt;
  {$EXTERNALSYM tagCAFLT}
  tagCAFLT = record
    cElems: ULONG;
    pElems: PFLOAT;
  end;
  {$EXTERNALSYM CAFLT}
  CAFLT = tagCAFLT;
  TCaflt = tagCAFLT;

  PCadbl = ^TCadbl;
  {$EXTERNALSYM tagCADBL}
  tagCADBL = record
    cElems: ULONG;
    pElems: PDOUBLE;
  end;
  {$EXTERNALSYM CADBL}
  CADBL = tagCADBL;
  TCadbl = tagCADBL;

  PCacy = ^TCacy;
  {$EXTERNALSYM tagCACY}
  tagCACY = record
    cElems: ULONG;
    pElems: PCY;
  end;
  {$EXTERNALSYM CACY}
  CACY = tagCACY;
  TCacy = tagCACY;

  PCadate = ^TCadate;
  {$EXTERNALSYM tagCADATE}
  tagCADATE = record
    cElems: ULONG;
    pElems: PDATE;
  end;
  {$EXTERNALSYM CADATE}
  CADATE = tagCADATE;
  TCadate = tagCADATE;

  PCabstr = ^TCabstr;
  {$EXTERNALSYM tagCABSTR}
  tagCABSTR = record
    cElems: ULONG;
    pElems: PBSTR;
  end;
  {$EXTERNALSYM CABSTR}
  CABSTR = tagCABSTR;
  TCabstr = tagCABSTR;

  PCabstrblob = ^TCabstrblob;
  {$EXTERNALSYM tagCABSTRBLOB}
  tagCABSTRBLOB = record
    cElems: ULONG;
    pElems: PBSTRBLOB;
  end;
  {$EXTERNALSYM CABSTRBLOB}
  CABSTRBLOB = tagCABSTRBLOB;
  TCabstrblob = tagCABSTRBLOB;

  PCabool = ^TCabool;
  {$EXTERNALSYM tagCABOOL}
  tagCABOOL = record
    cElems: ULONG;
    pElems: PVARIANT_BOOL;
  end;
  {$EXTERNALSYM CABOOL}
  CABOOL = tagCABOOL;
  TCabool = tagCABOOL;

  PCascode = ^TCascode;
  {$EXTERNALSYM tagCASCODE}
  tagCASCODE = record
    cElems: ULONG;
    pElems: PSCODE;
  end;
  {$EXTERNALSYM CASCODE}
  CASCODE = tagCASCODE;
  TCascode = tagCASCODE;

  PCapropvariant = ^TCapropvariant;
  {$EXTERNALSYM tagCAPROPVARIANT}
  tagCAPROPVARIANT = record
    cElems: ULONG;
    pElems: PPROPVARIANT;
  end;
  {$EXTERNALSYM CAPROPVARIANT}
  CAPROPVARIANT = tagCAPROPVARIANT;
  TCapropvariant = tagCAPROPVARIANT;

  PCah = ^TCah;
  {$EXTERNALSYM tagCAH}
  tagCAH = record
    cElems: ULONG;
    pElems: PLARGE_INTEGER;
  end;
  {$EXTERNALSYM CAH}
  CAH = tagCAH;
  TCah = tagCAH;

  PCauh = ^TCauh;
  {$EXTERNALSYM tagCAUH}
  tagCAUH = record
    cElems: ULONG;
    pElems: PULARGE_INTEGER;
  end;
  {$EXTERNALSYM CAUH}
  CAUH = tagCAUH;
  TCauh = tagCAUH;

  PCalpstr = ^TCalpstr;
  {$EXTERNALSYM tagCALPSTR}
  tagCALPSTR = record
    cElems: ULONG;
    pElems: PPAnsiChar;
  end;
  {$EXTERNALSYM CALPSTR}
  CALPSTR = tagCALPSTR;
  TCalpstr = tagCALPSTR;

  PCalpwstr = ^TCalpwstr;
  {$EXTERNALSYM tagCALPWSTR}
  tagCALPWSTR = record
    cElems: ULONG;
    pElems: PPWideChar;
  end;
  {$EXTERNALSYM CALPWSTR}
  CALPWSTR = tagCALPWSTR;
  TCalpwstr = tagCALPWSTR;

  PCafiletime = ^TCafiletime;
  {$EXTERNALSYM tagCAFILETIME}
  tagCAFILETIME = record
    cElems: ULONG;
    pElems: PFILETIME;
  end;
  {$EXTERNALSYM CAFILETIME}
  CAFILETIME = tagCAFILETIME;
  TCafiletime = tagCAFILETIME;

  PCaclipdata = ^TCaclipdata;
  {$EXTERNALSYM tagCACLIPDATA}
  tagCACLIPDATA = record
    cElems: ULONG;
    pElems: PCLIPDATA;
  end;
  {$EXTERNALSYM CACLIPDATA}
  CACLIPDATA = tagCACLIPDATA;
  TCaclipdata = tagCACLIPDATA;

  PCaclsid = ^TCaclsid;
  {$EXTERNALSYM tagCACLSID}
  tagCACLSID = record
    cElems: ULONG;
    pElems: PCLSID;
  end;
  {$EXTERNALSYM CACLSID}
  CACLSID = tagCACLSID;
  TCaclsid = tagCACLSID;

  // This is the PROPVARIANT padding layout for marshaling.
  PPropvarPad1 = ^TPropvarPad1;
  {$EXTERNALSYM PROPVAR_PAD1}
  PROPVAR_PAD1 = Byte;
  TPropvarPad1 = Byte;

  PPropvarPad2 = ^TPropvarPad2;
  {$EXTERNALSYM PROPVAR_PAD2}
  PROPVAR_PAD2 = Byte;
  TPropvarPad2 = Byte;

  PPropvarPad3 = ^TPropvarPad3;
  {$EXTERNALSYM PROPVAR_PAD3}
  PROPVAR_PAD3 = ULONG;
  TPropvarPad3 = ULONG;



  PPropvariant = ^TPropvariant;
  {$EXTERNALSYM PROPVARIANT}
  cwPROPVARIANT = record
    vt: WORD;
    wReserved1: PROPVAR_PAD1;
    wReserved2: PROPVAR_PAD2;
    wReserved3: PROPVAR_PAD3;
    case vt : WORD of
      0: (cVal: AnsiChar);
      1: (bVal: UCHAR);
      2: (iVal: SHORT);
      3: (uiVal: USHORT);
      4: (lVal: LONG);
      5: (ulVal: ULONG);
      6: (intVal: INT);
      7: (uintVal: UINT;);
      8: (hVal: LARGE_INTEGER);
      9: (uhVal: ULARGE_INTEGER);
     10: (fltVal: FLOAT);
     11: (dblVal: DOUBLE);
     12: (boolVal: VARIANT_BOOL);
     13: (scode: SCODE);
     14: (cyVal: CY);
     15: (date: DATE);
     16: (filetime: FILETIME);
     17: (puuid: PCLSID);
     18: (pclipdata: PCLIPDATA);
     19: (bstrVal: BSTR);
     20: (bstrblobVal: BSTRBLOB);
     21: (blob: BLOB);
     22: (pszVal: PAnsiChar);
     23: (pwszVal: PWideChar);
     24: (punkVal: PIUnknown);
     25: (pdispVal: PIDispatch);
     26: (pStream: PIStream);
     27: (pStorage: PIStorage);
     28: (pVersionedStream: LPVERSIONEDSTREAM);
     29: ( parray: LPSAFEARRAY);
     30: (cac: CAC);
     31: (caub: CAUB);
     32: (cai: CAI);
     33: (caui: CAUI);
     34: (cal: CAL);
     35: (caul: CAUL);
     36: (cah: CAH);
     37: (cauh: CAUH);
     38: (caflt: CAFLT);
     39: (cadbl: CADBL);
     40: (cabool: CABOOL);
     41: (cascode: CASCODE);
     42: (cacy: CACY);
     43: (cadate: CADATE);
     44: (cafiletime: CAFILETIME);
     45: (cauuid: CACLSID);
     46: (caclipdata: CACLIPDATA);
     47: (cabstr: CABSTR);
     48: (cabstrblob: CABSTRBLOB);
     49: (calpstr: CALPSTR);
     50: (calpwstr: CALPWSTR);
     51: (capropvar: CAPROPVARIANT);
     52: (pcVal: PAnsiChar);
     53: (pbVal: PUCHAR);
     54: (piVal: PSHORT);
     55: (puiVal: PUSHORT);
     56: (plVal: PLONG);
     57: (pulVal: PULONG);
     58: (pintVal: PINT);
     59: (puintVal: PUINT);
     60: (pfltVal: PFLOAT);
     61: (pdblVal: PDOUBLE);
     62: (pboolVal: PVARIANT_BOOL);
     63: (pdecVal: PDECIMAL);
     64: (pscode: PSCODE);
     65: (pcyVal: PCY);
     66: (pdate: PDATE);
     67: (pbstrVal: PBSTR);
     68: (ppunkVal: PPIUnknown);
     69: (ppdispVal: PPIDispatch);
     70: (pparray: PLPSAFEARRAY);
     71: (pvarVal: PPROPVARIANT);
    end;
  end;
  PROPVARIANT = cwPROPVARIANT;
  TPropvariant = cwPROPVARIANT;

  // This is the LPPROPVARIANT definition for marshaling.
  {$EXTERNALSYM LPPROPVARIANT}
  LPPROPVARIANT = ^cwPROPVARIANT;
  {$EXTERNALSYM REFPROPVARIANT}
  REFPROPVARIANT = ^PROPVARIANT;


  // Reserved global Property IDs
  {$EXTERNALSYM PID_DICTIONARY}
  PID_DICTIONARY                      = (0);

  {$EXTERNALSYM PID_CODEPAGE}
  PID_CODEPAGE                        = ($1);

  {$EXTERNALSYM PID_FIRST_USABLE}
  PID_FIRST_USABLE                    = ($2);

  {$EXTERNALSYM PID_FIRST_NAME_DEFAULT}
  PID_FIRST_NAME_DEFAULT              = ($FFF);

  {$EXTERNALSYM PID_LOCALE}
  PID_LOCALE                          = ($80000000);

  {$EXTERNALSYM PID_MODIFY_TIME}
  PID_MODIFY_TIME                     = ($80000001);

  {$EXTERNALSYM PID_SECURITY}
  PID_SECURITY                        = ($80000002);

  {$EXTERNALSYM PID_BEHAVIOR}
  PID_BEHAVIOR                        = ($80000003);

  {$EXTERNALSYM PID_ILLEGAL}
  PID_ILLEGAL                         = ($FFFFFFFF);

  // Range which is read-only to downlevel implementations
  {$EXTERNALSYM PID_MIN_READONLY}
  PID_MIN_READONLY                    = ($80000000);

  {$EXTERNALSYM PID_MAX_READONLY}
  PID_MAX_READONLY                    = ($BFFFFFFF);

  // Property IDs for the DiscardableInformation Property Set

  {$EXTERNALSYM PIDDI_THUMBNAIL}
  PIDDI_THUMBNAIL                     = $00000002;  // VT_BLOB

  // Property IDs for the SummaryInformation Property Set

  {$EXTERNALSYM PIDSI_TITLE}
  PIDSI_TITLE                         = $00000002;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_SUBJECT}
  PIDSI_SUBJECT                       = $00000003;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_AUTHOR}
  PIDSI_AUTHOR                        = $00000004;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_KEYWORDS}
  PIDSI_KEYWORDS                      = $00000005;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_COMMENTS}
  PIDSI_COMMENTS                      = $00000006;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_TEMPLATE}
  PIDSI_TEMPLATE                      = $00000007;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_LASTAUTHOR}
  PIDSI_LASTAUTHOR                    = $00000008;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_REVNUMBER}
  PIDSI_REVNUMBER                     = $00000009;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_EDITTIME}
  PIDSI_EDITTIME                      = $0000000A;  // VT_FILETIME (UTC)
  {$EXTERNALSYM PIDSI_LASTPRINTED}
  PIDSI_LASTPRINTED                   = $0000000B;  // VT_FILETIME (UTC)
  {$EXTERNALSYM PIDSI_CREATE_DTM}
  PIDSI_CREATE_DTM                    = $0000000C;  // VT_FILETIME (UTC)
  {$EXTERNALSYM PIDSI_LASTSAVE_DTM}
  PIDSI_LASTSAVE_DTM                  = $0000000D;  // VT_FILETIME (UTC)
  {$EXTERNALSYM PIDSI_PAGECOUNT}
  PIDSI_PAGECOUNT                     = $0000000E;  // VT_I4
  {$EXTERNALSYM PIDSI_WORDCOUNT}
  PIDSI_WORDCOUNT                     = $0000000F;  // VT_I4
  {$EXTERNALSYM PIDSI_CHARCOUNT}
  PIDSI_CHARCOUNT                     = $00000010;  // VT_I4
  {$EXTERNALSYM PIDSI_THUMBNAIL}
  PIDSI_THUMBNAIL                     = $00000011;  // VT_CF
  {$EXTERNALSYM PIDSI_APPNAME}
  PIDSI_APPNAME                       = $00000012;  // VT_LPSTR
  {$EXTERNALSYM PIDSI_DOC_SECURITY}
  PIDSI_DOC_SECURITY                  = $00000013;  // VT_I4

  // Property IDs for the DocSummaryInformation Property Set

  {$EXTERNALSYM PIDDSI_CATEGORY}
  PIDDSI_CATEGORY                     = $00000002;  // VT_LPSTR
  {$EXTERNALSYM PIDDSI_PRESFORMAT}
  PIDDSI_PRESFORMAT                   = $00000003;  // VT_LPSTR
  {$EXTERNALSYM PIDDSI_BYTECOUNT}
  PIDDSI_BYTECOUNT                    = $00000004;  // VT_I4
  {$EXTERNALSYM PIDDSI_LINECOUNT}
  PIDDSI_LINECOUNT                    = $00000005;  // VT_I4
  {$EXTERNALSYM PIDDSI_PARCOUNT}
  PIDDSI_PARCOUNT                     = $00000006;  // VT_I4
  {$EXTERNALSYM PIDDSI_SLIDECOUNT}
  PIDDSI_SLIDECOUNT                   = $00000007;  // VT_I4
  {$EXTERNALSYM PIDDSI_NOTECOUNT}
  PIDDSI_NOTECOUNT                    = $00000008;  // VT_I4
  {$EXTERNALSYM PIDDSI_HIDDENCOUNT}
  PIDDSI_HIDDENCOUNT                  = $00000009;  // VT_I4
  {$EXTERNALSYM PIDDSI_MMCLIPCOUNT}
  PIDDSI_MMCLIPCOUNT                  = $0000000A;  // VT_I4
  {$EXTERNALSYM PIDDSI_SCALE}
  PIDDSI_SCALE                        = $0000000B;  // VT_BOOL
  {$EXTERNALSYM PIDDSI_HEADINGPAIR}
  PIDDSI_HEADINGPAIR                  = $0000000C;  // VT_VARIANT | VT_VECTOR
  {$EXTERNALSYM PIDDSI_DOCPARTS}
  PIDDSI_DOCPARTS                     = $0000000D;  // VT_LPSTR | VT_VECTOR
  {$EXTERNALSYM PIDDSI_MANAGER}
  PIDDSI_MANAGER                      = $0000000E;  // VT_LPSTR
  {$EXTERNALSYM PIDDSI_COMPANY}
  PIDDSI_COMPANY                      = $0000000F;  // VT_LPSTR
  {$EXTERNALSYM PIDDSI_LINKSDIRTY}
  PIDDSI_LINKSDIRTY                   = $00000010;  // VT_BOOL


  //  FMTID_MediaFileSummaryInfo - Property IDs

  {$EXTERNALSYM PIDMSI_EDITOR}
  PIDMSI_EDITOR                       = $00000002;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_SUPPLIER}
  PIDMSI_SUPPLIER                     = $00000003;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_SOURCE}
  PIDMSI_SOURCE                       = $00000004;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_SEQUENCE_NO}
  PIDMSI_SEQUENCE_NO                  = $00000005;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_PROJECT}
  PIDMSI_PROJECT                      = $00000006;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_STATUS}
  PIDMSI_STATUS                       = $00000007;  // VT_UI4
  {$EXTERNALSYM PIDMSI_OWNER}
  PIDMSI_OWNER                        = $00000008;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_RATING}
  PIDMSI_RATING                       = $00000009;  // VT_LPWSTR
  {$EXTERNALSYM PIDMSI_PRODUCTION}
  PIDMSI_PRODUCTION                   = $0000000A;  // VT_FILETIME (UTC)
  {$EXTERNALSYM PIDMSI_COPYRIGHT}
  PIDMSI_COPYRIGHT                    = $0000000B;  // VT_LPWSTR


type
  //  PIDMSI_STATUS value definitions
  {$EXTERNALSYM PIDMSI_STATUS_VALUE}
  PIDMSI_STATUS_VALUE                 = (
  PIDMSI_STATUS_NORMAL                = 0,
	PIDMSI_STATUS_NEW	                  = PIDMSI_STATUS_NORMAL + 1,
	PIDMSI_STATUS_PRELIM	              = ( PIDMSI_STATUS_NEW + 1 ) ,
	PIDMSI_STATUS_DRAFT	                = ( PIDMSI_STATUS_PRELIM + 1 ) ,
	PIDMSI_STATUS_INPROGRESS	          = ( PIDMSI_STATUS_DRAFT + 1 ) ,
	PIDMSI_STATUS_EDIT	                = ( PIDMSI_STATUS_INPROGRESS + 1 ) ,
	PIDMSI_STATUS_REVIEW	              = ( PIDMSI_STATUS_EDIT + 1 ) ,
	PIDMSI_STATUS_PROOF	                = ( PIDMSI_STATUS_REVIEW + 1 ) ,
	PIDMSI_STATUS_FINAL	                = ( PIDMSI_STATUS_PROOF + 1 ) ,
	PIDMSI_STATUS_OTHER	                = $7fff
  );

const
  {$EXTERNALSYM PRSPEC_INVALID}
  PRSPEC_INVALID                      = $FFFFFFFF;
  {$EXTERNALSYM PRSPEC_LPWSTR}
  PRSPEC_LPWSTR                       = 0;
  {$EXTERNALSYM PRSPEC_PROPID}
  PRSPEC_PROPID                       = 1;

type
  PPropspec = ^TPropspec;
  {$EXTERNALSYM tagPROPSPEC}
  tagPROPSPEC = record
    ulKind: ULONG;
    DUMMYUNIONNAME: union
      { [switch_type] }
      propid: PROPID;
      lpwstr: LPOLESTR;
      { Empty union arm }
      end;
    end;
    {$EXTERNALSYM PROPSPEC}
    PROPSPEC = tagPROPSPEC;
    TPropspec = tagPROPSPEC;

type
  PStatpropstg = ^TStatpropstg;
  {$EXTERNALSYM tagSTATPROPSTG}
  tagSTATPROPSTG = record
    lpwstrName: LPOLESTR;
    propid: PROPID;
    vt: VARTYPE;
  end;
  {$EXTERNALSYM STATPROPSTG}
  STATPROPSTG = tagSTATPROPSTG;
  TStatpropstg = tagSTATPROPSTG;


  // Macros for parsing the OS Version of the Property Set Header
  {$EXTERNALSYM PROPSETHDR_OSVER_KIND}
  function PROPSETHDR_OSVER_KIND(dwOSVer: DWORD): DWORD;
  begin
    Result:= HIWORD(dwOSVer);
  end;

  {$EXTERNALSYM PROPSETHDR_OSVER_MAJOR}
  function PROPSETHDR_OSVER_MAJOR(dwOSVer: DWORD): DWORD;
  begin
    Result:= LOBYTE(LOWORD(dwOSVer));
  end;

  {$EXTERNALSYM PROPSETHDR_OSVER_MINOR}
  function PROPSETHDR_OSVER_MINOR(dwOSVer: DWORD): DWORD;
  begin
    Result:= HIBYTE(LOWORD(dwOSVer));
  end;

const
  {$EXTERNALSYM PROPSETHDR_OSVERSION_UNKNOWN}
  PROPSETHDR_OSVERSION_UNKNOWN        = $FFFFFFFF;

type
  PStatpropsetstg = ^TStatpropsetstg;
  {$EXTERNALSYM tagSTATPROPSETSTG}
  tagSTATPROPSETSTG = record
    fmtid: FMTID;
    clsid: CLSID;
    grfFlags: DWORD;
    mtime: FILETIME;
    ctime: FILETIME;
    atime: FILETIME;
    dwOSVersion: DWORD;
  end;
  {$EXTERNALSYM STATPROPSETSTG}
  STATPROPSETSTG = tagSTATPROPSETSTG;
  TStatpropsetstg = tagSTATPROPSETSTG;

type
  PIPropertySetStorage = ^TIPropertySetStorage;
  {$EXTERNALSYM IPropertySetStorage}
  IPropertySetStorage = __RPC_unique_pointer;
  TIPropertySetStorage = __RPC_unique_pointer;

type
  PIEnumSTATPROPSTG = ^TIEnumSTATPROPSTG;
  {$EXTERNALSYM IEnumSTATPROPSTG}
  IEnumSTATPROPSTG = __RPC_unique_pointer;
  TIEnumSTATPROPSTG = __RPC_unique_pointer;

type
  PIEnumSTATPROPSETSTG = ^TIEnumSTATPROPSETSTG;
  {$EXTERNALSYM IEnumSTATPROPSETSTG}
  IEnumSTATPROPSETSTG = __RPC_unique_pointer;
  TIEnumSTATPROPSETSTG = __RPC_unique_pointer;

type
  PIPropertyStorage = ^TIPropertyStorage;
  {$EXTERNALSYM IPropertyStorage}
  IPropertyStorage = __RPC_unique_pointer;
  TIPropertyStorage = __RPC_unique_pointer;

type
  PSerializedpropertyvalue = ^TSerializedpropertyvalue;
  {$EXTERNALSYM tagSERIALIZEDPROPERTYVALUE}
  tagSERIALIZEDPROPERTYVALUE = record
    dwType: DWORD;
    rgb: array[0..0] of Byte;
  end;
  {$EXTERNALSYM SERIALIZEDPROPERTYVALUE}
  SERIALIZEDPROPERTYVALUE = tagSERIALIZEDPROPERTYVALUE;
  TSerializedpropertyvalue = tagSERIALIZEDPROPERTYVALUE;



type
  // Forward Interfaces Declarations ///////////////////////////////////////////

  PIPropertyStorage = ^TIPropertyStorage;
  {$EXTERNALSYM IPropertyStorage}
  IPropertyStorage = interface;
  TIPropertyStorage = interface;

  PIPropertySetStorage = ^TIPropertySetStorage;
  {$EXTERNALSYM IPropertySetStorage}
  IPropertySetStorage = interface;
  TIPropertySetStorage = interface;

  PIEnumSTATPROPSTG = ^TIEnumSTATPROPSTG;
  {$EXTERNALSYM IEnumSTATPROPSTG}
  IEnumSTATPROPSTG = interface;
  TIEnumSTATPROPSTG = interface;

  PIEnumSTATPROPSETSTG = ^TIEnumSTATPROPSETSTG;
  {$EXTERNALSYM IEnumSTATPROPSETSTG}
  IEnumSTATPROPSETSTG = interface;
  TIEnumSTATPROPSETSTG = interface;

  // Interfaces ////////////////////////////////////////////////////////////////

  //Interface IPropertyStorage
  IPropertyStorage = interface(IUnknown)
  ['{00000138-0000-0000-C000-000000000046}']
    function ReadMultiple(const cpspec: ULONG; const rgpspec: PROPSPEC; out rgpropvar: PROPVARIANT): HResult; stdcall;
    function WriteMultiple(const cpspec: ULONG; const rgpspec: PROPSPEC; const rgpropvar: PROPVARIANT; const propidNameFirst: PROPID): HResult; stdcall;
    function DeleteMultiple(const cpspec: ULONG; const rgpspec: PROPSPEC): HResult; stdcall;
    function ReadPropertyNames(const cpropid: ULONG; const rgpropid: PROPID; out rglpwstrName: LPOLESTR): HResult; stdcall;
    function WritePropertyNames(const cpropid: ULONG; const rgpropid: PROPID; const rglpwstrName: LPOLESTR): HResult; stdcall;
    function DeletePropertyNames(const cpropid: ULONG; const rgpropid: PROPID): HResult; stdcall;
    function Commit(const grfCommitFlags: DWORD): HResult; stdcall;
    function Revert(): HResult; stdcall;
    function Enum(out ppenum: PIEnumSTATPROPSTG): HResult; stdcall;
    function SetTimes(const pctime: FILETIME; const patime: FILETIME; const pmtime: FILETIME): HResult; stdcall;
    function SetClass(const clsid: REFCLSID): HResult; stdcall;
    function Stat(out pstatpsstg: STATPROPSETSTG): HResult; stdcall;
  end;


  //Interface IPropertySetStorage
  IPropertySetStorage = interface(IUnknown)
  ['{0000013A-0000-0000-C000-000000000046}']
    function Create(const rfmtid: REFFMTID; const pclsid: CLSID; const grfFlags: DWORD; const grfMode: DWORD; out ppprstg: PIPropertyStorage): HResult; stdcall;
    function Open(const rfmtid: REFFMTID; const grfMode: DWORD; out var ppprstg: PIPropertyStorage): HResult; stdcall;
    function Delete(const rfmtid: REFFMTID): HResult; stdcall;
    function Enum(out ppenum: PIEnumSTATPROPSETSTG): HResult; stdcall;
  end;


  //Interface IEnumSTATPROPSTG
  IEnumSTATPROPSTG = interface(IUnknown)
  ['{00000139-0000-0000-C000-000000000046}']
    function Next(const celt: ULONG; const rgelt: STATPROPSTG; out pceltFetched: ULONG): HResult; stdcall;
    function Skip(celt: ULONG): HResult; stdcall;
    function Reset(): HResult; stdcall;
    function Clone(out ppenum: PIEnumSTATPROPSTG): HResult; stdcall;
  end;


  //Interface IEnumSTATPROPSETSTG
  IEnumSTATPROPSETSTG = interface(IUnknown)
  ['{00000139-0000-0000-C000-000000000046}']
    function Next(const celt: ULONG; out rgelt: STATPROPSETSTG; out pceltFetched: ULONG): HResult; stdcall;
    function Skip(celt: ULONG): HResult; stdcall;
    function Reset(): HResult; stdcall;
    function Clone(out ppenum: PIEnumSTATPROPSETSTG): HResult; stdcall;
  end;


  // functions /////////////////////////////////////////////////////////////////

  {$EXTERNALSYM PropVariantCopy}
  function PropVariantCopy(var pvarDest: PROPVARIANT; var pvarSrc: PROPVARIANT): HResult; stdcall;
  {$EXTERNALSYM PropVariantClear}
  function PropVariantClear(var pvar: PROPVARIANT): HResult; stdcall;
  {$EXTERNALSYM FreePropVariantArray}
  function FreePropVariantArray(const cVariants: ULONG; var rgvars: PROPVARIANT): HResult; stdcall;

  {$EXTERNALSYM PropVariantInit}
  function PropVariantInit(pvar: PROPVARIANT): PROPVARIANT;

  {$EXTERNALSYM StgCreatePropStg}
  function StgCreatePropStg(const pUnk: IUnknown; const fmtid: REFFMTID; const pclsid: CLSID;
                            const grfFlags: DWORD; const dwReserved: DWORD; out ppPropStg: PIPropertyStorage): HResult; stdcall;

  {$EXTERNALSYM StgOpenPropStg}
  function StgOpenPropStg(const pUnk: IUnknown; const fmtid: REFFMTID; const grfFlags: DWORD;
                          const dwReserved: DWORD; out ppPropStg: PIPropertyStorage): HResult; stdcall;

  {$EXTERNALSYM StgCreatePropSetStg}
  function StgCreatePropSetStg(const pStorage: IStorage; const dwReserved: DWORD; out ppPropSetStg: PIPropertySetStorage): HResult; stdcall;

  {$EXTERNALSYM FmtIdToPropStgName}
  function FmtIdToPropStgName(const pfmtid: FMTID; out oszName: LPOLESTR): HResult; stdcall;

  {$EXTERNALSYM PropStgNameToFmtId}
  function PropStgNameToFmtId(const oszName: LPOLESTR; out pfmtid: FMTID): HResult; stdcall;

  {$EXTERNALSYM StgConvertVariantToProperty}
  StgConvertVariantToProperty(const pvar: PPROPVARIANT; const CodePage: USHORT; out pprop: PSERIALIZEDPROPERTYVALUE; var pcb: PULONG;
                              const  pid: PROPID; const BOOLEAN: __reserved, var pcIndirect: PULONG): ^SERIALIZEDPROPERTYVALUE; stdcall;

  {$EXTERNALSYM StgConvertPropertyToVariant}
  function StgConvertPropertyToVariant(const prop: SERIALIZEDPROPERTYVALUE; const CodePage: USHORT; out pvar: PROPVARIANT; const pma: PMemoryAllocator): BOOLEAN; stdcall;



  function PropVariantInit(pvar: PROPVARIANT): PROPVARIANT;


implementation

  function PropVariantInit(pvar: PROPVARIANT): PROPVARIANT;
  begin
    Result:= FillChar(pvar, SizeOf(PROPVARIANT), 0);
  end;

end.
