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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapview/image_format.dart';

/// Represents a drawable resource that can be used by a MapMarker to be shown on the map.
abstract class MapImage {
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.png]
  /// is accepted.
  ///
  /// [pixelData] Data to be used for the image. The bytes of a PNG image datastream are expected as
  /// defined in https://www.w3.org/TR/PNG
  ///
  /// [imageFormat] The format of the image data to be used.
  ///
  factory MapImage.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) => MapImage$Impl.withPixelDataAndImageFormat(pixelData, imageFormat);
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.svg]
  /// is accepted.
  ///
  /// [imageData] Data to be used for the image. For image format [ImageFormat.svg] the bytes
  /// of a UTF-8 encoded string in SVG Tiny format are expected. For the format specification
  /// see https://www.w3.org/TR/SVGTiny12
  ///
  /// [imageFormat] The format of the image data to be used.
  ///
  /// [width] Width of the image in pixels
  ///
  /// [height] Height of the image in pixels
  ///
  factory MapImage.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) => MapImage$Impl.withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height);
  /// Creates a new map image from the provided path to the SVG Tiny or PNG image.
  ///
  /// Will throw an error
  /// if either the height or width equals zero or the path is empty. Trying to load the data that is
  /// not compliant with SVG Tiny or PNG could result in an undefined behavior.
  ///
  /// [filePath] The path to image file
  ///
  /// [width] Width of image in pixels
  ///
  /// [height] Height of image in pixels
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory MapImage.withFilePathAndWidthAndHeight(String filePath, int width, int height) => MapImage$Impl.withFilePathAndWidthAndHeight(filePath, width, height);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// MapImage "private" section, not exported.

final _sdkMapviewMapimageCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_copy_handle'));
final _sdkMapviewMapimageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_release_handle'));




final _withFilePathAndWidthAndHeightReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_release_handle'));
final _withFilePathAndWidthAndHeightReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_result'));
final _withFilePathAndWidthAndHeightReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_error'));
final _withFilePathAndWidthAndHeightReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_has_error'));


class MapImage$Impl extends __lib.NativeBase implements MapImage {

  MapImage$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapimageReleaseHandle(handle);
    handle = nullptr;
  }


  MapImage$Impl.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) : super(_withPixelDataAndImageFormat(pixelData, imageFormat)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  MapImage$Impl.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) : super(_withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  MapImage$Impl.withFilePathAndWidthAndHeight(String filePath, int width, int height) : super(_withFilePathAndWidthAndHeight(filePath, width, height)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) {
    final _withPixelDataAndImageFormatFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat'));
    final _pixelDataHandle = blobToFfi(pixelData);
    final _imageFormatHandle = sdkMapviewImageformatToFfi(imageFormat);
    final __resultHandle = _withPixelDataAndImageFormatFfi(__lib.LibraryContext.isolateId, _pixelDataHandle, _imageFormatHandle);
    blobReleaseFfiHandle(_pixelDataHandle);
    sdkMapviewImageformatReleaseFfiHandle(_imageFormatHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) {
    final _withImageDataImageFormatWidthAndHeightFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat_UInt_UInt'));
    final _imageDataHandle = blobToFfi(imageData);
    final _imageFormatHandle = sdkMapviewImageformatToFfi(imageFormat);
    final _widthHandle = (width);
    final _heightHandle = (height);
    final __resultHandle = _withImageDataImageFormatWidthAndHeightFfi(__lib.LibraryContext.isolateId, _imageDataHandle, _imageFormatHandle, _widthHandle, _heightHandle);
    blobReleaseFfiHandle(_imageDataHandle);
    sdkMapviewImageformatReleaseFfiHandle(_imageFormatHandle);


    return __resultHandle;
  }

  static Pointer<Void> _withFilePathAndWidthAndHeight(String filePath, int width, int height) {
    final _withFilePathAndWidthAndHeightFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt'));
    final _filePathHandle = stringToFfi(filePath);
    final _widthHandle = (width);
    final _heightHandle = (height);
    final __callResultHandle = _withFilePathAndWidthAndHeightFfi(__lib.LibraryContext.isolateId, _filePathHandle, _widthHandle, _heightHandle);
    stringReleaseFfiHandle(_filePathHandle);


    if (_withFilePathAndWidthAndHeightReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withFilePathAndWidthAndHeightReturnGetError(__callResultHandle);
        _withFilePathAndWidthAndHeightReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withFilePathAndWidthAndHeightReturnGetResult(__callResultHandle);
    _withFilePathAndWidthAndHeightReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkMapviewMapimageToFfi(MapImage value) =>
  _sdkMapviewMapimageCopyHandle((value as __lib.NativeBase).handle);

MapImage sdkMapviewMapimageFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapImage;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewMapimageCopyHandle(handle);
  final result = MapImage$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapimageReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapimageReleaseHandle(handle);

Pointer<Void> sdkMapviewMapimageToFfiNullable(MapImage value) =>
  value != null ? sdkMapviewMapimageToFfi(value) : Pointer<Void>.fromAddress(0);

MapImage? sdkMapviewMapimageFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapimageFromFfi(handle) : null;

void sdkMapviewMapimageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapimageReleaseHandle(handle);

// End of MapImage "private" section.

