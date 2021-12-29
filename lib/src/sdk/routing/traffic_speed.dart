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

/// The traffic speed information.

class TrafficSpeed {
  /// Initial index over [Section] polyline for which the traffic speed
  /// information is valid. The valid range end is either the offset of the next one,
  /// or to the end of the polyline if there are no other traffic speed information.
  int offset;

  /// Expected travel speed in regular conditions.
  double baseSpeedInMetersPerSecond;

  /// Travel speed in current traffic conditions.
  double trafficSpeedInMetersPerSecond;

  /// The traffic jam factor shows the traffic condition in a numeric way. It is a
  /// value in the range \[0.0, 10.0\]. A large jamFactor value means more traffic jam
  /// in general. Specifically, 0.0 means free traffic and 10.0 means stationary traffic.
  double jamFactor;


  TrafficSpeed(this.offset, this.baseSpeedInMetersPerSecond, this.trafficSpeedInMetersPerSecond, this.jamFactor);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TrafficSpeed) return false;
    TrafficSpeed _other = other;
    return offset == _other.offset &&
        baseSpeedInMetersPerSecond == _other.baseSpeedInMetersPerSecond &&
        trafficSpeedInMetersPerSecond == _other.trafficSpeedInMetersPerSecond &&
        jamFactor == _other.jamFactor;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + offset.hashCode;
    result = 31 * result + baseSpeedInMetersPerSecond.hashCode;
    result = 31 * result + trafficSpeedInMetersPerSecond.hashCode;
    result = 31 * result + jamFactor.hashCode;
    return result;
  }
}


// TrafficSpeed "private" section, not exported.

final _sdkRoutingTrafficspeedCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_create_handle'));
final _sdkRoutingTrafficspeedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_release_handle'));
final _sdkRoutingTrafficspeedGetFieldoffset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_offset'));
final _sdkRoutingTrafficspeedGetFieldbaseSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_baseSpeedInMetersPerSecond'));
final _sdkRoutingTrafficspeedGetFieldtrafficSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_trafficSpeedInMetersPerSecond'));
final _sdkRoutingTrafficspeedGetFieldjamFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_jamFactor'));


Pointer<Void> sdkRoutingTrafficspeedToFfi(TrafficSpeed value) {
  final _offsetHandle = (value.offset);
  final _baseSpeedInMetersPerSecondHandle = doubleToFfiNullable(value.baseSpeedInMetersPerSecond);
  final _trafficSpeedInMetersPerSecondHandle = doubleToFfiNullable(value.trafficSpeedInMetersPerSecond);
  final _jamFactorHandle = doubleToFfiNullable(value.jamFactor);
  final _result = _sdkRoutingTrafficspeedCreateHandle(_offsetHandle, _baseSpeedInMetersPerSecondHandle, _trafficSpeedInMetersPerSecondHandle, _jamFactorHandle);
  
  doubleReleaseFfiHandleNullable(_baseSpeedInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_trafficSpeedInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_jamFactorHandle);
  return _result;
}

TrafficSpeed sdkRoutingTrafficspeedFromFfi(Pointer<Void> handle) {
  final _offsetHandle = _sdkRoutingTrafficspeedGetFieldoffset(handle);
  final _baseSpeedInMetersPerSecondHandle = _sdkRoutingTrafficspeedGetFieldbaseSpeedInMetersPerSecond(handle);
  final _trafficSpeedInMetersPerSecondHandle = _sdkRoutingTrafficspeedGetFieldtrafficSpeedInMetersPerSecond(handle);
  final _jamFactorHandle = _sdkRoutingTrafficspeedGetFieldjamFactor(handle);
  try {
    return TrafficSpeed(
      (_offsetHandle), 
      doubleFromFfiNullable(_baseSpeedInMetersPerSecondHandle)!,
      doubleFromFfiNullable(_trafficSpeedInMetersPerSecondHandle)!,
      doubleFromFfiNullable(_jamFactorHandle)!
    );
  } finally {
    
    doubleReleaseFfiHandleNullable(_baseSpeedInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_trafficSpeedInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_jamFactorHandle);
  }
}

void sdkRoutingTrafficspeedReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTrafficspeedReleaseHandle(handle);

// Nullable TrafficSpeed

final _sdkRoutingTrafficspeedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_create_handle_nullable'));
final _sdkRoutingTrafficspeedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_release_handle_nullable'));
final _sdkRoutingTrafficspeedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_value_nullable'));

Pointer<Void> sdkRoutingTrafficspeedToFfiNullable(TrafficSpeed value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTrafficspeedToFfi(value);
  final result = _sdkRoutingTrafficspeedCreateHandleNullable(_handle);
  sdkRoutingTrafficspeedReleaseFfiHandle(_handle);
  return result;
}

TrafficSpeed? sdkRoutingTrafficspeedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTrafficspeedGetValueNullable(handle);
  final result = sdkRoutingTrafficspeedFromFfi(_handle);
  sdkRoutingTrafficspeedReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTrafficspeedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTrafficspeedReleaseHandleNullable(handle);

// End of TrafficSpeed "private" section.

