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

const unknownError = -1;

int _instanceCounter = 1024;
final Map<int, Object> instanceCache = {};
final Map<Object, int> tokenCache = {};

int cacheObject(Object obj) {
 // print("Token $obj");
  int? token = tokenCache.containsKey(obj) ? tokenCache[obj] : null;
  if (token == null) {
    token = _instanceCounter++;
    instanceCache[token] = obj;
    tokenCache[obj] = token;
  }
  return token;
}

void uncacheObjectByToken(int token) {
  tokenCache.remove(instanceCache[token]);
  instanceCache.remove(token);
}

void uncacheObject(Object object) {
  instanceCache.remove(tokenCache[object]);
  tokenCache.remove(object);
}

final uncacheObjectFfi =
    Pointer.fromFunction<Void Function(Uint64)>(uncacheObjectByToken);

final ffiGetCachedToken = __lib.catchArgumentError(() => __lib.nativeLibrary
    .lookupFunction<Uint64 Function(Pointer<Void>, Int32),
        int Function(Pointer<Void>, int)>('here_sdk_get_cached_token'));
final ffiCacheToken = __lib.catchArgumentError(() => __lib.nativeLibrary
    .lookupFunction<Void Function(Pointer<Void>, Int32, Uint64),
        void Function(Pointer<Void>, int, int)>('here_sdk_cache_token'));
final ffiUncacheToken = __lib.catchArgumentError(() => __lib.nativeLibrary
    .lookupFunction<Void Function(Pointer<Void>, Int32),
        void Function(Pointer<Void>, int)>('here_sdk_uncache_token'));
