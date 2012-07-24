// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: AudEvCod.pas
// Kind: Pascal Unit
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later. 
//              List of Audio device error event codes and the expected params. 
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
// Compiler version: 23, updt 4
// Todo: -
// =============================================================================
// Source: audevcod.h
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

unit AudEvCod;

  {$MINENUMSIZE 4}
  {$WEAKPACKAGEUNIT}

interface


const
  {$EXTERNALSYM EC_SND_DEVICE_ERROR_BASE}
  EC_SND_DEVICE_ERROR_BASE            = $0200;

type

  {$EXTERNALSYM _tagSND_DEVICE_ERROR}
  _tagSND_DEVICE_ERROR           = (
    SNDDEV_ERROR_Open            = 1,
    SNDDEV_ERROR_Close           = 2,
    SNDDEV_ERROR_GetCaps         = 3,
    SNDDEV_ERROR_PrepareHeader   = 4,
    SNDDEV_ERROR_UnprepareHeader = 5,
    SNDDEV_ERROR_Reset           = 6,
    SNDDEV_ERROR_Restart         = 7,
    SNDDEV_ERROR_GetPosition     = 8,
    SNDDEV_ERROR_Write           = 9,
    SNDDEV_ERROR_Pause           = 10,
    SNDDEV_ERROR_Stop            = 11,
    SNDDEV_ERROR_Start           = 12,
    SNDDEV_ERROR_AddBuffer       = 13,
    SNDDEV_ERROR_Query           = 14
  );
  {$EXTERNALSYM SNDDEV_ERR}
  SNDDEV_ERR = _tagSND_DEVICE_ERROR;


// Sound device error event codes
// ==============================
//
// All audio device error events are always passed on to the application, and are
// never processed by the filter graph

const
  {$EXTERNALSYM EC_SNDDEV_IN_ERROR}
  EC_SNDDEV_IN_ERROR                  = (EC_SND_DEVICE_ERROR_BASE + $00);
  {$EXTERNALSYM EC_SNDDEV_OUT_ERROR}
  EC_SNDDEV_OUT_ERROR                 = (EC_SND_DEVICE_ERROR_BASE + $01);
// Parameters: (DWORD, DWORD)
// lParam1 is an enum SND_DEVICE_ERROR which notifies the app how the device was
// being accessed when the failure occurred.
//
// lParam2 is the error returned from the sound device call.
//


implementation

end.
