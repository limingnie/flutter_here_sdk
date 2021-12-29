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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_arrow.dart';
import 'package:here_sdk/src/sdk/mapview/map_error.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';
import 'package:here_sdk/src/sdk/mapview/map_scheme.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_style.dart';

/// Represents a map scene and exposes the functionality to manipulate its content.
///
/// Map scene is obtained from the `HereMapController.mapScene` property.
///
/// ## Map schemes
///
/// The content of the displayed map and how it looks is specified by a
/// [MapScheme] which is set when loading a scene with [MapScene.loadSceneForMapScheme].
/// It is also possible to load your own custom map scheme from a file bundled
/// with your application.
///
/// ## Map layers
///
/// Map scheme is organized in layers, which can be controlled using [MapScene.setLayerState].
/// It's possible to change the state of any map layer as long as you know its name,
/// but [MapSceneLayers] provides a set of constants for most frequently used layers. Some of those
/// layers are not supported on all map schemes. Such limitations are stated in their documentation.
///
/// ## User content
///
/// User generated content can be visualised on the map using [MapMarker], [MapPolygon]
/// and [MapPolyline] (collectively referred to as "map items"). Those can be added to and removed
/// from the scene by respective add and remove methods.
///
/// ## Map style update
///
/// The map styles for [MapScheme.normalDay], [MapScheme.normalNight], [MapScheme.hybridDay] and [MapScheme.hybridNight] will be updated in v4.8.0. The planned new map styles are already accessible
/// under following file names as beta versions (to be used with the [MapScene.loadSceneFromConfigurationFile]):
/// - "preview.normal.day.json" - This scheme will update the current [MapScheme.normalDay] in v4.8.0.
/// - "preview.normal.night.json" - This scheme will update the current [MapScheme.normalNight] in v4.8.0.
/// - "preview.hybrid.day.json" - This scheme will update the current [MapScheme.hybridDay] in v4.8.0.
/// - "preview.hybrid.night.json" - This scheme will update the current [MapScheme.hybridNight] in v4.8.0.
///
/// The legacy map styles for [MapScheme.normalDay], [MapScheme.normalNight], [MapScheme.hybridDay] and [MapScheme.hybridNight] will still be accessible for v4.8.0 until v4.9.0 under the file names listed below. They will be removed in v4.9.0.
/// - "legacy.normal.day.json"
/// - "legacy.normal.night.json"
/// - "legacy.hybrid.day.json"
/// - "legacy.hybrid.night.json"
/// - "legacy.grey.day.json"
/// - "legacy.grey.night.json"
abstract class MapScene {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Asynchronously loads a map scene described by a specified map scheme.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  ///
  /// [mapScheme] Map scheme.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  loadSceneForMapScheme(
      MapScheme mapScheme, MapSceneLoadSceneCallback callback);

  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  loadSceneFromConfigurationFile(
      String configurationFile, MapSceneLoadSceneCallback callback);

  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// The style of the
  /// HERE watermark matching the map scheme is specified. Any previous map scene config
  /// will be replaced. The callback is called on the main thread. Calling this again before
  /// completion may result in a [MapError].
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [watermarkStyle] The style for the HERE watermark, see [WatermarkStyle].
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile,
      WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback callback);

  /// Adds a map polyline to this map scene.
  ///
  /// [mapPolyline] The map polyline to be added to this map scene.
  ///
  addMapPolyline(MapPolyline mapPolyline);

  /// Removes a map polyline from this map scene.
  ///
  /// [mapPolyline] The map polyline to be removed from this map scene.
  ///
  removeMapPolyline(MapPolyline mapPolyline);

  /// Adds a map arrow to this map scene.
  ///
  /// [mapArrow] The map arrow to be added to this map scene.
  ///
  addMapArrow(MapArrow mapArrow);

  /// Removes a map arrow from this map scene.
  ///
  /// [mapArrow] The map arrow to be removed from this map scene.
  ///
  removeMapArrow(MapArrow mapArrow);

  /// Adds a map marker to this map scene.
  ///
  /// Adding the same marker instance multiple times
  /// has no effect.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  addMapMarker(MapMarker marker);

  /// Removes a map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  removeMapMarker(MapMarker marker);

  /// Adds a 3D map marker to this map scene.
  ///
  /// Does nothing if the marker instance was already added to the scene.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  addMapMarker3d(MapMarker3D marker);

  /// Removes a 3D map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  removeMapMarker3d(MapMarker3D marker);

  /// Adds a map polygon to this map scene.
  ///
  /// [mapPolygon] The map polygon to be added to this map scene.
  ///
  addMapPolygon(MapPolygon mapPolygon);

  /// Removes a map polygon from this map scene.
  ///
  /// [mapPolygon] The map polygon to be removed from this map scene.
  ///
  removeMapPolygon(MapPolygon mapPolygon);

  /// Immediately changes the state of a specified map layer.
  ///
  /// This will show or hide it.
  ///
  /// [layerName] The name of the map layer to be changed.
  /// Use constants in Layers to reference the predefined layers.
  ///
  /// [newState] The new state of the layer.
  ///
  setLayerState(String layerName, MapSceneLayerState newState);
}

/// Represents the state and thus the visibility of a map layer.
enum MapSceneLayerState {
  /// The layer is visible.
  visible,

  /// The layer is hidden. Downloading the data is usually stopped for hidden layers.
  hidden
}

// MapSceneLayerState "private" section, not exported.

int sdkMapviewMapsceneLayerstateToFfi(MapSceneLayerState value) {
  switch (value) {
    case MapSceneLayerState.visible:
      return 0;

    case MapSceneLayerState.hidden:
      return 1;

    default:
      throw StateError(
          "Invalid enum value $value for MapSceneLayerState enum.");
  }
}

MapSceneLayerState sdkMapviewMapsceneLayerstateFromFfi(int handle) {
  switch (handle) {
    case 0:
      return MapSceneLayerState.visible;

    case 1:
      return MapSceneLayerState.hidden;

    default:
      throw StateError(
          "Invalid numeric value $handle for MapSceneLayerState enum.");
  }
}

void sdkMapviewMapsceneLayerstateReleaseFfiHandle(int handle) {}

final _sdkMapviewMapsceneLayerstateCreateHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Uint32), Pointer<Void> Function(int)>(
        'here_sdk_sdk_mapview_MapScene_LayerState_create_handle_nullable'));
final _sdkMapviewMapsceneLayerstateReleaseHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LayerState_release_handle_nullable'));
final _sdkMapviewMapsceneLayerstateGetValueNullable = __lib.catchArgumentError(
    () => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>),
            int Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LayerState_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLayerstateToFfiNullable(
    MapSceneLayerState value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLayerstateToFfi(value);
  final result = _sdkMapviewMapsceneLayerstateCreateHandleNullable(_handle);
  sdkMapviewMapsceneLayerstateReleaseFfiHandle(_handle);
  return result;
}

MapSceneLayerState? sdkMapviewMapsceneLayerstateFromFfiNullable(
    Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLayerstateGetValueNullable(handle);
  final result = sdkMapviewMapsceneLayerstateFromFfi(_handle);
  sdkMapviewMapsceneLayerstateReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLayerstateReleaseFfiHandleNullable(
        Pointer<Void> handle) =>
    _sdkMapviewMapsceneLayerstateReleaseHandleNullable(handle);

// End of MapSceneLayerState "private" section.
/// A collection of map layer identifiers used in the [MapScene.setLayerState] method.

class MapSceneLayers {
  /// 3D representation of buildings. Not supported for [MapScheme.satellite].
  static final String extrudedBuildings = "heresdk_layer_extruded_buildings";

  /// The 2D footprint of buildings. Not supported for [MapScheme.satellite].
  static final String buildingFootprints = "heresdk_layer_building_footprints";

  /// Traffic flow speed. Not supported for [MapScheme.satellite].
  static final String trafficFlow = "heresdk_layer_traffic_flow";

  /// Traffic incidents. Not supported for [MapScheme.satellite].
  static final String trafficIncidents = "heresdk_layer_traffic_incidents";

  /// Vehicle restrictions. Not supported for [MapScheme.satellite].
  /// Only supported in HERE SDK Navigate variant.
  static final String vehicleRestrictions =
      "heresdk_layer_vehicle_restrictions";
}

// MapSceneLayers "private" section, not exported.

final _sdkMapviewMapsceneLayersCreateHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary
        .lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>(
            'here_sdk_sdk_mapview_MapScene_Layers_create_handle'));
final _sdkMapviewMapsceneLayersReleaseHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>),
            void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_Layers_release_handle'));

Pointer<Void> sdkMapviewMapsceneLayersToFfi(MapSceneLayers value) {
  final _result = _sdkMapviewMapsceneLayersCreateHandle();
  return _result;
}

MapSceneLayers sdkMapviewMapsceneLayersFromFfi(Pointer<Void> handle) {
  try {
    return MapSceneLayers();
  } finally {}
}

void sdkMapviewMapsceneLayersReleaseFfiHandle(Pointer<Void> handle) =>
    _sdkMapviewMapsceneLayersReleaseHandle(handle);

// Nullable MapSceneLayers

final _sdkMapviewMapsceneLayersCreateHandleNullable = __lib.catchArgumentError(
    () => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_Layers_create_handle_nullable'));
final _sdkMapviewMapsceneLayersReleaseHandleNullable = __lib.catchArgumentError(
    () => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>),
            void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_Layers_release_handle_nullable'));
final _sdkMapviewMapsceneLayersGetValueNullable = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_Layers_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLayersToFfiNullable(MapSceneLayers value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLayersToFfi(value);
  final result = _sdkMapviewMapsceneLayersCreateHandleNullable(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

MapSceneLayers? sdkMapviewMapsceneLayersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLayersGetValueNullable(handle);
  final result = sdkMapviewMapsceneLayersFromFfi(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLayersReleaseFfiHandleNullable(Pointer<Void> handle) =>
    _sdkMapviewMapsceneLayersReleaseHandleNullable(handle);

// End of MapSceneLayers "private" section.
/// Called on the main thread after [MapScene.loadSceneFromConfigurationFileWithWatermarkStyle] has been completed.
typedef MapSceneLoadSceneCallback = void Function(MapError);

// MapSceneLoadSceneCallback "private" section, not exported.

final _sdkMapviewMapsceneLoadscenecallbackCopyHandle = __lib.catchArgumentError(
    () => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_copy_handle'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandle =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle'));
final _sdkMapviewMapsceneLoadscenecallbackCreateProxy =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
            Pointer<Void> Function(int, int, Pointer, Pointer)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_proxy'));

class MapSceneLoadSceneCallback$Impl {
  final Pointer<Void> handle;

  MapSceneLoadSceneCallback$Impl(this.handle);

  void release() => _sdkMapviewMapsceneLoadscenecallbackReleaseHandle(handle);

  call(MapError p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_call__MapError'));
    final _p0Handle = sdkMapviewMaperrorToFfiNullable(p0);
    final _handle = this.handle;
    final __resultHandle =
        _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewMaperrorReleaseFfiHandleNullable(_p0Handle);
    try {
      return (__resultHandle);
    } finally {}
  }
}

int _sdkMapviewMapsceneLoadscenecallbackcallStatic(
    int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token]
        as MapSceneLoadSceneCallback)(sdkMapviewMaperrorFromFfiNullable(p0)!);
  } finally {
    sdkMapviewMaperrorReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfi(
    MapSceneLoadSceneCallback value) {
  final result = _sdkMapviewMapsceneLoadscenecallbackCreateProxy(
      __lib.cacheObject(value),
      __lib.LibraryContext.isolateId,
      __lib.uncacheObjectFfi,
      Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(
          _sdkMapviewMapsceneLoadscenecallbackcallStatic, __lib.unknownError));

  return result;
}

MapSceneLoadSceneCallback sdkMapviewMapsceneLoadscenecallbackFromFfi(
    Pointer<Void> handle) {
  final _impl = MapSceneLoadSceneCallback$Impl(
      _sdkMapviewMapsceneLoadscenecallbackCopyHandle(handle));
  return (MapError p0) {
    final _result = _impl.call(p0);
    _impl.release();
    return _result;
  };
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(
        Pointer<Void> handle) =>
    _sdkMapviewMapsceneLoadscenecallbackReleaseHandle(handle);

// Nullable MapSceneLoadSceneCallback

final _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackGetValueNullable =
    __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
            Pointer<Void> Function(Pointer<Void>),
            Pointer<Void> Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfiNullable(
    MapSceneLoadSceneCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLoadscenecallbackToFfi(value);
  final result =
      _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

MapSceneLoadSceneCallback? sdkMapviewMapsceneLoadscenecallbackFromFfiNullable(
    Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLoadscenecallbackGetValueNullable(handle);
  final result = sdkMapviewMapsceneLoadscenecallbackFromFfi(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(
        Pointer<Void> handle) =>
    _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable(handle);

// End of MapSceneLoadSceneCallback "private" section.

// MapScene "private" section, not exported.

final _sdkMapviewMapsceneCopyHandle = __lib.catchArgumentError(() =>
    __lib.nativeLibrary.lookupFunction<
        Pointer<Void> Function(Pointer<Void>),
        Pointer<Void> Function(
            Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_copy_handle'));
final _sdkMapviewMapsceneReleaseHandle = __lib.catchArgumentError(() => __lib
    .nativeLibrary
    .lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
        'here_sdk_sdk_mapview_MapScene_release_handle'));

class MapScene$Impl extends __lib.NativeBase implements MapScene {
  MapScene$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapsceneReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  loadSceneForMapScheme(
      MapScheme mapScheme, MapSceneLoadSceneCallback callback) {
    final _loadSceneForMapSchemeFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>),
                void Function(Pointer<Void>, int, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_loadScene__MapScheme_LoadSceneCallback'));
    final _mapSchemeHandle = sdkMapviewMapschemeToFfi(mapScheme);
    final _callbackHandle =
        sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    final __resultHandle = _loadSceneForMapSchemeFfi(_handle,
        __lib.LibraryContext.isolateId, _mapSchemeHandle, _callbackHandle);
    sdkMapviewMapschemeReleaseFfiHandle(_mapSchemeHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(
        _callbackHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  loadSceneFromConfigurationFile(
      String configurationFile, MapSceneLoadSceneCallback callback) {
    final _loadSceneFromConfigurationFileFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>),
                void Function(
                    Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_loadScene__String_LoadSceneCallback'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _callbackHandle =
        sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    final __resultHandle = _loadSceneFromConfigurationFileFfi(
        _handle,
        __lib.LibraryContext.isolateId,
        _configurationFileHandle,
        _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(
        _callbackHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile,
      WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback callback) {
    final _loadSceneFromConfigurationFileWithWatermarkStyleFfi =
        __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
                Void Function(
                    Pointer<Void>, Int32, Pointer<Void>, Uint32, Pointer<Void>),
                void Function(
                    Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_loadScene__String_WatermarkStyle_LoadSceneCallback'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _watermarkStyleHandle = sdkMapviewWatermarkstyleToFfi(watermarkStyle);
    final _callbackHandle =
        sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    final __resultHandle = _loadSceneFromConfigurationFileWithWatermarkStyleFfi(
        _handle,
        __lib.LibraryContext.isolateId,
        _configurationFileHandle,
        _watermarkStyleHandle,
        _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewWatermarkstyleReleaseFfiHandle(_watermarkStyleHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(
        _callbackHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapPolyline(MapPolyline mapPolyline) {
    final _addMapPolylineFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_addMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    final __resultHandle = _addMapPolylineFfi(
        _handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapPolyline(MapPolyline mapPolyline) {
    final _removeMapPolylineFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_removeMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    final __resultHandle = _removeMapPolylineFfi(
        _handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapArrow(MapArrow mapArrow) {
    final _addMapArrowFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_addMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    final __resultHandle = _addMapArrowFfi(
        _handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapArrow(MapArrow mapArrow) {
    final _removeMapArrowFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_removeMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    final __resultHandle = _removeMapArrowFfi(
        _handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapMarker(MapMarker marker) {
    final _addMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_addMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    final __resultHandle = _addMapMarkerFfi(
        _handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapMarker(MapMarker marker) {
    final _removeMapMarkerFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_removeMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    final __resultHandle = _removeMapMarkerFfi(
        _handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapMarker3d(MapMarker3D marker) {
    final _addMapMarker3dFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_addMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    final __resultHandle = _addMapMarker3dFfi(
        _handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapMarker3d(MapMarker3D marker) {
    final _removeMapMarker3dFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_removeMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    final __resultHandle = _removeMapMarker3dFfi(
        _handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  addMapPolygon(MapPolygon mapPolygon) {
    final _addMapPolygonFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_addMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    final __resultHandle = _addMapPolygonFfi(
        _handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  removeMapPolygon(MapPolygon mapPolygon) {
    final _removeMapPolygonFfi = __lib.catchArgumentError(() =>
        __lib.nativeLibrary.lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>),
                void Function(Pointer<Void>, int, Pointer<Void>)>(
            'here_sdk_sdk_mapview_MapScene_removeMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    final __resultHandle = _removeMapPolygonFfi(
        _handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);
    try {
      return (__resultHandle);
    } finally {}
  }

  @override
  setLayerState(String layerName, MapSceneLayerState newState) {
    final _setLayerStateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary
        .lookupFunction<
                Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32),
                void Function(Pointer<Void>, int, Pointer<Void>, int)>(
            'here_sdk_sdk_mapview_MapScene_setLayerState__String_LayerState'));
    final _layerNameHandle = stringToFfi(layerName);
    final _newStateHandle = sdkMapviewMapsceneLayerstateToFfi(newState);
    final _handle = this.handle;
    final __resultHandle = _setLayerStateFfi(_handle,
        __lib.LibraryContext.isolateId, _layerNameHandle, _newStateHandle);
    stringReleaseFfiHandle(_layerNameHandle);
    sdkMapviewMapsceneLayerstateReleaseFfiHandle(_newStateHandle);
    try {
      return (__resultHandle);
    } finally {}
  }
}

Pointer<Void> sdkMapviewMapsceneToFfi(MapScene value) =>
    _sdkMapviewMapsceneCopyHandle((value as __lib.NativeBase).handle);

MapScene sdkMapviewMapsceneFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache.containsKey(token)
      ? (__lib.instanceCache[token] as MapScene)
      : null;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewMapsceneCopyHandle(handle);
  final result = MapScene$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapsceneReleaseFfiHandle(Pointer<Void> handle) =>
    _sdkMapviewMapsceneReleaseHandle(handle);

Pointer<Void> sdkMapviewMapsceneToFfiNullable(MapScene value) => value != null
    ? sdkMapviewMapsceneToFfi(value)
    : Pointer<Void>.fromAddress(0);

MapScene? sdkMapviewMapsceneFromFfiNullable(Pointer<Void> handle) =>
    handle.address != 0 ? sdkMapviewMapsceneFromFfi(handle) : null;

void sdkMapviewMapsceneReleaseFfiHandleNullable(Pointer<Void> handle) =>
    _sdkMapviewMapsceneReleaseHandle(handle);

// End of MapScene "private" section.
