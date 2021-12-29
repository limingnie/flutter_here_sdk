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
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';
import 'package:meta/meta.dart';

/// Abstract class for objects that want to get updates whenever the map is redrawn after
/// camera parameters change.
abstract class MapCameraObserver {
  MapCameraObserver();

  factory MapCameraObserver.fromLambdas({
    required void Function(MapCameraState) lambda_onCameraUpdated,

  }) => MapCameraObserver$Lambdas(
    lambda_onCameraUpdated,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called on the main thread after the map is drawn.
  ///
  /// [cameraState] Camera parameters at the time the map was drawn.
  ///
  onCameraUpdated(MapCameraState cameraState);
}


// MapCameraObserver "private" section, not exported.

final _sdkMapviewMapcameraobserverCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_copy_handle'));
final _sdkMapviewMapcameraobserverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_release_handle'));
final _sdkMapviewMapcameraobserverCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapCameraObserver_create_proxy'));
final _sdkMapviewMapcameraobserverGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_get_type_id'));


class MapCameraObserver$Lambdas implements MapCameraObserver {
  void Function(MapCameraState) lambda_onCameraUpdated;

  MapCameraObserver$Lambdas(
    this.lambda_onCameraUpdated,

  );

  @override
  void release() {}

  @override
  onCameraUpdated(MapCameraState cameraState) =>
    lambda_onCameraUpdated(cameraState);
}

class MapCameraObserver$Impl extends __lib.NativeBase implements MapCameraObserver {

  MapCameraObserver$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapcameraobserverReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  onCameraUpdated(MapCameraState cameraState) {
    final _onCameraUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraObserver_onCameraUpdated__State'));
    final _cameraStateHandle = sdkMapviewMapcameraStateToFfi(cameraState);
    final _handle = this.handle;
    final __resultHandle = _onCameraUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _cameraStateHandle);
    sdkMapviewMapcameraStateReleaseFfiHandle(_cameraStateHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkMapviewMapcameraobserveronCameraUpdatedStatic(int _token, Pointer<Void> cameraState) {

  try {
    (__lib.instanceCache[_token] as MapCameraObserver).onCameraUpdated(sdkMapviewMapcameraStateFromFfi(cameraState));
  } finally {
    sdkMapviewMapcameraStateReleaseFfiHandle(cameraState);
  }
  return 0;
}


Pointer<Void> sdkMapviewMapcameraobserverToFfi(MapCameraObserver value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapcameraobserverCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapcameraobserverCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_sdkMapviewMapcameraobserveronCameraUpdatedStatic, __lib.unknownError)
  );

  return result;
}

MapCameraObserver sdkMapviewMapcameraobserverFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapCameraObserver;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkMapviewMapcameraobserverGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapcameraobserverCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapCameraObserver$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapcameraobserverReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraobserverReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraobserverToFfiNullable(MapCameraObserver value) =>
  value != null ? sdkMapviewMapcameraobserverToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraObserver? sdkMapviewMapcameraobserverFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraobserverFromFfi(handle) : null;

void sdkMapviewMapcameraobserverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraobserverReleaseHandle(handle);

// End of MapCameraObserver "private" section.

