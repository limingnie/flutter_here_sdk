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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:meta/meta.dart';

/// Abstract class for handling tap gestures.
///
/// Tap gesture occurs after tapping on the screen.
abstract class TapListener {
  TapListener();

  factory TapListener.fromLambdas({
    required void Function(Point2D) lambda_onTap,

  }) => TapListener$Lambdas(
    lambda_onTap,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the tap gesture occurs.
  ///
  /// [origin] Position of the touch point relative to the MapView in pixels.
  ///
  onTap(Point2D origin);
}


// TapListener "private" section, not exported.

final _sdkGesturesTaplistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_copy_handle'));
final _sdkGesturesTaplistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_release_handle'));
final _sdkGesturesTaplistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_TapListener_create_proxy'));
final _sdkGesturesTaplistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_get_type_id'));


class TapListener$Lambdas implements TapListener {
  void Function(Point2D) lambda_onTap;

  TapListener$Lambdas(
    this.lambda_onTap,

  );

  @override
  void release() {}

  @override
  onTap(Point2D origin) =>
    lambda_onTap(origin);
}

class TapListener$Impl extends __lib.NativeBase implements TapListener {

  TapListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkGesturesTaplistenerReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  onTap(Point2D origin) {
    final _onTapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_TapListener_onTap__Point2D'));
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _handle = this.handle;
    final __resultHandle = _onTapFfi(_handle, __lib.LibraryContext.isolateId, _originHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkGesturesTaplisteneronTapStatic(int _token, Pointer<Void> origin) {

  try {
    (__lib.instanceCache[_token] as TapListener).onTap(sdkCorePoint2dFromFfi(origin));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdkGesturesTaplistenerToFfi(TapListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesTaplistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesTaplistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkGesturesTaplisteneronTapStatic, __lib.unknownError)
  );

  return result;
}

TapListener sdkGesturesTaplistenerFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as TapListener;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkGesturesTaplistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesTaplistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TapListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkGesturesTaplistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesTaplistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesTaplistenerToFfiNullable(TapListener value) =>
  value != null ? sdkGesturesTaplistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TapListener? sdkGesturesTaplistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesTaplistenerFromFfi(handle) : null;

void sdkGesturesTaplistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesTaplistenerReleaseHandle(handle);

// End of TapListener "private" section.

