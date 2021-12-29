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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/arrival.dart';
import 'package:here_sdk/src/sdk/routing/departure.dart';
import 'package:here_sdk/src/sdk/routing/e_v_details.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/notice.dart';
import 'package:here_sdk/src/sdk/routing/post_action.dart';
import 'package:here_sdk/src/sdk/routing/pre_action.dart';
import 'package:here_sdk/src/sdk/routing/route_place.dart';
import 'package:here_sdk/src/sdk/routing/section_notice.dart';
import 'package:here_sdk/src/sdk/routing/section_transport_mode.dart';
import 'package:here_sdk/src/sdk/routing/span.dart';
import 'package:here_sdk/src/sdk/routing/traffic_speed.dart';
import 'package:here_sdk/src/sdk/routing/transit_section_details.dart';

/// A section is a part of the route between two stopovers.
///
/// A stopover is a location on the route where a stop is made.
///
/// **Note:** A section contains a list of [SectionNotice] objects that describe
/// _potential issues_ after the route was calculated. If the list is non-empty, it
/// is recommended to evaluate possible violations against the requested route options
/// and reject the route if deemed necessary.
abstract class Section {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Gets the geographic coordinates that make up the polyline of this section.
  List<GeoCoordinates>? get polyline;

  /// Gets the [Span]'s that constitute this section.
  List<Span>? get spans;

  /// Gets the maneuvers for this section.
  List<Maneuver>? get maneuvers;

  /// Gets the traffic speeds information on the section.
  List<TrafficSpeed>? get trafficSpeeds;

  /// Gets the closest rectangular area where this section fits in.
  GeoBox? get boundingBox;

  /// Gets the length of this section in meters.
  int? get lengthInMeters;

  /// Gets the estimated time in seconds needed to travel along this section, including
  /// real-time traffic delays if available.
  int? get durationInSeconds;

  /// Gets the estimated extra time in seconds spent due to traffic delays along this section.
  /// Negative values indicate that the route can be traversed faster than usual.
  int? get trafficDelayInSeconds;

  /// Gets the transport mode of this section.
  SectionTransportMode? get sectionTransportMode;

  /// Gets the departure location.
  @Deprecated("Will be removed in v4.8.0, use [Section.departurePlace] instead.")
  Departure get departure;

  /// Gets the arrival location.
  @Deprecated("Will be removed in v4.8.0, use [Section.arrivalPlace] instead.")
  Arrival get arrival;

  /// Gets the departure place.
  RoutePlace? get departurePlace;

  /// Gets the arrival place.
  RoutePlace? get arrivalPlace;

  /// Gets the preceding actions that must be done prior to departure at the beginning of the section.
  List<PreAction>? get preActions;

  /// Gets the post actions that must be done after the arrival at the end of the section.
  List<PostAction>? get postActions;

  /// Gets the notices which explains the issues encountered during processing of this section.
  /// For example, while the scooter transport mode is selected, if no reasonable alternative route is
  /// possible except violating controlled-access to highway rule for the section, one notice is generated
  /// for the violation. The user must judge all the notices carefully before proceeding.
  @Deprecated("Will be removed in v4.9.0. Section.sectionNotices property should be used instead.")
  List<Notice> get notices;

  /// Gets the notices which explains the issues encountered during processing of this section.
  /// For example, while the scooter transport mode is selected, if no reasonable alternative route is
  /// possible except violating controlled-access to highway rule for the section, one notice is generated
  /// for the violation. The user must judge all the notices carefully before proceeding.
  List<SectionNotice>? get sectionNotices;

  /// Gets the additional information that is available if the transportation mode used
  /// for this section is an electric vehicle.
  EVDetails? get evDetails;

  /// Gets the details of a transit section.
  TransitSectionDetails? get transitDetails;

}


// Section "private" section, not exported.

final _sdkRoutingSectionCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Section_copy_handle'));
final _sdkRoutingSectionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Section_release_handle'));


class Section$Impl extends __lib.NativeBase implements Section {
  Section$Impl(Pointer<Void> handle) : super(handle);


 // Section$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkRoutingSectionReleaseHandle(handle);
    handle = nullptr;
  }


  /*late*/ List<GeoCoordinates>? _polylineCache;
  bool _polylineIsCached = false;
  @override
  List<GeoCoordinates> get polyline {
    if (!_polylineIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_polyline_get'));
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


  /*late*/ List<Span>? _spansCache;
  bool _spansIsCached = false;
  @override

  List<Span> get spans {
    if (!_spansIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_spans_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _spansCache = heresdkRoutingCommonBindingsListofSdkRoutingSpanFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingSpanReleaseFfiHandle(__resultHandle);

      }
      _spansIsCached = true;
    }
    return _spansCache!;
  }


  /*late*/ List<Maneuver>? _maneuversCache;
  bool? _maneuversIsCached = false;
  @override

  List<Maneuver> get maneuvers {
    if (!_maneuversIsCached!) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_maneuvers_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _maneuversCache = heresdkRoutingCommonBindingsListofSdkRoutingManeuverFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingManeuverReleaseFfiHandle(__resultHandle);

      }
      _maneuversIsCached = true;
    }
    return _maneuversCache!;
  }


  /*late*/ List<TrafficSpeed>? _trafficSpeedsCache;
  bool _trafficSpeedsIsCached = false;
  @override

  List<TrafficSpeed> get trafficSpeeds {
    if (!_trafficSpeedsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_trafficSpeeds_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _trafficSpeedsCache = heresdkRoutingCommonBindingsListofSdkRoutingTrafficspeedFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingTrafficspeedReleaseFfiHandle(__resultHandle);

      }
      _trafficSpeedsIsCached = true;
    }
    return _trafficSpeedsCache!;
  }

  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  int get durationInSeconds {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_durationInSeconds_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  int get trafficDelayInSeconds {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_trafficDelayInSeconds_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  SectionTransportMode get sectionTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_sectionTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingSectiontransportmodeFromFfi(__resultHandle);
    } finally {
      sdkRoutingSectiontransportmodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Departure get departure {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_departure_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingDepartureFromFfi(__resultHandle);
    } finally {
      sdkRoutingDepartureReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Arrival get arrival {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_arrival_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingArrivalFromFfi(__resultHandle);
    } finally {
      sdkRoutingArrivalReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoutePlace get departurePlace {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_departurePlace_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteplaceFromFfi(__resultHandle);
    } finally {
      sdkRoutingRouteplaceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoutePlace get arrivalPlace {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_arrivalPlace_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteplaceFromFfi(__resultHandle);
    } finally {
      sdkRoutingRouteplaceReleaseFfiHandle(__resultHandle);

    }

  }



  /*late*/ List<PreAction>? _preActionsCache;
  bool _preActionsIsCached = false;
  @override

  List<PreAction> get preActions {
    if (!_preActionsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_preActions_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _preActionsCache = heresdkRoutingCommonBindingsListofSdkRoutingPreactionFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingPreactionReleaseFfiHandle(__resultHandle);

      }
      _preActionsIsCached = true;
    }
    return _preActionsCache!;
  }


  /*late*/ List<PostAction>? _postActionsCache;
  bool _postActionsIsCached = false;
  @override

  List<PostAction> get postActions {
    if (!_postActionsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_postActions_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _postActionsCache = heresdkRoutingCommonBindingsListofSdkRoutingPostactionFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingPostactionReleaseFfiHandle(__resultHandle);

      }
      _postActionsIsCached = true;
    }
    return _postActionsCache!;
  }


  /*late*/ List<Notice>? _noticesCache;
  bool _noticesIsCached = false;
  @override

  List<Notice> get notices {
    if (!_noticesIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_notices_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _noticesCache = heresdkRoutingCommonBindingsListofSdkRoutingNoticeFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingNoticeReleaseFfiHandle(__resultHandle);

      }
      _noticesIsCached = true;
    }
    return _noticesCache!;
  }


  /*late*/ List<SectionNotice>? _sectionNoticesCache;
  bool _sectionNoticesIsCached = false;
  @override

  List<SectionNotice> get sectionNotices {
    if (!_sectionNoticesIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_sectionNotices_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _sectionNoticesCache = heresdkRoutingCommonBindingsListofSdkRoutingSectionnoticeFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingsListofSdkRoutingSectionnoticeReleaseFfiHandle(__resultHandle);

      }
      _sectionNoticesIsCached = true;
    }
    return _sectionNoticesCache!;
  }

  @override
  EVDetails get evDetails {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_evDetails_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingEvdetailsFromFfiNullable(__resultHandle)!;
    } finally {
      sdkRoutingEvdetailsReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  TransitSectionDetails get transitDetails {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_transitDetails_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingTransitsectiondetailsFromFfiNullable(__resultHandle)!;
    } finally {
      sdkRoutingTransitsectiondetailsReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingSectionToFfi(Section value) =>
  _sdkRoutingSectionCopyHandle((value as __lib.NativeBase).handle);

Section sdkRoutingSectionFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Section;
  if (instance != null) return instance;

  final _copiedHandle = _sdkRoutingSectionCopyHandle(handle);
  final result = Section$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkRoutingSectionReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingSectionReleaseHandle(handle);

Pointer<Void> sdkRoutingSectionToFfiNullable(Section value) =>
  value != null ? sdkRoutingSectionToFfi(value) : Pointer<Void>.fromAddress(0);

Section? sdkRoutingSectionFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingSectionFromFfi(handle) : null;

void sdkRoutingSectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSectionReleaseHandle(handle);

// End of Section "private" section.

