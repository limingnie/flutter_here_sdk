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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

/// All the options to specify how a pedestrian route should be calculated.

class PedestrianOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Specifies the speed that will be used by the service as the walking speed
  /// for pedestrian routing in meters per second. It influences the duration of
  /// walking segments along the route. The provided value must be in the range
  /// \[0.5, 2.0\]. When the value is outside this range, an invalid parameter
  /// error is raised. Refer to [RoutingError] for details. The default
  /// speed is 1 meter per second.
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  double walkSpeedInMetersPerSecond;


  PedestrianOptions(this.routeOptions, this.textOptions, this.avoidanceOptions, this.walkSpeedInMetersPerSecond);


  PedestrianOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults(), walkSpeedInMetersPerSecond = 1.0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! PedestrianOptions) return false;
    PedestrianOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        walkSpeedInMetersPerSecond == _other.walkSpeedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + walkSpeedInMetersPerSecond.hashCode;
    return result;
  }
}


// PedestrianOptions "private" section, not exported.

final _sdkRoutingPedestrianoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, double)
  >('here_sdk_sdk_routing_PedestrianOptions_create_handle'));
final _sdkRoutingPedestrianoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_release_handle'));
final _sdkRoutingPedestrianoptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_routeOptions'));
final _sdkRoutingPedestrianoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_textOptions'));
final _sdkRoutingPedestrianoptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_avoidanceOptions'));
final _sdkRoutingPedestrianoptionsGetFieldwalkSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_walkSpeedInMetersPerSecond'));


Pointer<Void> sdkRoutingPedestrianoptionsToFfi(PedestrianOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _walkSpeedInMetersPerSecondHandle = (value.walkSpeedInMetersPerSecond);
  final _result = _sdkRoutingPedestrianoptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _walkSpeedInMetersPerSecondHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  
  return _result;
}

PedestrianOptions sdkRoutingPedestrianoptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingPedestrianoptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingPedestrianoptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingPedestrianoptionsGetFieldavoidanceOptions(handle);
  final _walkSpeedInMetersPerSecondHandle = _sdkRoutingPedestrianoptionsGetFieldwalkSpeedInMetersPerSecond(handle);
  try {
    return PedestrianOptions(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      (_walkSpeedInMetersPerSecondHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    
  }
}

void sdkRoutingPedestrianoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingPedestrianoptionsReleaseHandle(handle);

// Nullable PedestrianOptions

final _sdkRoutingPedestrianoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_create_handle_nullable'));
final _sdkRoutingPedestrianoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_release_handle_nullable'));
final _sdkRoutingPedestrianoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_value_nullable'));

Pointer<Void> sdkRoutingPedestrianoptionsToFfiNullable(PedestrianOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPedestrianoptionsToFfi(value);
  final result = _sdkRoutingPedestrianoptionsCreateHandleNullable(_handle);
  sdkRoutingPedestrianoptionsReleaseFfiHandle(_handle);
  return result;
}

PedestrianOptions? sdkRoutingPedestrianoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPedestrianoptionsGetValueNullable(handle);
  final result = sdkRoutingPedestrianoptionsFromFfi(_handle);
  sdkRoutingPedestrianoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPedestrianoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPedestrianoptionsReleaseHandleNullable(handle);

// End of PedestrianOptions "private" section.

