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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/routing/road_features.dart';
import 'package:here_sdk/src/sdk/routing/zone_category.dart';

/// The options to specify restrictions for route calculations.

class AvoidanceOptions {
  /// Features which routes should avoid. Best effort only (not enforced).
  List<RoadFeatures> roadFeatures;

  /// Countries that the route must avoid. Strictly enforced.
  List<CountryCode> countries;

  /// Areas which routes must not cross. Strictly enforced.
  List<GeoBox> avoidAreas;

  /// Zone categories which routes must not cross. Strictly enforced.
  List<ZoneCategory> zoneCategories;


  AvoidanceOptions(this.roadFeatures, this.countries, this.avoidAreas, this.zoneCategories);


  AvoidanceOptions.withDefaults()
    : roadFeatures = [], countries = [], avoidAreas = [], zoneCategories = [];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! AvoidanceOptions) return false;
    AvoidanceOptions _other = other;
    return DeepCollectionEquality().equals(roadFeatures, _other.roadFeatures) &&
        DeepCollectionEquality().equals(countries, _other.countries) &&
        DeepCollectionEquality().equals(avoidAreas, _other.avoidAreas) &&
        DeepCollectionEquality().equals(zoneCategories, _other.zoneCategories);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(roadFeatures);
    result = 31 * result + DeepCollectionEquality().hash(countries);
    result = 31 * result + DeepCollectionEquality().hash(avoidAreas);
    result = 31 * result + DeepCollectionEquality().hash(zoneCategories);
    return result;
  }
}


// AvoidanceOptions "private" section, not exported.

final _sdkRoutingAvoidanceoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_create_handle'));
final _sdkRoutingAvoidanceoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_release_handle'));
final _sdkRoutingAvoidanceoptionsGetFieldroadFeatures = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_roadFeatures'));
final _sdkRoutingAvoidanceoptionsGetFieldcountries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_countries'));
final _sdkRoutingAvoidanceoptionsGetFieldavoidAreas = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_avoidAreas'));
final _sdkRoutingAvoidanceoptionsGetFieldzoneCategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_zoneCategories'));


Pointer<Void> sdkRoutingAvoidanceoptionsToFfi(AvoidanceOptions value) {
  final _roadFeaturesHandle = heresdkRoutingCommonBindingsListofSdkRoutingRoadfeaturesToFfi(value.roadFeatures);
  final _countriesHandle = heresdkRoutingCommonBindingsListofSdkCoreCountrycodeToFfi(value.countries);
  final _avoidAreasHandle = heresdkRoutingCommonBindingsListofSdkCoreGeoboxToFfi(value.avoidAreas);
  final _zoneCategoriesHandle = heresdkRoutingCommonBindingsListofSdkRoutingZonecategoryToFfi(value.zoneCategories);
  final _result = _sdkRoutingAvoidanceoptionsCreateHandle(_roadFeaturesHandle, _countriesHandle, _avoidAreasHandle, _zoneCategoriesHandle);
  heresdkRoutingCommonBindingsListofSdkRoutingRoadfeaturesReleaseFfiHandle(_roadFeaturesHandle);
  heresdkRoutingCommonBindingsListofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
  heresdkRoutingCommonBindingsListofSdkCoreGeoboxReleaseFfiHandle(_avoidAreasHandle);
  heresdkRoutingCommonBindingsListofSdkRoutingZonecategoryReleaseFfiHandle(_zoneCategoriesHandle);
  return _result;
}

AvoidanceOptions sdkRoutingAvoidanceoptionsFromFfi(Pointer<Void> handle) {
  final _roadFeaturesHandle = _sdkRoutingAvoidanceoptionsGetFieldroadFeatures(handle);
  final _countriesHandle = _sdkRoutingAvoidanceoptionsGetFieldcountries(handle);
  final _avoidAreasHandle = _sdkRoutingAvoidanceoptionsGetFieldavoidAreas(handle);
  final _zoneCategoriesHandle = _sdkRoutingAvoidanceoptionsGetFieldzoneCategories(handle);
  try {
    return AvoidanceOptions(
      heresdkRoutingCommonBindingsListofSdkRoutingRoadfeaturesFromFfi(_roadFeaturesHandle), 
      heresdkRoutingCommonBindingsListofSdkCoreCountrycodeFromFfi(_countriesHandle), 
      heresdkRoutingCommonBindingsListofSdkCoreGeoboxFromFfi(_avoidAreasHandle), 
      heresdkRoutingCommonBindingsListofSdkRoutingZonecategoryFromFfi(_zoneCategoriesHandle)
    );
  } finally {
    heresdkRoutingCommonBindingsListofSdkRoutingRoadfeaturesReleaseFfiHandle(_roadFeaturesHandle);
    heresdkRoutingCommonBindingsListofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
    heresdkRoutingCommonBindingsListofSdkCoreGeoboxReleaseFfiHandle(_avoidAreasHandle);
    heresdkRoutingCommonBindingsListofSdkRoutingZonecategoryReleaseFfiHandle(_zoneCategoriesHandle);
  }
}

void sdkRoutingAvoidanceoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingAvoidanceoptionsReleaseHandle(handle);

// Nullable AvoidanceOptions

final _sdkRoutingAvoidanceoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_create_handle_nullable'));
final _sdkRoutingAvoidanceoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_release_handle_nullable'));
final _sdkRoutingAvoidanceoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_value_nullable'));

Pointer<Void> sdkRoutingAvoidanceoptionsToFfiNullable(AvoidanceOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingAvoidanceoptionsToFfi(value);
  final result = _sdkRoutingAvoidanceoptionsCreateHandleNullable(_handle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_handle);
  return result;
}

AvoidanceOptions? sdkRoutingAvoidanceoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingAvoidanceoptionsGetValueNullable(handle);
  final result = sdkRoutingAvoidanceoptionsFromFfi(_handle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingAvoidanceoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingAvoidanceoptionsReleaseHandleNullable(handle);

// End of AvoidanceOptions "private" section.

