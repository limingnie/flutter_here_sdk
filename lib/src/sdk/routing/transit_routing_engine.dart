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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/transit_route_options.dart';
import 'package:here_sdk/src/sdk/routing/transit_waypoint.dart';

/// Use the TransitRoutingEngine to calculate a public transit route from A to B with
/// a number of waypoints in between.
///
/// Route calculation is done asynchronously and requires an
/// online connection. The resulting route contains various
/// information such as the polyline, route length in meters,
/// estimated time to traverse along the route and maneuver data.
abstract class TransitRoutingEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TransitRoutingEngine() => TransitRoutingEngine$Impl.$init();
  /// Creates a new instance of TransitRoutingEngine.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TransitRoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine) => TransitRoutingEngine$Impl.withSdkEngine(sdkEngine);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Asynchronously calculates a public transit route from the origin to the destination.
  ///
  /// [startingPoint] Position of starting point.
  ///
  /// [destination] Position of destination.
  ///
  /// [routeOptions] Options for public transit route calculation.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateRoute(TransitWaypoint startingPoint, TransitWaypoint destination, TransitRouteOptions routeOptions, CalculateRouteCallback callback);
}


// TransitRoutingEngine "private" section, not exported.

final _sdkRoutingTransitroutingengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_copy_handle'));
final _sdkRoutingTransitroutingengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_release_handle'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_has_error'));



class TransitRoutingEngine$Impl extends __lib.NativeBase implements TransitRoutingEngine {

  TransitRoutingEngine$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingTransitroutingengineReleaseHandle(handle);
    handle = nullptr;
  }


  TransitRoutingEngine$Impl.$init() : super(_$init()) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  TransitRoutingEngine$Impl.withSdkEngine(SDKNativeEngine sdkEngine) : super(_withSdkEngine(sdkEngine)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_TransitRoutingEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  calculateRoute(TransitWaypoint startingPoint, TransitWaypoint destination, TransitRouteOptions routeOptions, CalculateRouteCallback callback) {
    final _calculateRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_TransitRoutingEngine_calculateRoute__TransitWaypoint_TransitWaypoint_TransitRouteOptions_CalculateRouteCallback'));
    final _startingPointHandle = sdkRoutingTransitwaypointToFfi(startingPoint);
    final _destinationHandle = sdkRoutingTransitwaypointToFfi(destination);
    final _routeOptionsHandle = sdkRoutingTransitrouteoptionsToFfi(routeOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateRouteFfi(_handle, __lib.LibraryContext.isolateId, _startingPointHandle, _destinationHandle, _routeOptionsHandle, _callbackHandle);
    sdkRoutingTransitwaypointReleaseFfiHandle(_startingPointHandle);
    sdkRoutingTransitwaypointReleaseFfiHandle(_destinationHandle);
    sdkRoutingTransitrouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

Pointer<Void> sdkRoutingTransitroutingengineToFfi(TransitRoutingEngine value) =>
  _sdkRoutingTransitroutingengineCopyHandle((value as __lib.NativeBase).handle);

TransitRoutingEngine sdkRoutingTransitroutingengineFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as TransitRoutingEngine;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingTransitroutingengineCopyHandle(handle);
  final result = TransitRoutingEngine$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingTransitroutingengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingTransitroutingengineReleaseHandle(handle);

Pointer<Void> sdkRoutingTransitroutingengineToFfiNullable(TransitRoutingEngine value) =>
  value != null ? sdkRoutingTransitroutingengineToFfi(value) : Pointer<Void>.fromAddress(0);

TransitRoutingEngine? sdkRoutingTransitroutingengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingTransitroutingengineFromFfi(handle) : null;

void sdkRoutingTransitroutingengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitroutingengineReleaseHandle(handle);

// End of TransitRoutingEngine "private" section.

