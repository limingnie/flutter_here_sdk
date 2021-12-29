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
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';
import 'package:meta/meta.dart';

/// Abstract class for handling two finger pan gestures.
///
/// Two finger pan gesture occurs when two fingers are on the screen
/// and both of them are moving vertically.
abstract class TwoFingerPanListener {
  TwoFingerPanListener();

  factory TwoFingerPanListener.fromLambdas({
    required void Function(GestureState, Point2D, Point2D, double) lambda_onTwoFingerPan,

  }) => TwoFingerPanListener$Lambdas(
    lambda_onTwoFingerPan,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the two finger pan gesture occurs.
  ///
  /// [state] Determines in which state the gesture is.
  ///
  /// [origin] Position halfway between two touch points relative to the MapView in pixels.
  ///
  /// [translation] Translation offset since the last position in pixels.
  ///
  /// [velocity] Velocity of panning in pixels per millisecond.
  ///
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity);
}


// TwoFingerPanListener "private" section, not exported.

final _sdkGesturesTwofingerpanlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_copy_handle'));
final _sdkGesturesTwofingerpanlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_release_handle'));
final _sdkGesturesTwofingerpanlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_create_proxy'));
final _sdkGesturesTwofingerpanlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_get_type_id'));


class TwoFingerPanListener$Lambdas implements TwoFingerPanListener {
  void Function(GestureState, Point2D, Point2D, double) lambda_onTwoFingerPan;

  TwoFingerPanListener$Lambdas(
    this.lambda_onTwoFingerPan,

  );

  @override
  void release() {}

  @override
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity) =>
    lambda_onTwoFingerPan(state, origin, translation, velocity);
}

class TwoFingerPanListener$Impl extends __lib.NativeBase implements TwoFingerPanListener {

  TwoFingerPanListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkGesturesTwofingerpanlistenerReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity) {
    final _onTwoFingerPanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_gestures_TwoFingerPanListener_onTwoFingerPan__GestureState_Point2D_Point2D_Double'));
    final _stateHandle = sdkGesturesGesturestateToFfi(state);
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _translationHandle = sdkCorePoint2dToFfi(translation);
    final _velocityHandle = (velocity);
    final _handle = this.handle;
    final __resultHandle = _onTwoFingerPanFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle, _originHandle, _translationHandle, _velocityHandle);
    sdkGesturesGesturestateReleaseFfiHandle(_stateHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    sdkCorePoint2dReleaseFfiHandle(_translationHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkGesturesTwofingerpanlisteneronTwoFingerPanStatic(int _token, int state, Pointer<Void> origin, Pointer<Void> translation, double velocity) {

  try {
    (__lib.instanceCache[_token] as TwoFingerPanListener).onTwoFingerPan(sdkGesturesGesturestateFromFfi(state), sdkCorePoint2dFromFfi(origin), sdkCorePoint2dFromFfi(translation), (velocity));
  } finally {
    sdkGesturesGesturestateReleaseFfiHandle(state);
    sdkCorePoint2dReleaseFfiHandle(origin);
    sdkCorePoint2dReleaseFfiHandle(translation);
    
  }
  return 0;
}


Pointer<Void> sdkGesturesTwofingerpanlistenerToFfi(TwoFingerPanListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesTwofingerpanlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesTwofingerpanlistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>, Pointer<Void>, Double)>(_sdkGesturesTwofingerpanlisteneronTwoFingerPanStatic, __lib.unknownError)
  );

  return result;
}

TwoFingerPanListener sdkGesturesTwofingerpanlistenerFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as TwoFingerPanListener;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkGesturesTwofingerpanlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesTwofingerpanlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TwoFingerPanListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkGesturesTwofingerpanlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesTwofingerpanlistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesTwofingerpanlistenerToFfiNullable(TwoFingerPanListener value) =>
  value != null ? sdkGesturesTwofingerpanlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TwoFingerPanListener? sdkGesturesTwofingerpanlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesTwofingerpanlistenerFromFfi(handle) : null;

void sdkGesturesTwofingerpanlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesTwofingerpanlistenerReleaseHandle(handle);

// End of TwoFingerPanListener "private" section.

