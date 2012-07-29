// FactoryX
// factoryx.code@gmail.com
//
// Copyright ©2003 - 2012 by FactoryX, Sefferweich Germany (EU)
// Project: Media Foundation - MFPack
// Module: OpmApi.pas
// Kind: Pascal Unit
// Release date: 23-07-2012
// Language: ENU
//
// Version: 1.0.0.1
// Description: Requires Windows Vista or later.
//
// Intiator(s): Tony (maXcomX), Peter (OzShips)
//
// LastEdited by: Tony (maXcomX)
// EditDate: updt 260712b
//
// Remarks:
//
// Related objects: -
// Related projects: -
// Known Issues: -
// Compiler version: 23, upd 4
// Todo: General check
// =============================================================================
// Source: opmapi.h
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
//
// Licence Supplement:
// All kinds of commercial use, including distribution, of any kind, of the sources is strictly forbidden,
// unless you have a written permission or agreement from or with FactoryX.
//==============================================================================


unit OpmApi;

interface

uses
  Windows, ComObj, Ole2, UnKnwn, DxVa2Api;

type
  //Forward Interface Declarations

  IOPMVideoOutput = interface;

const
  OPM_GET_CURRENT_HDCP_SRM_VERSION               : TGUID = '{99c5ceff-5f1d-4879-81c1-c52443c9482b}';
  OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION      : TGUID = '{0db59d74-a992-492e-a0bd-c23fda564e00}';
  OPM_GET_ACP_AND_CGMSA_SIGNALING                : TGUID = '{6629a591-3b79-4cf3-924a-11e8e7811671}';
  OPM_GET_CONNECTOR_TYPE                         : TGUID = '{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}';
  OPM_GET_SUPPORTED_PROTECTION_TYPES             : TGUID = '{38f2a801-9a6c-48bb-9107-b6696e6f1797}';
  OPM_GET_VIRTUAL_PROTECTION_LEVEL               : TGUID = '{b2075857-3eda-4d5d-88db-748f8c1a0549}';
  OPM_GET_ACTUAL_PROTECTION_LEVEL                : TGUID = '{1957210a-7766-452a-b99a-d27aed54f03a}';
  OPM_GET_ACTUAL_OUTPUT_FORMAT                   : TGUID = '{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}';
  OPM_GET_ADAPTER_BUS_TYPE                       : TGUID = '{c6f4d673-6174-4184-8e35-f6db5200bcba}';
  OPM_GET_OUTPUT_ID                              : TGUID = '{72cb6df3-244f-40ce-b09e-20506af6302f}';
  OPM_GET_DVI_CHARACTERISTICS                    : TGUID = '{a470b3bb-5dd7-4172-839c-3d3776e0ebf5}';
  OPM_GET_CODEC_INFO                             : TGUID = '{4f374491-8f5f-4445-9dba-95588f6b58b4}';
  OPM_SET_PROTECTION_LEVEL                       : TGUID = '{9bb9327c-4eb5-4727-9f00-b42b0919c0da}';
  OPM_SET_ACP_AND_CGMSA_SIGNALING                : TGUID = '{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}';
  OPM_SET_HDCP_SRM                               : TGUID = '{8b5ef5d1-c30d-44ff-84a5-ea71dce78f13}';
  OPM_SET_PROTECTION_LEVEL_ACCORDING_TO_CSS_DVD  : TGUID = '{39ce333e-4cc0-44ae-bfcc-da50b5f82e72}';

type
  _opmapi_0000_0000_0001                         = (
    OPM_OMAC_SIZE                                = 16,
    OPM_128_BIT_RANDOM_NUMBER_SIZE               = 16,
    OPM_ENCRYPTED_INITIALIZATION_PARAMETERS_SIZE = 256,
    OPM_CONFIGURE_SETTING_DATA_SIZE              = 4056,
    OPM_GET_INFORMATION_PARAMETERS_SIZE          = 4056,
    OPM_REQUESTED_INFORMATION_SIZE               = 4076,
    OPM_HDCP_KEY_SELECTION_VECTOR_SIZE           = 5,
    OPM_PROTECTION_TYPE_SIZE                     = 4,
    OPM_BUS_TYPE_MASK                            = $FFFF,
    OPM_BUS_IMPLEMENTATION_MODIFIER_MASK         = $7FFF
  );
  opmapi_0000_0000_0001 = _opmapi_0000_0000_0001;

type
  _OPM_VIDEO_OUTPUT_SEMANTICS = (
    OPM_VOS_COPP_SEMANTICS = 0,
    OPM_VOS_OPM_SEMANTICS  = 1
  );
  OPM_VIDEO_OUTPUT_SEMANTICS = _OPM_VIDEO_OUTPUT_SEMANTICS;


typedef enum __MIDL___MIDL_itf_opmapi_0000_0000_0002
    {	OPM_HDCP_FLAG_NONE	= 0,
	OPM_HDCP_FLAG_REPEATER	= 0x1
    } ;

type
    _opmapi_0000_0000_0003                  = (
    OPM_STATUS_NORMAL                       = 0,
    OPM_STATUS_LINK_LOST                    = $1,
    OPM_STATUS_RENEGOTIATION_REQUIRED       = $2,
    OPM_STATUS_TAMPERING_DETECTED           = $4,
    OPM_STATUS_REVOKED_HDCP_DEVICE_ATTACHED = $8
  );
  opmapi_0000_0000_0003 = __opmapi_0000_0000_0003;

type
    _opmapi_0000_0000_0004                      = (
    OPM_CONNECTOR_TYPE_OTHER                    =  - 1,
    OPM_CONNECTOR_TYPE_VGA                      = 0,
    OPM_CONNECTOR_TYPE_SVIDEO                   = 1,
    OPM_CONNECTOR_TYPE_COMPOSITE_VIDEO          = 2,
    OPM_CONNECTOR_TYPE_COMPONENT_VIDEO          = 3,
    OPM_CONNECTOR_TYPE_DVI                      = 4,
    OPM_CONNECTOR_TYPE_HDMI                     = 5,
    OPM_CONNECTOR_TYPE_LVDS                     = 6,
    OPM_CONNECTOR_TYPE_D_JPN                    = 8,
    OPM_CONNECTOR_TYPE_SDI                      = 9,
    OPM_CONNECTOR_TYPE_DISPLAYPORT_EXTERNAL     = 10,
    OPM_CONNECTOR_TYPE_DISPLAYPORT_EMBEDDED     = 11,
    OPM_CONNECTOR_TYPE_UDI_EXTERNAL             = 12,
    OPM_CONNECTOR_TYPE_UDI_EMBEDDED             = 13,
    OPM_COPP_COMPATIBLE_CONNECTOR_TYPE_INTERNAL = $80000000
  );
  opmapi_0000_0000_0004 = _opmapi_0000_0000_0004;

typedef enum __MIDL___MIDL_itf_opmapi_0000_0000_0005
    {	OPM_DVI_CHARACTERISTIC_1_0	= 1,
	OPM_DVI_CHARACTERISTIC_1_1_OR_ABOVE	= 2
    } ;

typedef enum __MIDL___MIDL_itf_opmapi_0000_0000_0006
    {	OPM_BUS_TYPE_OTHER	= 0,
	OPM_BUS_TYPE_PCI	= 0x1,
	OPM_BUS_TYPE_PCIX	= 0x2,
	OPM_BUS_TYPE_PCIEXPRESS	= 0x3,
	OPM_BUS_TYPE_AGP	= 0x4,
	OPM_BUS_IMPLEMENTATION_MODIFIER_INSIDE_OF_CHIPSET	= 0x10000,
	OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP	= 0x20000,
	OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET	= 0x30000,
	OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR	= 0x40000,
	OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE	= 0x50000,
	OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD	= 0x80000000,
	OPM_COPP_COMPATIBLE_BUS_TYPE_INTEGRATED	= 0x80000000
    } ;


  _OPM_DPCP_PROTECTION_LEVEL = (
    OPM_DPCP_OFF         = 0,
    OPM_DPCP_ON          = 1,
    OPM_DPCP_FORCE_ULONG = $7FFFFFFF
  );
  OPM_DPCP_PROTECTION_LEVEL = _OPM_DPCP_PROTECTION_LEVEL;
  TOpmDpcpProtectionLevel = _OPM_DPCP_PROTECTION_LEVEL;

  POpmHdcpProtectionLevel = ^TOpmHdcpProtectionLevel;
  {$EXTERNALSYM _OPM_HDCP_PROTECTION_LEVEL}
  _OPM_HDCP_PROTECTION_LEVEL = (
    OPM_HDCP_OFF         = 0,
    OPM_HDCP_ON          = 1,
    OPM_HDCP_FORCE_ULONG = $7FFFFFFF
  );
  {$EXTERNALSYM OPM_HDCP_PROTECTION_LEVEL}
  OPM_HDCP_PROTECTION_LEVEL = _OPM_HDCP_PROTECTION_LEVEL;
  TOpmHdcpProtectionLevel = _OPM_HDCP_PROTECTION_LEVEL;


enum __MIDL___MIDL_itf_opmapi_0000_0000_0007
    {	OPM_CGMSA_OFF	= 0,
	OPM_CGMSA_COPY_FREELY	= 0x1,
	OPM_CGMSA_COPY_NO_MORE	= 0x2,
	OPM_CGMSA_COPY_ONE_GENERATION	= 0x3,
	OPM_CGMSA_COPY_NEVER	= 0x4,
	OPM_CGMSA_REDISTRIBUTION_CONTROL_REQUIRED	= 0x8
    } ;

  POpmAcpProtectionLevel = ^TOpmAcpProtectionLevel;
  {$EXTERNALSYM _OPM_ACP_PROTECTION_LEVEL}
  _OPM_ACP_PROTECTION_LEVEL = (
    OPM_ACP_OFF         = 0,
    OPM_ACP_LEVEL_ONE   = 1,
    OPM_ACP_LEVEL_TWO   = 2,
    OPM_ACP_LEVEL_THREE = 3,
    OPM_ACP_FORCE_ULONG = $7FFFFFFF
  );
  {$EXTERNALSYM OPM_ACP_PROTECTION_LEVEL}
  OPM_ACP_PROTECTION_LEVEL = _OPM_ACP_PROTECTION_LEVEL;
  TOpmAcpProtectionLevel = _OPM_ACP_PROTECTION_LEVEL;



  _opmapi_0000_0000_0008                     = (
    OPM_PROTECTION_TYPE_OTHER                = $80000000,
    OPM_PROTECTION_TYPE_NONE                 = 0,
    OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP = $1,
    OPM_PROTECTION_TYPE_ACP                  = $2,
    OPM_PROTECTION_TYPE_CGMSA                = $4,
    OPM_PROTECTION_TYPE_HDCP                 = $8,
    OPM_PROTECTION_TYPE_DPCP                 = $10
  );
  opmapi_0000_0000_0008 = _opmapi_0000_0000_0008;

typedef enum __MIDL___MIDL_itf_opmapi_0000_0000_0009
    {	OPM_PROTECTION_STANDARD_OTHER	= 0x80000000,
	OPM_PROTECTION_STANDARD_NONE	= 0,
	OPM_PROTECTION_STANDARD_IEC61880_525I	= 0x1,
	OPM_PROTECTION_STANDARD_IEC61880_2_525I	= 0x2,
	OPM_PROTECTION_STANDARD_IEC62375_625P	= 0x4,
	OPM_PROTECTION_STANDARD_EIA608B_525	= 0x8,
	OPM_PROTECTION_STANDARD_EN300294_625I	= 0x10,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEA_525P	= 0x20,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEA_750P	= 0x40,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEA_1125I	= 0x80,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEB_525P	= 0x100,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEB_750P	= 0x200,
	OPM_PROTECTION_STANDARD_CEA805A_TYPEB_1125I	= 0x400,
	OPM_PROTECTION_STANDARD_ARIBTRB15_525I	= 0x800,
	OPM_PROTECTION_STANDARD_ARIBTRB15_525P	= 0x1000,
	OPM_PROTECTION_STANDARD_ARIBTRB15_750P	= 0x2000,
	OPM_PROTECTION_STANDARD_ARIBTRB15_1125I	= 0x4000
    } ;

typedef
enum _OPM_IMAGE_ASPECT_RATIO_EN300294
    {	OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3	= 0,
	OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_CENTER	= 1,
	OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_TOP	= 2,
	OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_CENTER	= 3,
	OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_TOP	= 4,
	OPM_ASPECT_RATIO_EN300294_BOX_GT_16_BY_9_CENTER	= 5,
	OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3_PROTECTED_CENTER	= 6,
	OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_16_BY_9_ANAMORPHIC	= 7,
	OPM_ASPECT_RATIO_FORCE_ULONG	= 0x7fffffff
    } 	OPM_IMAGE_ASPECT_RATIO_EN300294;

typedef struct _OPM_RANDOM_NUMBER
    {
    BYTE abRandomNumber[ 16 ];
    } 	OPM_RANDOM_NUMBER;

typedef struct _OPM_OMAC
    {
    BYTE abOMAC[ 16 ];
    } 	OPM_OMAC;

typedef struct _OPM_ENCRYPTED_INITIALIZATION_PARAMETERS
    {
    BYTE abEncryptedInitializationParameters[ 256 ];
    } 	OPM_ENCRYPTED_INITIALIZATION_PARAMETERS;

typedef struct _OPM_GET_INFO_PARAMETERS
    {
    OPM_OMAC omac;
    OPM_RANDOM_NUMBER rnRandomNumber;
    GUID guidInformation;
    ULONG ulSequenceNumber;
    ULONG cbParametersSize;
    BYTE abParameters[ 4056 ];
    } 	OPM_GET_INFO_PARAMETERS;

typedef struct _OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    GUID guidInformation;
    ULONG ulSequenceNumber;
    ULONG cbParametersSize;
    BYTE abParameters[ 4056 ];
    } 	OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS;

typedef struct _OPM_HDCP_KEY_SELECTION_VECTOR
    {
    BYTE abKeySelectionVector[ 5 ];
    } 	OPM_HDCP_KEY_SELECTION_VECTOR;

typedef struct _OPM_CONNECTED_HDCP_DEVICE_INFORMATION
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    ULONG ulStatusFlags;
    ULONG ulHDCPFlags;
    OPM_HDCP_KEY_SELECTION_VECTOR ksvB;
    BYTE Reserved[ 11 ];
    BYTE Reserved2[ 16 ];
    BYTE Reserved3[ 16 ];
    } 	OPM_CONNECTED_HDCP_DEVICE_INFORMATION;

typedef struct _OPM_REQUESTED_INFORMATION
    {
    OPM_OMAC omac;
    ULONG cbRequestedInformationSize;
    BYTE abRequestedInformation[ 4076 ];
    } 	OPM_REQUESTED_INFORMATION;

typedef struct _OPM_STANDARD_INFORMATION
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    ULONG ulStatusFlags;
    ULONG ulInformation;
    ULONG ulReserved;
    ULONG ulReserved2;
    } 	OPM_STANDARD_INFORMATION;

#ifndef DO_NOT_USE_DIRECTX_OR_DXVA2
typedef struct _OPM_ACTUAL_OUTPUT_FORMAT
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    ULONG ulStatusFlags;
    ULONG ulDisplayWidth;
    ULONG ulDisplayHeight;
    DXVA2_SampleFormat dsfSampleInterleaveFormat;
    D3DFORMAT d3dFormat;
    ULONG ulFrequencyNumerator;
    ULONG ulFrequencyDenominator;
    } 	OPM_ACTUAL_OUTPUT_FORMAT;

#endif // DO_NOT_USE_DIRECTX_OR_DXVA2

typedef struct _OPM_ACP_AND_CGMSA_SIGNALING
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    ULONG ulStatusFlags;
    ULONG ulAvailableTVProtectionStandards;
    ULONG ulActiveTVProtectionStandard;
    ULONG ulReserved;
    ULONG ulAspectRatioValidMask1;
    ULONG ulAspectRatioData1;
    ULONG ulAspectRatioValidMask2;
    ULONG ulAspectRatioData2;
    ULONG ulAspectRatioValidMask3;
    ULONG ulAspectRatioData3;
    ULONG ulReserved2[ 4 ];
    ULONG ulReserved3[ 4 ];
    } 	OPM_ACP_AND_CGMSA_SIGNALING;

typedef struct _OPM_OUTPUT_ID_DATA
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    ULONG ulStatusFlags;
    UINT64 OutputId;
    } 	OPM_OUTPUT_ID_DATA;

typedef struct _OPM_CONFIGURE_PARAMETERS
    {
    OPM_OMAC omac;
    GUID guidSetting;
    ULONG ulSequenceNumber;
    ULONG cbParametersSize;
    BYTE abParameters[ 4056 ];
    } 	OPM_CONFIGURE_PARAMETERS;

typedef struct _OPM_SET_PROTECTION_LEVEL_PARAMETERS
    {
    ULONG ulProtectionType;
    ULONG ulProtectionLevel;
    ULONG Reserved;
    ULONG Reserved2;
    } 	OPM_SET_PROTECTION_LEVEL_PARAMETERS;

typedef struct _OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS
    {
    ULONG ulNewTVProtectionStandard;
    ULONG ulAspectRatioChangeMask1;
    ULONG ulAspectRatioData1;
    ULONG ulAspectRatioChangeMask2;
    ULONG ulAspectRatioData2;
    ULONG ulAspectRatioChangeMask3;
    ULONG ulAspectRatioData3;
    ULONG ulReserved[ 4 ];
    ULONG ulReserved2[ 4 ];
    ULONG ulReserved3;
    } 	OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS;

typedef struct _OPM_SET_HDCP_SRM_PARAMETERS
    {
    ULONG ulSRMVersion;
    } 	OPM_SET_HDCP_SRM_PARAMETERS;

typedef struct _OPM_GET_CODEC_INFO_PARAMETERS
    {
    DWORD cbVerifier;
    BYTE Verifier[ 4052 ];
    } 	OPM_GET_CODEC_INFO_PARAMETERS;

typedef struct _OPM_GET_CODEC_INFO_INFORMATION
    {
    OPM_RANDOM_NUMBER rnRandomNumber;
    DWORD Merit;
    } 	OPM_GET_CODEC_INFO_INFORMATION;

#if defined( _WIN32 ) && !defined( _NO_COM )
DEFINE_GUID( IID_IOPMVideoOutput, 0x0A15159D, 0x41C7, 0x4456, 0x93, 0xE1, 0x28, 0x4C, 0xD6, 0x1D, 0x4E, 0x8D );
#endif // defined( _WIN32 ) && !defined( _NO_COM )


extern RPC_IF_HANDLE __MIDL_itf_opmapi_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_opmapi_0000_0000_v0_0_s_ifspec;

#ifndef __IOPMVideoOutput_INTERFACE_DEFINED__
#define __IOPMVideoOutput_INTERFACE_DEFINED__

/* interface IOPMVideoOutput */
/* [local][uuid][object] */


EXTERN_C const IID IID_IOPMVideoOutput;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("0A15159D-41C7-4456-93E1-284CD61D4E8D")
    IOPMVideoOutput : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE StartInitialization(
            /* [annotation][out] */
            __out  OPM_RANDOM_NUMBER *prnRandomNumber,
            /* [annotation][out] */
            __deref_out_bcount(*pulCertificateLength)  BYTE **ppbCertificate,
            /* [annotation][out] */
            __out  ULONG *pulCertificateLength) = 0;

        virtual HRESULT STDMETHODCALLTYPE FinishInitialization(
            /* [annotation][in] */
            __in  const OPM_ENCRYPTED_INITIALIZATION_PARAMETERS *pParameters) = 0;

        virtual HRESULT STDMETHODCALLTYPE GetInformation(
            /* [annotation][in] */
            __in  const OPM_GET_INFO_PARAMETERS *pParameters,
            /* [annotation][out] */
            __out  OPM_REQUESTED_INFORMATION *pRequestedInformation) = 0;

        virtual HRESULT STDMETHODCALLTYPE COPPCompatibleGetInformation(
            /* [annotation][in] */
            __in  const OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS *pParameters,
            /* [annotation][out] */
            __out  OPM_REQUESTED_INFORMATION *pRequestedInformation) = 0;

        virtual HRESULT STDMETHODCALLTYPE Configure(
            /* [annotation][in] */
            __in  const OPM_CONFIGURE_PARAMETERS *pParameters,
            /* [annotation][in] */
            __in  ULONG ulAdditionalParametersSize,
            /* [annotation][in] */
            __in_bcount_opt(ulAdditionalParametersSize)  const BYTE *pbAdditionalParameters) = 0;

    };

#else 	/* C style interface */

    typedef struct IOPMVideoOutputVtbl
    {
        BEGIN_INTERFACE

        HRESULT ( STDMETHODCALLTYPE *QueryInterface )(
            IOPMVideoOutput * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */
            __RPC__deref_out  void **ppvObject);

        ULONG ( STDMETHODCALLTYPE *AddRef )(
            IOPMVideoOutput * This);

        ULONG ( STDMETHODCALLTYPE *Release )(
            IOPMVideoOutput * This);

        HRESULT ( STDMETHODCALLTYPE *StartInitialization )(
            IOPMVideoOutput * This,
            /* [annotation][out] */
            __out  OPM_RANDOM_NUMBER *prnRandomNumber,
            /* [annotation][out] */
            __deref_out_bcount(*pulCertificateLength)  BYTE **ppbCertificate,
            /* [annotation][out] */
            __out  ULONG *pulCertificateLength);

        HRESULT ( STDMETHODCALLTYPE *FinishInitialization )(
            IOPMVideoOutput * This,
            /* [annotation][in] */
            __in  const OPM_ENCRYPTED_INITIALIZATION_PARAMETERS *pParameters);

        HRESULT ( STDMETHODCALLTYPE *GetInformation )(
            IOPMVideoOutput * This,
            /* [annotation][in] */
            __in  const OPM_GET_INFO_PARAMETERS *pParameters,
            /* [annotation][out] */
            __out  OPM_REQUESTED_INFORMATION *pRequestedInformation);

        HRESULT ( STDMETHODCALLTYPE *COPPCompatibleGetInformation )(
            IOPMVideoOutput * This,
            /* [annotation][in] */
            __in  const OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS *pParameters,
            /* [annotation][out] */
            __out  OPM_REQUESTED_INFORMATION *pRequestedInformation);

        HRESULT ( STDMETHODCALLTYPE *Configure )(
            IOPMVideoOutput * This,
            /* [annotation][in] */
            __in  const OPM_CONFIGURE_PARAMETERS *pParameters,
            /* [annotation][in] */
            __in  ULONG ulAdditionalParametersSize,
            /* [annotation][in] */
            __in_bcount_opt(ulAdditionalParametersSize)  const BYTE *pbAdditionalParameters);

        END_INTERFACE
    } IOPMVideoOutputVtbl;

    interface IOPMVideoOutput
    {
        CONST_VTBL struct IOPMVideoOutputVtbl *lpVtbl;
    };



#ifdef COBJMACROS


#define IOPMVideoOutput_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) )

#define IOPMVideoOutput_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) )

#define IOPMVideoOutput_Release(This)	\
    ( (This)->lpVtbl -> Release(This) )


#define IOPMVideoOutput_StartInitialization(This,prnRandomNumber,ppbCertificate,pulCertificateLength)	\
    ( (This)->lpVtbl -> StartInitialization(This,prnRandomNumber,ppbCertificate,pulCertificateLength) )

#define IOPMVideoOutput_FinishInitialization(This,pParameters)	\
    ( (This)->lpVtbl -> FinishInitialization(This,pParameters) )

#define IOPMVideoOutput_GetInformation(This,pParameters,pRequestedInformation)	\
    ( (This)->lpVtbl -> GetInformation(This,pParameters,pRequestedInformation) )

#define IOPMVideoOutput_COPPCompatibleGetInformation(This,pParameters,pRequestedInformation)	\
    ( (This)->lpVtbl -> COPPCompatibleGetInformation(This,pParameters,pRequestedInformation) )

#define IOPMVideoOutput_Configure(This,pParameters,ulAdditionalParametersSize,pbAdditionalParameters)	\
    ( (This)->lpVtbl -> Configure(This,pParameters,ulAdditionalParametersSize,pbAdditionalParameters) )

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IOPMVideoOutput_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_opmapi_0000_0001 */
/* [local] */

#ifdef DEFINE_GUIDSTRUCT
#define STATIC_KSPROPSETID_OPMVideoOutput                                                       \
0x6f414bb, 0xf43a, 0x4fe2, 0xa5, 0x66, 0x77, 0x4b, 0x4c, 0x81, 0xf0, 0xdb
DEFINE_GUIDSTRUCT("06F414BB-F43A-4fe2-A566-774B4C81F0DB", KSPROPSETID_OPMVideoOutput);
#define KSPROPSETID_OPMVideoOutput DEFINE_GUIDNAMED(KSPROPSETID_OPMVideoOutput)

typedef enum {
    //  Output is OPM_RANDOM_NUMBER followed by certifiate
    KSMETHOD_OPMVIDEOOUTPUT_STARTINITIALIZATION = 0,

    //  Input OPM_ENCRYPTED_INITIALIZATION_PARAMETERS
    //  Output OPM_STANDARD_INFORMATION
    KSMETHOD_OPMVIDEOOUTPUT_FINISHINITIALIZATION = 1,

    //  Input is OPM_GET_INFO_PARAMETERS, output is OPM_REQUESTED_INFORMATION
    //  Use KsMethod - both input and output in the buffer (not after the KSMETHOD structure)
    KSMETHOD_OPMVIDEOOUTPUT_GETINFORMATION = 2
} KSMETHOD_OPMVIDEOOUTPUT;
#endif

#define GetBusType( ulBusTypeAndImplementation )                        ((ulBusTypeAndImplementation) & OPM_BUS_TYPE_MASK)
#define GetBusImplementation( ulBusTypeAndImplementation )              (((ulBusTypeAndImplementation) & OPM_BUS_IMPLEMENTATION_MODIFIER_MASK) >> 16)
#define IsNonStandardBusImplementation( ulBusTypeAndImplementation )    ((ulBusTypeAndImplementation) & OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD)


function OPMGetVideoOutputsFromHMONITOR(
  hMonitor: HMONITOR;
  vos: OPM_VIDEO_OUTPUT_SEMANTICS;
  var pulNumVideoOutputs: ULONG;
  var pppOPMVideoOutputArray: PPIOPMVideoOutput
): HResult; winapi;


//#ifndef DO_NOT_USE_DIRECTX_OR_DXVA2

function OPMGetVideoOutputsFromIDirect3DDevice9Object(
  var pDirect3DDevice9: IDirect3DDevice9;
  vos: OPM_VIDEO_OUTPUT_SEMANTICS;
  var pulNumVideoOutputs: ULONG;
  var pppOPMVideoOutputArray: PPIOPMVideoOutput
): HResult; winapi;

//#endif // DO_NOT_USE_DIRECTX_OR_DXVA2


#pragma pack( pop )
#endif // OPM_API_DEFINED


extern RPC_IF_HANDLE __MIDL_itf_opmapi_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_opmapi_0000_0001_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



#pragma option pop /*P_O_Pop*/

implementation

end.
