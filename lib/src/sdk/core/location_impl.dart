// Copyright (c) 2020 HERE Global B.V. and its affiliate(s).
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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Describes a location in the world at a given time.
class Location {
  /// The geographic coordinates of the location.
  GeoCoordinates? coordinates;

  /// Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).
  double? bearingInDegrees;

  /// Current speed of the device. If it cannot be determined, the value is `null`.
  double? speedInMetersPerSecond;

  /// The time at which the location was determined.
  DateTime? timestamp;

  /// The estimated horizontal accuracy. The actual location will lie within this radius of uncertainty.
  double? horizontalAccuracyInMeters;

  /// Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\].
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\].
  double? verticalAccuracyInMeters;

  /// Estimated bearing accuracy for this location, in degrees.
  /// If it cannot be determined, the value is `null`.
  double? bearingAccuracyInDegrees;

  /// Estimated speed accuracy of this location, in meters per second.
  /// If it cannot be determined, the value is `null`.
  double? speedAccuracyInMetersPerSecond;

  /// The time in milliseconds at which the location was determined, relative to device
  /// boot time. This time is monotonic and not affected by leap time or other system
  /// time adjustments, so this is the recommended basis for general purpose interval timing
  /// between location updates.
  /// If it cannot be determined, the value is `null`.
  int? timestampSinceBootInMilliseconds;

  /// Creates a new Location instance from the provided values.
  ///
  @Deprecated(
      'Will be removed in v4.9.0. To create a new Location instance use one of the available named constructors.')
  Location(this.coordinates, this.bearingInDegrees, this.speedInMetersPerSecond, this.timestamp,
      this.horizontalAccuracyInMeters, this.verticalAccuracyInMeters);

  /// Creates a new Location instance from the provided values.
  ///
  /// Both the [coordinates] and [timestamp] parameters are mandatory. The rest
  /// can be passed as named parameters and will be initialized to null if not provided.
  Location.withAllFields(this.coordinates, this.timestamp,
      {this.bearingInDegrees,
      this.speedInMetersPerSecond,
      this.horizontalAccuracyInMeters,
      this.verticalAccuracyInMeters,
      this.bearingAccuracyInDegrees,
      this.speedAccuracyInMetersPerSecond,
      this.timestampSinceBootInMilliseconds});

  /// Creates a new Location instance from the provided [coordinates] and [timestamp] values.
  ///
  /// Both the [coordinates] and [timestamp] parameters are mandatory.
  /// The rest of the fields will be initialized to null.
  Location.withDefaults(GeoCoordinates coordinates, DateTime timestamp)
      : coordinates = coordinates,
        bearingInDegrees = null,
        speedInMetersPerSecond = null,
        timestamp = timestamp,
        horizontalAccuracyInMeters = null,
        verticalAccuracyInMeters = null,
        this.bearingAccuracyInDegrees = null,
        this.speedAccuracyInMetersPerSecond = null,
        this.timestampSinceBootInMilliseconds = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Location) return false;
    Location _other = other;
    return coordinates == _other.coordinates &&
        bearingInDegrees == _other.bearingInDegrees &&
        speedInMetersPerSecond == _other.speedInMetersPerSecond &&
        timestamp == _other.timestamp &&
        horizontalAccuracyInMeters == _other.horizontalAccuracyInMeters &&
        verticalAccuracyInMeters == _other.verticalAccuracyInMeters &&
        bearingAccuracyInDegrees == _other.bearingAccuracyInDegrees &&
        speedAccuracyInMetersPerSecond == _other.speedAccuracyInMetersPerSecond &&
        timestampSinceBootInMilliseconds == _other.timestampSinceBootInMilliseconds;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + bearingInDegrees.hashCode;
    result = 31 * result + speedInMetersPerSecond.hashCode;
    result = 31 * result + timestamp.hashCode;
    result = 31 * result + horizontalAccuracyInMeters.hashCode;
    result = 31 * result + verticalAccuracyInMeters.hashCode;
    result = 31 * result + bearingAccuracyInDegrees.hashCode;
    result = 31 * result + speedAccuracyInMetersPerSecond.hashCode;
    result = 31 * result + timestampSinceBootInMilliseconds.hashCode;
    return result;
  }
}
