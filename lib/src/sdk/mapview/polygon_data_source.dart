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

/// @nodoc
abstract class PolygonDataSource {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// PolygonDataSource "private" section, not exported.

final _sdkMapviewPolygondatasourceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PolygonDataSource_copy_handle'));
final _sdkMapviewPolygondatasourceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PolygonDataSource_release_handle'));


class PolygonDataSource$Impl extends __lib.NativeBase implements PolygonDataSource {

  PolygonDataSource$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewPolygondatasourceReleaseHandle(handle);
    handle = nullptr;
  }


}

Pointer<Void> sdkMapviewPolygondatasourceToFfi(PolygonDataSource value) =>
  _sdkMapviewPolygondatasourceCopyHandle((value as __lib.NativeBase).handle);

PolygonDataSource sdkMapviewPolygondatasourceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as PolygonDataSource;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewPolygondatasourceCopyHandle(handle);
  final result = PolygonDataSource$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewPolygondatasourceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPolygondatasourceReleaseHandle(handle);

Pointer<Void> sdkMapviewPolygondatasourceToFfiNullable(PolygonDataSource value) =>
  value != null ? sdkMapviewPolygondatasourceToFfi(value) : Pointer<Void>.fromAddress(0);

PolygonDataSource? sdkMapviewPolygondatasourceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPolygondatasourceFromFfi(handle) : null;

void sdkMapviewPolygondatasourceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPolygondatasourceReleaseHandle(handle);

// End of PolygonDataSource "private" section.

