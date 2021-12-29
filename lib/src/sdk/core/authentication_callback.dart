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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/authentication_data.dart';
import 'package:here_sdk/src/sdk/core/authentication_error.dart';

/// Callback passed to [Authentication.authenticateWithSDKNativeEngine].
///
/// This callback is called on the main thread asynchronously when an
/// authenticate call has completed.
/// The first argument is the operation status. It is 'null' for an operation that succeeds.
/// The second argument is the authentication data.
typedef AuthenticationCallback = void Function(AuthenticationError, AuthenticationData);

// AuthenticationCallback "private" section, not exported.

final _sdkCoreAuthenticationcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_copy_handle'));
final _sdkCoreAuthenticationcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_release_handle'));
final _sdkCoreAuthenticationcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_AuthenticationCallback_create_proxy'));

class AuthenticationCallback$Impl {
  final Pointer<Void> handle;
  AuthenticationCallback$Impl(this.handle);

  void release() => _sdkCoreAuthenticationcallbackReleaseHandle(handle);

  call(AuthenticationError p0, AuthenticationData p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_AuthenticationCallback_call__AuthenticationError_AuthenticationData'));
    final _p0Handle = sdkCoreAuthenticationerrorToFfiNullable(p0);
    final _p1Handle = sdkCoreAuthenticationdataToFfiNullable(p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkCoreAuthenticationerrorReleaseFfiHandleNullable(_p0Handle);
    sdkCoreAuthenticationdataReleaseFfiHandleNullable(_p1Handle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

}

int _sdkCoreAuthenticationcallbackcallStatic(int _token, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (__lib.instanceCache[_token] as AuthenticationCallback)(sdkCoreAuthenticationerrorFromFfiNullable(p0)!, sdkCoreAuthenticationdataFromFfiNullable(p1)!);
  } finally {
    sdkCoreAuthenticationerrorReleaseFfiHandleNullable(p0);
    sdkCoreAuthenticationdataReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkCoreAuthenticationcallbackToFfi(AuthenticationCallback value) {
  final result = _sdkCoreAuthenticationcallbackCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Void>)>(_sdkCoreAuthenticationcallbackcallStatic, __lib.unknownError)
  );

  return result;
}

AuthenticationCallback sdkCoreAuthenticationcallbackFromFfi(Pointer<Void> handle) {
  final _impl = AuthenticationCallback$Impl(_sdkCoreAuthenticationcallbackCopyHandle(handle));
  return (AuthenticationError p0, AuthenticationData p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}

void sdkCoreAuthenticationcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreAuthenticationcallbackReleaseHandle(handle);

// Nullable AuthenticationCallback

final _sdkCoreAuthenticationcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_create_handle_nullable'));
final _sdkCoreAuthenticationcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_release_handle_nullable'));
final _sdkCoreAuthenticationcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_get_value_nullable'));

Pointer<Void> sdkCoreAuthenticationcallbackToFfiNullable(AuthenticationCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreAuthenticationcallbackToFfi(value);
  final result = _sdkCoreAuthenticationcallbackCreateHandleNullable(_handle);
  sdkCoreAuthenticationcallbackReleaseFfiHandle(_handle);
  return result;
}

AuthenticationCallback? sdkCoreAuthenticationcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreAuthenticationcallbackGetValueNullable(handle);
  final result = sdkCoreAuthenticationcallbackFromFfi(_handle);
  sdkCoreAuthenticationcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreAuthenticationcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAuthenticationcallbackReleaseHandleNullable(handle);

// End of AuthenticationCallback "private" section.

