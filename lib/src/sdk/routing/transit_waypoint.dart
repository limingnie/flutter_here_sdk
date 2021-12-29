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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Represents a transit waypoint, used as input for transit route calculation.

class TransitWaypoint {
  /// The waypoint's geographic coordinates.
  GeoCoordinates coordinates;

  /// This parameter can be used to customize the name of the origin place and will
  /// affect the generated actions descriptions.
  String? placeName;


  TransitWaypoint(this.coordinates, this.placeName);


  TransitWaypoint.withDefaults(GeoCoordinates coordinates)
    : coordinates = coordinates, placeName = null;

}


// TransitWaypoint "private" section, not exported.

final _sdkRoutingTransitwaypointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_create_handle'));
final _sdkRoutingTransitwaypointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_release_handle'));
final _sdkRoutingTransitwaypointGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_field_coordinates'));
final _sdkRoutingTransitwaypointGetFieldplaceName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_field_placeName'));


Pointer<Void> sdkRoutingTransitwaypointToFfi(TransitWaypoint value) {
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _placeNameHandle = stringToFfiNullable(value.placeName!);
  final _result = _sdkRoutingTransitwaypointCreateHandle(_coordinatesHandle, _placeNameHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  stringReleaseFfiHandleNullable(_placeNameHandle);
  return _result;
}

TransitWaypoint sdkRoutingTransitwaypointFromFfi(Pointer<Void> handle) {
  final _coordinatesHandle = _sdkRoutingTransitwaypointGetFieldcoordinates(handle);
  final _placeNameHandle = _sdkRoutingTransitwaypointGetFieldplaceName(handle);
  try {
    return TransitWaypoint(
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      stringFromFfiNullable(_placeNameHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandleNullable(_placeNameHandle);
  }
}

void sdkRoutingTransitwaypointReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitwaypointReleaseHandle(handle);

// Nullable TransitWaypoint

final _sdkRoutingTransitwaypointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_create_handle_nullable'));
final _sdkRoutingTransitwaypointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_release_handle_nullable'));
final _sdkRoutingTransitwaypointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_value_nullable'));

Pointer<Void> sdkRoutingTransitwaypointToFfiNullable(TransitWaypoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitwaypointToFfi(value);
  final result = _sdkRoutingTransitwaypointCreateHandleNullable(_handle);
  sdkRoutingTransitwaypointReleaseFfiHandle(_handle);
  return result;
}

TransitWaypoint? sdkRoutingTransitwaypointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitwaypointGetValueNullable(handle);
  final result = sdkRoutingTransitwaypointFromFfi(_handle);
  sdkRoutingTransitwaypointReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitwaypointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitwaypointReleaseHandleNullable(handle);

// End of TransitWaypoint "private" section.

