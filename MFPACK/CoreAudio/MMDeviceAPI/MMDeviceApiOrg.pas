// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: Media Foundation interfaces - MMDeviceApi.pas
// Kind: Pascal Unit
// Release date: 27-06-2012
// Language: ENU
//
// Version: 1.0.0.2 
// Description: Requires Windows Vista or later. 
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony (maXcomX)
// EditDate: updt 270612a
//
// Remarks:
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: -
// =============================================================================
// Source: mmdeviceapi.h
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

unit MMDeviceApiOrg;

	{$MINENUMSIZE 4}
	{$WEAKPACKAGEUNIT}

interface

uses
	Windows, ActiveX, ComObj, PropSys, DeviceTopology, DXTypes, MMSystem, WinError;

const
	//Error types
	{$EXTERNALSYM E_NOTFOUND}
	E_NOTFOUND                          = HRESULT(ERROR_NOT_FOUND);
	{$EXTERNALSYM E_UNSUPPORTED_TYPE}
	E_UNSUPPORTED_TYPE                  = HRESULT(ERROR_UNSUPPORTED_TYPE);

	//The DEVICE_STATE_XXX constants indicate the current state of an audio endpoint device.
	{$EXTERNALSYM DEVICE_STATE_ACTIVE}
	DEVICE_STATE_ACTIVE                 = $00000001;  //The audio endpoint device is active.
																										//That is, the audio adapter that connects to the endpoint device is present and enabled.
																										//In addition, if the endpoint device plugs into a jack on the adapter,
																										//then the endpoint device is plugged in.
	{$EXTERNALSYM DEVICE_STATE_DISABLED}
	DEVICE_STATE_DISABLED               = $00000002;  //The audio endpoint device is disabled.
																										//The user has disabled the device in the Windows multimedia control panel,
																										//Mmsys.cpl.

  {$EXTERNALSYM DEVICE_STATE_NOTPRESENT}
	DEVICE_STATE_NOTPRESENT             = $00000004;  //The audio endpoint device is not present because the audio adapter that connects to
																										//the endpoint device has been removed from the system,
																										//or the user has disabled the adapter device in Device Manager.

	{$EXTERNALSYM DEVICE_STATE_UNPLUGGED}
	DEVICE_STATE_UNPLUGGED              = $00000008;  //The audio endpoint device is unplugged.
																										//The audio adapter that contains the jack for the endpoint device is present and enabled,
																										//but the endpoint device is not plugged into the jack.
																										//Only a device with jack-presence detection can be in this state.
																										//For more information about jack-presence detection, see Audio Endpoint Devices.

	{$EXTERNALSYM DEVICE_STATEMASK_ALL}
	DEVICE_STATEMASK_ALL                = $0000000F;  //Includes audio endpoint devices in all states—active, disabled, not present, and unplugged.


	//PKEY_AUDIOENDPOINT_XXX
	//Indicates the physical attributes of the audio endpoint device.
	PKEY_AudioEndpoint_FormFactor: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 0);
	//Specifies the CLSID of the registered provider of the device-properties extension for the audio endpoint device.
	PKEY_AudioEndpoint_ControlPanelPageProvider: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 1);
	//Associates a kernel-streaming (KS) pin category with an audio endpoint device.
	PKEY_AudioEndpoint_Association: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 2);
	//Defines the physical speaker configuration for the audio endpoint device.
	PKEY_AudioEndpoint_PhysicalSpeakers: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 3);
	//Specifies the CLSID of the registered provider of the device-properties extension for the audio endpoint device.
	PKEY_AudioEndpoint_GUID: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 4);
	//FX - Indicates whether system effects are enabled in the shared-mode stream that flows to or from the audio endpoint device.
	//Note: You may also access the DirectSound FX interfaces to do this. (See also: DSFx.pas (not included with Media Foundation))
	PKEY_AudioEndpoint_Disable_SysFx: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 5);

	ENDPOINT_SYSFX_ENABLED 						= $00000000;  // System Effects are enabled.
	ENDPOINT_SYSFX_DISABLED 					= $00000001;  // System Effects are disabled.

	//Specifies the channel-configuration mask for the full-range speakers that are connected to the audio endpoint device.
	PKEY_AudioEndpoint_FullRangeSpeakers: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 6);
	//Indicates whether the endpoint supports the event-driven mode. The values are populated by the OEM in an .inf file.
	PKEY_AudioEndpoint_Supports_EventDriven_Mode: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 7);
	//Contains an output category GUID for an audio endpoint device.
	PKEY_AudioEndpoint_JackSubType: PROPERTYKEY = (
								fmtid: (D1:$1da5d803; D2:$d492; D3:$4edd;
								D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
								pid: 8);

	//The following properties are defined in Functiondiscoverykeys_devpkey.h in Windows Vista and later.
	//
	PKEY_Device_FriendlyName: PROPERTYKEY = (
								fmtid: (D1:$a45c254e; D2:$df1c; D3:$4efd;
								D4: ($80, $20, $67, $d1, $46, $a8, $50, $e0));
								pid: 14);

	//PKEY_AudioEndpoint_XXX
	PKEY_AudioEngine_DeviceFormat: PROPERTYKEY = (
								fmtid: (D1:$f19f064d; D2:$82c; D3:$4e27;
								D4: ($bc, $73, $68, $82, $a1, $bb, $8e, $4c));
								pid: 0);
	PKEY_AudioEngine_OEMFormat: PROPERTYKEY = (
								fmtid: (D1:$e4870e26; D2:$3cc5; D3:$4cd2;
								D4: ($ba, $46, $ca, $a, $9a, $70, $ed, $4));
								pid: 3);


	//IID
	CLSID_MMDeviceEnumerator              : TGUID = '{BCDE0395-E52F-467C-8E3D-C4579291692E}';
	IID_IMMDeviceEnumerator               : TGUID = '{A95664D2-9614-4F35-A746-DE8DB63617E6}';
	IID_IMMDevice                         : TGUID = '{D666063F-1587-4E43-81F1-B948E807363F}';
	IID_IMMDeviceCollection               : TGUID = '{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}';


type
	LPCGUID = PGUID;   //See: ComObj for TGuid specs
	HANDLE = System.THandle;

  //Note: Skip the auto wrapper classnames generated for COM enumerations (__MIDL___MIDL_itf_name_xxx_xxx)
	//Also the generated pointers and Tobjects, because they are of little use here, and when needed, you need them localy most of the time.
	//Example: A pointer to EDataFlow will be: PEDataFlow = ^EDataFlow and a TEDataFlow = EDataFlow  etc.

type
	{$EXTERNALSYM tagDIRECTX_AUDIO_ACTIVATION_PARAMS}
	tagDIRECTX_AUDIO_ACTIVATION_PARAMS = record
		cbDirectXAudioActivationParams: DWORD;
		guidAudioSession: TGUID;
    dwAudioStreamFlags: DWORD;
  end;
  {$EXTERNALSYM DIRECTX_AUDIO_ACTIVATION_PARAMS}
  DIRECTX_AUDIO_ACTIVATION_PARAMS = tagDIRECTX_AUDIO_ACTIVATION_PARAMS;
	{$EXTERNALSYM PDIRECTX_AUDIO_ACTIVATION_PARAMS}
	PDIRECTX_AUDIO_ACTIVATION_PARAMS = ^tagDIRECTX_AUDIO_ACTIVATION_PARAMS;

type
	{$EXTERNALSYM EDataFlow}
	_tagEDataFlow = (
		eRender              = 0,
		eCapture             = (eRender + 1),
		eAll                 = (eCapture + 1),
		EDataFlow_enum_count = (eAll + 1)      //
  );
	EDataFlow = _tagEDataFlow;

type
	//ERole
	_tagERole = (
		eConsole         = 0,
		eMultimedia      = (eConsole  + 1),
		eCommunications  = (eMultimedia  + 1),
		ERole_enum_count = (eCommunications  + 1)
	);
	{$EXTERNALSYM ERole}
	ERole = _tagERole;

type
	//EndpointFormFactor enum
	_tagEndpointFormFactor = (
		RemoteNetworkDevice           = 0,
		Speakers                      = (RemoteNetworkDevice  + 1),
    LineLevel                     = (Speakers  + 1),
		Headphones                    = (LineLevel  + 1),
    Microphone                    = (Headphones  + 1),
    Headset                       = (Microphone  + 1),
    Handset                       = (Headset  + 1),
		UnknownDigitalPassthrough     = (Handset  + 1),
    SPDIF                         = (UnknownDigitalPassthrough  + 1),
    DigitalAudioDisplayDevice     = (SPDIF  + 1),
		UnknownFormFactor             = (DigitalAudioDisplayDevice  + 1),
		EndpointFormFactor_enum_count = (UnknownFormFactor  + 1)
  );
	{$EXTERNALSYM EndpointFormFactor}
	EndpointFormFactor = _tagEndpointFormFactor;


type
	//Forward declarations of the interfaces
	{$EXTERNALSYM IMMNotificationClient}
	IMMNotificationClient = interface;
	{$EXTERNALSYM IMMDevice}
	IMMDevice = interface;
	{$EXTERNALSYM IMMDeviceCollection}
	IMMDeviceCollection = interface;
	{$EXTERNALSYM IMMEndpoint}
	IMMEndpoint = interface;
	{$EXTERNALSYM IMMDeviceEnumerator}
  IMMDeviceEnumerator = interface;
	{$EXTERNALSYM IMMDeviceActivator}
	IMMDeviceActivator = interface;
	//{$EXTERNALSYM MMDeviceEnumerator}
	//MMDeviceEnumerator = class;


  //Interface IMMNotificationClient
  {
   The IMMNotificationClient interface provides notifications when an audio endpoint device
   is added or removed, when the state or properties of an endpoint device change,
   or when there is a change in the default role assigned to an endpoint device.
   Unlike the other interfaces in this section, which are implemented by the MMDevice API system component,
   an MMDevice API client implements the IMMNotificationClient interface.
   To receive notifications, the client passes a pointer to its IMMNotificationClient interface instance
   as a parameter to the IMMDeviceEnumerator.RegisterEndpointNotificationCallback method.
  }
	IMMNotificationClient = interface(IUnknown)
	['{7991EEC9-7E89-4D85-8390-6C703CEC60C0}']
		function OnDefaultDeviceChanged(flow: EDataFlow; role: ERole; pwstrDefaultDevice: PAnsiChar): HRESULT; stdcall;
		function OnDeviceAdded(pwstrDeviceId: PAnsiChar): HRESULT; stdcall;
		function OnDeviceRemoved(pwstrDeviceId: PAnsiChar): HRESULT; stdcall;
		function OnDeviceStateChanged(pwstrDeviceIdl: PAnsiChar; dwNewState: DWord): HRESULT; stdcall;
		function OnPropertyValueChanged(pwstrDeviceId: PAnsiChar; const key: PPROPERTYKEY): HRESULT; stdcall;
	end;

  //Interface IMMDevice
  {
   The IMMDevice interface encapsulates the generic features of a multimedia device resource.
   In the current implementation of the MMDevice API, the only type of device resource that an
   IMMDevice interface can represent is an audio endpoint device.

   NOTE:
    A client can obtain an IMMDevice interface from one of the following methods:
      IMMDeviceCollection.Item
      IMMDeviceEnumerator.GetDefaultAudioEndpoint
      IMMDeviceEnumerator.GetDevice
  }
	IMMDevice = interface(IUnknown)
	['{D666063F-1587-4E43-81F1-B948E807363F}']
		function Activate(const iid: TGUID; dwClsCtx: UINT; pActivationParams: PPropVariant; out ppInterface: IUnknown): HRESULT; stdcall;
		function OpenPropertyStore(stgmAccess: integer; out ppProperties: IPropertyStore): HRESULT; stdcall;
		function GetId(ppstrId: LPWSTR): HRESULT; stdcall;
		function GetState(var pdwState: UINT): HRESULT; stdcall;
	end;

  //Interface IMMDeviceCollection
  {
   The IMMDeviceCollection interface represents a collection of multimedia device resources.
   In the current implementation, the only device resources that the MMDevice API can create collections
   of are audio endpoint devices.
   A client can obtain a reference to an IMMDeviceCollection interface instance by calling the
   IMMDeviceEnumerator.EnumAudioEndpoints method.
   This method creates a collection of endpoint objects, each of which represents an
   audio endpoint device in the system.
   Each endpoint object in the collection supports the IMMDevice and IMMEndpoint interfaces.
  }
	IMMDeviceCollection = interface(IUnknown)
	['{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}']
		function GetCount(var pcDevices: UINT): HRESULT; stdcall;
		function Item(nDevice: uint; out ppDevice: IMMDevice): HRESULT; stdcall;
	end;

  //Interface IMMEndpoint
  {
   The IMMEndpoint interface represents an audio endpoint device.
   A client obtains a reference to an IMMEndpoint interface instance by following these steps:
    By using one of the techniques described in IMMDevice Interface,
    obtain a reference to the IMMDevice interface of an audio endpoint device.
   Call the IMMDevice.QueryInterface method with parameter iid set to REFIID IID_IMMEndpoint.
  }
	IMMEndpoint = interface(IUnknown)
	['{1BE09788-6894-4089-8586-9A2A6C265AC5}']
		function GetDataFlow(out pDataFlow: eDataFlow): HRESULT; stdcall;
	end;

  //Interface IMMDeviceEnumerator
  {
   The IMMDeviceEnumerator interface provides methods for enumerating multimedia device resources.
   In the current implementation of the MMDevice API, the only device resources that this interface
   can enumerate are audio endpoint devices.
   A client obtains a reference to an IMMDeviceEnumerator interface by calling the CoCreateInstance function,
   as described previously (see MMDevice API).

   NOTE:
     The device resources enumerated by the methods in the IMMDeviceEnumerator interface are represented
     as collections of objects with IMMDevice interfaces.
     A collection has an IMMDeviceCollection interface.
     The IMMDeviceEnumerator.EnumAudioEndpoints method creates a device collection.

   To obtain a pointer to the IMMDevice interface of an item in a device collection,
   the client calls the IMMDeviceCollection.Item method.
  }
	IMMDeviceEnumerator = interface(IUnknown)
	['{A95664D2-9614-4F35-A746-DE8DB63617E6}']
		function EnumAudioEndpoints(dataFlow: EDataFlow; dwStateMask: DWORD; out ppDevices: IMMDeviceCollection): HRESULT; stdcall;
		function GetDefaultAudioEndpoint(dataFlow: EDataFlow; role: eRole; out ppEndpoint: IMMDevice): HRESULT; stdcall;
		function GetDevice(pwstrId: PWChar; out ppDevice: IMMDevice): HRESULT; stdcall;
		function RegisterEndpointNotificationCallback(var pClient: IMMNotificationClient): HRESULT; stdcall;
		function UnregisterEndpointNotificationCallback(var pClient: IMMNotificationClient): HRESULT; stdcall;
	end;

  //Interface IMMDeviceActivator
  {

  }
	IMMDeviceActivator = interface(IUnknown)
	['{3B0D0EA4-D0A9-4B0E-935B-09516746FAC0}']
		function Activate(const iid: REFIID; const pDevice: IMMDevice; const pActivationParams: PROPVARIANT; out ppInterface: Pointer): HRESULT; stdcall;
	end;

implementation

end.
