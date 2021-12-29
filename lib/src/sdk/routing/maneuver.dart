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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/routing/indoor_maneuver_internal.dart';
import 'package:here_sdk/src/sdk/routing/maneuver_action.dart';
import 'package:here_sdk/src/sdk/routing/road_texts.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';

/// This class provides all the information for a maneuver.
///
/// The directional information (e.g. road names, road
/// numbers and signpost direction) is stored in [Maneuver.roadTexts] and [Maneuver.nextRoadTexts] attributes.
/// As for the motorway exit information, it can be obtained from [Maneuver.exitSignTexts] attribute.
abstract class Maneuver {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Gets the maneuver action.
  ManeuverAction get action;

  /// Gets the geographic coordinates where the maneuver is located.
  GeoCoordinates get coordinates;

  /// Gets the country code of the maneuver position.
  String get countryCode;

  /// Gets the textual attributes of the exit sign.
  LocalizedTexts get exitSignTexts;

  /// Gets the length of the maneuver in meters.
  int get lengthInMeters;

  /// Gets the geographic coordinates that make up the polyline of this maneuver. All items
  /// in the list belong to a route shape, it is guarantied that the return list has at least one item.
  List<GeoCoordinates> get polyline;

  /// Gets the textual attributes of the current road.
  RoadTexts get roadTexts;

  /// Gets the current road type.
  RoadType get roadType;

  /// Gets the current road name as shown on the local road signs.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.roadTexts], which exposes multiple names and numbers together with locale information.")
  String get roadName;

  /// Gets the orthographic language code of current road name.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.roadTexts], which exposes multiple names and numbers together with locale information.")
  String get roadNameLanguageCode;

  /// Gets the current road number as shown on the local road signs.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.roadTexts], which exposes multiple names and numbers together with locale information.")
  String get roadNumber;

  /// Gets the textual attributes of the next road.
  RoadTexts get nextRoadTexts;

  /// Gets the next road type.
  RoadType get nextRoadType;

  /// Gets the next road name as shown on the local road signs.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.nextRoadTexts], which exposes multiple names and numbers together with locale information.")
  String get nextRoadName;

  /// Gets the orthographic language code of next road name.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.nextRoadTexts], which exposes multiple names and numbers together with locale information.")
  String get nextRoadNameLanguageCode;

  /// Gets the next road number as shown on the local road signs.
  @Deprecated("Will be removed in v4.8.0, use [Maneuver.nextRoadTexts], which exposes multiple names and numbers together with locale information.")
  String get nextRoadNumber;

  /// Gets the maneuver instruction.
  String get text;

  /// @nodoc
  IndoorManeuverInternal get internalindoorManeuver;

}


// Maneuver "private" section, not exported.

final _sdkRoutingManeuverCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Maneuver_copy_handle'));
final _sdkRoutingManeuverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Maneuver_release_handle'));


class Maneuver$Impl extends __lib.NativeBase implements Maneuver {

  Maneuver$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingManeuverReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  ManeuverAction get action {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_action_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingManeuveractionFromFfi(__resultHandle);
    } finally {
      sdkRoutingManeuveractionReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get countryCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_countryCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocalizedTexts get exitSignTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_exitSignTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextsFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



  /*late*/ List<GeoCoordinates>? _polylineCache;
  bool _polylineIsCached = false;
  @override

  List<GeoCoordinates> get polyline {
    if (!_polylineIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_polyline_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _polylineCache = heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

      }
      _polylineIsCached = true;
    }
    return _polylineCache!;
  }

  @override
  RoadTexts get roadTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtextsFromFfi(__resultHandle);
    } finally {
      sdkRoutingRoadtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoadType get roadType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtypeFromFfiNullable(__resultHandle)!;
    } finally {
      sdkRoutingRoadtypeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get roadName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get roadNameLanguageCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadNameLanguageCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get roadNumber {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadNumber_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  RoadTexts get nextRoadTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtextsFromFfi(__resultHandle);
    } finally {
      sdkRoutingRoadtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoadType get nextRoadType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtypeFromFfiNullable(__resultHandle)!;
    } finally {
      sdkRoutingRoadtypeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get nextRoadName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get nextRoadNameLanguageCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadNameLanguageCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get nextRoadNumber {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadNumber_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get text {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_text_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  IndoorManeuverInternal get internalindoorManeuver {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_indoorManeuver_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoormaneuverinternalFromFfiNullable(__resultHandle)!;
    } finally {
      sdkRoutingIndoormaneuverinternalReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingManeuverToFfi(Maneuver value) =>
  _sdkRoutingManeuverCopyHandle((value as __lib.NativeBase).handle);

Maneuver sdkRoutingManeuverFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Maneuver;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingManeuverCopyHandle(handle);
  final result = Maneuver$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingManeuverReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingManeuverReleaseHandle(handle);

Pointer<Void> sdkRoutingManeuverToFfiNullable(Maneuver value) =>
  value != null ? sdkRoutingManeuverToFfi(value) : Pointer<Void>.fromAddress(0);

Maneuver? sdkRoutingManeuverFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingManeuverFromFfi(handle) : null;

void sdkRoutingManeuverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingManeuverReleaseHandle(handle);

// End of Maneuver "private" section.

