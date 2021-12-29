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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:meta/meta.dart';

/// This abstract class should be implemented in order to receive notifications
/// about location updates.
abstract class LocationListener {
  LocationListener();

  factory LocationListener.fromLambdas({
    required void Function(location_impl.Location) lambda_onLocationUpdated,

  }) => LocationListener$Lambdas(
    lambda_onLocationUpdated,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called each time a new location is available.
  ///
  /// Invoked on the main thread.
  ///
  /// [location] Current location.
  ///
  onLocationUpdated(location_impl.Location location);
}


// LocationListener "private" section, not exported.

final _sdkCoreLocationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_copy_handle'));
final _sdkCoreLocationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_release_handle'));
final _sdkCoreLocationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_LocationListener_create_proxy'));
final _sdkCoreLocationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_get_type_id'));


class LocationListener$Lambdas implements LocationListener {
  void Function(location_impl.Location) lambda_onLocationUpdated;

  LocationListener$Lambdas(
    this.lambda_onLocationUpdated,

  );

  @override
  void release() {}

  @override
  onLocationUpdated(location_impl.Location location) =>
    lambda_onLocationUpdated(location);
}

class LocationListener$Impl extends __lib.NativeBase implements LocationListener {

  LocationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkCoreLocationlistenerReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationListener_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    final __resultHandle = _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkCoreLocationlisteneronLocationUpdatedStatic(int _token, Pointer<Void> location) {

  try {
    (__lib.instanceCache[_token] as LocationListener).onLocationUpdated(sdkCoreLocationFromFfi(location));
  } finally {
    sdkCoreLocationReleaseFfiHandle(location);
  }
  return 0;
}


Pointer<Void> sdkCoreLocationlistenerToFfi(LocationListener value) {
  if (value is __lib.NativeBase) return _sdkCoreLocationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreLocationlistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkCoreLocationlisteneronLocationUpdatedStatic, __lib.unknownError)
  );

  return result;
}

LocationListener sdkCoreLocationlistenerFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LocationListener;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkCoreLocationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreLocationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkCoreLocationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreLocationlistenerReleaseHandle(handle);

Pointer<Void> sdkCoreLocationlistenerToFfiNullable(LocationListener value) =>
  value != null ? sdkCoreLocationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LocationListener? sdkCoreLocationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreLocationlistenerFromFfi(handle) : null;

void sdkCoreLocationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocationlistenerReleaseHandle(handle);

// End of LocationListener "private" section.

