// Copyright (c) 2018-2021 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Version of SDK

class SDKVersion {
  /// Product variant.
  String productVariant;

  /// Version information as string.
  String versionName;

  /// Generation number.
  int versionGeneration;

  /// Major version number.
  int versionMajor;

  /// Minor version number.
  int versionMinor;

  /// Patch number.
  int versionPatch;

  /// Build number.
  int versionBuild;

  /// Version tag.
  String versionTag;


  /// Creates a new SDK version instance from the provided parameter values.

  /// [productVariant] Product variant.

  /// [versionName] Version information as string.

  /// [versionGeneration] Generation number.

  /// [versionMajor] Major version number.

  /// [versionMinor] Minor version number.

  /// [versionPatch] Patch number.

  /// [versionBuild] Build number.

  /// [versionTag] Version tag.

  SDKVersion(this.productVariant, this.versionName, this.versionGeneration, this.versionMajor, this.versionMinor, this.versionPatch, this.versionBuild, this.versionTag);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SDKVersion) return false;
    SDKVersion _other = other;
    return productVariant == _other.productVariant &&
        versionName == _other.versionName &&
        versionGeneration == _other.versionGeneration &&
        versionMajor == _other.versionMajor &&
        versionMinor == _other.versionMinor &&
        versionPatch == _other.versionPatch &&
        versionBuild == _other.versionBuild &&
        versionTag == _other.versionTag;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + productVariant.hashCode;
    result = 31 * result + versionName.hashCode;
    result = 31 * result + versionGeneration.hashCode;
    result = 31 * result + versionMajor.hashCode;
    result = 31 * result + versionMinor.hashCode;
    result = 31 * result + versionPatch.hashCode;
    result = 31 * result + versionBuild.hashCode;
    result = 31 * result + versionTag.hashCode;
    return result;
  }
}


// SDKVersion "private" section, not exported.

final _sdkCoreEngineSdkversionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Int32, Int32, Int32, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, int, int, int, int, Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_create_handle'));
final _sdkCoreEngineSdkversionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_release_handle'));
final _sdkCoreEngineSdkversionGetFieldproductVariant = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_productVariant'));
final _sdkCoreEngineSdkversionGetFieldversionName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionName'));
final _sdkCoreEngineSdkversionGetFieldversionGeneration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionGeneration'));
final _sdkCoreEngineSdkversionGetFieldversionMajor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionMajor'));
final _sdkCoreEngineSdkversionGetFieldversionMinor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionMinor'));
final _sdkCoreEngineSdkversionGetFieldversionPatch = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionPatch'));
final _sdkCoreEngineSdkversionGetFieldversionBuild = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionBuild'));
final _sdkCoreEngineSdkversionGetFieldversionTag = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionTag'));


Pointer<Void> sdkCoreEngineSdkversionToFfi(SDKVersion value) {
  final _productVariantHandle = stringToFfi(value.productVariant);
  final _versionNameHandle = stringToFfi(value.versionName);
  final _versionGenerationHandle = (value.versionGeneration);
  final _versionMajorHandle = (value.versionMajor);
  final _versionMinorHandle = (value.versionMinor);
  final _versionPatchHandle = (value.versionPatch);
  final _versionBuildHandle = (value.versionBuild);
  final _versionTagHandle = stringToFfi(value.versionTag);
  final _result = _sdkCoreEngineSdkversionCreateHandle(_productVariantHandle, _versionNameHandle, _versionGenerationHandle, _versionMajorHandle, _versionMinorHandle, _versionPatchHandle, _versionBuildHandle, _versionTagHandle);
  stringReleaseFfiHandle(_productVariantHandle);
  stringReleaseFfiHandle(_versionNameHandle);
  
  
  
  
  
  stringReleaseFfiHandle(_versionTagHandle);
  return _result;
}

SDKVersion sdkCoreEngineSdkversionFromFfi(Pointer<Void> handle) {
  final _productVariantHandle = _sdkCoreEngineSdkversionGetFieldproductVariant(handle);
  final _versionNameHandle = _sdkCoreEngineSdkversionGetFieldversionName(handle);
  final _versionGenerationHandle = _sdkCoreEngineSdkversionGetFieldversionGeneration(handle);
  final _versionMajorHandle = _sdkCoreEngineSdkversionGetFieldversionMajor(handle);
  final _versionMinorHandle = _sdkCoreEngineSdkversionGetFieldversionMinor(handle);
  final _versionPatchHandle = _sdkCoreEngineSdkversionGetFieldversionPatch(handle);
  final _versionBuildHandle = _sdkCoreEngineSdkversionGetFieldversionBuild(handle);
  final _versionTagHandle = _sdkCoreEngineSdkversionGetFieldversionTag(handle);
  try {
    return SDKVersion(
      stringFromFfi(_productVariantHandle), 
      stringFromFfi(_versionNameHandle), 
      (_versionGenerationHandle), 
      (_versionMajorHandle), 
      (_versionMinorHandle), 
      (_versionPatchHandle), 
      (_versionBuildHandle), 
      stringFromFfi(_versionTagHandle)
    );
  } finally {
    stringReleaseFfiHandle(_productVariantHandle);
    stringReleaseFfiHandle(_versionNameHandle);
    
    
    
    
    
    stringReleaseFfiHandle(_versionTagHandle);
  }
}

void sdkCoreEngineSdkversionReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineSdkversionReleaseHandle(handle);

// Nullable SDKVersion

final _sdkCoreEngineSdkversionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_create_handle_nullable'));
final _sdkCoreEngineSdkversionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_release_handle_nullable'));
final _sdkCoreEngineSdkversionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_value_nullable'));

Pointer<Void> sdkCoreEngineSdkversionToFfiNullable(SDKVersion value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineSdkversionToFfi(value);
  final result = _sdkCoreEngineSdkversionCreateHandleNullable(_handle);
  sdkCoreEngineSdkversionReleaseFfiHandle(_handle);
  return result;
}

SDKVersion? sdkCoreEngineSdkversionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineSdkversionGetValueNullable(handle);
  final result = sdkCoreEngineSdkversionFromFfi(_handle);
  sdkCoreEngineSdkversionReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineSdkversionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdkversionReleaseHandleNullable(handle);

// End of SDKVersion "private" section.

