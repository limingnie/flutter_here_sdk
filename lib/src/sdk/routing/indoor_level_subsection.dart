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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';

/// @nodoc
abstract class IndoorLevelSubsection {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// @nodoc
  List<GeoCoordinates> get internalpolyline;

  /// @nodoc
  IndoorLocationDataInternal get internalindoorLocation;

  /// @nodoc
  List<Maneuver> get internalmaneuvers;

}


// IndoorLevelSubsection "private" section, not exported.

final _sdkRoutingIndoorlevelsubsectionCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_copy_handle'));
final _sdkRoutingIndoorlevelsubsectionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_release_handle'));


class IndoorLevelSubsection$Impl extends __lib.NativeBase implements IndoorLevelSubsection {

  IndoorLevelSubsection$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingIndoorlevelsubsectionReleaseHandle(handle);
    handle = nullptr;
  }


  /*late*/ List<GeoCoordinates>? _polylineCache;
  bool _polylineIsCached = false;
  @override

  List<GeoCoordinates> get internalpolyline {
    if (!_polylineIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_polyline_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _polylineCache = heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

      }
      _polylineIsCached = true;
    }
    return _polylineCache!;
  }

  @override
  IndoorLocationDataInternal get internalindoorLocation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_indoorLocation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorlocationdatainternalFromFfi(__resultHandle);
    } finally {
      sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(__resultHandle);

    }

  }



  /*late*/ List<Maneuver>? _maneuversCache;
  bool _maneuversIsCached = false;
  @override

  List<Maneuver> get internalmaneuvers {
    if (!_maneuversIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_maneuvers_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _maneuversCache = heresdkRoutingCommonBindingsListofSdkRoutingManeuverFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingManeuverReleaseFfiHandle(__resultHandle);

      }
      _maneuversIsCached = true;
    }
    return _maneuversCache!;
  }


}

Pointer<Void> sdkRoutingIndoorlevelsubsectionToFfi(IndoorLevelSubsection value) =>
  _sdkRoutingIndoorlevelsubsectionCopyHandle((value as __lib.NativeBase).handle);

IndoorLevelSubsection sdkRoutingIndoorlevelsubsectionFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as IndoorLevelSubsection;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingIndoorlevelsubsectionCopyHandle(handle);
  final result = IndoorLevelSubsection$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingIndoorlevelsubsectionReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingIndoorlevelsubsectionReleaseHandle(handle);

Pointer<Void> sdkRoutingIndoorlevelsubsectionToFfiNullable(IndoorLevelSubsection value) =>
  value != null ? sdkRoutingIndoorlevelsubsectionToFfi(value) : Pointer<Void>.fromAddress(0);

IndoorLevelSubsection? sdkRoutingIndoorlevelsubsectionFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingIndoorlevelsubsectionFromFfi(handle) : null;

void sdkRoutingIndoorlevelsubsectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoorlevelsubsectionReleaseHandle(handle);

// End of IndoorLevelSubsection "private" section.

