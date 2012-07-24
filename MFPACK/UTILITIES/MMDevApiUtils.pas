// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: MMDevApiUtils.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.3
// Description: MMDevApiUtils, Device api helper routines <= Win 8
//
// LastEdited by: Tony (maXcomX)
// EditDate: updt 040512a
//
// Remarks:
//          Delphi : The IUnknown entries of functions should be casted like this:
//                   IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: -
// =============================================================================
// Source: MSDN (some portions)
// See: Links to Msdn
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

unit MMDevApiUtils;

interface

uses
	Windows, Classes, SysUtils, ActiveX, ComObj, shlobj,
	MMSystem, MMDeviceApi, PropSys, AudioPolicy, Audiosessiontypes,
	DXUtil, DXTypes, DirectShow9;


type
  //-----------------------------------------------------------
	// Register the application to receive notifications when the
	// volume level changes on the default process-specific audio
	// session (with session GUID value GUID_NULL) on the audio
	// endpoint device with the specified data-flow direction
	// (eRender or eCapture) and device role.
	// See for more info:
	// http://msdn.microsoft.com/en-us/library/windows/desktop/dd370795(v=vs.85).aspx
	//-----------------------------------------------------------
	TAudioVolumeEvents = class
	private
		_hrStatus: HRESULT;
		_pManager: IAudioSessionManager;
		_pControl: IAudioSessionControl;
		_pAudioEvents: IAudioSessionEvents;

  public
		constructor Create(flow: eDataFlow; role: eRole; pAudioEvents: IAudioSessionEvents);
		destructor Destroy; override;
		property AVEStatus: HRESULT read _hrStatus;
	end;


	function OsIsVistaOrHigher(): boolean;
	function GetEndpointNames(slEndPoints: TStrings; DataFlow: eDataFlow; DeviceState: TOleEnum): HRESULT;
	//function PlayAudioStream(pSource: Pointer): HRESULT;
	function GetDefaultComDeviceEndPoint: HRESULT;
	function GetImmDeviceName(const Device: IMMDevice; out deviceName: string): HRESULT;
	//create DirectShow AudioRenderer
	function CreateDShowAudioRenderer(const role: eRole; out ppAudioRenderer: IBaseFilter): HRESULT;
	//Get DirectSound GUID
	function GetDirectSoundGuid(const flow: eDataFlow; const role: eRole; out pDevGuid: TGuid): HRESULT;

implementation

// Constructor
constructor TAudioVolumeEvents.Create(flow: EDataFlow; role: ERole; pAudioEvents: IAudioSessionEvents);
var
	pEnumerator: IMMDeviceEnumerator;
  pDevice: IMMDevice;

begin   

  _hrStatus:= S_OK;
try
  _pManager:= nil;
  _pControl:= nil;
  _pAudioEvents:= pAudioEvents;

  if not Assigned(_pAudioEvents) then
    begin
      _hrStatus:= E_POINTER;
      exit;
    end;

	_pAudioEvents._AddRef();

  // Get the enumerator for the audio endpoint devices
  // on this system.
	_hrStatus:= CoCreateInstance(CLSID_MMDeviceEnumerator, nil, CLSCTX_INPROC_SERVER, IID_IMMDeviceEnumerator, pEnumerator);

	if Failed(_hrStatus) then
    exit;

  // Get the audio endpoint device with the specified data-flow
	// direction (eRender or eCapture) and device role.
  _hrStatus:= pEnumerator.GetDefaultAudioEndpoint(flow, role, pDevice);
  if Failed(_hrStatus) then 
    exit;

  // Get the session manager for the endpoint device.
	_hrStatus:= pDevice.Activate(IID_IAudioSessionManager, CLSCTX_INPROC_SERVER, nil, IUnknown(_pManager));
  if Failed(_hrStatus) then 
    exit;                                


  // Get the control interface for the process-specific audio
  // session with session GUID = GUID_NULL. This is the session
  // that an audio stream for a DirectSound, DirectShow, waveOut,
  // or PlaySound application stream belongs to by default.
  _hrStatus:= _pManager.GetAudioSessionControl(nil, 0, _pControl);
  if Failed(_hrStatus) then 
    exit;

  _hrStatus:= _pControl.RegisterAudioSessionNotification(_pAudioEvents);
  if Failed(_hrStatus) then 
    exit;

finally
	SAFE_RELEASE(pEnumerator);
	SAFE_RELEASE(pDevice);
end;
end;


// Destructor
destructor TAudioVolumeEvents.Destroy;
begin
	if Assigned(_pControl) then
    begin
			_pControl.UnregisterAudioSessionNotification(_pAudioEvents);
		end;
	SAFE_RELEASE(_pManager);
	SAFE_RELEASE(_pControl);
	SAFE_RELEASE(_pAudioEvents);
end;

// eof AudioVolumeEvents


//Vista or higher check
function OsIsVistaOrHigher(): boolean;
var
	_VerInfo: TOSVersioninfo;

begin
	_VerInfo.dwOSVersionInfoSize:= SizeOf(TOSVersionInfo);
	GetVersionEx(_VerInfo);
	if (_VerInfo.dwPlatformId >= VER_PLATFORM_WIN32_NT) and (_VerInfo.dwMajorVersion > 5) then
		result:= true
	else
		result:= false;
end;


//Get endpointnames
//Source: Microsoft, http://msdn.microsoft.com/en-us/library/windows/desktop/dd370812(v=vs.85).aspx
//Remarks: the index of slEndPoints indicates also the device index.
function GetEndpointNames(slEndPoints: TStrings; DataFlow: eDataFlow; DeviceState: TOleEnum): HRESULT;
var
	_hr: HRESULT;
	_Enumerator: IMMDeviceEnumerator;
	_Collection: IMMDeviceCollection;
	_Endpoint: IMMDevice;
	_Props: IPropertyStore;
	_wszID: PWideChar;
	_count: Dword;
	_i: integer;
	_varName: PROPVARIANT;

begin
	slEndPoints.Clear;
	_hr:= S_OK;
try

	_hr:= CoCreateInstance(CLSID_MMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, _Enumerator);
	if Failed(_hr) then
		exit;

	_hr:= _Enumerator.EnumAudioEndpoints(DataFlow, DeviceState, _Collection);
	if Failed(_hr) then
		exit;

	_hr:= _Collection.GetCount(_count);
	if Failed(_hr) then
		exit;

	if (_count = 0) then
		begin
			result:= E_FAIL;
			exit;
		end;

	// Each loop prints the name of an endpoint device.
	for _i:= 0 to _count -1 do
		begin
			// Get pointer to endpoint number _i
			_hr:= _Collection.Item(_i, _Endpoint);
			if Failed(_hr) then
				exit;

			// Get the endpoint ID string.
			_hr:= _Endpoint.GetId(_wszID);
			if Failed(_hr) then
				exit;

			_hr:= _Endpoint.OpenPropertyStore(STGM_READ, _Props);
			if Failed(_hr) then
				exit;

			// Initialize container for property value.
			PropVariantInit(_varName);

			// Get the endpoint's friendly-name property.
			_hr:= _Props.GetValue(PKEY_Device_FriendlyName, _varName);
			if Failed(_hr) then
				exit;

			// endpoint friendly name and endpoint ID.
			slEndPoints.Append(string(_varName.pwszVal));

			PropVariantClear(_varName);
		end;

finally    
	CoTaskMemFree(_wszID);
	SAFE_RELEASE(_Enumerator);
	SAFE_RELEASE(_Collection);
	SAFE_RELEASE(_Endpoint);
	SAFE_RELEASE(_Props);
	Result:= _hr;
end;
end;

//todo:
{function GetStreamVolumes(): HRESULT;
var
	_hr: HRESULT;

begin

end;}



{
//-----------------------------------------------------------
// Play an audio stream on the default audio rendering
// device. The PlayAudioStream function allocates a shared
// buffer big enough to hold one second of PCM audio data.
// The function uses this buffer to stream data to the
// rendering device. The inner loop runs every 1/2 second.
//-----------------------------------------------------------
function PlayAudioStream(pSource: Pointer): HRESULT;
var
	hr: HRESULT;
	hnsRequestedDuration: REFERENCE_TIME;
	hnsActualDuration: REFERENCE_TIME;
	pDeviceEnumerator: IMMDeviceEnumerator;
  pDevice: IMMDevice;
	pAudioClient: IAudioClient;
	pRenderClient: IAudioRenderClient;
	pwfx: PWaveFormatEx;
	bufferFrameCount: Uint;
	numFramesAvailable: Uint;
	numFramesPadding: Uint;
  pData: Byte;
  flags: DWord;

begin
try
	hr:= CoCreateInstance(CLSID_MMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, pDeviceEnumerator);
	if Failed(hr) then
		raise Exception.Create('');

	hr:= pDeviceEnumerator.GetDefaultAudioEndpoint(eRender, eConsole, pDevice);
  if Failed(hr) then
		raise Exception.Create('');

	hr:= pDevice.Activate(IID_IAudioClient, CLSCTX_ALL, nil, IUnknown(pAudioClient));
  if Failed(hr) then
    raise Exception.Create('');

	hr:= pAudioClient.GetMixFormat(pwfx);
  if Failed(hr) then
    raise Exception.Create('');

  hr:= pAudioClient.Initialize(AUDCLNT_SHAREMODE_SHARED, 0, hnsRequestedDuration, 0, pwfx, nil);
  if Failed(hr) then
    raise Exception.Create('');

  //Tell the audio source which format to use.
	hr:= pSource.SetFormat(pwfx);
  if Failed(hr) then
		raise Exception.Create('');

  //Get the actual size of the allocated buffer.
  hr:= pAudioClient.GetBufferSize(@bufferFrameCount);
  if Failed(hr) then
    raise Exception.Create('');

  hr:= pAudioClient.GetService(IID_IAudioRenderClient, @pRenderClient);
  if Failed(hr) then
    raise Exception.Create('');

  //Grab the entire buffer for the initial fill operation.
  hr:= pRenderClient.GetBuffer(bufferFrameCount, @pData);
  if Failed(hr) then
    raise Exception.Create('');

  //Load the initial data into the shared buffer.
  hr:= pMySource.LoadData(bufferFrameCount, pData, @flags);

  hr:= pRenderClient.ReleaseBuffer(bufferFrameCount, flags);

  //Calculate the actual duration of the allocated buffer.
  hnsActualDuration:= (REFTIMES_PER_SEC * bufferFrameCount) / pwfx.nSamplesPerSec;
                        
  //Start playing.
  hr:= pAudioClient.Start(); 
 
  //Each loop fills about half of the shared buffer.
	while (flags <> AUDCLNT_BUFFERFLAGS_SILENT) do
    begin
      //Sleep for half the buffer duration.
      Sleep(round((hnsActualDuration / REFTIMES_PER_MILLISEC) / 2));

      //See how much buffer space is available.
      hr:= pAudioClient.GetCurrentPadding(@numFramesPadding);
      if Failed(hr) then
				raise Exception.Create('');

      numFramesAvailable:= bufferFrameCount - numFramesPadding;

      //Grab all the available space in the shared buffer.
      hr:= pRenderClient.GetBuffer(numFramesAvailable, @pData);
      if Failed(hr) then
        raise Exception.Create('');

      //Get next 1/2-second of data from the audio source.
      hr:= pMySource.LoadData(numFramesAvailable, pData, @flags);
			if Failed(hr) then
				raise Exception.Create('');

      hr:= pRenderClient.ReleaseBuffer(numFramesAvailable, flags);
      if Failed(hr) then
        raise Exception.Create('');
    end;

  //Wait for last data in buffer to play before stopping.
  Sleep(Round((hnsActualDuration / REFTIMES_PER_MILLISEC) / 2));

  //Stop playing.
  hr:= pAudioClient.Stop();

finally
  SAFE_RELEASE(pEnumerator);
  SAFE_RELEASE(pDevice);
  SAFE_RELEASE(pAudioClient);
  SAFE_RELEASE(pRenderClient);

  Result:= hr;
end;
end;
}

//Get a reference to the endpoint of the default communication device for rendering an audio stream.
function GetDefaultComDeviceEndPoint: HRESULT;
var
	_pdeviceEnumerator: IMMDeviceEnumerator;
	_DefaultAudioEndpoint: IMMDevice;
	_hr: HRESULT;

begin
try
	_hr:= CoCreateInstance(CLSID_MMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, _pdeviceEnumerator);
	if Failed(_hr) then
		Exit;

	_hr:= _pdeviceEnumerator.GetDefaultAudioEndpoint(eRender,	eCommunications, _DefaultAudioEndpoint);
	if Failed(_hr) then
		Exit;
finally
	Result:= _hr;
end;
end;

//
function GetImmDeviceName(const Device: IMMDevice; out deviceName: string): HRESULT;
var
	_PropertyStore: IPropertyStore;
	_var: TPropVariant;
	_hr: HRESULT;

begin
	deviceName:= '';
try
	_hr:= Device.OpenPropertyStore(STGM_READ, _PropertyStore);
	if SUCCEEDED(_hr) then
		begin
			// Get the DirectSound or DirectSoundCapture device GUID
			// (in WCHAR string format) for the endpoint device.
			_hr:= _PropertyStore.GetValue(PKEY_Device_FriendlyName, _var);
			if Failed(_hr) then
				exit
			else
				deviceName:= string(_var.pwszVal);
		end;
finally
	Result:= _hr;
end;
end;

//-----------------------------------------------------------
// Create a DirectShow audio rendering filter that
// encapsulates the audio endpoint device that is currently
// assigned to the specified device role.
// Source: http://msdn.microsoft.com/en-us/library/windows/desktop/dd370815(v=vs.85).aspx
//-----------------------------------------------------------
function CreateDShowAudioRenderer(const role: eRole; out ppAudioRenderer: IBaseFilter): HRESULT;
const
	// This application's audio session GUID
	guidAudioSessionId: TGUID = '{b13ff52e-a5cf-4fca-9fc3-42265b0b14fb}';

var
	_hr: HRESULT;
	_daap: PDIRECTX_AUDIO_ACTIVATION_PARAMS;
	_pVar: TPropVariant;
	_pEnumerator: IMMDeviceEnumerator;
	_pDevice: IMMDevice;

begin
  _hr:= S_OK;

try   
  if not Assigned(ppAudioRenderer) then
		result:= E_POINTER;

  // Activate the IBaseFilter interface on the
  // audio renderer with the specified role.
	_hr:= CoCreateInstance(CLSID_MMDeviceEnumerator,
													nil, CLSCTX_INPROC_SERVER,
													IID_IMMDeviceEnumerator,
													IUnknown(_pEnumerator));
	if Failed(_hr) then
		exit;

	_hr:= _pEnumerator.GetDefaultAudioEndpoint(eRender, role, _pDevice);
                                              
  if Failed(_hr) then
		exit;

  // daap  DIRECTX_AUDIO_ACTIVATION_PARAMS
	_daap.cbDirectXAudioActivationParams:= SizeOf(_daap);
	_daap.guidAudioSession:= guidAudioSessionId;
	_daap.dwAudioStreamFlags:= AUDCLNT_STREAMFLAGS_CROSSPROCESS;

	//
	PropVariantInit(_pVar);

	_pVar.vt:= VT_BLOB;
	_pVar.blob.cbSize:= SizeOf(_daap);
	_pVar.blob.pBlobData:= @_daap;

	_hr:= _pDevice.Activate(IID_IBaseFilter,
													 CLSCTX_ALL, @_pVar,
													 IUnknown(ppAudioRenderer));
	if Failed(_hr) then
    exit;

finally
		SAFE_RELEASE(_pEnumerator);
		SAFE_RELEASE(_pDevice);
    Result:= _hr;
end;
end;


//-----------------------------------------------------------
// Get the DirectSound or DirectSoundCapture device GUID for
// an audio endpoint device. If flow = eRender, the function
// gets the DirectSound device GUID for the rendering device
// with the specified device role. If flow = eCapture, the
// function gets the DirectSoundCapture device GUID for the
// capture device with the specified device role.
// Source: http://msdn.microsoft.com/en-us/library/windows/desktop/dd370817(v=vs.85).aspx
//-----------------------------------------------------------
function GetDirectSoundGuid(const flow: eDataFlow; const role: eRole; out pDevGuid: TGuid): HRESULT;
var
	_hr: HRESULT;
	_pEnumerator: IMMDeviceEnumerator;
	_pDevice: IMMDevice;
  _pProps: IPropertyStore;
	_pVar: TPropVariant;

begin
	_hr:= S_OK;
try
	PropVariantInit(_pVar);

	if (SizeOf(pDevGuid) = 0) then
		Result:= E_POINTER;

  // Get a device enumerator for the audio endpoint
  // devices in the system.
  _hr:= CoCreateInstance(CLSID_MMDeviceEnumerator,
													nil, CLSCTX_INPROC_SERVER,
													IID_IMMDeviceEnumerator,
													IUnknown(_pEnumerator));
  if Failed(_hr) then
    exit;

  // Get the endpoint device with the specified dataflow
  // direction (eRender or eCapture) and device role.
  _hr:= _pEnumerator.GetDefaultAudioEndpoint(flow, role, _pDevice);
  if Failed(_hr) then
    exit;

	_hr:= _pDevice.OpenPropertyStore(STGM_READ, _pProps);
  if Failed(_hr) then
    exit;

  // Get the DirectSound or DirectSoundCapture device GUID
  // (in WCHAR string format) for the endpoint device.
	_hr:= _pProps.GetValue(PKEY_AudioEndpoint_GUID, _pVar);
  if Failed(_hr) then
		exit;

  // Convert the WCHAR string to a GUID structure.
	_hr:= CLSIDFromString(_pVar.pwszVal, pDevGuid);
  if Failed(_hr) then
    exit;

finally
		PropVariantClear(_pVar);
    SAFE_RELEASE(_pEnumerator);
    SAFE_RELEASE(_pDevice);
    SAFE_RELEASE(_pProps);
    Result:= _hr;
end;
end;

end.
