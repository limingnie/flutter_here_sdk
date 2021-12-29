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
import 'package:here_sdk/src/sdk/mapview/map_context.dart';

/// @nodoc
abstract class MapContextProvider {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Gets the map context.
  ///
  /// Creates one if necessary (when called for the first time
  /// or after a call to destroy()).
  ///
  /// @nodoc
  static MapContext internalgetInstance() => MapContextProvider$Impl.internalgetInstance();
  /// Destroys the map context.
  ///
  /// The instance is not usable after this point, get a new one
  /// with get_instance() if needed.
  ///
  /// @nodoc
  static internaldestroy() => MapContextProvider$Impl.internaldestroy();
}


// MapContextProvider "private" section, not exported.

final _sdkMapviewMapcontextproviderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_copy_handle'));
final _sdkMapviewMapcontextproviderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_release_handle'));




class MapContextProvider$Impl extends __lib.NativeBase implements MapContextProvider {

  MapContextProvider$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapcontextproviderReleaseHandle(handle);
    handle = nullptr;
  }

  static MapContext internalgetInstance() {
    final _getInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MapContextProvider_getInstance'));
    final __resultHandle = _getInstanceFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcontextFromFfiNullable(__resultHandle)!;
    } finally {
      sdkMapviewMapcontextReleaseFfiHandleNullable(__resultHandle);

    }

  }

  static internaldestroy() {
    final _destroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_mapview_MapContextProvider_destroy'));
    final __resultHandle = _destroyFfi(__lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

Pointer<Void> sdkMapviewMapcontextproviderToFfi(MapContextProvider value) =>
  _sdkMapviewMapcontextproviderCopyHandle((value as __lib.NativeBase).handle);

MapContextProvider sdkMapviewMapcontextproviderFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapContextProvider;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewMapcontextproviderCopyHandle(handle);
  final result = MapContextProvider$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapcontextproviderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcontextproviderReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcontextproviderToFfiNullable(MapContextProvider value) =>
  value != null ? sdkMapviewMapcontextproviderToFfi(value) : Pointer<Void>.fromAddress(0);

MapContextProvider? sdkMapviewMapcontextproviderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcontextproviderFromFfi(handle) : null;

void sdkMapviewMapcontextproviderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontextproviderReleaseHandle(handle);

// End of MapContextProvider "private" section.

