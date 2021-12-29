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
import 'dart:typed_data';
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
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_placement.dart';

/// Internal implementation of the MapView class, which wraps around HARP's C++ API.
/// @nodoc
abstract class MapViewInternal implements MapViewBase {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Creates a screenshot of the map and passes it as byte buffer to a callback.
  ///
  /// [callback] Callback to receive the screenshot bytes.
  ///
  /// @nodoc
  internaltakeScreenshot(MapViewInternalTakeScreenshotCallback callback);
}

/// The method will be called on the main thread when takeScreenshot() has been completed.
/// @nodoc
typedef MapViewInternalTakeScreenshotCallback = void Function(Uint8List);

// MapViewInternalTakeScreenshotCallback "private" section, not exported.

final _sdkMapviewMapviewinternalTakescreenshotcallbackCopyHandle =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_copy_handle'));
final _sdkMapviewMapviewinternalTakescreenshotcallbackReleaseHandle =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_release_handle'));
final _sdkMapviewMapviewinternalTakescreenshotcallbackCreateProxy =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
            Pointer<Void> Function(int, int, Pointer, Pointer)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_create_proxy'));

class MapViewInternalTakeScreenshotCallback$Impl {
  final Pointer<Void> handle;

  MapViewInternalTakeScreenshotCallback$Impl(this.handle);

  void release() =>
      _sdkMapviewMapviewinternalTakescreenshotcallbackReleaseHandle(handle);

  internalcall(Uint8List p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_call__Blob'));
    final _p0Handle = blobToFfiNullable(p0);
    final _handle = this.handle;
    final __resultHandle =
        _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    blobReleaseFfiHandleNullable(_p0Handle);
    try {
      return (__resultHandle);
    } finally {}
  }
}

int _sdkMapviewMapviewinternalTakescreenshotcallbackcallStatic(
    int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token]
        as MapViewInternalTakeScreenshotCallback)(blobFromFfiNullable(p0));
  } finally {
    blobReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapviewinternalTakescreenshotcallbackToFfi(
    MapViewInternalTakeScreenshotCallback value) {
  final result = _sdkMapviewMapviewinternalTakescreenshotcallbackCreateProxy(
      __lib.cacheObject(value),
      __lib.LibraryContext.isolateId,
      __lib.uncacheObjectFfi,
      Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(
          _sdkMapviewMapviewinternalTakescreenshotcallbackcallStatic,
          __lib.unknownError));

  return result;
}

MapViewInternalTakeScreenshotCallback
    sdkMapviewMapviewinternalTakescreenshotcallbackFromFfi(
        Pointer<Void> handle) {
  final _impl = MapViewInternalTakeScreenshotCallback$Impl(
      _sdkMapviewMapviewinternalTakescreenshotcallbackCopyHandle(handle));
  return (Uint8List p0) {
    final _result = _impl.internalcall(p0);
    _impl.release();
    return _result;
  };
}

void sdkMapviewMapviewinternalTakescreenshotcallbackReleaseFfiHandle(
        Pointer<Void> handle) =>
    _sdkMapviewMapviewinternalTakescreenshotcallbackReleaseHandle(handle);

// Nullable MapViewInternalTakeScreenshotCallback

final _sdkMapviewMapviewinternalTakescreenshotcallbackCreateHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_create_handle_nullable'));
final _sdkMapviewMapviewinternalTakescreenshotcallbackReleaseHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_release_handle_nullable'));
final _sdkMapviewMapviewinternalTakescreenshotcallbackGetValueNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_TakeScreenshotCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewinternalTakescreenshotcallbackToFfiNullable(
    MapViewInternalTakeScreenshotCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewinternalTakescreenshotcallbackToFfi(value);
  final result =
      _sdkMapviewMapviewinternalTakescreenshotcallbackCreateHandleNullable(
          _handle);
  sdkMapviewMapviewinternalTakescreenshotcallbackReleaseFfiHandle(_handle);
  return result;
}

MapViewInternalTakeScreenshotCallback?
    sdkMapviewMapviewinternalTakescreenshotcallbackFromFfiNullable(
        Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle =
      _sdkMapviewMapviewinternalTakescreenshotcallbackGetValueNullable(handle);
  final result =
      sdkMapviewMapviewinternalTakescreenshotcallbackFromFfi(_handle);
  sdkMapviewMapviewinternalTakescreenshotcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewinternalTakescreenshotcallbackReleaseFfiHandleNullable(
        Pointer<Void> handle) =>
    _sdkMapviewMapviewinternalTakescreenshotcallbackReleaseHandleNullable(
        handle);

// End of MapViewInternalTakeScreenshotCallback "private" section.

// MapViewInternal "private" section, not exported.

final _sdkMapviewMapviewinternalCopyHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_copy_handle'));
final _sdkMapviewMapviewinternalReleaseHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>),
            void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_release_handle'));
final _sdkMapviewMapviewinternalGetTypeId = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapViewInternal_get_type_id'));

class MapViewInternal$Impl extends __lib.NativeBase implements MapViewInternal {
  MapViewInternal$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == nullptr) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapviewinternalReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  internaltakeScreenshot(MapViewInternalTakeScreenshotCallback callback) {
    final _takeScreenshotFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewInternal_takeScreenshot__TakeScreenshotCallback'));
    final _callbackHandle =
        sdkMapviewMapviewinternalTakescreenshotcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _takeScreenshotFfi(
        _handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMapviewMapviewinternalTakescreenshotcallbackReleaseFfiHandle(
        _callbackHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) {
    final _viewToGeoCoordinatesFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>),
                Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_viewToGeoCoordinates__Point2D'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _handle = this.handle;
    final __resultHandle = _viewToGeoCoordinatesFfi(
        _handle, __lib.LibraryContext.isolateId, _viewCoordinatesHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);
    }
  }

  @override
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates) {
    final _geoToViewCoordinatesFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>),
                Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_geoToViewCoordinates__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = this.handle;
    final __resultHandle = _geoToViewCoordinatesFfi(
        _handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCorePoint2dFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCorePoint2dReleaseFfiHandleNullable(__resultHandle);
    }
  }

  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) {
    final _setWatermarkPositionFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Uint32, Uint32),
                void Function(Pointer<Void>, int, int, int)>(
            'here_sdk_sdk_mapview_MapViewBase_setWatermarkPosition__WatermarkPlacement_UInt'));
    final _placementHandle = sdkMapviewWatermarkplacementToFfi(placement);
    final _bottomCenterMarginHandle = (bottomCenterMargin);
    final _handle = this.handle;
    final __resultHandle = _setWatermarkPositionFfi(
        _handle,
        __lib.LibraryContext.isolateId,
        _placementHandle,
        _bottomCenterMarginHandle);
    sdkMapviewWatermarkplacementReleaseFfiHandle(_placementHandle);

    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapRepresentable(MapRepresentable mapRepresentable) {
    final _addMapRepresentableFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_addMapRepresentable__MapRepresentable'));
    final _mapRepresentableHandle =
        sdkMapviewMaprepresentableToFfi(mapRepresentable);
    final _handle = this.handle;
    final __resultHandle = _addMapRepresentableFfi(
        _handle, __lib.LibraryContext.isolateId, _mapRepresentableHandle);
    sdkMapviewMaprepresentableReleaseFfiHandle(_mapRepresentableHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) {
    final _removeMapRepresentableFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_removeMapRepresentable__MapRepresentable'));
    final _mapRepresentableHandle =
        sdkMapviewMaprepresentableToFfi(mapRepresentable);
    final _handle = this.handle;
    final __resultHandle = _removeMapRepresentableFfi(
        _handle, __lib.LibraryContext.isolateId, _mapRepresentableHandle);
    sdkMapviewMaprepresentableReleaseFfiHandle(_mapRepresentableHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _addLifecycleListenerFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_addLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle =
        sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    final __resultHandle = _addLifecycleListenerFfi(
        _handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(
        _lifecycleListenerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _removeLifecycleListenerFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_removeLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle =
        sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    final __resultHandle = _removeLifecycleListenerFfi(
        _handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(
        _lifecycleListenerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  pickMapItems(Point2D centerPoint, double radius,
      MapViewBasePickMapItemsCallback callback) {
    final _pickMapItemsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
                Void Function(
                    Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>),
                void Function(
                    Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapViewBase_pickMapItems__Point2D_Double_PickMapItemsCallback'));
    final _centerPointHandle = sdkCorePoint2dToFfi(centerPoint);
    final _radiusHandle = (radius);
    final _callbackHandle =
        sdkMapviewMapviewbasePickmapitemscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _pickMapItemsFfi(
        _handle,
        __lib.LibraryContext.isolateId,
        _centerPointHandle,
        _radiusHandle,
        _callbackHandle);
    sdkCorePoint2dReleaseFfiHandle(_centerPointHandle);

    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  MapCamera get camera {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_camera_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcameraFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraReleaseFfiHandle(__resultHandle);
    }
  }

  @override
  Gestures get gestures {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_gestures_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesGesturesFromFfi(__resultHandle);
    } finally {
      sdkGesturesGesturesReleaseFfiHandle(__resultHandle);
    }
  }

  @override
  MapScene get mapScene {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_mapScene_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapsceneFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapsceneReleaseFfiHandle(__resultHandle);
    }
  }

  @override
  Size2D get viewportSize {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Pointer<Void> Function(Pointer<Void>, Int32),
            Pointer<Void> Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_viewportSize_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreSize2dFromFfi(__resultHandle);
    } finally {
      sdkCoreSize2dReleaseFfiHandle(__resultHandle);
    }
  }

  @override
  int get frameRate {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Int32 Function(Pointer<Void>, Int32),
            int Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  set frameRate(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Void Function(Pointer<Void>, Int32, Int32),
            void Function(Pointer<Void>, int,
                int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    final __resultHandle =
        _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);

    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  double get pixelScale {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
            Double Function(Pointer<Void>, Int32),
            double Function(Pointer<Void>,
                int)>('here_sdk_sdk_mapview_MapViewBase_pixelScale_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {}
  }
}

Pointer<Void> sdkMapviewMapviewinternalToFfi(MapViewInternal value) =>
    _sdkMapviewMapviewinternalCopyHandle((value as __lib.NativeBase).handle);

MapViewInternal sdkMapviewMapviewinternalFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache.containsKey(token)
      ? (__lib.instanceCache[token] as MapViewInternal)
      : null;
  if (instance != null) return instance;
 // print("token_ja $token");
  print("times of Visit  $isolateId");

  final _typeIdHandle = _sdkMapviewMapviewinternalGetTypeId(handle);
  //print("_typeIdHandle ${_typeIdHandle}");
  //print("stringFromFfi ${stringFromFfi(_typeIdHandle)}");

  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];

  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapviewinternalCopyHandle(handle);
  final result = factoryConstructor != null
      ? factoryConstructor(_copiedHandle)
      : MapViewInternal$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapviewinternalReleaseFfiHandle(Pointer<Void> handle) =>
    _sdkMapviewMapviewinternalReleaseHandle(handle);

Pointer<Void> sdkMapviewMapviewinternalToFfiNullable(MapViewInternal value) =>
    value != null
        ? sdkMapviewMapviewinternalToFfi(value)
        : Pointer<Void>.fromAddress(0);

MapViewInternal? sdkMapviewMapviewinternalFromFfiNullable(
        Pointer<Void> handle) =>
    handle.address != 0 ? sdkMapviewMapviewinternalFromFfi(handle) : null;

void sdkMapviewMapviewinternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
    _sdkMapviewMapviewinternalReleaseHandle(handle);

// End of MapViewInternal "private" section.
