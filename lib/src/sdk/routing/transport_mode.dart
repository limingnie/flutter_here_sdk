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

/// Specifies the mode of transport used for route calculalation
enum TransportMode {
    /// The calculated route is optimized for cars.
    car,
    /// The calculated route is optimized for trucks. This mode considers truck restrictions
    /// and uses truck specific speed assumptions when calculating the route.
    truck,
    /// The calculated route is optimized for pedestrians. As one effect, maneuvers will be
    /// optimized for walking, i.e. segments will consider actions relevant for pedestrians
    /// and maneuver instructions will contain texts suitable for a walking person. This mode
    /// disregards any traffic information.
    pedestrian,
    /// The calculated route is optimized for scooters.
    scooter,
    /// The calculated route is optimized for public transit. Note that this transport mode is
    /// available only for some versions of the HERE SDK. Check [SDKBuildInformation]
    /// and consult your HERE representative if necessary.
    publicTransit,
    /// The taxi transport mode takes into account tax restricted streets as well as streets reserved for
    /// exclusive taxi access. Note that roads that are restricted or reserved for taxis are avoided, unless
    /// a waypoint is set on such a road - as this may indicate to pick-up or to drop-off a passenger.
    ///
    /// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
    /// behaviors. Related APIs may change for new releases or even become unsupported, without a
    /// deprecation process.
    taxi
}

// TransportMode "private" section, not exported.

int sdkRoutingTransportmodeToFfi(TransportMode value) {
  switch (value) {
  case TransportMode.car:
    return 0;
  break;
  case TransportMode.truck:
    return 1;
  break;
  case TransportMode.pedestrian:
    return 2;
  break;
  case TransportMode.scooter:
    return 3;
  break;
  case TransportMode.publicTransit:
    return 4;
  break;
  case TransportMode.taxi:
    return 5;
  break;
  default:
    throw StateError("Invalid enum value $value for TransportMode enum.");
  }
}

TransportMode sdkRoutingTransportmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransportMode.car;
  break;
  case 1:
    return TransportMode.truck;
  break;
  case 2:
    return TransportMode.pedestrian;
  break;
  case 3:
    return TransportMode.scooter;
  break;
  case 4:
    return TransportMode.publicTransit;
  break;
  case 5:
    return TransportMode.taxi;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TransportMode enum.");
  }
}

void sdkRoutingTransportmodeReleaseFfiHandle(int handle) {}

final _sdkRoutingTransportmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransportMode_create_handle_nullable'));
final _sdkRoutingTransportmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransportMode_release_handle_nullable'));
final _sdkRoutingTransportmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransportMode_get_value_nullable'));

Pointer<Void> sdkRoutingTransportmodeToFfiNullable(TransportMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransportmodeToFfi(value);
  final result = _sdkRoutingTransportmodeCreateHandleNullable(_handle);
  sdkRoutingTransportmodeReleaseFfiHandle(_handle);
  return result;
}

TransportMode? sdkRoutingTransportmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransportmodeGetValueNullable(handle);
  final result = sdkRoutingTransportmodeFromFfi(_handle);
  sdkRoutingTransportmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransportmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransportmodeReleaseHandleNullable(handle);

// End of TransportMode "private" section.

