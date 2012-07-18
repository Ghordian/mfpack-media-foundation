// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: AudioAPOTypes.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later. 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony
// EditDate: updt 010412a
//
// Remarks:
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, updt 4
// Todo: These should be implemented in a class, for now, it works.
// =============================================================================
// Source: audioapotypes.h
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

unit AudioAPOTypes;

  {$MINENUMSIZE 4}
  {$WEAKPACKAGEUNIT}

interface

uses
	Windows, ActiveX, ComObj;

type
	//Hundred nanosecond unit
  PHnstime = ^THnstime;
  {$EXTERNALSYM HNSTIME}
	HNSTIME = LONGLONG;
  THnstime = LONGLONG;

	//Hundred nanosecond unit
	PMftime = ^TMftime;
  {$EXTERNALSYM MFTIME}
  MFTIME = LONGLONG;
  TMftime = LONGLONG;

	//float
  PFloat32 = ^TFloat32;
  {$EXTERNALSYM FLOAT32}
  FLOAT32 = Single;
  TFloat32 = Single;
	//double
  PFloat64 = ^TFloat64;
  {$EXTERNALSYM FLOAT64}
  FLOAT64 = Double;
	TFloat64 = Double;
	UINT_PTR = PUINT;
	UINT32 =  LongWord;

// Validation flags for APO_CONNECTION_PROPERTY. Each APO connection has
// an APO_CONNECTION_PROPERTY structure associated with it. The buffer
// for each connection may be either invalid, valid, or silent.

	{$EXTERNALSYM APO_BUFFER_FLAGS}
	_tagAPO_BUFFER_FLAGS = (
    // BUFFER_INVALID means that there is no valid data in  the connection
    // buffer. The buffer pointer will still be valid and capable of holding
    // the amount of valid audio data specified in the APO_CONNECTION_PROPERTY.
    // The processor will mark every connection BUFFER_INVALID before running
    // the IAudioOutputEndpoint::GetOutputDataPointer,
    // IAudioInputEndpointRT::GetInputDataPointer, or
    // IAudioProcessingObjectRT::APOProcess each time its IAudioProcess::Process
    // routine is called.
    BUFFER_INVALID = 0,
    // Connection buffer has valid data. This is the "normal" operational
    // state of the connection buffer. An APO will set this flag once it
    // writes valid data into a buffer.
    BUFFER_VALID   = 1,
    // The connection buffer should be treated as if it contains silence.
    // APOs will mark their output connection buffers as silent (instead
    // of writing silence into the buffer) if they generate a buffer of
    // silence. This typically only happens when the buffer(s) going in
    // are marked BUFFER_SILENT.
    BUFFER_SILENT  = 2
	);
	APO_BUFFER_FLAGS = _tagAPO_BUFFER_FLAGS;

// This structure contains the dynamically changing connection properties.
// The connection between APOs ends up resolving to the APO_CONNECTION_PROPERTY
// structure for the IAudioProcessingObjectRT::APOProcess call.  This structure
// is passed in IAudioInputEndpointRT.GetInputDataPointer and
// IAudioOutputEndpointRT.ReleaseOutputDataPointer.

	{$EXTERNALSYM APO_CONNECTION_PROPERTY}
  APO_CONNECTION_PROPERTY = record
    // The connection buffer. APOs use this buffer to read and write
    // audio data.
    //
    // Alignment required
    // (128 bit or frame aligned)
    //            |
    //      +-----+
    //      V
    //      +-------------------------------------------------------------+
    //      |                                                             |
    //      |                                                             |
    //      |                     audio buffer                            |
    //      |                                                             |
    //      |                                                             |
    //      +-------------------------------------------------------------+
    //      ^
    //      |
    //   pBuffer
    //
		pBuffer: UINT_PTR;
    // Number of valid frames in the connection buffer. This must
    // be less than or equal to APO_CONNECTION_DESCRIPTOR.u32MaxFrameCount.
    // An APO will use the valid frame count to determine how much data to
    // process on an input buffer. An APO will set the valid frame count
    // upon writing data into its output connection(s).
    u32ValidFrameCount: UINT32;
    // Connection flags for this buffer.  Tells APOs if the buffer is valid,
    // in valid, or silent. See APO_BUFFER_FLAGS.
    u32BufferFlags: APO_BUFFER_FLAGS;
    // A tag identifying a valid APO_CONNECTION_PROPERTY structure.
		u32Signature: UINT32;
  end;
	PAPO_CONNECTION_PROPERTY = ^APO_CONNECTION_PROPERTY;

implementation

end.
