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

/// Preferences for authentication.
///
/// By default, system time is used.
@Deprecated("Will be removed in v4.8.0. System time will be always used for authentication and in case of failure, current time will be read from the server's response.")
enum AuthenticationPreferences {
    /// Timestamp needed for requests will be obtained from the server.
    useServerTime,
    /// Local system time will be used for the authentication request.
    useSystemTime
}

// AuthenticationPreferences "private" section, not exported.

int sdkCoreEngineAuthenticationpreferencesToFfi(AuthenticationPreferences value) {
  switch (value) {
  case AuthenticationPreferences.useServerTime:
    return 0;
  break;
  case AuthenticationPreferences.useSystemTime:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for AuthenticationPreferences enum.");
  }
}

AuthenticationPreferences sdkCoreEngineAuthenticationpreferencesFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AuthenticationPreferences.useServerTime;
  break;
  case 1:
    return AuthenticationPreferences.useSystemTime;
  break;
  default:
    throw StateError("Invalid numeric value $handle for AuthenticationPreferences enum.");
  }
}

void sdkCoreEngineAuthenticationpreferencesReleaseFfiHandle(int handle) {}

final _sdkCoreEngineAuthenticationpreferencesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_AuthenticationPreferences_create_handle_nullable'));
final _sdkCoreEngineAuthenticationpreferencesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AuthenticationPreferences_release_handle_nullable'));
final _sdkCoreEngineAuthenticationpreferencesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AuthenticationPreferences_get_value_nullable'));

Pointer<Void> sdkCoreEngineAuthenticationpreferencesToFfiNullable(AuthenticationPreferences value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineAuthenticationpreferencesToFfi(value);
  final result = _sdkCoreEngineAuthenticationpreferencesCreateHandleNullable(_handle);
  sdkCoreEngineAuthenticationpreferencesReleaseFfiHandle(_handle);
  return result;
}

AuthenticationPreferences? sdkCoreEngineAuthenticationpreferencesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineAuthenticationpreferencesGetValueNullable(handle);
  final result = sdkCoreEngineAuthenticationpreferencesFromFfi(_handle);
  sdkCoreEngineAuthenticationpreferencesReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineAuthenticationpreferencesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineAuthenticationpreferencesReleaseHandleNullable(handle);

// End of AuthenticationPreferences "private" section.

