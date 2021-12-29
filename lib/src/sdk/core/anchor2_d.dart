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



/// Represents a point in a rectangle as a ratio of this rectangle's width and height.

class Anchor2D {
  /// Defines the x axis where the left is 0, the right is 1 and the middle is 0.5. The default value is 0.5.
  double horizontal;

  /// Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5. The default value is 0.5.
  double vertical;


  Anchor2D._(this.horizontal, this.vertical);

  Anchor2D._copy(Anchor2D _other) : this._(_other.horizontal, _other.vertical);

  /// Creates a new instance of an Anchor2D with the default parameters
  ///
  Anchor2D() : this._copy(_$init());

  /// Creates a new instance of an Anchor2D.
  ///
  /// [horizontal] Defines the x axis where the left is 0, the right is 1 and the middle is 0.5.
  ///
  /// [vertical] Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5.
  ///
  Anchor2D.withHorizontalAndVertical(double horizontal, double vertical) : this._copy(_withHorizontalAndVertical(horizontal, vertical));

  /// Creates a new instance of an Anchor2D with the default parameters
  ///
  static Anchor2D _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_Anchor2D_make'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnchor2dFromFfi(__resultHandle);
    } finally {
      sdkCoreAnchor2dReleaseFfiHandle(__resultHandle);

    }

  }

  /// Creates a new instance of an Anchor2D.
  ///
  /// [horizontal] Defines the x axis where the left is 0, the right is 1 and the middle is 0.5.
  ///
  /// [vertical] Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5.
  ///
  static Anchor2D _withHorizontalAndVertical(double horizontal, double vertical) {
    final _withHorizontalAndVerticalFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_Anchor2D_make__Double_Double'));
    final _horizontalHandle = (horizontal);
    final _verticalHandle = (vertical);
    final __resultHandle = _withHorizontalAndVerticalFfi(__lib.LibraryContext.isolateId, _horizontalHandle, _verticalHandle);


    try {
      return sdkCoreAnchor2dFromFfi(__resultHandle);
    } finally {
      sdkCoreAnchor2dReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Anchor2D) return false;
    Anchor2D _other = other;
    return horizontal == _other.horizontal &&
        vertical == _other.vertical;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + horizontal.hashCode;
    result = 31 * result + vertical.hashCode;
    return result;
  }
}


// Anchor2D "private" section, not exported.

final _sdkCoreAnchor2dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Anchor2D_create_handle'));
final _sdkCoreAnchor2dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_release_handle'));
final _sdkCoreAnchor2dGetFieldhorizontal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_field_horizontal'));
final _sdkCoreAnchor2dGetFieldvertical = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_field_vertical'));


Pointer<Void> sdkCoreAnchor2dToFfi(Anchor2D value) {
  final _horizontalHandle = (value.horizontal);
  final _verticalHandle = (value.vertical);
  final _result = _sdkCoreAnchor2dCreateHandle(_horizontalHandle, _verticalHandle);
  
  
  return _result;
}

Anchor2D sdkCoreAnchor2dFromFfi(Pointer<Void> handle) {
  final _horizontalHandle = _sdkCoreAnchor2dGetFieldhorizontal(handle);
  final _verticalHandle = _sdkCoreAnchor2dGetFieldvertical(handle);
  try {
    return Anchor2D._(
      (_horizontalHandle), 
      (_verticalHandle)
    );
  } finally {
    
    
  }
}

void sdkCoreAnchor2dReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreAnchor2dReleaseHandle(handle);

// Nullable Anchor2D

final _sdkCoreAnchor2dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_create_handle_nullable'));
final _sdkCoreAnchor2dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_release_handle_nullable'));
final _sdkCoreAnchor2dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_value_nullable'));

Pointer<Void> sdkCoreAnchor2dToFfiNullable(Anchor2D value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreAnchor2dToFfi(value);
  final result = _sdkCoreAnchor2dCreateHandleNullable(_handle);
  sdkCoreAnchor2dReleaseFfiHandle(_handle);
  return result;
}

Anchor2D? sdkCoreAnchor2dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreAnchor2dGetValueNullable(handle);
  final result = sdkCoreAnchor2dFromFfi(_handle);
  sdkCoreAnchor2dReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreAnchor2dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAnchor2dReleaseHandleNullable(handle);

// End of Anchor2D "private" section.

