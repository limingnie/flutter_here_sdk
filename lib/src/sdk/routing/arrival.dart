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
import 'package:here_sdk/src/sdk/routing/charging_station.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/route_place_type.dart';

/// The arrival location information.
@Deprecated("Will be removed in v4.8.0, use [RoutePlace] instead.")

class Arrival {
  /// The type of the arrival place.
  RoutePlaceType type;

  /// If present, this index corresponds to the waypoint in the original
  /// user-defined waypoint list. Otherwise this waypoint was added during
  /// route calculation by the system.
  int waypointIndex;

  /// User-defined geographic coordinates. If not available, this waypoint was
  /// added during route calculation.
  GeoCoordinates originalCoordinates;

  /// Map-matched geographic coordinates.
  GeoCoordinates mapMatchedCoordinates;

  /// Estimated arrival battery charge in kWh for electric vehicles.
  double chargeInKilowattHours;

  /// Charging station data for electric vehicles.
  ChargingStation chargingStation;

  /// @nodoc
  IndoorLocationDataInternal internalindoorLocation;


  Arrival(this.type, this.waypointIndex, this.originalCoordinates, this.mapMatchedCoordinates, this.chargeInKilowattHours, this.chargingStation, this.internalindoorLocation);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Arrival) return false;
    Arrival _other = other;
    return type == _other.type &&
        waypointIndex == _other.waypointIndex &&
        originalCoordinates == _other.originalCoordinates &&
        mapMatchedCoordinates == _other.mapMatchedCoordinates &&
        chargeInKilowattHours == _other.chargeInKilowattHours &&
        chargingStation == _other.chargingStation &&
        internalindoorLocation == _other.internalindoorLocation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + waypointIndex.hashCode;
    result = 31 * result + originalCoordinates.hashCode;
    result = 31 * result + mapMatchedCoordinates.hashCode;
    result = 31 * result + chargeInKilowattHours.hashCode;
    result = 31 * result + chargingStation.hashCode;
    result = 31 * result + internalindoorLocation.hashCode;
    return result;
  }
}


// Arrival "private" section, not exported.

final _sdkRoutingArrivalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_create_handle'));
final _sdkRoutingArrivalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_release_handle'));
final _sdkRoutingArrivalGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_type'));
final _sdkRoutingArrivalGetFieldwaypointIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_waypointIndex'));
final _sdkRoutingArrivalGetFieldoriginalCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_originalCoordinates'));
final _sdkRoutingArrivalGetFieldmapMatchedCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_mapMatchedCoordinates'));
final _sdkRoutingArrivalGetFieldchargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_chargeInKilowattHours'));
final _sdkRoutingArrivalGetFieldchargingStation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_chargingStation'));
final _sdkRoutingArrivalGetFieldindoorLocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_indoorLocation'));


Pointer<Void> sdkRoutingArrivalToFfi(Arrival value) {
  final _typeHandle = sdkRoutingRouteplacetypeToFfi(value.type);
  final _waypointIndexHandle = intToFfiNullable(value.waypointIndex);
  final _originalCoordinatesHandle = sdkCoreGeocoordinatesToFfiNullable(value.originalCoordinates);
  final _mapMatchedCoordinatesHandle = sdkCoreGeocoordinatesToFfi(value.mapMatchedCoordinates);
  final _chargeInKilowattHoursHandle = doubleToFfiNullable(value.chargeInKilowattHours);
  final _chargingStationHandle = sdkRoutingChargingstationToFfiNullable(value.chargingStation);
  final _indoorLocationHandle = sdkRoutingIndoorlocationdatainternalToFfiNullable(value.internalindoorLocation);
  final _result = _sdkRoutingArrivalCreateHandle(_typeHandle, _waypointIndexHandle, _originalCoordinatesHandle, _mapMatchedCoordinatesHandle, _chargeInKilowattHoursHandle, _chargingStationHandle, _indoorLocationHandle);
  sdkRoutingRouteplacetypeReleaseFfiHandle(_typeHandle);
  intReleaseFfiHandleNullable(_waypointIndexHandle);
  sdkCoreGeocoordinatesReleaseFfiHandleNullable(_originalCoordinatesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_mapMatchedCoordinatesHandle);
  doubleReleaseFfiHandleNullable(_chargeInKilowattHoursHandle);
  sdkRoutingChargingstationReleaseFfiHandleNullable(_chargingStationHandle);
  sdkRoutingIndoorlocationdatainternalReleaseFfiHandleNullable(_indoorLocationHandle);
  return _result;
}

Arrival sdkRoutingArrivalFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkRoutingArrivalGetFieldtype(handle);
  final _waypointIndexHandle = _sdkRoutingArrivalGetFieldwaypointIndex(handle);
  final _originalCoordinatesHandle = _sdkRoutingArrivalGetFieldoriginalCoordinates(handle);
  final _mapMatchedCoordinatesHandle = _sdkRoutingArrivalGetFieldmapMatchedCoordinates(handle);
  final _chargeInKilowattHoursHandle = _sdkRoutingArrivalGetFieldchargeInKilowattHours(handle);
  final _chargingStationHandle = _sdkRoutingArrivalGetFieldchargingStation(handle);
  final _indoorLocationHandle = _sdkRoutingArrivalGetFieldindoorLocation(handle);
  try {
    return Arrival(
      sdkRoutingRouteplacetypeFromFfi(_typeHandle), 
      intFromFfiNullable(_waypointIndexHandle)!,
      sdkCoreGeocoordinatesFromFfiNullable(_originalCoordinatesHandle)!,
      sdkCoreGeocoordinatesFromFfi(_mapMatchedCoordinatesHandle), 
      doubleFromFfiNullable(_chargeInKilowattHoursHandle)!,
      sdkRoutingChargingstationFromFfiNullable(_chargingStationHandle)!,
      sdkRoutingIndoorlocationdatainternalFromFfiNullable(_indoorLocationHandle)!
    );
  } finally {
    sdkRoutingRouteplacetypeReleaseFfiHandle(_typeHandle);
    intReleaseFfiHandleNullable(_waypointIndexHandle);
    sdkCoreGeocoordinatesReleaseFfiHandleNullable(_originalCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_mapMatchedCoordinatesHandle);
    doubleReleaseFfiHandleNullable(_chargeInKilowattHoursHandle);
    sdkRoutingChargingstationReleaseFfiHandleNullable(_chargingStationHandle);
    sdkRoutingIndoorlocationdatainternalReleaseFfiHandleNullable(_indoorLocationHandle);
  }
}

void sdkRoutingArrivalReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingArrivalReleaseHandle(handle);

// Nullable Arrival

final _sdkRoutingArrivalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_create_handle_nullable'));
final _sdkRoutingArrivalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_release_handle_nullable'));
final _sdkRoutingArrivalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_value_nullable'));

Pointer<Void> sdkRoutingArrivalToFfiNullable(Arrival value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingArrivalToFfi(value);
  final result = _sdkRoutingArrivalCreateHandleNullable(_handle);
  sdkRoutingArrivalReleaseFfiHandle(_handle);
  return result;
}

Arrival? sdkRoutingArrivalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingArrivalGetValueNullable(handle);
  final result = sdkRoutingArrivalFromFfi(_handle);
  sdkRoutingArrivalReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingArrivalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingArrivalReleaseHandleNullable(handle);

// End of Arrival "private" section.

