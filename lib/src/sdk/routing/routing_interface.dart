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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';
import 'package:meta/meta.dart';

abstract class RoutingInterface {
  RoutingInterface();

  factory RoutingInterface.fromLambdas({
    required void Function(List<Waypoint>, CarOptions, CalculateRouteCallback) lambda_calculateCarRoute,
    required void Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) lambda_calculatePedestrianRoute,
    required void Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) lambda_calculateTruckRoute,
    required void Function(List<Waypoint>, ScooterOptions, CalculateRouteCallback) lambda_calculateScooterRoute,
    required void Function(List<Waypoint>, TaxiOptions, CalculateRouteCallback) lambda_calculateTaxiRoute,
    required void Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) lambda_calculateEVCarRoute,
    required void Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) lambda_calculateEVTruckRoute,

  }) => RoutingInterface$Lambdas(
    lambda_calculateCarRoute,
    lambda_calculatePedestrianRoute,
    lambda_calculateTruckRoute,
    lambda_calculateScooterRoute,
    lambda_calculateTaxiRoute,
    lambda_calculateEVCarRoute,
    lambda_calculateEVTruckRoute,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Asynchronously calculates a car route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [carOptions] Options specific for car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a pedestrian route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [pedestrianOptions] Options specific for pedestrian route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for pedestrians and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a truck route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [truckOptions] Options specific for truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a scooter route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [scooterOptions] Options specific for scooter route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for scooters and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a taxi route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases or even become unsupported, without a
  /// deprecation process.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [taxiOptions] Options specific for taxi route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for taxis and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electric car route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [evCarOptions] Options specific for an electric car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electic truck route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [evTruckOptions] Options specific for an electric truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback);
}


// RoutingInterface "private" section, not exported.

final _sdkRoutingRoutinginterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_copy_handle'));
final _sdkRoutingRoutinginterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_release_handle'));
final _sdkRoutingRoutinginterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_routing_RoutingInterface_create_proxy'));
final _sdkRoutingRoutinginterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_get_type_id'));








class RoutingInterface$Lambdas implements RoutingInterface {
  void Function(List<Waypoint>, CarOptions, CalculateRouteCallback) lambda_calculateCarRoute;
  void Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) lambda_calculatePedestrianRoute;
  void Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) lambda_calculateTruckRoute;
  void Function(List<Waypoint>, ScooterOptions, CalculateRouteCallback) lambda_calculateScooterRoute;
  void Function(List<Waypoint>, TaxiOptions, CalculateRouteCallback) lambda_calculateTaxiRoute;
  void Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) lambda_calculateEVCarRoute;
  void Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) lambda_calculateEVTruckRoute;

  RoutingInterface$Lambdas(
    this.lambda_calculateCarRoute,
    this.lambda_calculatePedestrianRoute,
    this.lambda_calculateTruckRoute,
    this.lambda_calculateScooterRoute,
    this.lambda_calculateTaxiRoute,
    this.lambda_calculateEVCarRoute,
    this.lambda_calculateEVTruckRoute,

  );

  @override
  void release() {}

  @override
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) =>
    lambda_calculateCarRoute(waypoints, carOptions, callback);
  @override
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) =>
    lambda_calculatePedestrianRoute(waypoints, pedestrianOptions, callback);
  @override
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) =>
    lambda_calculateTruckRoute(waypoints, truckOptions, callback);
  @override
  calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) =>
    lambda_calculateScooterRoute(waypoints, scooterOptions, callback);
  @override
  calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) =>
    lambda_calculateTaxiRoute(waypoints, taxiOptions, callback);
  @override
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) =>
    lambda_calculateEVCarRoute(waypoints, evCarOptions, callback);
  @override
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) =>
    lambda_calculateEVTruckRoute(waypoints, evTruckOptions, callback);
}

class RoutingInterface$Impl extends __lib.NativeBase implements RoutingInterface {

  RoutingInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingRoutinginterfaceReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _carOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _calculatePedestrianRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_PedestrianOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculatePedestrianRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _pedestrianOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _calculateTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_TruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _truckOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) {
    final _calculateScooterRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_ScooterOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateScooterRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _scooterOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) {
    final _calculateTaxiRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_TaxiOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTaxiRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _taxiOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _calculateEVCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_EVCarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evCarOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _calculateEVTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_EVTruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingsListofSdkRoutingWaypointToFfi(waypoints);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evTruckOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkRoutingRoutinginterfacecalculateCarRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> carOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateCarRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingCaroptionsFromFfi(carOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingCaroptionsReleaseFfiHandle(carOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculatePedestrianRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> pedestrianOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculatePedestrianRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingPedestrianoptionsFromFfi(pedestrianOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(pedestrianOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateTruckRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> truckOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateTruckRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingTruckoptionsFromFfi(truckOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingTruckoptionsReleaseFfiHandle(truckOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateScooterRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> scooterOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateScooterRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingScooteroptionsFromFfi(scooterOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingScooteroptionsReleaseFfiHandle(scooterOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateTaxiRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> taxiOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateTaxiRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingTaxioptionsFromFfi(taxiOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingTaxioptionsReleaseFfiHandle(taxiOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateEVCarRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> evCarOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateEVCarRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingEvcaroptionsFromFfi(evCarOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingEvcaroptionsReleaseFfiHandle(evCarOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateEVTruckRouteStatic(int _token, Pointer<Void> waypoints, Pointer<Void> evTruckOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateEVTruckRoute(heresdkRoutingCommonBindingsListofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingEvtruckoptionsFromFfi(evTruckOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(evTruckOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}


Pointer<Void> sdkRoutingRoutinginterfaceToFfi(RoutingInterface value) {
  if (value is __lib.NativeBase) return _sdkRoutingRoutinginterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkRoutingRoutinginterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateCarRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculatePedestrianRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateTruckRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateScooterRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateTaxiRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateEVCarRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkRoutingRoutinginterfacecalculateEVTruckRouteStatic, __lib.unknownError)
  );

  return result;
}

RoutingInterface sdkRoutingRoutinginterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as RoutingInterface;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkRoutingRoutinginterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkRoutingRoutinginterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoutingInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingRoutinginterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRoutinginterfaceReleaseHandle(handle);

Pointer<Void> sdkRoutingRoutinginterfaceToFfiNullable(RoutingInterface value) =>
  value != null ? sdkRoutingRoutinginterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

RoutingInterface? sdkRoutingRoutinginterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRoutinginterfaceFromFfi(handle) : null;

void sdkRoutingRoutinginterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutinginterfaceReleaseHandle(handle);

// End of RoutingInterface "private" section.

