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

import 'dart:collection';
import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';




/// A geographical area that wraps around a geographical polyline with a given distance.
///
/// The corridor has round edges at the endpoints of the polyline. The distance from
/// any point of the polyline to the closest border of the corridor is always the same.
@immutable
class GeoCorridor {
  /// The polyline passing through the middle of the corridor.
  final List<GeoCoordinates> polyline;

  /// The shortest distance from any point on the polyline to the border of the corridor.
  @Deprecated("Will be removed in v4.10.0. Please use [GeoCorridor.halfWidthInMeters] instead.")
  final int radiusInMeters;

  /// The shortest distance from any point on the polyline to the border of the corridor.
  final int halfWidthInMeters;


  const GeoCorridor._(this.polyline, this.radiusInMeters, this.halfWidthInMeters);

  GeoCorridor._copy(GeoCorridor _other) : this._(_other.polyline, _other.radiusInMeters, _other.halfWidthInMeters);

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  ///
  @Deprecated("Will be removed in v4.10.0. Please use [GeoCorridor.halfWidthInMeters] instead.")

  GeoCorridor.withRadius(List<GeoCoordinates> polyline, int radiusInMeters) : this._copy(_withRadius(polyline, radiusInMeters));

  /// Constructs a GeoCorridor from the provided polyline and half-width in meters.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  /// [halfWidthInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  ///
  GeoCorridor.make(List<GeoCoordinates> polyline, int halfWidthInMeters) : this._copy(_make(polyline, halfWidthInMeters));

  /// Constructs a GeoCorridor from the provided polyline.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  GeoCorridor.withPolyline(List<GeoCoordinates> polyline) : this._copy(_withPolyline(polyline));

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  ///
  @Deprecated("Will be removed in v4.10.0. Please use [GeoCorridor.halfWidthInMeters] instead.")

  static GeoCorridor _withRadius(List<GeoCoordinates> polyline, int radiusInMeters) {
    final _withRadiusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_core_GeoCorridor_makeDeprecated__ListOf_1sdk_1core_1GeoCoordinates_Int'));
    final _polylineHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(polyline);
    final _radiusInMetersHandle = (radiusInMeters);
    final __resultHandle = _withRadiusFfi(__lib.LibraryContext.isolateId, _polylineHandle, _radiusInMetersHandle);
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);

    try {
      return sdkCoreGeocorridorFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocorridorReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a GeoCorridor from the provided polyline and half-width in meters.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  /// [halfWidthInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  ///
  static GeoCorridor _make(List<GeoCoordinates> polyline, int halfWidthInMeters) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_1sdk_1core_1GeoCoordinates_Int'));
    final _polylineHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(polyline);
    final _halfWidthInMetersHandle = (halfWidthInMeters);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _polylineHandle, _halfWidthInMetersHandle);
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);

    try {
      return sdkCoreGeocorridorFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocorridorReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a GeoCorridor from the provided polyline.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  static GeoCorridor _withPolyline(List<GeoCoordinates> polyline) {
    final _withPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_1sdk_1core_1GeoCoordinates'));
    final _polylineHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(polyline);
    final __resultHandle = _withPolylineFfi(__lib.LibraryContext.isolateId, _polylineHandle);
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
    try {
      return sdkCoreGeocorridorFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocorridorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoCorridor) return false;
    GeoCorridor _other = other;
    return DeepCollectionEquality().equals(polyline, _other.polyline) &&
        radiusInMeters == _other.radiusInMeters &&
        halfWidthInMeters == _other.halfWidthInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(polyline);
    result = 31 * result + radiusInMeters.hashCode;
    result = 31 * result + halfWidthInMeters.hashCode;
    return result;
  }
}


// GeoCorridor "private" section, not exported.

final _sdkCoreGeocorridorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_create_handle'));
final _sdkCoreGeocorridorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle'));
final _sdkCoreGeocorridorGetFieldpolyline = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_polyline'));
final _sdkCoreGeocorridorGetFieldradiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_radiusInMeters'));
final _sdkCoreGeocorridorGetFieldhalfWidthInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_halfWidthInMeters'));


Pointer<Void> sdkCoreGeocorridorToFfi(GeoCorridor value) {
  final _polylineHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(value.polyline);
  final _radiusInMetersHandle = (value.radiusInMeters);
  final _halfWidthInMetersHandle = intToFfiNullable(value.halfWidthInMeters);
  final _result = _sdkCoreGeocorridorCreateHandle(_polylineHandle, _radiusInMetersHandle, _halfWidthInMetersHandle);
  heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
  
  intReleaseFfiHandleNullable(_halfWidthInMetersHandle);
  return _result;
}

GeoCorridor sdkCoreGeocorridorFromFfi(Pointer<Void> handle) {
  final _polylineHandle = _sdkCoreGeocorridorGetFieldpolyline(handle);
  final _radiusInMetersHandle = _sdkCoreGeocorridorGetFieldradiusInMeters(handle);
  final _halfWidthInMetersHandle = _sdkCoreGeocorridorGetFieldhalfWidthInMeters(handle);
  try {
    return GeoCorridor._(
      heresdkCoreBindingsListofSdkCoreGeocoordinatesFromFfi(_polylineHandle), 
      (_radiusInMetersHandle), 
      intFromFfiNullable(_halfWidthInMetersHandle)!
    );
  } finally {
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
    
    intReleaseFfiHandleNullable(_halfWidthInMetersHandle);
  }
}

void sdkCoreGeocorridorReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocorridorReleaseHandle(handle);

// Nullable GeoCorridor

final _sdkCoreGeocorridorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_create_handle_nullable'));
final _sdkCoreGeocorridorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle_nullable'));
final _sdkCoreGeocorridorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_value_nullable'));

Pointer<Void> sdkCoreGeocorridorToFfiNullable(GeoCorridor value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocorridorToFfi(value);
  final result = _sdkCoreGeocorridorCreateHandleNullable(_handle);
  sdkCoreGeocorridorReleaseFfiHandle(_handle);
  return result;
}

GeoCorridor? sdkCoreGeocorridorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocorridorGetValueNullable(handle);
  final result = sdkCoreGeocorridorFromFfi(_handle);
  sdkCoreGeocorridorReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocorridorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocorridorReleaseHandleNullable(handle);

// End of GeoCorridor "private" section.

