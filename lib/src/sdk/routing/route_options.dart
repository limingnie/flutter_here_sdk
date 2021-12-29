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
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';

/// The options to specify how the route will be calculated.

class RouteOptions {
  /// The optimization mode to be used for route calculation.
  OptimizationMode optimizationMode;

  /// Maximum number of alternative routes that will be calculated, in addition
  /// to the best one. The provided value must be in the range \[0, 6\].
  /// Alternative routes can be unavailable, thus they are not guaranteed to be returned.
  /// The order of routes is from the best to the worst, as evaluated by the route calculation
  /// algorithm and according to the given input parameters.
  /// Defaults to 0, which means there are no alternatives, i.e. only the best route is returned.
  /// Must be 0 for isoline calculation.
  int alternatives;

  /// Optional time when travel is expected to start. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route.
  /// Note that in the event of a past departure time, the historical traffic is limited to one year. If it
  /// is not specified, it is set to the current time.
  DateTime? departureTime;

  /// Optional time when travel is expected to end. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route.
  /// Note this parameter is not yet supported for route calculation.
  DateTime? arrivalTime;

  /// Specifies the maximum speed in meters per second, which the user wishes not to exceed.
  /// The valid range is \[1, 70\] meters per second. Note that it is valid only for [TransportMode.car],
  /// [TransportMode.truck] and [TransportMode.scooter] transport modes.
  /// For car, truck and scooter transport modes, it will affect [Route.durationInSeconds] of
  /// the route. Only for scooter transport mode, it may affect the route geometry. Defaults to `null`,
  /// which means that no speed cap is set.
  double? speedCapInMetersPerSecond;

  /// A flag that indicates whether the resulting route should contain a [RouteHandle].
  /// Defaults to false.
  bool? enableRouteHandle;


  RouteOptions([OptimizationMode optimizationMode = OptimizationMode.fastest, int alternatives = 0, DateTime? departureTime = null, DateTime? arrivalTime = null, double? speedCapInMetersPerSecond = null, bool? enableRouteHandle = false])
    : optimizationMode = optimizationMode, alternatives = alternatives, departureTime = departureTime, arrivalTime = arrivalTime, speedCapInMetersPerSecond = speedCapInMetersPerSecond!, enableRouteHandle = enableRouteHandle;


  RouteOptions.withDefaults()
    : optimizationMode = OptimizationMode.fastest, alternatives = 0, departureTime = null, arrivalTime = null, speedCapInMetersPerSecond = null, enableRouteHandle = false;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! RouteOptions) return false;
    RouteOptions _other = other;
    return optimizationMode == _other.optimizationMode &&
        alternatives == _other.alternatives &&
        departureTime == _other.departureTime &&
        arrivalTime == _other.arrivalTime &&
        speedCapInMetersPerSecond == _other.speedCapInMetersPerSecond &&
        enableRouteHandle == _other.enableRouteHandle;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + optimizationMode.hashCode;
    result = 31 * result + alternatives.hashCode;
    result = 31 * result + departureTime.hashCode;
    result = 31 * result + arrivalTime.hashCode;
    result = 31 * result + speedCapInMetersPerSecond.hashCode;
    result = 31 * result + enableRouteHandle.hashCode;
    return result;
  }
}


// RouteOptions "private" section, not exported.

final _sdkRoutingRouteoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_RouteOptions_create_handle'));
final _sdkRoutingRouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle'));
final _sdkRoutingRouteoptionsGetFieldoptimizationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_optimizationMode'));
final _sdkRoutingRouteoptionsGetFieldalternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_alternatives'));
final _sdkRoutingRouteoptionsGetFielddepartureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_departureTime'));
final _sdkRoutingRouteoptionsGetFieldarrivalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_arrivalTime'));
final _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_speedCapInMetersPerSecond'));
final _sdkRoutingRouteoptionsGetFieldenableRouteHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableRouteHandle'));


Pointer<Void> sdkRoutingRouteoptionsToFfi(RouteOptions value) {
  final _optimizationModeHandle = sdkRoutingOptimizationmodeToFfi(value.optimizationMode);
  final _alternativesHandle = (value.alternatives);
  final _departureTimeHandle = dateToFfiNullable(value.departureTime!);
  final _arrivalTimeHandle = dateToFfiNullable(value.arrivalTime!);
  final _speedCapInMetersPerSecondHandle = doubleToFfiNullable(value.speedCapInMetersPerSecond!);
  final _enableRouteHandleHandle = booleanToFfi(value.enableRouteHandle!);
  final _result = _sdkRoutingRouteoptionsCreateHandle(_optimizationModeHandle, _alternativesHandle, _departureTimeHandle, _arrivalTimeHandle, _speedCapInMetersPerSecondHandle, _enableRouteHandleHandle);
  sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
  
  dateReleaseFfiHandleNullable(_departureTimeHandle);
  dateReleaseFfiHandleNullable(_arrivalTimeHandle);
  doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
  booleanReleaseFfiHandle(_enableRouteHandleHandle);
  return _result;
}

RouteOptions sdkRoutingRouteoptionsFromFfi(Pointer<Void> handle) {
  final _optimizationModeHandle = _sdkRoutingRouteoptionsGetFieldoptimizationMode(handle);
  final _alternativesHandle = _sdkRoutingRouteoptionsGetFieldalternatives(handle);
  final _departureTimeHandle = _sdkRoutingRouteoptionsGetFielddepartureTime(handle);
  final _arrivalTimeHandle = _sdkRoutingRouteoptionsGetFieldarrivalTime(handle);
  final _speedCapInMetersPerSecondHandle = _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond(handle);
  final _enableRouteHandleHandle = _sdkRoutingRouteoptionsGetFieldenableRouteHandle(handle);
  try {
    return RouteOptions(
      sdkRoutingOptimizationmodeFromFfi(_optimizationModeHandle), 
      (_alternativesHandle), 
      dateFromFfiNullable(_departureTimeHandle), 
      dateFromFfiNullable(_arrivalTimeHandle), 
      doubleFromFfiNullable(_speedCapInMetersPerSecondHandle), 
      booleanFromFfi(_enableRouteHandleHandle)
    );
  } finally {
    sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
    
    dateReleaseFfiHandleNullable(_departureTimeHandle);
    dateReleaseFfiHandleNullable(_arrivalTimeHandle);
    doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
    booleanReleaseFfiHandle(_enableRouteHandleHandle);
  }
}

void sdkRoutingRouteoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRouteoptionsReleaseHandle(handle);

// Nullable RouteOptions

final _sdkRoutingRouteoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_create_handle_nullable'));
final _sdkRoutingRouteoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle_nullable'));
final _sdkRoutingRouteoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_value_nullable'));

Pointer<Void> sdkRoutingRouteoptionsToFfiNullable(RouteOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouteoptionsToFfi(value);
  final result = _sdkRoutingRouteoptionsCreateHandleNullable(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

RouteOptions? sdkRoutingRouteoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouteoptionsGetValueNullable(handle);
  final result = sdkRoutingRouteoptionsFromFfi(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteoptionsReleaseHandleNullable(handle);

// End of RouteOptions "private" section.

