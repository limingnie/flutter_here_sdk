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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';





final _expandedByReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_release_handle'));
final _expandedByReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_result'));
final _expandedByReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_error'));
final _expandedByReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_has_error'));


/// Represents a bounding rectangle aligned with latitude and longitude.
///
/// Geographic area represented by this would be visualised as a rectangle
/// when using a normal cylindrical projection (such as Mercator).
@immutable
class GeoBox {
  /// South west corner coordinates.
  final GeoCoordinates southWestCorner;

  /// North east corner coordinates.
  final GeoCoordinates northEastCorner;


  const GeoBox(this.southWestCorner, this.northEastCorner);


  /// Creates a GeoBox which encompases all coordinates from the list
  /// Provided list must contain at leat two points.
  ///
  /// [geoCoordinates] List of coordinates to encompass inside bounding box
  ///
  /// Returns [GeoBox]. GeoBox containing all supplied coordinates, or `null` if less than two coordinates were provided
  ///
  static GeoBox containingGeoCoordinates(List<GeoCoordinates> geoCoordinates) {
    final _containingGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_containing__ListOf_1sdk_1core_1GeoCoordinates'));
    final _geoCoordinatesHandle = coreTypesListofSdkCoreGeocoordinatesToFfi(geoCoordinates);
    final __resultHandle = _containingGeoCoordinatesFfi(__lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    coreTypesListofSdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle)!;
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Determines whether this GeoBox intersects with the passed GeoBox.
  ///
  /// [geoBox] A GeoBox to check for intersection.
  ///
  /// Returns [bool]. true if intersects with the GeoBox, false otherwise.
  ///
  bool intersects(GeoBox geoBox) {
    final _intersectsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_intersects__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi(this);
    final __resultHandle = _intersectsFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// Determines whether the specified GeoBox is covered entirely by this GeoBox.
  ///
  /// [geoBox] A GeoBox to check for containment within this GeoBox.
  ///
  /// Returns [bool]. true if covered by the GeoBox, false otherwise.
  ///
  bool containsGeoBox(GeoBox geoBox) {
    final _containsGeoBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi(this);
    final __resultHandle = _containsGeoBoxFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// Determines whether the specified GeoCoordinates is contained within this GeoBox.
  ///
  /// [geoCoordinates] A GeoCoordinates to check for containment within this GeoBox.
  ///
  /// Returns [bool]. true if contained within the GeoBox, false otherwise.
  ///
  bool containsGeoCoordinates(GeoCoordinates geoCoordinates) {
    final _containsGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = sdkCoreGeoboxToFfi(this);
    final __resultHandle = _containsGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// Creates a GeoBox which is expanded by a fixed distance.
  ///
  /// Throws an InstantiationError if It's not possible to create a valid
  /// GeoBox with the given arguments.
  ///
  /// [southMeters] Distance in the south direction in meters to expand the GeoBox.
  ///
  /// [westMeters] Distance in the west direction in meters to expand the GeoBox.
  ///
  /// [northMeters] Distance in the north direction in meters to expand the GeoBox.
  ///
  /// [eastMeters] Distance in the east direction in meters to expand the GeoBox.
  ///
  /// Returns [GeoBox]. The expanded GeoBox.
  ///
  /// Throws [InstantiationException]. Instantiation error.
  ///
  GeoBox expandedBy(double southMeters, double westMeters, double northMeters, double eastMeters) {
    final _expandedByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double, Double, Double, Double), Pointer<Void> Function(Pointer<Void>, int, double, double, double, double)>('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double'));
    final _southMetersHandle = (southMeters);
    final _westMetersHandle = (westMeters);
    final _northMetersHandle = (northMeters);
    final _eastMetersHandle = (eastMeters);
    final _handle = sdkCoreGeoboxToFfi(this);
    final __callResultHandle = _expandedByFfi(_handle, __lib.LibraryContext.isolateId, _southMetersHandle, _westMetersHandle, _northMetersHandle, _eastMetersHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);




    if (_expandedByReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _expandedByReturnGetError(__callResultHandle);
        _expandedByReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _expandedByReturnGetResult(__callResultHandle);
    _expandedByReturnReleaseHandle(__callResultHandle);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoBox) return false;
    GeoBox _other = other;
    return southWestCorner == _other.southWestCorner &&
        northEastCorner == _other.northEastCorner;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + southWestCorner.hashCode;
    result = 31 * result + northEastCorner.hashCode;
    return result;
  }
}


// GeoBox "private" section, not exported.

final _sdkCoreGeoboxCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle'));
final _sdkCoreGeoboxReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle'));
final _sdkCoreGeoboxGetFieldsouthWestCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_southWestCorner'));
final _sdkCoreGeoboxGetFieldnorthEastCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_northEastCorner'));


Pointer<Void> sdkCoreGeoboxToFfi(GeoBox value) {
  final _southWestCornerHandle = sdkCoreGeocoordinatesToFfi(value.southWestCorner);
  final _northEastCornerHandle = sdkCoreGeocoordinatesToFfi(value.northEastCorner);
  final _result = _sdkCoreGeoboxCreateHandle(_southWestCornerHandle, _northEastCornerHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_southWestCornerHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_northEastCornerHandle);
  return _result;
}

GeoBox sdkCoreGeoboxFromFfi(Pointer<Void> handle) {
  final _southWestCornerHandle = _sdkCoreGeoboxGetFieldsouthWestCorner(handle);
  final _northEastCornerHandle = _sdkCoreGeoboxGetFieldnorthEastCorner(handle);
  try {
    return GeoBox(
      sdkCoreGeocoordinatesFromFfi(_southWestCornerHandle), 
      sdkCoreGeocoordinatesFromFfi(_northEastCornerHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_southWestCornerHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_northEastCornerHandle);
  }
}

void sdkCoreGeoboxReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeoboxReleaseHandle(handle);

// Nullable GeoBox

final _sdkCoreGeoboxCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle_nullable'));
final _sdkCoreGeoboxReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle_nullable'));
final _sdkCoreGeoboxGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_value_nullable'));

Pointer<Void> sdkCoreGeoboxToFfiNullable(GeoBox value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeoboxToFfi(value);
  final result = _sdkCoreGeoboxCreateHandleNullable(_handle);
  sdkCoreGeoboxReleaseFfiHandle(_handle);
  return result;
}

GeoBox? sdkCoreGeoboxFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeoboxGetValueNullable(handle);
  final result = sdkCoreGeoboxFromFfi(_handle);
  sdkCoreGeoboxReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeoboxReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeoboxReleaseHandleNullable(handle);

// End of GeoBox "private" section.

