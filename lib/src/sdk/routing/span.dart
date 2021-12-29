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

/// A span is a part of the [Section] which is traversable or navigable.
///
/// Each span
/// usually has some geometry associated with it.
abstract class Span {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Gets the geographic coordinates that make up the polyline of this span.
  List<GeoCoordinates> get polyline;

  /// Gets the length of this span in meters.
  int get lengthInMeters;

  /// Gets the list of indexes to [Section.sectionNotices] the parent section owns.
  /// In case the list is not empty, the user must judge all the indexed [SectionNotice]'s
  /// carefully before proceeding.
  List<int> get noticeIndexes;

}


// Span "private" section, not exported.

final _sdkRoutingSpanCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_copy_handle'));
final _sdkRoutingSpanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_release_handle'));


class Span$Impl extends __lib.NativeBase implements Span {

  Span$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingSpanReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  List<GeoCoordinates> get polyline {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_polyline_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  List<int> get noticeIndexes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_noticeIndexes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingsListofIntFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingsListofIntReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingSpanToFfi(Span value) =>
  _sdkRoutingSpanCopyHandle((value as __lib.NativeBase).handle);

Span sdkRoutingSpanFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Span;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingSpanCopyHandle(handle);
  final result = Span$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingSpanReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingSpanReleaseHandle(handle);

Pointer<Void> sdkRoutingSpanToFfiNullable(Span value) =>
  value != null ? sdkRoutingSpanToFfi(value) : Pointer<Void>.fromAddress(0);

Span? sdkRoutingSpanFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingSpanFromFfi(handle) : null;

void sdkRoutingSpanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSpanReleaseHandle(handle);

// End of Span "private" section.

