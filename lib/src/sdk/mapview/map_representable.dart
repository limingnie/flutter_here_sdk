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
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:meta/meta.dart';

/// Any object that conforms this abstract class can be represented graphically on the MapView.
@Deprecated("Will be removed in v4.9.0. Use [MapViewLifecycleListener] instead.")
abstract class MapRepresentable {
  MapRepresentable();

  factory MapRepresentable.fromLambdas({
    required void Function(MapViewBase) lambda_attach,
    required void Function(MapViewBase) lambda_detach,

  }) => MapRepresentable$Lambdas(
    lambda_attach,
    lambda_detach,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// This method is called to attach the component to the mapView.
  ///
  /// [mapView] Abstract class representation of MapView.
  ///
  attach(MapViewBase mapView);
  /// This method is called to remove this component from the mapView.
  ///
  /// It can be explicitly called or
  /// based on the MapView lifecycle.
  ///
  /// [mapView] Abstract class representation of MapView.
  ///
  detach(MapViewBase mapView);
}


// MapRepresentable "private" section, not exported.

final _sdkMapviewMaprepresentableCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_copy_handle'));
final _sdkMapviewMaprepresentableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_release_handle'));
final _sdkMapviewMaprepresentableCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapRepresentable_create_proxy'));
final _sdkMapviewMaprepresentableGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_get_type_id'));



class MapRepresentable$Lambdas implements MapRepresentable {
  void Function(MapViewBase) lambda_attach;
  void Function(MapViewBase) lambda_detach;

  MapRepresentable$Lambdas(
    this.lambda_attach,
    this.lambda_detach,

  );

  @override
  void release() {}

  @override
  attach(MapViewBase mapView) =>
    lambda_attach(mapView);
  @override
  detach(MapViewBase mapView) =>
    lambda_detach(mapView);
}

class MapRepresentable$Impl extends __lib.NativeBase implements MapRepresentable {

  MapRepresentable$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMaprepresentableReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  attach(MapViewBase mapView) {
    final _attachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapRepresentable_attach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    final __resultHandle = _attachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  detach(MapViewBase mapView) {
    final _detachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapRepresentable_detach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    final __resultHandle = _detachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkMapviewMaprepresentableattachStatic(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapRepresentable).attach(sdkMapviewMapviewbaseFromFfi(mapView));
  } finally {
    sdkMapviewMapviewbaseReleaseFfiHandle(mapView);
  }
  return 0;
}
int _sdkMapviewMaprepresentabledetachStatic(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapRepresentable).detach(sdkMapviewMapviewbaseFromFfi(mapView));
  } finally {
    sdkMapviewMapviewbaseReleaseFfiHandle(mapView);
  }
  return 0;
}


Pointer<Void> sdkMapviewMaprepresentableToFfi(MapRepresentable value) {
  if (value is __lib.NativeBase) return _sdkMapviewMaprepresentableCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMaprepresentableCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMaprepresentableattachStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMaprepresentabledetachStatic, __lib.unknownError)
  );

  return result;
}

MapRepresentable sdkMapviewMaprepresentableFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapRepresentable;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkMapviewMaprepresentableGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMaprepresentableCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapRepresentable$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMaprepresentableReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaprepresentableReleaseHandle(handle);

Pointer<Void> sdkMapviewMaprepresentableToFfiNullable(MapRepresentable value) =>
  value != null ? sdkMapviewMaprepresentableToFfi(value) : Pointer<Void>.fromAddress(0);

MapRepresentable? sdkMapviewMaprepresentableFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaprepresentableFromFfi(handle) : null;

void sdkMapviewMaprepresentableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaprepresentableReleaseHandle(handle);

// End of MapRepresentable "private" section.

