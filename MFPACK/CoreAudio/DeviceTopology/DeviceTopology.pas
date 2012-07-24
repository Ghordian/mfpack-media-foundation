// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: DeviceTopology.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later. 
//              DeviceTopology API, provides client applications with the ability to traverse 
//              the functional hardware topologies of audio rendering and capture devices. 
//
// Intiator(s): Tony (maXcomX), Peter (OzShips)
// 
// LastEdited by: Tony
// EditDate: updt 010712a
//
// Remarks:  Until now most functions are implemented.
//           Future releases will be conform the appropiate header translations.
//
//          Delphi : The IUnknown entries of functions should be casted like this:
//                   IUnknown(Pointer), IUnknown(Object), IUnknown(Nil) etc.
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: Add minor changes.
// =============================================================================
// Source: devicetopology.h
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

unit DeviceTopology;

{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

interface

uses
	Windows, ActiveX, ComObj, DXTypes, MMSystem;


const
  {$EXTERNALSYM IID_IKsControl}
	IID_IKsControl									: TGUID = '{28F54685-06FD-11D2-B27A-00A0C9223196}'; //Deprecated
	IID_IControlChangeNotify       	: TGUID = '{A09513ED-C709-4d21-BD7B-5F34C47F3947}';
	IID_IControlInterface          	: TGUID = '{45d37c3f-5140-444a-ae24-400789f3cbf3}';
	IID_IConnector									: TGUID = '{9c2c4058-23f5-41de-877a-df3af236a09e}';
	IID_IDeviceTopology            	: TGUID = '{2A07407E-6497-4A18-9787-32F79BD0D98F}';
	IID_IPart                      	: TGUID = '{AE2DE0E4-5BCA-4F2D-AA46-5D13F8FDB3A9}';
	IID_IPartsList                 	: TGUID = '{6DAA848C-5EB0-45CC-AEA5-998A2CDA1FFB}';
	IID_ISubUnit 										: TGUID = '{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}';
	IID_IAudioAutoGainControl 			: TGUID = '{85401FD4-6DE4-4b9d-9869-2D6753A82F3C}';
	IID_IAudioPeakMeter 						: TGUID = '{DD79923C-0599-45e0-B8B6-C8DF7DB6E796}';
	IID_IDeviceSpecificProperty     : TGUID = '{3B22BCBF-2586-4af0-8583-205D391B807C}';

	IID_IPerChannelDbLevel          : TGUID = '{85401FD4-6DE4-4b9d-9869-2D6753A82F3C}';
	IID_IAudioBass 									: TGUID = '{A2B1A1D9-4DB3-425D-A2B2-BD335CB3E2E5}';
	IID_IAudioMidrange							: TGUID = '{5E54B6D7-B44B-40D9-9A9E-E691D9CE6EDF}';
	IID_IAudioTreble								: TGUID = '{0A717812-694E-4907-B74B-BAFA5CFDCA7B}';
	IID_IAudioVolumeLevel						: TGUID = '{7FB7B48F-531D-44A2-BCB3-5AD5A134B3DC}';

	IID_IAudioChannelConfig 				: TGUID = '{BB11C46F-EC28-493C-B88A-5DB88062CE98}';
	IID_IAudioLoudness 							: TGUID = '{7D8B1437-DD53-4350-9C1B-1EE2890BD938}';
	IID_IAudioOutputSelector				: TGUID = '{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}';
	IID_IAudioInputSelector					: TGUID = '{4F03DC02-5E6E-4653-8F72-A030C123D598}';

	IID_IKsFormatSupport 						: TGUID = '{3CB4A69D-BB6F-4D2B-95B7-452D2C155DB5}';
	IID_IKsJackDescription 					: TGUID = '{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}';
	IID_IKsJackDescription2 				: TGUID = '{478F3A9B-E0C9-4827-9228-6F5505FFE76A}';
	IID_IKsJackSinkInformation 			: TGUID = '{D9BD72ED-290F-4581-9FF3-61027A8FE532}';

	//Flag for clients of IControlChangeNotify.OnNotify to allow those clients to
	//identify hardware initiated notifications.
	DEVTOPO_HARDWARE_INITIATED_EVENTCONTEXT = ' draH ';
	EVENTCONTEXT_VOLUMESLIDER 			: TGUID = '{E2C2E9DE-09B1-4B04-84E5-07931225EE04}';


// Enum Structs
type
	ULONG =	Cardinal;
	LONG = Integer;


	GUID = record
		Data1: LongInt;
		Data2: Integer;
		Data3: Integer;
		Data4: array[0..7] of Byte;
	end;
	{$EXTERNALSYM GUID}
	REFIID = GUID; //check if this should be "TGUID"
	{$EXTERNALSYM LPCGUID}
	LPCGUID = ^GUID;
	refguid = GUID;


	KSDATAFORMAT = record
		FormatSize: ULONG;
		Flags: ULONG;
		SampleSize: ULONG;
    Reserved: ULONG;
		MajorFormat: GUID;
		SubFormat: GUID;
		Specifier: GUID;
  end;
	{$EXTERNALSYM KSDATAFORMAT}
	PKSDATAFORMAT = ^KSDATAFORMAT;


	//Is also defined in directShow9.pas
	KSIDENTIFIER = record
		case Integer of
      0: (
        Set_  : TGUID;
        Id    : ULONG;
        Flags : ULONG);
      1: (
        Alignment : int64);
	end;
	{$EXTERNALSYM KSIDENTIFIER}
	PKSIDENTIFIER = ^KSIDENTIFIER;
	{$EXTERNALSYM KSPROPERTY}
	KSPROPERTY = KSIDENTIFIER;
	PKSPROPERTY = ^KSPROPERTY;
	{$EXTERNALSYM KSMETHOD}
	KSMETHOD = KSIDENTIFIER;
	PKSMETHOD = ^KSMETHOD;
	{$EXTERNALSYM KSEVENT}
	KSEVENT = KSIDENTIFIER;
	PKSEVENT = ^KSEVENT;

	_tagEPcxConnectionType = (
		eConnTypeUnknown               = 0,
		eConnType3Point5mm             = (eConnTypeUnknown  + 1),
		eConnTypeQuarter               = (eConnType3Point5mm  + 1),
		eConnTypeAtapiInternal         = (eConnTypeQuarter  + 1),
		eConnTypeRCA                   = (eConnTypeAtapiInternal  + 1),
		eConnTypeOptical               = (eConnTypeRCA  + 1),
    eConnTypeOtherDigital          = (eConnTypeOptical  + 1),
    eConnTypeOtherAnalog           = (eConnTypeOtherDigital  + 1),
    eConnTypeMultichannelAnalogDIN = (eConnTypeOtherAnalog  + 1),
    eConnTypeXlrProfessional       = (eConnTypeMultichannelAnalogDIN  + 1),
    eConnTypeRJ11Modem             = (eConnTypeXlrProfessional  + 1),
    eConnTypeCombination           = (eConnTypeRJ11Modem  + 1)
  );
	{$EXTERNALSYM ePcxConnectionType}
	EPcxConnectionType = _tagEPcxConnectionType;
	{$EXTERNALSYM PePcxConnectionType}
	PePcxConnectionType = ^EPcxConnectionType;


	_tagEPcxGeoLocation = (
		eGeoLocRear             = $1,
		eGeoLocFront            = (eGeoLocRear  + 1),
		eGeoLocLeft             = (eGeoLocFront  + 1),
    eGeoLocRight            = (eGeoLocLeft  + 1),
    eGeoLocTop              = (eGeoLocRight  + 1),
    eGeoLocBottom           = (eGeoLocTop  + 1),
    eGeoLocRearPanel        = (eGeoLocBottom  + 1),
		eGeoLocRiser            = (eGeoLocRearPanel  + 1),
		eGeoLocInsideMobileLid  = (eGeoLocRiser  + 1),
    eGeoLocDrivebay         = (eGeoLocInsideMobileLid  + 1),
    eGeoLocHDMI             = (eGeoLocDrivebay  + 1),
    eGeoLocOutsideMobileLid = (eGeoLocHDMI  + 1),
    eGeoLocATAPI            = (eGeoLocOutsideMobileLid  + 1),
    eGeoLocReserved5        = (eGeoLocATAPI  + 1),
    eGeoLocReserved6        = (eGeoLocReserved5  + 1)
	);
	{$EXTERNALSYM EPcxGeoLocation}
	EPcxGeoLocation = _tagEPcxGeoLocation;
	{$EXTERNALSYM PEPcxGeoLocation}
	PEPcxGeoLocation = ^EPcxGeoLocation;


	_tagEPcxGenLocation = (
		eGenLocPrimaryBox = 0,
		eGenLocInternal   = (eGenLocPrimaryBox  + 1),
		eGenLocSeparate   = (eGenLocInternal  + 1),
		eGenLocOther      = (eGenLocSeparate  + 1)
  );
	{$EXTERNALSYM ePcxGenLocation}
	EPcxGenLocation = _tagEPcxGenLocation;
	{$EXTERNALSYM PePcxGenLocation}
	PePcxGenLocation = ^EPcxGenLocation;


	_tagePxcPortConnection = (
		ePortConnJack                  = 0,
		ePortConnIntegratedDevice      = (ePortConnJack  + 1),
		ePortConnBothIntegratedAndJack = (ePortConnIntegratedDevice  + 1),
		ePortConnUnknown               = (ePortConnBothIntegratedAndJack  + 1)
	);
	{$EXTERNALSYM ePxcPortConnection}
	ePxcPortConnection = _tagEPxcPortConnection;
	{$EXTERNALSYM PePxcPortConnection}
	PEPxcPortConnection = ^ePxcPortConnection;


	{$EXTERNALSYM KSJACK_DESCRIPTION}
	KSJACK_DESCRIPTION = record
		ChannelMapping: DWORD;
		Color: COLORREF;
		ConnectionType: EPcxConnectionType;
		GeoLocation: ePcxGeoLocation;
		GenLocation: ePcxGenLocation;
		PortConnection: EPxcPortConnection;
		IsConnected: BOOL;
	end;
	{$EXTERNALSYM PKsjackDescription}
	PKsjackDescription = ^KSJACK_DESCRIPTION;


	{$EXTERNALSYM LUID}
	LUID = record
		LowPart: DWORD;
		HighPart: LONG;
	end;
	{$EXTERNALSYM PLuid}
	PLuid = ^LUID;


	_tagKSJACK_SINK_CONNECTIONTYPE = (
		KSJACK_SINK_CONNECTIONTYPE_HDMI        = 0,
		KSJACK_SINK_CONNECTIONTYPE_DISPLAYPORT = (KSJACK_SINK_CONNECTIONTYPE_HDMI + 1)
	);
	{$EXTERNALSYM KSJACK_SINK_CONNECTIONTYPE}
	KSJACK_SINK_CONNECTIONTYPE = _tagKSJACK_SINK_CONNECTIONTYPE;
	{$EXTERNALSYM PKSJACK_SINK_CONNECTIONTYPE}
	PKSJACK_SINK_CONNECTIONTYPE = ^KSJACK_SINK_CONNECTIONTYPE;


	{$EXTERNALSYM _tagKSJACK_SINK_INFORMATION}
	_tagKSJACK_SINK_INFORMATION = record
		ConnType: KSJACK_SINK_CONNECTIONTYPE;
		ManufacturerId: WORD;
		ProductId: WORD;
		AudioLatency: WORD;
    HDCPCapable: BOOL;
    AICapable: BOOL;
    SinkDescriptionLength: UCHAR;
		SinkDescription: array[0..31] of WideChar;
		PortId: LUID;
  end;
	{$EXTERNALSYM KSJACK_SINK_INFORMATION}
	KSJACK_SINK_INFORMATION = _tagKSJACK_SINK_INFORMATION;
	PKSJACK_SINK_INFORMATION = ^KSJACK_SINK_INFORMATION;


	{$EXTERNALSYM _tagKSJACK_DESCRIPTION2}
	_tagKSJACK_DESCRIPTION2 = record
		DeviceStateInfo: DWORD;
		JackCapabilities: DWORD;
  end;
  {$EXTERNALSYM KSJACK_DESCRIPTION2}
	KSJACK_DESCRIPTION2 = _tagKSJACK_DESCRIPTION2;
	PKSJACK_DESCRIPTION2 = ^KSJACK_DESCRIPTION2;

	_tagDataFlow = (
		_In  = 0,             //In
		_Out = (_In  + 1)     //Out
	);
	{$EXTERNALSYM DataFlow}
	DataFlow = _tagDataFlow;


	_tagPartType = (
		Connector = 0,
		Subunit   = (Connector  + 1)
  );
	{$EXTERNALSYM PartType}
	PartType = _tagPartType;
	{$EXTERNALSYM PPartType}
	PPartType = PartType;


type
	_tagConnectorType = (
		Unknown_Connector = 0,
		Physical_Internal = (Unknown_Connector  + 1),
		Physical_External = (Physical_Internal  + 1),
		Software_IO       = (Physical_External  + 1),
    Software_Fixed    = (Software_IO  + 1),
		Network           = (Software_Fixed  + 1)
	);
	{$EXTERNALSYM ConnectorType}
	ConnectorType = _tagConnectorType;
	{$EXTERNALSYM PConnectorType}
	PConnectorType = ^ConnectorType;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

type

	//Forward declarations of interfaces defined in the type library

	IKsControl = interface; //Deprecated.
	IKsFormatSupport = interface;
	IKsJackDescription = interface;  //Vista
	IKsJackDescription2 = interface; //Win >=7
	IKsJackSinkInformation = interface;

	IPart = interface;
	IControlInterface = interface;
	IControlChangeNotify = interface;
	IConnector = interface;
	IAudioAutoGainControl = interface;
	IDeviceTopology = interface;
	IPartsList = interface;
	ISubUnit = interface;
	IPerChannelDbLevel = interface;
	IAudioOutputSelector = interface;
	IAudioInputSelector = interface;
	IAudioPeakMeter = interface;
	IAudioVolumeLevel = interface;
	IAudioMute = interface;
	IAudioBass = interface;
	IAudioMidrange = interface;
	IAudioTreble = interface;
	IAudioChannelConfig = interface;
	IDeviceSpecificProperty = interface;
	IAudioLoudness = interface;


//Interfaces Type Library

	//This interface is deprecated as is all of DirectMusic.
	//Deprecated components are considered obsolete.
	//See: DirectShow9.pas
	IKsControl = interface(IUnknown)
	['{28F54685-06FD-11D2-B27A-00A0C9223196}']
	 function KsProperty(const ksProperty: PKSPROPERTY; const PropertyLength: ULONG; var PropertyData: Pointer; const DataLength: UINT; out BytesReturned: ULONG): HRESULT; stdcall;
	 function KsMethod(const Method: PKSMETHOD; const MethodLength: ULong; var MethodData: Pointer; const DataLength: ULong; out BytesReturned: ULong): HRESULT; stdcall;
	 function KsEvent(const {OPTIONAL}Event: PKSEVENT; const EventLength: ULONG; var EventData: Pointer; const DataLength: ULONG; out BytesReturned: ULONG): HRESULT; stdcall;
	end;

  //Represents a generic subunit control interface that provides per-channel control over the volume level,
	//in decibels, of an audio stream or of a frequency band in an audio stream.
	//A positive volume level represents gain, and a negative value represents attenuation.
	//Clients do not call the methods in this interface directly.
	//Instead, this interface serves as the base interface for the following interfaces, which clients do call directly:
	//IAudioBass Interface, IAudioMidrange Interface, IAudioTreble Interface, IAudioVolumeLevel Interface
	IPerChannelDbLevel = interface(IUnknown)
	['{85401FD4-6DE4-4b9d-9869-2D6753A82F3C}']
		function GetChannelCount(out pcChannels: UINT): HRESULT; stdcall;
		function GetLevel(const nChannel: UINT; out pfLevelDB: Single): HRESULT; stdcall;
		function GetLevelRange(const nChannel: UINT; out pfMinLevelDB: Single; out pfMaxLevelDB: Single; out pfStepping: Single): HRESULT; stdcall;
		function SetLevel(const nChannel: UINT;const fLevelDB: Single; const pguidEventContext: LPCGUID): HRESULT; stdcall;
		//The number of elements in the aLevelsDB array.
		//If this parameter does not match the number of channels in the audio stream,
		//the method fails without modifying the aLevelsDB array.
		function SetLevelAllChannels(const aLevelsDB: Single; const cChannels: ULONG; const pguidEventContext: LPCGUID): HRESULT; stdcall;
		function SetLevelUniform(const fLevelDB: Single; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

	//Inherited members from of IPerChannelDbLevel.
	//Those will only work, if the HARDWARE supports it!
  IAudioVolumeLevel = interface(IPerChannelDbLevel)
	['{7FB7B48F-531D-44A2-BCB3-5AD5A134B3DC}']
	end;

  //Provides access to a hardware channel-configuration control.
	IAudioChannelConfig = interface(IUnknown)
	['{BB11C46F-EC28-493C-B88A-5DB88062CE98}']
		function GetChannelConfig(out pdwConfig: DWord): HRESULT; stdcall;
		function SetChannelConfig(const dwConfig: DWord; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

  //
	IAudioLoudness = interface(IUnknown)
	['{7D8B1437-DD53-4350-9C1B-1EE2890BD938}']
		function GetEnabled(out pbEnabled: Boolean): HRESULT; stdcall;
		function SetEnabled(const bEnable: Boolean; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

  //Provides access to a hardware multiplexer control (input selector)
	IAudioInputSelector = interface(IUnknown)
	['{4F03DC02-5E6E-4653-8F72-A030C123D598}']
		function GetSelection(out pnIdSelected: UINT): HRESULT; stdcall;
		function SetSelection(const nIdSelect: UINT; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

  //Provides access to a hardware de-multiplexer control (output selector)
	IAudioOutputSelector = interface(IUnknown)
	['{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}']
		function GetSelection(out pnIdSelected: UINT): HRESULT; stdcall;
		function SetSelection(const nIdSelect: UINT; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

	//Also implemented in MMDEvApi
	IAudioMute = interface(IUnknown)
	['{DF45AEEA-B74A-4B6B-AFAD-2366B6AA012E}']
		//Original Delphi implementation : this will not work because a C++ BOOL = 4 bytes, Delphi Bool = 1 byte
		//function SetMute(bMute: bool; pguidEventContext: PGuid): HRESULT; stdcall;
		//function GetMute(var pbMute: bool): HRESULT; stdcall;
		//Improved functions  (See: CBOOL function @ Win78Mixer.pas)
		function SetMute(const bMute: DWORD; const pguidEventContext: PGuid): HRESULT; stdcall;
		function GetMute(var pbMute: DWORD): HRESULT; stdcall;
	end;

	//Inherited member from of IPerChannelDbLevel.
	//Those will only work, if the HARDWARE supports it!
	IAudioBass = interface(IPerChannelDbLevel)
	['{A2B1A1D9-4DB3-425D-A2B2-BD335CB3E2E5}']
	end;

  //Inherited member from of IPerChannelDbLevel.
	//Those will only work, if the HARDWARE supports it!
	IAudioMidrange = interface(IPerChannelDbLevel)
	['{5E54B6D7-B44B-40D9-9A9E-E691D9CE6EDF}']
	end;

  //Inherited member from of IPerChannelDbLevel.
	//Those will only work, if the HARDWARE supports it!
	IAudioTreble = interface(IPerChannelDbLevel)
	['{0A717812-694E-4907-B74B-BAFA5CFDCA7B}']
	end;

  //Provides access to a hardware automatic gain control (AGC)
	IAudioAutoGainControl = interface(IUnknown)
	['{85401FD4-6DE4-4b9d-9869-2D6753A82F3C}']
		function GetEnabled(out pbEnabled: Bool): HRESULT; stdcall;
		function SetEnabled(const bEnable: Bool; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

  //Provides access to a hardware peak-meter control.
	//When there is no hardware peakmeter, use: MMDevApi.IAudioMeterInformation, that supports both hardware and software
	IAudioPeakMeter = interface(IUnknown)
	['{DD79923C-0599-45e0-B8B6-C8DF7DB6E796}']
		function GetChannelCount(out pcChannels: UINT): HRESULT; stdcall;
		function GetLevel(const nChannel: UINT; out pfLevel: Single): HRESULT; stdcall;
	end;


	IDeviceSpecificProperty = interface(IUnknown)
	['{3B22BCBF-2586-4af0-8583-205D391B807C}']
		function Get4BRange(out plMin: LONG; out plMax: LONG; out plStepping: LONG): HRESULT; stdcall;
		function GetType(out pVType: TVarType): HRESULT; stdcall;
		function GetValue(out pvValue: Pointer; pcbValue: Dword): HRESULT; stdcall;
		function SetValue(const pvValue: Pointer; const cbValue: Dword; pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;

	//Provides information about the audio data formats that are supported by a software-configured I/O connection
	//(typically a DMA channel) between an audio adapter device and system memory.
	IKsFormatSupport = interface(IUnknown)
	['{3CB4A69D-BB6F-4D2B-95B7-452D2C155DB5}']
		function GetDevicePreferredFormat(out ppKsFormat: PKSDATAFORMAT): HRESULT; stdcall;
		//cbFormat = the size in bytes of the buffer that contains the format specifier.
		function IsFormatSupported(const pKsFormat: PKSDATAFORMAT; const cbFormat: DWord; pbSupported: Boolean): HRESULT; stdcall;
	end;

	////provides information about the jacks or internal connectors that provide a physical connection between
	//a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
	//This interface is implemented < Windows 7!
	IKsJackDescription = interface(IUnknown)
	['{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}']
		function GetJackCount(out pcJacks: UINT): HRESULT; stdcall;
		function GetJackDescription(const nJack: UINT; out pDescription: KSJACK_DESCRIPTION): HRESULT; stdcall;
	end;

	//provides information about the jacks or internal connectors that provide a physical connection between
	//a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
	//This interface is implemented >= Windows 7!
	IKsJackDescription2 = interface(IUnknown)
	['{478F3A9B-E0C9-4827-9228-6F5505FFE76A}']
		function GetJackCount(out pcJacks: UINT): HRESULT; stdcall;
		function GetJackDescription2(const nJack: UINT; pDescription2: KSJACK_DESCRIPTION2): HRESULT; stdcall;
	end;

	//Provides access to jack sink information if the jack is supported by the hardware.
	IKsJackSinkInformation = interface(IUnknown)
	['{D9BD72ED-290F-4581-9FF3-61027A8FE532}']
		function GetJackSinkInformation(out pJackSinkInformation: KSJACK_SINK_INFORMATION): HRESULT; stdcall;
	end;

	//
  IPartsList = interface(IUnknown)
	['{6DAA848C-5EB0-45CC-AEA5-998A2CDA1FFB}']
		function GetCount(out pCount: UINT): HRESULT; stdcall;
		function GetPart(const nIndex: UINT; out ppPart: IPart): HRESULT; stdcall;
	end;

	//Represents a part (connector or subunit) of a device topology.
	IPart = interface(IUnknown)
	['{AE2DE0E4-5BCA-4F2D-AA46-5D13F8FDB3A9}']
		//The interface id for the requested control function. The client should set this parameter to one of the following REFIID values:
		//IID_IAudioAutoGainControl, IID_IAudioBass, IID_IAudioChannelConfig, IID_IAudioInputSelector, IID_IAudioLoudness
		//IID_IAudioMidrange, IID_IAudioMute, IID_IAudioOutputSelector, IID_IAudioPeakMeter, IID_IAudioTreble, IID_IAudioVolumeLevel
		//IID_IDeviceSpecificProperty, IID_IKsFormatSupport, IID_IKsJackDescription
		function Activate(const dwClsContext: DWord; const refiid: REFIID; out ppvObject: IUnknown): HRESULT; stdcall;  //todo: pointer to pointer
		function EnumPartsIncoming(out ppParts: IPartsList): HRESULT; stdcall;
		function EnumPartsOutgoing(out ppParts: IPartsList): HRESULT; stdcall;
		function GetControlInterface(const nIndex: UINT; out ppFunction: IControlInterface): HRESULT; stdcall;
		function GetControlInterfaceCount(out pCount: UINT): HRESULT; stdcall;
		function GetGlobalId(out ppwstrGlobalId: LPWSTR): HRESULT; stdcall;
		function GetLocalId(out pnId: UINT): HRESULT; stdcall;
		function GetName(out ppwstrName: LPWSTR): HRESULT; stdcall;
		function GetPartType(out pPartType: PartType): HRESULT; stdcall;
		function GetSubType(out pSubType: TGuid): HRESULT; stdcall;
		function GetTopologyObject(out ppTopology: IDeviceTopology): HRESULT; stdcall;
		function RegisterControlChangeCallback(const riid: REFGUID; const pNotify: IControlChangeNotify): HRESULT; stdcall;
		function UnregisterControlChangeCallback(const pNotify: IControlChangeNotify): HRESULT; stdcall;
	end;


	//Represents a point of connection between components.
	IConnector = interface(IUnknown)
	['{9c2c4058-23f5-41de-877a-df3af236a09e}']
		function ConnectTo(const pConnectTo: IConnector): HRESULT; stdcall;
		function Disconnect(): HRESULT; stdcall;
		function GetConnectorIdConnectedTo(out ppwstrConnectorId: LPWSTR): HRESULT; stdcall;
		function GetConnectedTo(out ppConTo: IConnector): HRESULT; stdcall;
		function GetDataFlow(out pFlow: DataFlow): HRESULT; stdcall;
		function IdConnectedTo(out ppwstrDeviceId: LPWSTR): HRESULT; stdcall;
		function GetType(out pType: ConnectorType): HRESULT; stdcall;
		function IsConnected(out pbConnected: Bool): HRESULT; stdcall;
	end;


  //The ISubunit interface inherits from the IUnknown interface but does not have additional members.
	ISubUnit = interface(IUnknown)
	['{82149A85-DBA6-4487-86BB-EA8F7FEFCC71}']
	end;


  //Represents a control interface on a part (connector or subunit) in a device topology.
	IControlInterface = interface(IUnknown)
	['{45d37c3f-5140-444a-ae24-400789f3cbf3}']
		function GetIID(out pIID: TGuid): HRESULT; stdcall;
		function GetName(out ppwstrName: LPWSTR): HRESULT; stdcall;
	end;

	//
	IControlChangeNotify = interface(IUnknown)
	['{A09513ED-C709-4d21-BD7B-5F34C47F3947}']
		function OnNotify(const dwSenderProcessId: DWord; const pguidEventContext: LPCGUID): HRESULT; stdcall;
	end;


	IDeviceTopology = interface(IUnknown)
	['{2A07407E-6497-4A18-9787-32F79BD0D98F}']
		function GetConnector(const nIndex: UINT; out ppConnector: IConnector): HRESULT; stdcall;
		function GetConnectorCount(out pCount: UINT): HRESULT; stdcall;
		function GetDeviceId(out ppwstrDeviceId: LPWSTR): HRESULT; stdcall;
		function GetPartById(const nId: UINT; out ppPart: IPart): HRESULT; stdcall;
		function GetSignalPath(const pIPartFrom: IPart; const pIPartTo: IPart; const bRejectMixedPaths: Bool; out ppParts: IPartsList): HRESULT; stdcall;
		function GetSubunit(const nIndex: UINT; out ppSubunit: ISubUnit): HRESULT; stdcall;
		function GetSubunitCount(out pCount: UINT): HRESULT; stdcall;
	end;


//Declare simplified and MS example functions here.

implementation

//Implement simplified and MS example functions here.
end.


