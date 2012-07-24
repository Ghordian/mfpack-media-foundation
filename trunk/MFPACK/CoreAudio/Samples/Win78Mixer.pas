// FactoryX
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation
// Module: Win78Mixer.pas
// Kind: Pascal Unit
// Release date: 04-05-2012
// Language: ENU
//
// Version: 1.0.0.2
// Version: 1.0.0.2 
// Description: Requires Windows XP SP3 or later. 
//              Sample code, Win78Mixer, suitable to create and manage soundmixerdevice objects.  
// 
// Intiator(s): Tony (maXcomX), Peter (OzShips) 
// 
// LastEdited by: Tony (maXcomX)
// EditDate: updt 010412a
//
// Remarks: This unit contains samples of how to create the soundmixerdevice objects and managing them.
//          The Mute property for Vista and higher devices should be a 4 byte-BOOL and not a Boolean!(see comments on this -function CBOOL-)
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 15 upd 1
// Todo: See remarks.
// =============================================================================
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

unit Win78Mixer;

//Sample unit to get/set the proper mixer (and properties) used in XP, Vista, 7 and 8

interface

const
	MAX_INPUT_VALUE = High(Word);
	MIN_INPUT_VALUE = 0;
	MAX_OUTPUT_VALUE = High(Word);
	MIN_OUTPUT_VALUE = 0;

type

	TBasicMixer = class
  protected
    function GetMute(): boolean; virtual; abstract;
		procedure SetMute(Value: boolean); virtual; abstract;
		function GetMasterVolume(): integer; virtual; abstract;
		procedure SetMasterVolume(Value: integer); virtual; abstract;

	public
		function GetChannelVolume(Channel: LongWord; Value: integer): integer; virtual; abstract;
		procedure SetChannelVolume(Channel: LongWord; Value: integer); virtual; abstract;

		property MasterVolume: integer read GetMasterVolume write SetMasterVolume;
		property Muted: boolean read GetMute write SetMute;

	end;

function CreateVis78Mixer: TBasicMixer;


implementation

uses
	Windows, SysUtils, ShlObj, ComObj, ActiveX, MMSystem, MMDeviceApi, PropSys,
	Endpointvolume, DXUtil;

type


	//Windows XP
	TXpMixer = class(TBasicMixer)
  private
		//HRES: HRESULT;
    Fmxct: integer;
    FMixer: HMIXER;
    procedure CheckError(mmRes: MMRESULT);

  protected
    function GetMute(): boolean; override;
    procedure SetMute(Value: boolean); override;
    function GetMasterVolume(): integer; override;
    procedure SetMasterVolume(Value: integer); override;

	public
		constructor Create;
		destructor Destroy; override;
		//TODO: implement these functions
		//function GetChannelVolume(Channel: DWord; Value: integer): integer;
		//procedure SetChannelVolume(Channel: DWord; Value: integer);

	end;


//Windows Vista, 7 and 8
	TVis78Mixer = class(TBasicMixer)
  private
		HRES: HRESULT;
		DefaultDevice: IMMDevice;
		DeviceEnumerator: IMMDeviceEnumerator;
		FAudioEndpoint: IAudioEndpointVolume;

	protected
		function GetMute(): boolean; override;
		procedure SetMute(Value: boolean); override;
		function GetMasterVolume(): integer; override;
    procedure SetMasterVolume(Value: integer); override;

  public
		constructor Create;
		destructor Destroy; override;

		function GetDevice(DeviceId: integer): string;

		function GetChannelVolume(Channel: DWord; Value: integer): integer; override;
		procedure SetChannelVolume(Channel: DWord; Value: integer); override;
	end;

// ---------------------------------------------------------------------------

var
	_FBasicMixer: TBasicMixer;

//a special function to translate Delphi boolean to a C++ BOOL (4 bytes) in some rare cases, like the Get/set Mute functions on Windows Vista, 7 and 8
//see: http://blog.delphi-jedi.net/2008/09/25/bool-boolean-and-integer/
function CBOOL(Value: boolean): DWORD;
begin
	if Value = true then
		Result:= 1
	else
		Result:= 0;
	//as an altenative use: Result:= integer(Value), which does the same
end;


function CreateVis78Mixer: TBasicMixer;
var
	_VerInfo: TOSVersioninfo;

begin
	if (_FBasicMixer = nil) then
		begin
			_VerInfo.dwOSVersionInfoSize:= SizeOf(TOSVersionInfo);
			GetVersionEx(_VerInfo);
			if (_VerInfo.dwMajorVersion >= 6) then
				_FBasicMixer:= TVis78Mixer.Create
      else
				_FBasicMixer:= TXpMixer.Create;
		end;
	result:= _FBasicMixer;
end;




//TXpMixer
//
procedure TXpMixer.CheckError(MMRes: MMRESULT);
var
  _s: string;

begin
  if mmRes = MMSYSERR_NOERROR then
    Exit;

  SetLength(_s, MMSystem.MAXERRORLENGTH + 1);

  if waveOutGetErrorText(mmRes, @_s[1], MMSystem.MAXERRORLENGTH) <> MMSYSERR_NOERROR then
    raise Exception.Create(StrPas(PChar(_s)));
end;

//
constructor TXpMixer.Create;
begin
	Fmxct:= MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
	CheckError(MixerOpen(@Fmixer, 0, 0, 0, 0));
end;

//
destructor TXpMixer.Destroy;
begin
	if (Fmixer <> 0) then
		MixerClose(Fmixer);
	inherited;
end;

//
function TXpMixer.GetMute: boolean;
var
	_MasterMute: TMixerControl;
	_Details: TMixerControlDetails;
	_BoolDetails: TMixerControlDetailsBoolean;
	_Line: TMixerLine;
	_Controls: TMixerLineControls;

begin
	ZeroMemory(@_Line, SizeOf(_Line));
	_Line.cbStruct:= SizeOf(_Line);
	_Line.dwComponentType:= Fmxct;
  //
	CheckError(mixerGetLineInfo(0, @_Line, MIXER_GETLINEINFOF_COMPONENTTYPE));

	ZeroMemory(@_Controls, SizeOf(_Controls));
	with _Controls do
		begin
			cbStruct:= SizeOf(_Controls);
			dwLineID:= _Line.dwLineID;
			cControls:= 1;
			dwControlType:= MIXERCONTROL_CONTROLTYPE_MUTE;
			cbmxctrl:= SizeOf(_MasterMute);
			pamxctrl:= @_MasterMute;
		end;
  //
	CheckError(mixerGetLineControls(0, @_Controls, MIXER_GETLINECONTROLSF_ONEBYTYPE));
	with _Details do
		begin
			cbStruct:= SizeOf(_Details);
			dwControlID:= _MasterMute.dwControlID;
			cChannels:= 1;
			cMultipleItems:= 0;
			cbDetails:= SizeOf(_BoolDetails);
			paDetails:= @_BoolDetails;
		end;
  //
	CheckError(mixerGetControlDetails(0, @_Details, MIXER_GETCONTROLDETAILSF_VALUE));

	result:= _BoolDetails.fValue <> 0;
end;

//
function TXpMixer.GetMasterVolume(): integer;
var
	_Line: TMixerLine;
	_Controls: TMixerLineControls;
	_MasterVolume: TMixerControl;
	_Details: TMixerControlDetails;
	_UnsignedDetails: TMixerControlDetailsUnsigned;

begin
	ZeroMemory(@_Line, SizeOf(_Line));
	_Line.cbStruct:= SizeOf(_Line);
	_Line.dwComponentType:= Fmxct;
  //
	CheckError(mixerGetLineInfo(Fmixer, @_Line, MIXER_GETLINEINFOF_COMPONENTTYPE));

	ZeroMemory(@_Controls, SizeOf(_Controls));
	with _Controls do
    begin
			cbStruct:= SizeOf(_Controls);
			dwLineID:= _Line.dwLineID;
			cControls:= 1;
      dwControlType:= MIXERCONTROL_CONTROLTYPE_VOLUME;
			cbmxctrl:= SizeOf(_MasterVolume);
			pamxctrl:= @_MasterVolume;
    end;

  //
	CheckError(mixerGetLineControls(Fmixer, @_Controls, MIXER_GETLINECONTROLSF_ONEBYTYPE));

	with _Details do
    begin
			cbStruct:= SizeOf(_Details);
			dwControlID:= _MasterVolume.dwControlID;
      cChannels:= 1;
      cMultipleItems:= 0;
			cbDetails:= SizeOf(_UnsignedDetails);
			paDetails:= @_UnsignedDetails;
    end;
	//
	CheckError(mixerGetControlDetails(Fmixer, @_Details, MIXER_GETCONTROLDETAILSF_VALUE));

	result:= _UnsignedDetails.dwValue;
end;

//
procedure TXpMixer.SetMute(Value: boolean);
var
	_Line: TMixerLine;
	_Controls: TMixerLineControls;
	_MasterMute: TMixerControl;
	_Details: TMixerControlDetails;
	_BoolDetails: TMixerControlDetailsBoolean;

begin
	ZeroMemory(@_Line, SizeOf(_Line));
	_Line.cbStruct:= SizeOf(_Line);
	_Line.dwComponentType:= Fmxct;
  //
	CheckError(mixerGetLineInfo(Fmixer, @_Line, MIXER_GETLINEINFOF_COMPONENTTYPE));

	ZeroMemory(@_Controls, SizeOf(_Controls));
	with _Controls do
    begin
			cbStruct:= SizeOf(_Controls);
			dwLineID:= _Line.dwLineID;
      cControls:= 1;
      dwControlType:= MIXERCONTROL_CONTROLTYPE_MUTE;
			cbmxctrl:= SizeOf(_MasterMute);
			pamxctrl:= @_MasterMute;
    end;
  //
	CheckError(MixerGetLineControls(Fmixer, @_Controls, MIXER_GETLINECONTROLSF_ONEBYTYPE));

	with _Details do
    begin
			cbStruct:= SizeOf(_Details);
			dwControlID:= _MasterMute.dwControlID;
      cChannels:= 1;
      cMultipleItems:= 0;
			cbDetails:= SizeOf(_BoolDetails);
			paDetails:= @_BoolDetails;
    end;
  //
	CheckError(MixerGetControlDetails(0, @_Details, MIXER_GETCONTROLDETAILSF_VALUE));

  if Value then
		_BoolDetails.fValue:= 1
  else
		_BoolDetails.fValue:= 0;
	//
	CheckError(mixerSetControlDetails(0, @_Details, MIXER_SETCONTROLDETAILSF_VALUE));
end;

//
procedure TXpMixer.SetMasterVolume(Value: integer);
var 
	_Line: TMixerLine;
	_Controls: TMixerLineControls;
	_MasterVolume: TMixerControl;
	_Details: TMixerControlDetails;
	_UnsignedDetails: TMixerControlDetailsUnsigned;

begin
	if (value < 0) then
		value:= 0;
	if (value > MAX_INPUT_VALUE) then
		value:= MAX_INPUT_VALUE;

	ZeroMemory(@_Line, SizeOf(_Line));
	_Line.cbStruct:= SizeOf(_Line);
	_Line.dwComponentType:= Fmxct;
  //
	CheckError(mixerGetLineInfo(Fmixer, @_Line, MIXER_GETLINEINFOF_COMPONENTTYPE));

	ZeroMemory(@_Controls, SizeOf(_Controls));

	with _Controls do
    begin
			cbStruct:= SizeOf(_Controls);
			dwLineID:= _Line.dwLineID;
      cControls:= 1;
      dwControlType:= MIXERCONTROL_CONTROLTYPE_VOLUME;
			cbmxctrl:= SizeOf(_MasterVolume);
			pamxctrl:= @_MasterVolume;
    end;

	CheckError(mixerGetLineControls(Fmixer, @_Controls, MIXER_GETLINECONTROLSF_ONEBYTYPE));

	with _Details do
    begin
			cbStruct:= SizeOf(_Details);
			dwControlID:= _MasterVolume.dwControlID;
      cChannels:= 1;
      cMultipleItems:= 0;
			cbDetails:= SizeOf(_UnsignedDetails);
			paDetails:= @_UnsignedDetails;
    end;

	_UnsignedDetails.dwValue:= Value;
  //
	CheckError(mixerSetControlDetails(Fmixer, @_Details, MIXER_SETCONTROLDETAILSF_VALUE));
end;



//TVis78Mixer
constructor TVis78Mixer.Create;
begin
	HRES:= CoCreateInstance(CLSID_MMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, DeviceEnumerator);
	if SUCCEEDED(HRES) then
		HRES:= DeviceEnumerator.GetDefaultAudioEndpoint(eRender, eMultimedia, DefaultDevice);
			if SUCCEEDED(HRES) then
				HRES:= DefaultDevice.Activate(IID_IAudioEndpointVolume, CLSCTX_ALL, nil,  IUnknown(FAudioEndpoint));

	if FAILED(HRES) then
		Raise Exception.Create('Failure: Could not create mixer.');
end;

//
destructor TVis78Mixer.Destroy;
begin
	SAFE_RELEASE(DeviceEnumerator); //SAFE_RELEASE is declared in unit DXUtil.pas
	SAFE_RELEASE(DefaultDevice);
	SAFE_RELEASE(FAudioEndpoint);
	inherited;
end;


//
function TVis78Mixer.GetDevice(DeviceId: integer): string;
var
	_PropertyStore: IPropertyStore;
	_var: TPropVariant;

begin
	Result:= '';
	HRES:= DefaultDevice.OpenPropertyStore(STGM_READ, _PropertyStore);
	if SUCCEEDED(HRES) then
		begin
			// Get the DirectSound or DirectSoundCapture device GUID
			// (in WCHAR string format) for the endpoint device.
			HRES:= _PropertyStore.GetValue(PKEY_Device_FriendlyName, _var);
			if Failed(HRES) then
				Raise Exception.Create('GetDevice failed')
			else
				Result:= '';
		end;
end;

//
function TVis78Mixer.GetMute: boolean;
var
	_Res: DWORD;
begin
	HRES:= FAudioEndpoint.GetMute(_Res);
	if FAILED(HRES) then
		Raise Exception.Create('Get mute failed')
	else
		Result:= Boolean(_Res);
end;

//
procedure TVis78Mixer.SetMute(Value: boolean);
begin
	HRES:= FAudioEndpoint.SetMute(CBOOL(Value), nil);
	if FAILED(HRES) then
		Raise Exception.Create('Set mute failed');
end;

//
function TVis78Mixer.GetMasterVolume: integer;
var
  _VolLevel: Single;

begin
	FAudioEndpoint.GetMasterVolumeLevelScalar(_VolLevel);
	result:= Round(_VolLevel * MAX_INPUT_VALUE);
end;

//
procedure TVis78Mixer.SetMasterVolume(Value: integer);
var
  _sVal: Single;

begin
  if (value < 0) then
    value:= 0;
	if (value > MAX_INPUT_VALUE) then
		value:= MAX_INPUT_VALUE;
	_sVal:= Value / MAX_INPUT_VALUE;
	HRES:= FAudioEndpoint.SetMasterVolumeLevelScalar(_sVal, nil);
	if FAILED(HRES) then
		Raise Exception.Create('SetMasterVolume failed');
end;

//
function TVis78Mixer.GetChannelVolume(Channel: DWord; Value: integer): integer;
var
  _VolLevel: Double;

begin
	_VolLevel:= 0;
	HRES:= FAudioEndpoint.GetChannelVolumeLevelScalar(Channel, _VolLevel);
	if SUCCEEDED(HRES) then
		result:= Round(_VolLevel * MAX_OUTPUT_VALUE)
	else
		Raise Exception.Create('GetChannelVolume failed');
end;

//
procedure TVis78Mixer.SetChannelVolume(Channel: DWord; Value: integer);
var
	_sVal: Single;
	_G: TGUID;

begin
	if (value < MIN_INPUT_VALUE) then
		value:= MIN_INPUT_VALUE;
	if (value > MAX_INPUT_VALUE) then
		value:= MAX_INPUT_VALUE;
	_sVal:= Value / MAX_INPUT_VALUE;
	HRES:= FAudioEndpoint.SetChannelVolumeLevelScalar(Channel, _sVal, @_G);
	if FAILED(HRES) then
		Raise Exception.Create('SetChannelVolume failed');
end;

end.