# Structure of MFPack #

MFPack follows mainly the structures from Microsoft, MSDN: http://msdn.microsoft.com/en-us/library/windows/desktop/ee663260

In that way we broke with the tradition used by former Delphi translations, where C Builder directives where build in the translations of the official headers. Also translations to **TDelphitype** and **PDelhiPointer** are abandoned. The main reason is that we want to keep this software for free and not suitable for commercial implementations (see: Introduction page). Also: It makes it easier to read and interpret the issues on MSDN in relation to the Delphi translations.
If you need a pointer to an object, you are free to do so.

### MIDL ###
Most translations are translated from MIDL (Microsoft Interface Definition Language) headers. In the first translations you may find specific idl names translated to cwFriendlyName. The latest translations have the idl name shortened to _headerfilename\_idl digits._

_**Example:**__MIDL_MIDL\_itf\_dxva2api\_0000\_0000\_0003 is shortened to: _dxva2api\_0000\_0000\_0003
This will it make some easier to read back documentation and the SDK headerfiles._



# MFPACK DIRECTORY STRUCTURES #

---


## MFPack - Core Audio headers ##

_Headers and libraries that define all of the Core Audio APIs._

### The Core Audio APIs are ###
  * **Multimedia Device API (MMDevice)** Clients use this API to enumerate the audio endpoint devices in the system.
  * **Windows Audio Session API (WASAPI)** Clients use this API to create and manage audio streams to and from audio endpoint devices.
  * **DeviceTopology API** Clients use this API to directly access the topological features (for example, volume controls and multiplexers) that lie along the data paths inside hardware devices in audio adapters.
  * **EndpointVolume API** Clients use this API to directly access the volume controls on audio endpoint devices. This API is primarily used by applications that manage exclusive-mode audio streams.



To find the header and library for a specific API element, please consult the reference pages in the Core Audio Programming Reference on MSDN http://msdn.microsoft.com/en-us/library/windows/desktop/dd370851





### HEADERS ###


| **Core Audio component** | **Header file(s)** |
|:-------------------------|:-------------------|
|  |
|MMDevice API|Mmdeviceapi.h|
|WASAPI|Audioclient.h|
|      |Audiopolicy.h|
|      |Audiosessiontypes.h (defines constants that are used by WASAPI)|
|DeviceTopology API|Devicetopology.h|
|EndpointVolume API|Endpointvolume.h|



### DELPHI UNITS ###

| **Path** | **Unit(s)** |
|:---------|:------------|
|  |
|MFPack/CoreAudio/Common|AudEvCod.pas|
|                |AudioAPOTypes.pas|
|                |DeviceCategories.pas|
|MFPack/CoreAudio/DeviceTopology|DeviceTopology.pas|
|MFPack/CoreAudio/EndpointVolume|Endpointvolume.pas|
|MFPack/CoreAudio/MMDeviceAPI|MMDeviceApi.pas|
|MFPack/CoreAudio/WASAPI|AudioClient.pas|
|                |AudioPolicy.pas|
|                |AudioSessionTypes.pas|
|MFPack/CoreAudio/Utilities|MMDevApiUtils.pas (This unit contains some usefull functions and helpers)|
|MFPack/CoreAudio/Samples|Win78Mixer.pas (A sample unit how to access the mixer device in XP, Vista and Windows 7)|



### REMARKS: ###

Every MFPack unit has a section that contains helpers specific for the Delphi programming language.
If, however, a helper or utility covers more units, then this will be added in a MFPack helper unit located in ../Common



## MFPack - Media Foundation headers ##

_Headers and libraries that define all of the Media Foundation APIs._


To find the header and library for a specific API element,
please consult the reference pages in the Media Foundation Programming Reference on MSDN http://msdn.microsoft.com/en-us/library/windows/desktop/ee663600

Path: MFPack/MediaFoundation

### HEADERS ###
  * xva2api.h
  * xvahd.h
  * vr.h
  * vr9.h
  * fapi.h
  * fmp2dlna.h
  * ferrors.h
  * fidl.h
  * fobjects.h
  * fplay.h
  * freadwrite.h
  * ftransform.h
  * pmapi.h
  * mcontainer.h

### DELPHI UNITS ###
  * xva2api.pas
  * xvahd.pas
  * vr.pas
  * vr9.pas
  * fapi.pas
  * fmp2dlna.pas
  * ferrors.pas
  * fidl.pas (Source Resolver)
  * fobjects.pas
  * fplay.pas
  * freadwrite.pas
  * ftransform.pas
  * pmapi.pas
  * mcontainer.pas


### REMARKS: ###

Every MFPack unit has a section that contains helpers specific for the Delphi programming language.
If, however, a Media Foundation (MF) helper or utility covers more units or shares units with CoreAudio, then this will be added in the helper unit MFPack/Common/MfUtils.pas respectivly MFPack/Common/MfPUtils.pas

## Common ##
Here you find the support headers need to be included with both CoreAudio and/or MediaFoundation.

The following headers have been added**:**

Path: MFPack/Common

| **Header** | **Unit(s)** | **Comment** |
|:-----------|:------------|:------------|
|  |
|functiondiscoverykeys\_devpkey.h|FunctionDiscoveryKeys\_devpkey.pas|  |
|mmstream.h|MMStream.pas|  |
|mediaobj.h|MediaObj.pas|  |
|          |MfpTypes.pas|Delphi specific types and translations|
|          |MfpUtils.pas|Delphi specific helper routines|
|mmreg.h|MmReg.pas|  |
|propidl.h|PropIdl.pas|  |
|propsys.h|PropSys.pas|  |
|unknwn.h|Unknwn.pas|  |
|WTypes.pas|WTypes.pas|  |