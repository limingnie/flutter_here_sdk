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
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/transport_mode.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';

/// The options to specify how to refresh an already calculated route identified by a [RouteHandle].
///
/// All the
/// options that may result in a new route shape are ignored as no new route is calculated. Instead, only the data that
/// accompanies a route, such as traffic information, can be refreshed. Therefore, the following route options are ignored:
/// [RouteOptions.alternatives], [RouteOptions.arrivalTime], and [RouteOptions.optimizationMode].
/// If new [AvoidanceOptions] are specified, they are ignored as well and instead new [Section.notices]
/// are generated that indicate where the requested [AvoidanceOptions] are violated. Note that when
/// [EVCarOptions.ensureReachability] is set to true, the route refresh request will fail as this option
/// is incompatible with a fixed route shape.
/// If any of the ignored options are important, consider calculating a new route instead.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class RefreshRouteOptions {
  /// Constructs a RefreshRouteOptions object with [TransportMode].
  ///
  /// [transportMode] Updates the transport mode for the route.
  ///
  factory RefreshRouteOptions.withTransportMode(TransportMode transportMode) => RefreshRouteOptions$Impl.withTransportMode(transportMode);
  /// Constructs a RefreshRouteOptions object with [CarOptions].
  ///
  /// [carOptions] Converts the route to a car route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withCarOptions(CarOptions carOptions) => RefreshRouteOptions$Impl.withCarOptions(carOptions);
  /// Constructs a RefreshRouteOptions object with [TruckOptions].
  ///
  /// [truckOptions] Converts the route to a truck route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withTruckOptions(TruckOptions truckOptions) => RefreshRouteOptions$Impl.withTruckOptions(truckOptions);
  /// Constructs a RefreshRouteOptions object with [PedestrianOptions].
  ///
  /// [pedestrianOptions] Converts the route to a pedestrian route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withPedestrianOptions(PedestrianOptions pedestrianOptions) => RefreshRouteOptions$Impl.withPedestrianOptions(pedestrianOptions);
  /// Constructs a RefreshRouteOptions object with [ScooterOptions].
  ///
  /// [scooterOptions] Converts the route to a scooter route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withScooterOptions(ScooterOptions scooterOptions) => RefreshRouteOptions$Impl.withScooterOptions(scooterOptions);
  /// Constructs a RefreshRouteOptions object with [TaxiOptions].
  ///
  /// [taxiOptions] Converts the route to a taxi route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withTaxiOptions(TaxiOptions taxiOptions) => RefreshRouteOptions$Impl.withTaxiOptions(taxiOptions);
  /// Constructs a RefreshRouteOptions object with [EVCarOptions].
  ///
  /// [evCarOptions] Converts the route to an electric car route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withEVCarOptions(EVCarOptions evCarOptions) => RefreshRouteOptions$Impl.withEVCarOptions(evCarOptions);
  /// Constructs a RefreshRouteOptions object with [EVTruckOptions].
  ///
  /// [evTruckOptions] Converts the route to an electric truck route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withEVTruckOptions(EVTruckOptions evTruckOptions) => RefreshRouteOptions$Impl.withEVTruckOptions(evTruckOptions);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Updates the existing starting point of the route.
  ///
  /// It should be of type [WaypointType.stopover]
  /// and very close to the original route specified with the [RouteHandle]. Since the new starting
  /// point is expected to be along the original route, the original route geometry is
  /// used to reach the remaining waypoints. The new route will not include the [Waypoint] items that
  /// lie behind the new starting point (ie. the path that was already travelled). Plus, [Route.lengthInMeters]
  /// and [Route.durationInSeconds] values are from the new starting point to the destination.
  /// If the new waypoint is too far off the original route, the route refresh may fail and an
  /// [RoutingError.noRouteFound] error is triggered. In that case, an application may decide to
  /// calculate a new route from scratch.
  ///
  /// [startingPoint] The new starting point, that should replace the original starting point.
  ///
  RefreshRouteOptions updateStartingPoint(Waypoint startingPoint);
}


// RefreshRouteOptions "private" section, not exported.

final _sdkRoutingRefreshrouteoptionsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RefreshRouteOptions_copy_handle'));
final _sdkRoutingRefreshrouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RefreshRouteOptions_release_handle'));











class RefreshRouteOptions$Impl extends __lib.NativeBase implements RefreshRouteOptions {

  RefreshRouteOptions$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingRefreshrouteoptionsReleaseHandle(handle);
    handle =  nullptr;
  }


  RefreshRouteOptions$Impl.withTransportMode(TransportMode transportMode) : super(_withTransportMode(transportMode)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withCarOptions(CarOptions carOptions) : super(_withCarOptions(carOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withTruckOptions(TruckOptions truckOptions) : super(_withTruckOptions(truckOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withPedestrianOptions(PedestrianOptions pedestrianOptions) : super(_withPedestrianOptions(pedestrianOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withScooterOptions(ScooterOptions scooterOptions) : super(_withScooterOptions(scooterOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withTaxiOptions(TaxiOptions taxiOptions) : super(_withTaxiOptions(taxiOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withEVCarOptions(EVCarOptions evCarOptions) : super(_withEVCarOptions(evCarOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  RefreshRouteOptions$Impl.withEVTruckOptions(EVTruckOptions evTruckOptions) : super(_withEVTruckOptions(evTruckOptions)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _withTransportMode(TransportMode transportMode) {
    final _withTransportModeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32), Pointer<Void> Function(int, int)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TransportMode'));
    final _transportModeHandle = sdkRoutingTransportmodeToFfi(transportMode);
    final __resultHandle = _withTransportModeFfi(__lib.LibraryContext.isolateId, _transportModeHandle);
    sdkRoutingTransportmodeReleaseFfiHandle(_transportModeHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withCarOptions(CarOptions carOptions) {
    final _withCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__CarOptions'));
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final __resultHandle = _withCarOptionsFfi(__lib.LibraryContext.isolateId, _carOptionsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTruckOptions(TruckOptions truckOptions) {
    final _withTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TruckOptions'));
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final __resultHandle = _withTruckOptionsFfi(__lib.LibraryContext.isolateId, _truckOptionsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withPedestrianOptions(PedestrianOptions pedestrianOptions) {
    final _withPedestrianOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__PedestrianOptions'));
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final __resultHandle = _withPedestrianOptionsFfi(__lib.LibraryContext.isolateId, _pedestrianOptionsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withScooterOptions(ScooterOptions scooterOptions) {
    final _withScooterOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__ScooterOptions'));
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final __resultHandle = _withScooterOptionsFfi(__lib.LibraryContext.isolateId, _scooterOptionsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTaxiOptions(TaxiOptions taxiOptions) {
    final _withTaxiOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TaxiOptions'));
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final __resultHandle = _withTaxiOptionsFfi(__lib.LibraryContext.isolateId, _taxiOptionsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEVCarOptions(EVCarOptions evCarOptions) {
    final _withEVCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__EVCarOptions'));
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final __resultHandle = _withEVCarOptionsFfi(__lib.LibraryContext.isolateId, _evCarOptionsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEVTruckOptions(EVTruckOptions evTruckOptions) {
    final _withEVTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__EVTruckOptions'));
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final __resultHandle = _withEVTruckOptionsFfi(__lib.LibraryContext.isolateId, _evTruckOptionsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    return __resultHandle;
  }

  @override
  RefreshRouteOptions updateStartingPoint(Waypoint startingPoint) {
    final _updateStartingPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_updateStartingPoint__Waypoint'));
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _handle = this.handle;
    final __resultHandle = _updateStartingPointFfi(_handle, __lib.LibraryContext.isolateId, _startingPointHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);
    try {
      return sdkRoutingRefreshrouteoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingRefreshrouteoptionsReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkRoutingRefreshrouteoptionsToFfi(RefreshRouteOptions value) =>
  _sdkRoutingRefreshrouteoptionsCopyHandle((value as __lib.NativeBase).handle);

RefreshRouteOptions sdkRoutingRefreshrouteoptionsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as RefreshRouteOptions;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingRefreshrouteoptionsCopyHandle(handle);
  final result = RefreshRouteOptions$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingRefreshrouteoptionsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRefreshrouteoptionsReleaseHandle(handle);

Pointer<Void> sdkRoutingRefreshrouteoptionsToFfiNullable(RefreshRouteOptions value) =>
  value != null ? sdkRoutingRefreshrouteoptionsToFfi(value) : Pointer<Void>.fromAddress(0);

RefreshRouteOptions? sdkRoutingRefreshrouteoptionsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRefreshrouteoptionsFromFfi(handle) : null;

void sdkRoutingRefreshrouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRefreshrouteoptionsReleaseHandle(handle);

// End of RefreshRouteOptions "private" section.

