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
import 'package:here_sdk/src/sdk/core/angle.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';
import 'package:meta/meta.dart';

/// Abstract class for handling pinch rotate gestures.
///
/// Pinch rotate gesture occurs when two fingers are on the screen
/// and at least one of them moves.
abstract class PinchRotateListener {
  PinchRotateListener();

  factory PinchRotateListener.fromLambdas({
    required void Function(GestureState, Point2D, Point2D, double, Angle) lambda_onPinchRotate,

  }) => PinchRotateListener$Lambdas(
    lambda_onPinchRotate,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the pinch rotate gesture occurs.
  ///
  /// [state] Determines in which state the gesture is.
  ///
  /// [pinchOrigin] Position where the pinch happened relative to the MapView in pixels.
  ///
  /// [rotationOrigin] Position where the rotation happened relative to the MapView in pixels.
  ///
  /// [twoFingerDistance] Distance between the two fingers in pixels.
  ///
  /// [rotation] Fingers rotation angle delta. Indicates how much the fingers rotation angle has changed
  /// since the previous gesture update. Clockwise finger rotation gives positive deltas,
  /// counter clockwise finger rotation gives negative deltas.
  ///
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation);
}


// PinchRotateListener "private" section, not exported.

final _sdkGesturesPinchrotatelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_copy_handle'));
final _sdkGesturesPinchrotatelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_release_handle'));
final _sdkGesturesPinchrotatelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_PinchRotateListener_create_proxy'));
final _sdkGesturesPinchrotatelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_get_type_id'));


class PinchRotateListener$Lambdas implements PinchRotateListener {
  void Function(GestureState, Point2D, Point2D, double, Angle) lambda_onPinchRotate;

  PinchRotateListener$Lambdas(
    this.lambda_onPinchRotate,

  );

  @override
  void release() {}

  @override
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) =>
    lambda_onPinchRotate(state, pinchOrigin, rotationOrigin, twoFingerDistance, rotation);
}

class PinchRotateListener$Impl extends __lib.NativeBase implements PinchRotateListener {

  PinchRotateListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkGesturesPinchrotatelistenerReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) {
    final _onPinchRotateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_gestures_PinchRotateListener_onPinchRotate__GestureState_Point2D_Point2D_Double_Angle'));
    final _stateHandle = sdkGesturesGesturestateToFfi(state);
    final _pinchOriginHandle = sdkCorePoint2dToFfi(pinchOrigin);
    final _rotationOriginHandle = sdkCorePoint2dToFfi(rotationOrigin);
    final _twoFingerDistanceHandle = (twoFingerDistance);
    final _rotationHandle = sdkCoreAngleToFfi(rotation);
    final _handle = this.handle;
    final __resultHandle = _onPinchRotateFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle, _pinchOriginHandle, _rotationOriginHandle, _twoFingerDistanceHandle, _rotationHandle);
    sdkGesturesGesturestateReleaseFfiHandle(_stateHandle);
    sdkCorePoint2dReleaseFfiHandle(_pinchOriginHandle);
    sdkCorePoint2dReleaseFfiHandle(_rotationOriginHandle);

    sdkCoreAngleReleaseFfiHandle(_rotationHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkGesturesPinchrotatelisteneronPinchRotateStatic(int _token, int state, Pointer<Void> pinchOrigin, Pointer<Void> rotationOrigin, double twoFingerDistance, Pointer<Void> rotation) {

  try {
    (__lib.instanceCache[_token] as PinchRotateListener).onPinchRotate(sdkGesturesGesturestateFromFfi(state), sdkCorePoint2dFromFfi(pinchOrigin), sdkCorePoint2dFromFfi(rotationOrigin), (twoFingerDistance), sdkCoreAngleFromFfi(rotation));
  } finally {
    sdkGesturesGesturestateReleaseFfiHandle(state);
    sdkCorePoint2dReleaseFfiHandle(pinchOrigin);
    sdkCorePoint2dReleaseFfiHandle(rotationOrigin);
    
    sdkCoreAngleReleaseFfiHandle(rotation);
  }
  return 0;
}


Pointer<Void> sdkGesturesPinchrotatelistenerToFfi(PinchRotateListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesPinchrotatelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesPinchrotatelistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>)>(_sdkGesturesPinchrotatelisteneronPinchRotateStatic, __lib.unknownError)
  );

  return result;
}

PinchRotateListener sdkGesturesPinchrotatelistenerFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as PinchRotateListener;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkGesturesPinchrotatelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesPinchrotatelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PinchRotateListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkGesturesPinchrotatelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesPinchrotatelistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesPinchrotatelistenerToFfiNullable(PinchRotateListener value) =>
  value != null ? sdkGesturesPinchrotatelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

PinchRotateListener? sdkGesturesPinchrotatelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesPinchrotatelistenerFromFfi(handle) : null;

void sdkGesturesPinchrotatelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesPinchrotatelistenerReleaseHandle(handle);

// End of PinchRotateListener "private" section.

