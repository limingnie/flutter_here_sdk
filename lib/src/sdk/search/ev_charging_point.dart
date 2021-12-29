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

/// Contains information about an EV charging point.
/// @nodoc

class EvChargingPoint {
  /// Charging mode of the connector. The current available values are:
  /// Mode 1 ? slow charging from a regular electrical socket (1 or 3 phase)
  /// Mode 2 ? slow charging from a regular socket equipped with some EV specific protection arrangement.
  /// Examples include Park & Charge and PARVE systems.
  /// Mode 3 ? slow or fast charging using a specific EV multi-pin socket with control and
  /// protection functions. Examples include systems with SAE J1772 and IEC 62196 connectors.
  /// Mode 4 ? fast charging using some special charging technology such as CHAdeMO.
  /// Unspecified ? no information provided
  /// @nodoc
  String internalchargingMode;

  /// Number of physical connectors at the charging point.
  /// @nodoc
  int internalconnectorCount;

  /// Number of phases used by the charge point.
  /// @nodoc
  int internalphasesCount;

  /// Voltage range of the charge provided by the charge point, in volts.
  /// Values are alpha numeric represented by the Volt value followed by 'V' and
  /// by the current type 'AC' or 'DC', for example: '100-120V AC'
  /// @nodoc
  String internalvoltageRangeInVolts;

  /// Current range provided by the charge point, in amperes.
  /// Values are alpha numeric represented by the Ampere value followed by an 'A',
  /// for example '12A-80A'
  /// @nodoc
  String internalcurrentRangeInAmperes;


  EvChargingPoint(this.internalchargingMode, this.internalconnectorCount, this.internalphasesCount, this.internalvoltageRangeInVolts, this.internalcurrentRangeInAmperes);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvChargingPoint) return false;
    EvChargingPoint _other = other;
    return internalchargingMode == _other.internalchargingMode &&
        internalconnectorCount == _other.internalconnectorCount &&
        internalphasesCount == _other.internalphasesCount &&
        internalvoltageRangeInVolts == _other.internalvoltageRangeInVolts &&
        internalcurrentRangeInAmperes == _other.internalcurrentRangeInAmperes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalchargingMode.hashCode;
    result = 31 * result + internalconnectorCount.hashCode;
    result = 31 * result + internalphasesCount.hashCode;
    result = 31 * result + internalvoltageRangeInVolts.hashCode;
    result = 31 * result + internalcurrentRangeInAmperes.hashCode;
    return result;
  }
}


// EvChargingPoint "private" section, not exported.

final _sdkSearchEvchargingpointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_create_handle'));
final _sdkSearchEvchargingpointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_release_handle'));
final _sdkSearchEvchargingpointGetFieldchargingMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_chargingMode'));
final _sdkSearchEvchargingpointGetFieldconnectorCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_connectorCount'));
final _sdkSearchEvchargingpointGetFieldphasesCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_phasesCount'));
final _sdkSearchEvchargingpointGetFieldvoltageRangeInVolts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_voltageRangeInVolts'));
final _sdkSearchEvchargingpointGetFieldcurrentRangeInAmperes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_currentRangeInAmperes'));


Pointer<Void> sdkSearchEvchargingpointToFfi(EvChargingPoint value) {
  final _chargingModeHandle = stringToFfiNullable(value.internalchargingMode);
  final _connectorCountHandle = intToFfiNullable(value.internalconnectorCount);
  final _phasesCountHandle = intToFfiNullable(value.internalphasesCount);
  final _voltageRangeInVoltsHandle = stringToFfiNullable(value.internalvoltageRangeInVolts);
  final _currentRangeInAmperesHandle = stringToFfiNullable(value.internalcurrentRangeInAmperes);
  final _result = _sdkSearchEvchargingpointCreateHandle(_chargingModeHandle, _connectorCountHandle, _phasesCountHandle, _voltageRangeInVoltsHandle, _currentRangeInAmperesHandle);
  stringReleaseFfiHandleNullable(_chargingModeHandle);
  intReleaseFfiHandleNullable(_connectorCountHandle);
  intReleaseFfiHandleNullable(_phasesCountHandle);
  stringReleaseFfiHandleNullable(_voltageRangeInVoltsHandle);
  stringReleaseFfiHandleNullable(_currentRangeInAmperesHandle);
  return _result;
}

EvChargingPoint sdkSearchEvchargingpointFromFfi(Pointer<Void> handle) {
  final _chargingModeHandle = _sdkSearchEvchargingpointGetFieldchargingMode(handle);
  final _connectorCountHandle = _sdkSearchEvchargingpointGetFieldconnectorCount(handle);
  final _phasesCountHandle = _sdkSearchEvchargingpointGetFieldphasesCount(handle);
  final _voltageRangeInVoltsHandle = _sdkSearchEvchargingpointGetFieldvoltageRangeInVolts(handle);
  final _currentRangeInAmperesHandle = _sdkSearchEvchargingpointGetFieldcurrentRangeInAmperes(handle);
  try {
    return EvChargingPoint(
      stringFromFfiNullable(_chargingModeHandle), 
      intFromFfiNullable(_connectorCountHandle)!,
      intFromFfiNullable(_phasesCountHandle)!,
      stringFromFfiNullable(_voltageRangeInVoltsHandle), 
      stringFromFfiNullable(_currentRangeInAmperesHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_chargingModeHandle);
    intReleaseFfiHandleNullable(_connectorCountHandle);
    intReleaseFfiHandleNullable(_phasesCountHandle);
    stringReleaseFfiHandleNullable(_voltageRangeInVoltsHandle);
    stringReleaseFfiHandleNullable(_currentRangeInAmperesHandle);
  }
}

void sdkSearchEvchargingpointReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvchargingpointReleaseHandle(handle);

// Nullable EvChargingPoint

final _sdkSearchEvchargingpointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_create_handle_nullable'));
final _sdkSearchEvchargingpointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_release_handle_nullable'));
final _sdkSearchEvchargingpointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_value_nullable'));

Pointer<Void> sdkSearchEvchargingpointToFfiNullable(EvChargingPoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvchargingpointToFfi(value);
  final result = _sdkSearchEvchargingpointCreateHandleNullable(_handle);
  sdkSearchEvchargingpointReleaseFfiHandle(_handle);
  return result;
}

EvChargingPoint? sdkSearchEvchargingpointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvchargingpointGetValueNullable(handle);
  final result = sdkSearchEvchargingpointFromFfi(_handle);
  sdkSearchEvchargingpointReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvchargingpointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvchargingpointReleaseHandleNullable(handle);

// End of EvChargingPoint "private" section.

