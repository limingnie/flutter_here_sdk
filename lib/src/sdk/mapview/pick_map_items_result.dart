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
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';

/// Carries results from the picking of map items on the map scene.
abstract class PickMapItemsResult {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Gets list of markers at the location of picking.
  List<MapMarker> get markers;

  /// Gets list of polylines at the location of picking.
  List<MapPolyline> get polylines;

  /// Gets list of polygons at the location of picking.
  List<MapPolygon> get polygons;
}

// PickMapItemsResult "private" section, not exported.

final _sdkMapviewPickmapitemsresultCopyHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_PickMapItemsResult_copy_handle'));
final _sdkMapviewPickmapitemsresultReleaseHandle = __lib.catchArgumentError(
    () => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>),
            void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_PickMapItemsResult_release_handle'));

class PickMapItemsResult$Impl extends __lib.NativeBase
    implements PickMapItemsResult {
  PickMapItemsResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewPickmapitemsresultReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  List<MapMarker> get markers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_PickMapItemsResult_markers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingsListofSdkMapviewMapmarkerFromFfi(
          __resultHandle);
    } finally {
      heresdkMapviewHarpBindingsListofSdkMapviewMapmarkerReleaseFfiHandle(
          __resultHandle);
    }
  }

  @override
  List<MapPolyline> get polylines {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_PickMapItemsResult_polylines_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingsListofSdkMapviewMappolylineFromFfi(
          __resultHandle);
    } finally {
      heresdkMapviewHarpBindingsListofSdkMapviewMappolylineReleaseFfiHandle(
          __resultHandle);
    }
  }

  @override
  List<MapPolygon> get polygons {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_PickMapItemsResult_polygons_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingsListofSdkMapviewMappolygonFromFfi(
          __resultHandle);
    } finally {
      heresdkMapviewHarpBindingsListofSdkMapviewMappolygonReleaseFfiHandle(
          __resultHandle);
    }
  }
}

Pointer<Void> sdkMapviewPickmapitemsresultToFfi(PickMapItemsResult value) =>
    _sdkMapviewPickmapitemsresultCopyHandle((value as __lib.NativeBase).handle);

PickMapItemsResult sdkMapviewPickmapitemsresultFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache.containsKey(token)
      ? (__lib.instanceCache[token] as PickMapItemsResult)
      : null;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewPickmapitemsresultCopyHandle(handle);
  final result = PickMapItemsResult$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewPickmapitemsresultReleaseFfiHandle(Pointer<Void> handle) =>
    _sdkMapviewPickmapitemsresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapitemsresultToFfiNullable(
        PickMapItemsResult value) =>
    value != null
        ? sdkMapviewPickmapitemsresultToFfi(value)
        : Pointer<Void>.fromAddress(0);

PickMapItemsResult? sdkMapviewPickmapitemsresultFromFfiNullable(
    Pointer<Void> handle) {
 // print("handle.address ${handle.address}");
  return handle.address != 0
      ? sdkMapviewPickmapitemsresultFromFfi(handle)
      : null;
}

void sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(
        Pointer<Void> handle) =>
    _sdkMapviewPickmapitemsresultReleaseHandle(handle);

// End of PickMapItemsResult "private" section.
