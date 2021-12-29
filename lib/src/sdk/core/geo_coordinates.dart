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
import 'package:meta/meta.dart';




/// Represents geographical coordinates in 3D space.
@immutable
class GeoCoordinates {
  /// Latitude in degrees.
  final double latitude;

  /// Longitude in degrees.
  final double longitude;

  /// Optional altitude in meters.
  /// By convention, on iOS devices, altitude is set as meters relative to the
  /// mean sea level.
  /// On Android devices, altitude is set as meters relative to the WGS 84
  /// reference ellipsoid.
  final double altitude;


  const GeoCoordinates._(this.latitude, this.longitude, this.altitude);

  GeoCoordinates._copy(GeoCoordinates _other) : this._(_other.latitude, _other.longitude, _other.altitude);

  /// Constructs a GeoCoordinates from the provided lat, long, alt values.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  ///
  GeoCoordinates.withAltitude(double latitude, double longitude, double altitude) : this._copy(_withAltitude(latitude, longitude, altitude));


  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  GeoCoordinates(double latitude, double longitude) : this._copy(_$init(latitude, longitude));

  /// Computes distance (in meters) along the great circle between two points.
  ///
  /// This method ignores altitude of both points.
  ///
  /// [point] Coordinates of the point to which the distance is computed.
  ///
  /// Returns [double]. distance in meters.
  ///
  double distanceTo(GeoCoordinates point) {
    final _distanceToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinates_distanceTo__GeoCoordinates'));
    final _pointHandle = sdkCoreGeocoordinatesToFfi(point);
    final _handle = sdkCoreGeocoordinatesToFfi(this);
    final __resultHandle = _distanceToFfi(_handle, __lib.LibraryContext.isolateId, _pointHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_pointHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  /// Constructs a GeoCoordinates from the provided lat, long, alt values.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  ///
  static GeoCoordinates _withAltitude(double latitude, double longitude, double altitude) {
    final _withAltitudeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double, Double), Pointer<Void> Function(int, double, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double_Double'));
    final _latitudeHandle = (latitude);
    final _longitudeHandle = (longitude);
    final _altitudeHandle = (altitude);
    final __resultHandle = _withAltitudeFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle, _altitudeHandle);



    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  static GeoCoordinates _$init(double latitude, double longitude) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double'));
    final _latitudeHandle = (latitude);
    final _longitudeHandle = (longitude);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle);


    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoCoordinates) return false;
    GeoCoordinates _other = other;
    return latitude == _other.latitude &&
        longitude == _other.longitude &&
        altitude == _other.altitude;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + latitude.hashCode;
    result = 31 * result + longitude.hashCode;
    result = 31 * result + altitude.hashCode;
    return result;
  }
}


// GeoCoordinates "private" section, not exported.

final _sdkCoreGeocoordinatesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>),
    Pointer<Void> Function(double, double, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle'));
final _sdkCoreGeocoordinatesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle'));
final _sdkCoreGeocoordinatesGetFieldlatitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_latitude'));
final _sdkCoreGeocoordinatesGetFieldlongitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_longitude'));
final _sdkCoreGeocoordinatesGetFieldaltitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_altitude'));


Pointer<Void> sdkCoreGeocoordinatesToFfi(GeoCoordinates value) {
  final _latitudeHandle = (value.latitude);
  final _longitudeHandle = (value.longitude);
  final _altitudeHandle = doubleToFfiNullable(value.altitude);
  final _result = _sdkCoreGeocoordinatesCreateHandle(_latitudeHandle, _longitudeHandle, _altitudeHandle);
  
  
  doubleReleaseFfiHandleNullable(_altitudeHandle);
  return _result;
}

GeoCoordinates sdkCoreGeocoordinatesFromFfi(Pointer<Void> handle) {
  final _latitudeHandle = _sdkCoreGeocoordinatesGetFieldlatitude(handle);
  final _longitudeHandle = _sdkCoreGeocoordinatesGetFieldlongitude(handle);
  final _altitudeHandle = _sdkCoreGeocoordinatesGetFieldaltitude(handle);
 // print("_latitudeHandle $_latitudeHandle");
 // print("_longitudeHandle $_longitudeHandle");
 // print("_altitudeHandle $_altitudeHandle");
  try {
    return GeoCoordinates._(
      (_latitudeHandle), 
      (_longitudeHandle),
      doubleFromFfiNullable(_altitudeHandle)!
    );
  } finally {
    
    
    doubleReleaseFfiHandleNullable(_altitudeHandle);
  }
}

void sdkCoreGeocoordinatesReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocoordinatesReleaseHandle(handle);

// Nullable GeoCoordinates

final _sdkCoreGeocoordinatesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle_nullable'));
final _sdkCoreGeocoordinatesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle_nullable'));
final _sdkCoreGeocoordinatesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> sdkCoreGeocoordinatesToFfiNullable(GeoCoordinates value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocoordinatesToFfi(value);
  final result = _sdkCoreGeocoordinatesCreateHandleNullable(_handle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
  return result;
}

GeoCoordinates? sdkCoreGeocoordinatesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocoordinatesGetValueNullable(handle);
  final result = sdkCoreGeocoordinatesFromFfi(_handle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocoordinatesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocoordinatesReleaseHandleNullable(handle);

// End of GeoCoordinates "private" section.

