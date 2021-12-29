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
import 'package:here_sdk/src/sdk/search/ev_charging_point.dart';

/// Contains information about a connector at an EV charging station.
/// @nodoc

class EvConnector {
  /// The supplier name.
  /// @nodoc
  String internalsupplierName;

  /// Id and name element pairs with an Integer value and a descriptive name describing the connector type.
  /// For more information on the current connector types, see the list of connectorType values.
  /// @nodoc
  List<String> internalconnectorTypes;

  /// Maximum charge power of connector in kilowatts.
  /// @nodoc
  double internalmaxPowerInKilowatts;

  /// Dynamic information for the connector.
  /// @nodoc
  List<EvChargingPoint> internalchargingPoints;


  EvConnector(this.internalsupplierName, this.internalconnectorTypes, this.internalmaxPowerInKilowatts, this.internalchargingPoints);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvConnector) return false;
    EvConnector _other = other;
    return internalsupplierName == _other.internalsupplierName &&
        DeepCollectionEquality().equals(internalconnectorTypes, _other.internalconnectorTypes) &&
        internalmaxPowerInKilowatts == _other.internalmaxPowerInKilowatts &&
        DeepCollectionEquality().equals(internalchargingPoints, _other.internalchargingPoints);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalsupplierName.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalconnectorTypes);
    result = 31 * result + internalmaxPowerInKilowatts.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalchargingPoints);
    return result;
  }
}


// EvConnector "private" section, not exported.

final _sdkSearchEvconnectorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_create_handle'));
final _sdkSearchEvconnectorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_release_handle'));
final _sdkSearchEvconnectorGetFieldsupplierName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_supplierName'));
final _sdkSearchEvconnectorGetFieldconnectorTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_connectorTypes'));
final _sdkSearchEvconnectorGetFieldmaxPowerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_maxPowerInKilowatts'));
final _sdkSearchEvconnectorGetFieldchargingPoints = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_chargingPoints'));


Pointer<Void> sdkSearchEvconnectorToFfi(EvConnector value) {
  final _supplierNameHandle = stringToFfiNullable(value.internalsupplierName);
  final _connectorTypesHandle = heresdkSearchCommonBindingsListofStringToFfi(value.internalconnectorTypes);
  final _maxPowerInKilowattsHandle = doubleToFfiNullable(value.internalmaxPowerInKilowatts);
  final _chargingPointsHandle = heresdkSearchCommonBindingsListofSdkSearchEvchargingpointToFfi(value.internalchargingPoints);
  final _result = _sdkSearchEvconnectorCreateHandle(_supplierNameHandle, _connectorTypesHandle, _maxPowerInKilowattsHandle, _chargingPointsHandle);
  stringReleaseFfiHandleNullable(_supplierNameHandle);
  heresdkSearchCommonBindingsListofStringReleaseFfiHandle(_connectorTypesHandle);
  doubleReleaseFfiHandleNullable(_maxPowerInKilowattsHandle);
  heresdkSearchCommonBindingsListofSdkSearchEvchargingpointReleaseFfiHandle(_chargingPointsHandle);
  return _result;
}

EvConnector sdkSearchEvconnectorFromFfi(Pointer<Void> handle) {
  final _supplierNameHandle = _sdkSearchEvconnectorGetFieldsupplierName(handle);
  final _connectorTypesHandle = _sdkSearchEvconnectorGetFieldconnectorTypes(handle);
  final _maxPowerInKilowattsHandle = _sdkSearchEvconnectorGetFieldmaxPowerInKilowatts(handle);
  final _chargingPointsHandle = _sdkSearchEvconnectorGetFieldchargingPoints(handle);
  try {
    return EvConnector(
      stringFromFfiNullable(_supplierNameHandle), 
      heresdkSearchCommonBindingsListofStringFromFfi(_connectorTypesHandle), 
      doubleFromFfiNullable(_maxPowerInKilowattsHandle)!,
      heresdkSearchCommonBindingsListofSdkSearchEvchargingpointFromFfi(_chargingPointsHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_supplierNameHandle);
    heresdkSearchCommonBindingsListofStringReleaseFfiHandle(_connectorTypesHandle);
    doubleReleaseFfiHandleNullable(_maxPowerInKilowattsHandle);
    heresdkSearchCommonBindingsListofSdkSearchEvchargingpointReleaseFfiHandle(_chargingPointsHandle);
  }
}

void sdkSearchEvconnectorReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvconnectorReleaseHandle(handle);

// Nullable EvConnector

final _sdkSearchEvconnectorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_create_handle_nullable'));
final _sdkSearchEvconnectorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_release_handle_nullable'));
final _sdkSearchEvconnectorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_value_nullable'));

Pointer<Void> sdkSearchEvconnectorToFfiNullable(EvConnector value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvconnectorToFfi(value);
  final result = _sdkSearchEvconnectorCreateHandleNullable(_handle);
  sdkSearchEvconnectorReleaseFfiHandle(_handle);
  return result;
}

EvConnector? sdkSearchEvconnectorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvconnectorGetValueNullable(handle);
  final result = sdkSearchEvconnectorFromFfi(_handle);
  sdkSearchEvconnectorReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvconnectorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvconnectorReleaseHandleNullable(handle);

// End of EvConnector "private" section.

