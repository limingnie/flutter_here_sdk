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

/// Represents an angle independent of the unit of measurement.
abstract class Angle {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Creates a new angle object based on the supplied angle value in degrees.
  ///
  /// [angle] Angle value in degrees.
  ///
  /// Returns [Angle]. The angle as specified by input in degrees.
  ///
  static Angle fromDegrees(double angle) => Angle$Impl.fromDegrees(angle);
  /// Creates a new angle object based on the supplied angle value in radians.
  ///
  /// [angle] Angle value in radians.
  ///
  /// Returns [Angle]. The angle as specified by input in radians.
  ///
  static Angle fromRadians(double angle) => Angle$Impl.fromRadians(angle);
  /// Gets the value of this angle in degrees.
  double get degrees;

  /// Gets the value of this angle in radians.
  double get radians;

}


// Angle "private" section, not exported.

final _sdkCoreAngleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_copy_handle'));
final _sdkCoreAngleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_release_handle'));




class Angle$Impl extends __lib.NativeBase implements Angle {

  Angle$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkCoreAngleReleaseHandle(handle);
    handle = nullptr;
  }

  static Angle fromDegrees(double angle) {
    final _fromDegreesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromDegrees__Double'));
    final _angleHandle = (angle);
    final __resultHandle = _fromDegreesFfi(__lib.LibraryContext.isolateId, _angleHandle);

    try {
      return sdkCoreAngleFromFfi(__resultHandle);
    } finally {
      sdkCoreAngleReleaseFfiHandle(__resultHandle);

    }

  }

  static Angle fromRadians(double angle) {
    final _fromRadiansFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromRadians__Double'));
    final _angleHandle = (angle);
    final __resultHandle = _fromRadiansFfi(__lib.LibraryContext.isolateId, _angleHandle);

    try {
      return sdkCoreAngleFromFfi(__resultHandle);
    } finally {
      sdkCoreAngleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  double get degrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_degrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  double get radians {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_radians_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkCoreAngleToFfi(Angle value) =>
  _sdkCoreAngleCopyHandle((value as __lib.NativeBase).handle);

Angle sdkCoreAngleFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Angle;
  if (instance != null) return instance;

  final _copiedHandle = _sdkCoreAngleCopyHandle(handle);
  final result = Angle$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkCoreAngleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreAngleReleaseHandle(handle);

Pointer<Void> sdkCoreAngleToFfiNullable(Angle value) =>
  value != null ? sdkCoreAngleToFfi(value) : Pointer<Void>.fromAddress(0);

Angle? sdkCoreAngleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreAngleFromFfi(handle) : null;

void sdkCoreAngleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAngleReleaseHandle(handle);

// End of Angle "private" section.

