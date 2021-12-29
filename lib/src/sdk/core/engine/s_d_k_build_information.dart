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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/engine/s_d_k_version.dart';

/// Provides information about the SDK build.
abstract class SDKBuildInformation {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();


  /// Returns [SDKVersion]. SDK version information.
  ///
  static SDKVersion sdkVersion() => SDKBuildInformation$Impl.sdkVersion();
}


// SDKBuildInformation "private" section, not exported.

final _sdkCoreEngineSdkbuildinformationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKBuildInformation_copy_handle'));
final _sdkCoreEngineSdkbuildinformationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKBuildInformation_release_handle'));



class SDKBuildInformation$Impl extends __lib.NativeBase implements SDKBuildInformation {

  SDKBuildInformation$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkCoreEngineSdkbuildinformationReleaseHandle(handle);
    handle = nullptr;
  }

  static SDKVersion sdkVersion() {
    final _sdkVersionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKBuildInformation_sdkVersion'));
    final __resultHandle = _sdkVersionFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineSdkversionFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkversionReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkCoreEngineSdkbuildinformationToFfi(SDKBuildInformation value) =>
  _sdkCoreEngineSdkbuildinformationCopyHandle((value as __lib.NativeBase).handle);

SDKBuildInformation sdkCoreEngineSdkbuildinformationFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SDKBuildInformation;
  if (instance != null) return instance;

  final _copiedHandle = _sdkCoreEngineSdkbuildinformationCopyHandle(handle);
  final result = SDKBuildInformation$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkCoreEngineSdkbuildinformationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdkbuildinformationReleaseHandle(handle);

Pointer<Void> sdkCoreEngineSdkbuildinformationToFfiNullable(SDKBuildInformation value) =>
  value != null ? sdkCoreEngineSdkbuildinformationToFfi(value) : Pointer<Void>.fromAddress(0);

SDKBuildInformation? sdkCoreEngineSdkbuildinformationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineSdkbuildinformationFromFfi(handle) : null;

void sdkCoreEngineSdkbuildinformationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdkbuildinformationReleaseHandle(handle);

// End of SDKBuildInformation "private" section.

