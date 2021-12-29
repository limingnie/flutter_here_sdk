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
import 'package:here_sdk/src/sdk/routing/notice_code.dart';

/// A notice explains an issue encountered during processing of a route calculation request.
@Deprecated("Will be removed in v4.9.0. SectionNotice should be used instead.")

class Notice {
  /// The notice code.
  NoticeCode code;


  Notice(this.code);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Notice) return false;
    Notice _other = other;
    return code == _other.code;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + code.hashCode;
    return result;
  }
}


// Notice "private" section, not exported.

final _sdkRoutingNoticeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_Notice_create_handle'));
final _sdkRoutingNoticeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_release_handle'));
final _sdkRoutingNoticeGetFieldcode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_get_field_code'));


Pointer<Void> sdkRoutingNoticeToFfi(Notice value) {
  final _codeHandle = sdkRoutingNoticecodeToFfi(value.code);
  final _result = _sdkRoutingNoticeCreateHandle(_codeHandle);
  sdkRoutingNoticecodeReleaseFfiHandle(_codeHandle);
  return _result;
}

Notice sdkRoutingNoticeFromFfi(Pointer<Void> handle) {
  final _codeHandle = _sdkRoutingNoticeGetFieldcode(handle);
  try {
    return Notice(
      sdkRoutingNoticecodeFromFfi(_codeHandle)
    );
  } finally {
    sdkRoutingNoticecodeReleaseFfiHandle(_codeHandle);
  }
}

void sdkRoutingNoticeReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingNoticeReleaseHandle(handle);

// Nullable Notice

final _sdkRoutingNoticeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_create_handle_nullable'));
final _sdkRoutingNoticeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_release_handle_nullable'));
final _sdkRoutingNoticeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_get_value_nullable'));

Pointer<Void> sdkRoutingNoticeToFfiNullable(Notice value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingNoticeToFfi(value);
  final result = _sdkRoutingNoticeCreateHandleNullable(_handle);
  sdkRoutingNoticeReleaseFfiHandle(_handle);
  return result;
}

Notice? sdkRoutingNoticeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingNoticeGetValueNullable(handle);
  final result = sdkRoutingNoticeFromFfi(_handle);
  sdkRoutingNoticeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingNoticeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingNoticeReleaseHandleNullable(handle);

// End of Notice "private" section.

