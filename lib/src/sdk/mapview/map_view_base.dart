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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/size2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gestures.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';
import 'package:here_sdk/src/sdk/mapview/map_representable.dart';
import 'package:here_sdk/src/sdk/mapview/map_scene.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';
import 'package:here_sdk/src/sdk/mapview/pick_map_items_result.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_placement.dart';
import 'package:meta/meta.dart';

/// Represents the available public API from  MapView.
abstract class MapViewBase {
  MapViewBase();

  factory MapViewBase.fromLambdas({
    required GeoCoordinates Function(Point2D) lambda_viewToGeoCoordinates,
    required Point2D Function(GeoCoordinates) lambda_geoToViewCoordinates,
    required void Function(WatermarkPlacement, int) lambda_setWatermarkPosition,
    required void Function(MapRepresentable) lambda_addMapRepresentable,
    required void Function(MapRepresentable) lambda_removeMapRepresentable,
    required void Function(MapViewLifecycleListener) lambda_addLifecycleListener,
    required void Function(MapViewLifecycleListener) lambda_removeLifecycleListener,
    required void Function(Point2D, double, MapViewBasePickMapItemsCallback) lambda_pickMapItems,
    required MapCamera Function() lambda_camera_get,
    required Gestures Function() lambda_gestures_get,
    required MapScene Function() lambda_mapScene_get,
    required Size2D Function() lambda_viewportSize_get,
    required int Function() lambda_frameRate_get,
    required void Function(int) lambda_frameRate_set,
    required double Function() lambda_pixelScale_get
  }) => MapViewBase$Lambdas(
    lambda_viewToGeoCoordinates,
    lambda_geoToViewCoordinates,
    lambda_setWatermarkPosition,
    lambda_addMapRepresentable,
    lambda_removeMapRepresentable,
    lambda_addLifecycleListener,
    lambda_removeLifecycleListener,
    lambda_pickMapItems,
    lambda_camera_get,
    lambda_gestures_get,
    lambda_mapScene_get,
    lambda_viewportSize_get,
    lambda_frameRate_get,
    lambda_frameRate_set,
    lambda_pixelScale_get
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Converts view coordinates to geographical coordinates.
  ///
  /// If the MapView does not have a rendered surface attached,
  /// it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  ///
  /// [viewCoordinates] Point on the screen to convert.
  ///
  /// Returns [GeoCoordinates]. The converted GeoCoordinate or `null` if there is no rendered
  /// surface attached.
  ///
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates);
  /// Converts geographical coordinates to view coordinates.
  ///
  /// View coordinates might be outside of current viewport, i.e. result might contain values
  /// less than zero or greater than view's dimensions. If the MapView does not have a rendered
  /// surface attached, it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  ///
  /// [geoCoordinates] Geographical coordinates to convert.
  ///
  /// Returns [Point2D]. The converted point on the map or `null` in cases described in
  /// the method description.
  ///
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates);
  /// Sets the HERE logo watermark location within the map view.
  ///
  /// Defaults to [WatermarkPlacement.bottomRight].
  /// It is recommended to change the default placement only when it
  /// is required due to overlapping UI elements.
  /// The margin will only be applied if the placement is equal to
  /// [WatermarkPlacement.bottomCenter].
  /// If the map view is smaller then half of the total screen size
  /// either horizontally or vertically then the watermark remains in
  /// the default position (bottom right). For map views that are smaller
  /// then 250 dip in width and height the watermark will not be shown.
  ///
  /// [placement] Placement of HERE logo watermark. For more details please see
  /// [WatermarkPlacement].
  ///
  /// [bottomCenterMargin] An optional margin for the distance to the bottom measured in physical pixels.
  /// The value zero corresponds to the default margin. The margin will always be
  /// set to zero (default margin) if the placement is not equal to
  /// [WatermarkPlacement.bottomCenter].
  ///
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin);
  /// Adds a MapRepresentable to this map view.
  ///
  /// Adding the same object multiple times has no effect.
  ///
  /// [mapRepresentable] An object implementing [MapRepresentable].
  ///
  @Deprecated("Will be removed in v4.9.0. Use [MapViewBase.addLifecycleListener] instead.")

  addMapRepresentable(MapRepresentable mapRepresentable);
  /// Removes a MapRepresentable from this map view.
  ///
  /// Trying to remove an object that was not added or was removed before
  /// has no effect.
  ///
  /// [mapRepresentable] An object implementing [MapRepresentable].
  ///
  @Deprecated("Will be removed in v4.9.0. Use [MapViewBase.removeLifecycleListener] instead.")

  removeMapRepresentable(MapRepresentable mapRepresentable);
  /// Adds a [MapViewLifecycleListener] to this map view.
  ///
  /// Adding the same object multiple times has no effect.
  ///
  /// [lifecycleListener] An object to be notified of lifecycle events.
  ///
  addLifecycleListener(MapViewLifecycleListener lifecycleListener);
  /// Removes a [MapViewLifecycleListener] from this map view.
  ///
  /// Trying to remove an object that was not added or was removed before
  /// has no effect.
  ///
  /// [lifecycleListener] An object to stop being notified of lifecycle events.
  ///
  removeLifecycleListener(MapViewLifecycleListener lifecycleListener);
  /// Returns all map items located inside the specified pick area.
  ///
  /// The pick area is a circle
  /// defined by a center point and radius.
  ///
  /// [centerPoint] The center point of the pick area, in view coordinates.
  ///
  /// [radius] The radius of the pick area, in pixels.
  ///
  /// [callback] Callback to call with the result. This will be called on main thread when the operation
  /// has completed.
  ///
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback);
  /// Gets the camera to control the view for the map.
  MapCamera get camera;

  /// Gets the gestures control object.
  Gestures get gestures;

  /// Gets the map scene associated with this map view.
  MapScene get mapScene;

  /// Gets the viewport size in physical pixels.
  Size2D get viewportSize;

  /// Gets maximum render frame rate in frames per second. The default value is 60 frames per second.
  int get frameRate;
  /// Sets maximum render frame rate in frames per second. Setting to 0 disables automatic rendering for this view. Setting negative values has no effect.
  set frameRate(int value);

  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density
  ///
  /// .
  /// It can be used to translate between physical pixels and
  ///
  /// according to the formula:
  double get pixelScale;

}

/// Callback after pick map items operation has completed.
///
/// If the pick operation failed,
/// null will be returned.
typedef MapViewBasePickMapItemsCallback = void Function(PickMapItemsResult);

// MapViewBasePickMapItemsCallback "private" section, not exported.

final _sdkMapviewMapviewbasePickmapitemscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_copy_handle'));
final _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle'));
final _sdkMapviewMapviewbasePickmapitemscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_proxy'));

class MapViewBasePickMapItemsCallback$Impl {
  final Pointer<Void> handle;
  MapViewBasePickMapItemsCallback$Impl(this.handle);

  void release() => _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandle(handle);

  call(PickMapItemsResult p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_call__PickMapItemsResult'));
    final _p0Handle = sdkMapviewPickmapitemsresultToFfiNullable(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(_p0Handle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

}

int _sdkMapviewMapviewbasePickmapitemscallbackcallStatic(int _token, Pointer<Void> p0) {
  
  try {
    (__lib.instanceCache[_token] as MapViewBasePickMapItemsCallback)(sdkMapviewPickmapitemsresultFromFfiNullable(p0)!);
  } finally {
    sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapviewbasePickmapitemscallbackToFfi(MapViewBasePickMapItemsCallback value) {
  final result = _sdkMapviewMapviewbasePickmapitemscallbackCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapviewbasePickmapitemscallbackcallStatic, __lib.unknownError)
  );

  return result;
}

MapViewBasePickMapItemsCallback sdkMapviewMapviewbasePickmapitemscallbackFromFfi(Pointer<Void> handle) {
  final _impl = MapViewBasePickMapItemsCallback$Impl(_sdkMapviewMapviewbasePickmapitemscallbackCopyHandle(handle));
  return (PickMapItemsResult p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}

void sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandle(handle);

// Nullable MapViewBasePickMapItemsCallback

final _sdkMapviewMapviewbasePickmapitemscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_handle_nullable'));
final _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle_nullable'));
final _sdkMapviewMapviewbasePickmapitemscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewbasePickmapitemscallbackToFfiNullable(MapViewBasePickMapItemsCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewbasePickmapitemscallbackToFfi(value);
  final result = _sdkMapviewMapviewbasePickmapitemscallbackCreateHandleNullable(_handle);
  sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_handle);
  return result;
}

MapViewBasePickMapItemsCallback? sdkMapviewMapviewbasePickmapitemscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapviewbasePickmapitemscallbackGetValueNullable(handle);
  final result = sdkMapviewMapviewbasePickmapitemscallbackFromFfi(_handle);
  sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandleNullable(handle);

// End of MapViewBasePickMapItemsCallback "private" section.

// MapViewBase "private" section, not exported.

final _sdkMapviewMapviewbaseCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_copy_handle'));
final _sdkMapviewMapviewbaseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_release_handle'));
final _sdkMapviewMapviewbaseCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_create_proxy'));
final _sdkMapviewMapviewbaseGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_get_type_id'));









class MapViewBase$Lambdas implements MapViewBase {
  GeoCoordinates Function(Point2D) lambda_viewToGeoCoordinates;
  Point2D Function(GeoCoordinates) lambda_geoToViewCoordinates;
  void Function(WatermarkPlacement, int) lambda_setWatermarkPosition;
  void Function(MapRepresentable) lambda_addMapRepresentable;
  void Function(MapRepresentable) lambda_removeMapRepresentable;
  void Function(MapViewLifecycleListener) lambda_addLifecycleListener;
  void Function(MapViewLifecycleListener) lambda_removeLifecycleListener;
  void Function(Point2D, double, MapViewBasePickMapItemsCallback) lambda_pickMapItems;
  MapCamera Function() lambda_camera_get;
  Gestures Function() lambda_gestures_get;
  MapScene Function() lambda_mapScene_get;
  Size2D Function() lambda_viewportSize_get;
  int Function() lambda_frameRate_get;
  void Function(int) lambda_frameRate_set;
  double Function() lambda_pixelScale_get;

  MapViewBase$Lambdas(
    this.lambda_viewToGeoCoordinates,
    this.lambda_geoToViewCoordinates,
    this.lambda_setWatermarkPosition,
    this.lambda_addMapRepresentable,
    this.lambda_removeMapRepresentable,
    this.lambda_addLifecycleListener,
    this.lambda_removeLifecycleListener,
    this.lambda_pickMapItems,
    this.lambda_camera_get,
    this.lambda_gestures_get,
    this.lambda_mapScene_get,
    this.lambda_viewportSize_get,
    this.lambda_frameRate_get,
    this.lambda_frameRate_set,
    this.lambda_pixelScale_get
  );

  @override
  void release() {}

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) =>
    lambda_viewToGeoCoordinates(viewCoordinates);
  @override
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates) =>
    lambda_geoToViewCoordinates(geoCoordinates);
  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) =>
    lambda_setWatermarkPosition(placement, bottomCenterMargin);
  @override
  addMapRepresentable(MapRepresentable mapRepresentable) =>
    lambda_addMapRepresentable(mapRepresentable);
  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) =>
    lambda_removeMapRepresentable(mapRepresentable);
  @override
  addLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
    lambda_addLifecycleListener(lifecycleListener);
  @override
  removeLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
    lambda_removeLifecycleListener(lifecycleListener);
  @override
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) {
   // print("pick");
    lambda_pickMapItems(centerPoint, radius, callback);
  }
  @override
  MapCamera get camera => lambda_camera_get();
  @override
  Gestures get gestures => lambda_gestures_get();
  @override
  MapScene get mapScene => lambda_mapScene_get();
  @override
  Size2D get viewportSize => lambda_viewportSize_get();
  @override
  int get frameRate => lambda_frameRate_get();
  @override
  set frameRate(int value) => lambda_frameRate_set(value);
  @override
  double get pixelScale => lambda_pixelScale_get();
}

class MapViewBase$Impl extends __lib.NativeBase implements MapViewBase {

  MapViewBase$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapviewbaseReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) {
    final _viewToGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_viewToGeoCoordinates__Point2D'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _handle = this.handle;
    final __resultHandle = _viewToGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _viewCoordinatesHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates) {
    final _geoToViewCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_geoToViewCoordinates__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = this.handle;
    final __resultHandle = _geoToViewCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCorePoint2dFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCorePoint2dReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) {
    final _setWatermarkPositionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32), void Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapViewBase_setWatermarkPosition__WatermarkPlacement_UInt'));
    final _placementHandle = sdkMapviewWatermarkplacementToFfi(placement);
    final _bottomCenterMarginHandle = (bottomCenterMargin);
    final _handle = this.handle;
    final __resultHandle = _setWatermarkPositionFfi(_handle, __lib.LibraryContext.isolateId, _placementHandle, _bottomCenterMarginHandle);
    sdkMapviewWatermarkplacementReleaseFfiHandle(_placementHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  addMapRepresentable(MapRepresentable mapRepresentable) {
    final _addMapRepresentableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_addMapRepresentable__MapRepresentable'));
    final _mapRepresentableHandle = sdkMapviewMaprepresentableToFfi(mapRepresentable);
    final _handle = this.handle;
    final __resultHandle = _addMapRepresentableFfi(_handle, __lib.LibraryContext.isolateId, _mapRepresentableHandle);
    sdkMapviewMaprepresentableReleaseFfiHandle(_mapRepresentableHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) {
    final _removeMapRepresentableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_removeMapRepresentable__MapRepresentable'));
    final _mapRepresentableHandle = sdkMapviewMaprepresentableToFfi(mapRepresentable);
    final _handle = this.handle;
    final __resultHandle = _removeMapRepresentableFfi(_handle, __lib.LibraryContext.isolateId, _mapRepresentableHandle);
    sdkMapviewMaprepresentableReleaseFfiHandle(_mapRepresentableHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  addLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _addLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_addLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    final __resultHandle = _addLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  removeLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _removeLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_removeLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    final __resultHandle = _removeLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) {
    final _pickMapItemsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_pickMapItems__Point2D_Double_PickMapItemsCallback'));
    final _centerPointHandle = sdkCorePoint2dToFfi(centerPoint);
    final _radiusHandle = (radius);
    final _callbackHandle = sdkMapviewMapviewbasePickmapitemscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _pickMapItemsFfi(_handle, __lib.LibraryContext.isolateId, _centerPointHandle, _radiusHandle, _callbackHandle);
    sdkCorePoint2dReleaseFfiHandle(_centerPointHandle);

    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  /// Gets the camera to control the view for the map.
  MapCamera get camera {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_camera_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcameraFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the gestures control object.
  Gestures get gestures {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_gestures_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesGesturesFromFfi(__resultHandle);
    } finally {
      sdkGesturesGesturesReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the map scene associated with this map view.
  MapScene get mapScene {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_mapScene_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapsceneFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapsceneReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the viewport size in physical pixels.
  Size2D get viewportSize {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_viewportSize_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreSize2dFromFfi(__resultHandle);
    } finally {
      sdkCoreSize2dReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets maximum render frame rate in frames per second. The default value is 60 frames per second.
  int get frameRate {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  /// Sets maximum render frame rate in frames per second. Setting to 0 disables automatic rendering for this view. Setting negative values has no effect.
  set frameRate(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }


  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density
  ///
  /// .
  /// It can be used to translate between physical pixels and
  ///
  /// according to the formula:
  double get pixelScale {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_pixelScale_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

int _sdkMapviewMapviewbaseviewToGeoCoordinatesStatic(int _token, Pointer<Void> viewCoordinates, Pointer<Pointer<Void>> _result) {
  GeoCoordinates _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as MapViewBase).viewToGeoCoordinates(sdkCorePoint2dFromFfi(viewCoordinates));
    _result.value = sdkCoreGeocoordinatesToFfiNullable(_resultObject);
  } finally {
    sdkCorePoint2dReleaseFfiHandle(viewCoordinates);
  }
  return 0;
}
int _sdkMapviewMapviewbasegeoToViewCoordinatesStatic(int _token, Pointer<Void> geoCoordinates, Pointer<Pointer<Void>> _result) {
  Point2D _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as MapViewBase).geoToViewCoordinates(sdkCoreGeocoordinatesFromFfi(geoCoordinates));
    _result.value = sdkCorePoint2dToFfiNullable(_resultObject);
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(geoCoordinates);
  }
  return 0;
}
int _sdkMapviewMapviewbasesetWatermarkPositionStatic(int _token, int placement, int bottomCenterMargin) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).setWatermarkPosition(sdkMapviewWatermarkplacementFromFfi(placement), (bottomCenterMargin));
  } finally {
    sdkMapviewWatermarkplacementReleaseFfiHandle(placement);
    
  }
  return 0;
}
int _sdkMapviewMapviewbaseaddMapRepresentableStatic(int _token, Pointer<Void> mapRepresentable) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).addMapRepresentable(sdkMapviewMaprepresentableFromFfi(mapRepresentable));
  } finally {
    sdkMapviewMaprepresentableReleaseFfiHandle(mapRepresentable);
  }
  return 0;
}
int _sdkMapviewMapviewbaseremoveMapRepresentableStatic(int _token, Pointer<Void> mapRepresentable) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).removeMapRepresentable(sdkMapviewMaprepresentableFromFfi(mapRepresentable));
  } finally {
    sdkMapviewMaprepresentableReleaseFfiHandle(mapRepresentable);
  }
  return 0;
}
int _sdkMapviewMapviewbaseaddLifecycleListenerStatic(int _token, Pointer<Void> lifecycleListener) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).addLifecycleListener(sdkMapviewMapviewlifecyclelistenerFromFfi(lifecycleListener));
  } finally {
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(lifecycleListener);
  }
  return 0;
}
int _sdkMapviewMapviewbaseremoveLifecycleListenerStatic(int _token, Pointer<Void> lifecycleListener) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).removeLifecycleListener(sdkMapviewMapviewlifecyclelistenerFromFfi(lifecycleListener));
  } finally {
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(lifecycleListener);
  }
  return 0;
}
int _sdkMapviewMapviewbasepickMapItemsStatic(int _token, Pointer<Void> centerPoint, double radius, Pointer<Void> callback) {
//print("_token $_token");
//print("centerPoint ${centerPoint.address}");
//print("radius $radius");
  try {
    (__lib.instanceCache[_token] as MapViewBase).pickMapItems(sdkCorePoint2dFromFfi(centerPoint), (radius), sdkMapviewMapviewbasePickmapitemscallbackFromFfi(callback));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(centerPoint);
    
    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(callback);
  }
  return 0;
}

int _sdkMapviewMapviewbasecameraGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewMapcameraToFfi((__lib.instanceCache[_token] as MapViewBase).camera);
  return 0;
}
int _sdkMapviewMapviewbasegesturesGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdkGesturesGesturesToFfi((__lib.instanceCache[_token] as MapViewBase).gestures);
  return 0;
}
int _sdkMapviewMapviewbasemapSceneGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewMapsceneToFfi((__lib.instanceCache[_token] as MapViewBase).mapScene);
  return 0;
}
int _sdkMapviewMapviewbaseviewportSizeGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreSize2dToFfi((__lib.instanceCache[_token] as MapViewBase).viewportSize);
  return 0;
}
int _sdkMapviewMapviewbaseframeRateGetStatic(int _token, Pointer<Int32> _result) {
  _result.value = ((__lib.instanceCache[_token] as MapViewBase).frameRate);
  return 0;
}

int _sdkMapviewMapviewbaseframeRateSetStatic(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as MapViewBase).frameRate =
      (_value);
  } finally {
    
  }
  return 0;
}
int _sdkMapviewMapviewbasepixelScaleGetStatic(int _token, Pointer<Double> _result) {
  _result.value = ((__lib.instanceCache[_token] as MapViewBase).pixelScale);
  return 0;
}

Pointer<Void> sdkMapviewMapviewbaseToFfi(MapViewBase value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapviewbaseCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapviewbaseCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbaseviewToGeoCoordinatesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasegeoToViewCoordinatesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Uint32)>(_sdkMapviewMapviewbasesetWatermarkPositionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapviewbaseaddMapRepresentableStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapviewbaseremoveMapRepresentableStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapviewbaseaddLifecycleListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapviewbaseremoveLifecycleListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Double, Pointer<Void>)>(_sdkMapviewMapviewbasepickMapItemsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasecameraGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasegesturesGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasemapSceneGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbaseviewportSizeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Int32>)>(_sdkMapviewMapviewbaseframeRateGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Int32)>(_sdkMapviewMapviewbaseframeRateSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Double>)>(_sdkMapviewMapviewbasepixelScaleGetStatic, __lib.unknownError)
  );

  return result;
}

MapViewBase sdkMapviewMapviewbaseFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapViewBase;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkMapviewMapviewbaseGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapviewbaseCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapViewBase$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapviewbaseReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewbaseReleaseHandle(handle);

Pointer<Void> sdkMapviewMapviewbaseToFfiNullable(MapViewBase value) =>
  value != null ? sdkMapviewMapviewbaseToFfi(value) : Pointer<Void>.fromAddress(0);

MapViewBase? sdkMapviewMapviewbaseFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapviewbaseFromFfi(handle) : null;

void sdkMapviewMapviewbaseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewbaseReleaseHandle(handle);

// End of MapViewBase "private" section.

