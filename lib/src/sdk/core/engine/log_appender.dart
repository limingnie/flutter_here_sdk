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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/log_level.dart';
import 'package:meta/meta.dart';

/// An interface to implement a listener to receive log messages.
abstract class LogAppender {
  LogAppender();

  factory LogAppender.fromLambdas({
    required void Function(LogLevel, String) lambda_log,

  }) => LogAppender$Lambdas(
    lambda_log,

  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}


  /// [level] The severity of the log message.
  ///
  /// [message] The log message.
  ///
  log(LogLevel level, String message);
}


// LogAppender "private" section, not exported.

final _sdkCoreEngineLogappenderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_copy_handle'));
final _sdkCoreEngineLogappenderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_release_handle'));
final _sdkCoreEngineLogappenderCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_engine_LogAppender_create_proxy'));
final _sdkCoreEngineLogappenderGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_get_type_id'));


class LogAppender$Lambdas implements LogAppender {
  void Function(LogLevel, String) lambda_log;

  LogAppender$Lambdas(
    this.lambda_log,

  );

  @override
  void release() {}

  @override
  log(LogLevel level, String message) =>
    lambda_log(level, message);
}

class LogAppender$Impl extends __lib.NativeBase implements LogAppender {

  LogAppender$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkCoreEngineLogappenderReleaseHandle(handle);
    handle = nullptr;
  }

  @override
  log(LogLevel level, String message) {
    final _logFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_core_engine_LogAppender_log__LogLevel_String'));
    final _levelHandle = sdkCoreEngineLoglevelToFfi(level);
    final _messageHandle = stringToFfi(message);
    final _handle = this.handle;
    final __resultHandle = _logFfi(_handle, __lib.LibraryContext.isolateId, _levelHandle, _messageHandle);
    sdkCoreEngineLoglevelReleaseFfiHandle(_levelHandle);
    stringReleaseFfiHandle(_messageHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

int _sdkCoreEngineLogappenderlogStatic(int _token, int level, Pointer<Void> message) {

  try {
    (__lib.instanceCache[_token] as LogAppender).log(sdkCoreEngineLoglevelFromFfi(level), stringFromFfi(message));
  } finally {
    sdkCoreEngineLoglevelReleaseFfiHandle(level);
    stringReleaseFfiHandle(message);
  }
  return 0;
}


Pointer<Void> sdkCoreEngineLogappenderToFfi(LogAppender value) {
  if (value is __lib.NativeBase) return _sdkCoreEngineLogappenderCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreEngineLogappenderCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>)>(_sdkCoreEngineLogappenderlogStatic, __lib.unknownError)
  );

  return result;
}

LogAppender sdkCoreEngineLogappenderFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LogAppender;
  if (instance != null) return instance;

  final _typeIdHandle = _sdkCoreEngineLogappenderGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreEngineLogappenderCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LogAppender$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkCoreEngineLogappenderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineLogappenderReleaseHandle(handle);

Pointer<Void> sdkCoreEngineLogappenderToFfiNullable(LogAppender value) =>
  value != null ? sdkCoreEngineLogappenderToFfi(value) : Pointer<Void>.fromAddress(0);

LogAppender? sdkCoreEngineLogappenderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineLogappenderFromFfi(handle) : null;

void sdkCoreEngineLogappenderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLogappenderReleaseHandle(handle);

// End of LogAppender "private" section.

