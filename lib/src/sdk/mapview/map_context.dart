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
import 'package:here_sdk/src/sdk/core/language_code.dart';

/// internal class wrapping HARP's map context
/// @nodoc
abstract class MapContext {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Pauses the map context.
  ///
  /// @nodoc
  internalpause();
  /// Resumes the map context.
  ///
  /// @nodoc
  internalresume();
  /// @nodoc
  LanguageCode get internalprimaryLanguage;
  /// @nodoc
  set internalprimaryLanguage(LanguageCode value);

}


// MapContext "private" section, not exported.

final _sdkMapviewMapcontextCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_copy_handle'));
final _sdkMapviewMapcontextReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_release_handle'));




class MapContext$Impl extends __lib.NativeBase implements MapContext {

  MapContext$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkMapviewMapcontextReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  internalpause() {
    final _pauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_pause'));
    final _handle = this.handle;
    final __resultHandle = _pauseFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  internalresume() {
    final _resumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_resume'));
    final _handle = this.handle;
    final __resultHandle = _resumeFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  LanguageCode get internalprimaryLanguage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_primaryLanguage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLanguagecodeFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCoreLanguagecodeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set internalprimaryLanguage(LanguageCode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapContext_primaryLanguage_set__LanguageCode'));
    final _valueHandle = sdkCoreLanguagecodeToFfiNullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkMapviewMapcontextToFfi(MapContext value) =>
  _sdkMapviewMapcontextCopyHandle((value as __lib.NativeBase).handle);

MapContext sdkMapviewMapcontextFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapContext;
  if (instance != null) return instance;

  final _copiedHandle = _sdkMapviewMapcontextCopyHandle(handle);
  final result = MapContext$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkMapviewMapcontextReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcontextReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcontextToFfiNullable(MapContext value) =>
  value != null ? sdkMapviewMapcontextToFfi(value) : Pointer<Void>.fromAddress(0);

MapContext? sdkMapviewMapcontextFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcontextFromFfi(handle) : null;

void sdkMapviewMapcontextReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontextReleaseHandle(handle);

// End of MapContext "private" section.

