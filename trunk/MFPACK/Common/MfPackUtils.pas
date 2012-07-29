// FactoryX
// factoryx.code@gmail.com
//
// Copyright �2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: MfPackUtils.pas
// Kind: Pascal Unit
// Release date: 29-07-2012
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later.
//              Holds common helper routines used by Media Foundation and Core Audio
//
// Intiator(s): Tony (maXcomX), Peter (OzShips)
//
// LastEdited by: Tony (maXcomX)
// EditDate: 290712b
//
// Remarks:
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: General check
// =============================================================================
// Source: -
//
// Copyright (c) 1997-2012 Microsoft Corporation. All rights reserved
// Copyright (c) 2007 clootie (DirectX related)
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
//
// Licence Supplement:
// All kinds of commercial use, including distribution, of any kind, of the sources is strictly forbidden,
// unless you have a written permission or agreement from or with FactoryX.
//==============================================================================

unit MfPackUtils;

interface

uses
  Windows;

  procedure SAFE_RELEASE(var Obj);
  procedure SAFE_DELETE(var Obj);

implementation

procedure SAFE_RELEASE(var Obj);
begin
  if IUnknown(Obj) <> nil then
    IUnknown(Obj):= nil;
end;

procedure SAFE_DELETE(var Obj);
var
  Tmp: TObject;

begin
  Tmp:= TObject(Obj);
  Pointer(Obj):= nil;
  Tmp.Free;
end;

end.
