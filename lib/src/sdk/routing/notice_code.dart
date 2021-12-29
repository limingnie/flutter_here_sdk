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

/// Notice codes which point the issues encountered during processing of a route calculation request.
///
/// The notice codes are going to be extended for new error situations.
@Deprecated("Will be removed in v4.9.0. SectionNoticeCode should be used instead.")
enum NoticeCode {
    /// No schedule information is available for a transit section.
    noSchedule,
    /// Violated avoid controlled-access highway preference.
    violatedAvoidControlledAccessHighway,
    /// Violated avoid toll road preference.
    violatedAvoidTollRoad,
    /// Violated avoid ferry preference.
    violatedAvoidFerry,
    /// Violated avoid tunnel preference.
    violatedAvoidTunnel,
    /// Violated avoid dirt road preference.
    violatedAvoidDirtRoad,
    /// Violated avoid rail ferry preference.
    violatedAvoidRailFerry,
    /// Violated avoid park preference.
    violatedAvoidPark,
    /// Route uses roads blocked by traffic events.
    violatedBlockedRoad,
    /// Start direction of the route is not as requested.
    violatedStartDirection,
    /// Violated carpool preference.
    violatedCarpool,
    /// Route uses a time-restricted turn.
    violatedTurnRestriction,
    /// Route uses roads or turns which are permanently forbidden for the given truck profile.
    violatedPermanentTruckRestriction,
    /// Route uses roads which are part of restricted routing zones
    violatedZoneRestriction,
    /// Violated avoid difficult turns preference.
    violatedAvoidDifficultTurns,
    /// Route uses a time-restricted road.
    violatedTimeDependentRestriction
}

// NoticeCode "private" section, not exported.

int sdkRoutingNoticecodeToFfi(NoticeCode value) {
  switch (value) {
  case NoticeCode.noSchedule:
    return 0;
  
  case NoticeCode.violatedAvoidControlledAccessHighway:
    return 1;
  
  case NoticeCode.violatedAvoidTollRoad:
    return 2;
  
  case NoticeCode.violatedAvoidFerry:
    return 3;
  
  case NoticeCode.violatedAvoidTunnel:
    return 4;
  
  case NoticeCode.violatedAvoidDirtRoad:
    return 5;
  
  case NoticeCode.violatedAvoidRailFerry:
    return 6;
  
  case NoticeCode.violatedAvoidPark:
    return 7;
  
  case NoticeCode.violatedBlockedRoad:
    return 8;
  
  case NoticeCode.violatedStartDirection:
    return 9;
  
  case NoticeCode.violatedCarpool:
    return 10;
  
  case NoticeCode.violatedTurnRestriction:
    return 11;
  
  case NoticeCode.violatedPermanentTruckRestriction:
    return 12;
  
  case NoticeCode.violatedZoneRestriction:
    return 13;
  
  case NoticeCode.violatedAvoidDifficultTurns:
    return 14;
  
  case NoticeCode.violatedTimeDependentRestriction:
    return 15;
  
  default:
    throw StateError("Invalid enum value $value for NoticeCode enum.");
  }
}

NoticeCode sdkRoutingNoticecodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return NoticeCode.noSchedule;
  
  case 1:
    return NoticeCode.violatedAvoidControlledAccessHighway;
  
  case 2:
    return NoticeCode.violatedAvoidTollRoad;
  
  case 3:
    return NoticeCode.violatedAvoidFerry;
  
  case 4:
    return NoticeCode.violatedAvoidTunnel;
  
  case 5:
    return NoticeCode.violatedAvoidDirtRoad;
  
  case 6:
    return NoticeCode.violatedAvoidRailFerry;
  
  case 7:
    return NoticeCode.violatedAvoidPark;
  
  case 8:
    return NoticeCode.violatedBlockedRoad;
  
  case 9:
    return NoticeCode.violatedStartDirection;
  
  case 10:
    return NoticeCode.violatedCarpool;
  
  case 11:
    return NoticeCode.violatedTurnRestriction;
  
  case 12:
    return NoticeCode.violatedPermanentTruckRestriction;
  
  case 13:
    return NoticeCode.violatedZoneRestriction;
  
  case 14:
    return NoticeCode.violatedAvoidDifficultTurns;
  
  case 15:
    return NoticeCode.violatedTimeDependentRestriction;
  
  default:
    throw StateError("Invalid numeric value $handle for NoticeCode enum.");
  }
}

void sdkRoutingNoticecodeReleaseFfiHandle(int handle) {}

final _sdkRoutingNoticecodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_NoticeCode_create_handle_nullable'));
final _sdkRoutingNoticecodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeCode_release_handle_nullable'));
final _sdkRoutingNoticecodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeCode_get_value_nullable'));

Pointer<Void> sdkRoutingNoticecodeToFfiNullable(NoticeCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingNoticecodeToFfi(value);
  final result = _sdkRoutingNoticecodeCreateHandleNullable(_handle);
  sdkRoutingNoticecodeReleaseFfiHandle(_handle);
  return result;
}

NoticeCode? sdkRoutingNoticecodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingNoticecodeGetValueNullable(handle);
  final result = sdkRoutingNoticecodeFromFfi(_handle);
  sdkRoutingNoticecodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingNoticecodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingNoticecodeReleaseHandleNullable(handle);

// End of NoticeCode "private" section.

