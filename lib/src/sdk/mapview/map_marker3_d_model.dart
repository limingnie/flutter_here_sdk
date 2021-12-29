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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';

/// Represents a 3D model that can be used by a [MapMarker3D] to be shown on the map.
///
/// Geometry of 3D marker can be provided in form of a Wavefront OBJ file as specified in
/// http://www.martinreddy.net/gfx/3d/OBJ.spec.
///
/// HERE SDK only supports the following set of features of the OBJ specification:
/// - Triangle Meshes
/// - Following vertex attributes must be present:
///   - Vertex Position
///   - Vertex Normal
///   - Texture Coordinates
///   - Geometry must be indexed (contain an Index Buffer)
///   - Face element
///
/// HERE SDK does not support:
/// - Multi Texturing
/// - Materials (mtllib \[external .mtl file name\] )
///   - Lines
///   - Higher Order Surfaces
///   - Vendor specific extensions
///
/// For supported texture formats, SDK allows the following formats to be specified:
/// JPG, PNG, SVG, GPU compressed texture formats: ECT1 (OpenGL only), YUV, ASTC, KTX.
abstract class MapMarker3DModel {
  /// Creates a new 3D model from path to .obj file, texture and color.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  /// [color] Color to be blend with texture.
  /// This color is multiplied with color of texture.
  ///
  factory MapMarker3DModel.withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) => MapMarker3DModel$Impl.withTextureFilePathAndColor(geometryFilePath, textureFilePath, color);
  /// Creates a new 3D model from path to .obj file and texture.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  factory MapMarker3DModel.withTextureFilePath(String geometryFilePath, String textureFilePath) => MapMarker3DModel$Impl.withTextureFilePath(geometryFilePath, textureFilePath);
  /// Creates a new 3D model from path to .obj file.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  factory MapMarker3DModel(String geometryFilePath) => MapMarker3DModel$Impl.$init(geometryFilePath);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// MapMarker3DModel "private" section, not exported.

final _sdkMapviewMapmarker3dmodelCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_copy_handle'));
final _sdkMapviewMapmarker3dmodelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_release_handle'));





class MapMarker3DModel$Impl extends __lib.NativeBase implements MapMarker3DModel {

  MapMarker3DModel$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapmarker3dmodelReleaseHandle(handle);
    handle = nullptr;
  }


  MapMarker3DModel$Impl.withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) : super(_withTextureFilePathAndColor(geometryFilePath, textureFilePath, color)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  MapMarker3DModel$Impl.withTextureFilePath(String geometryFilePath, String textureFilePath) : super(_withTextureFilePath(geometryFilePath, textureFilePath)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  MapMarker3DModel$Impl.$init(String geometryFilePath) : super(_$init(geometryFilePath)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) {
    final _withTextureFilePathAndColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String_Color'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _withTextureFilePathAndColorFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle, _textureFilePathHandle, _colorHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTextureFilePath(String geometryFilePath, String textureFilePath) {
    final _withTextureFilePathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final __resultHandle = _withTextureFilePathFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle, _textureFilePathHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    return __resultHandle;
  }

  static Pointer<Void> _$init(String geometryFilePath) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkMapviewMapmarker3dmodelToFfi(MapMarker3DModel value) =>
  _sdkMapviewMapmarker3dmodelCopyHandle((value as __lib.NativeBase).handle);

MapMarker3DModel sdkMapviewMapmarker3dmodelFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapMarker3DModel;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewMapmarker3dmodelCopyHandle(handle);
  final result = MapMarker3DModel$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapmarker3dmodelReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dmodelReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarker3dmodelToFfiNullable(MapMarker3DModel value) =>
  value != null ? sdkMapviewMapmarker3dmodelToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker3DModel? sdkMapviewMapmarker3dmodelFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarker3dmodelFromFfi(handle) : null;

void sdkMapviewMapmarker3dmodelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dmodelReleaseHandle(handle);

// End of MapMarker3DModel "private" section.

