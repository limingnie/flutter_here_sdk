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

import 'dart:collection';
import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:intl/locale.dart';



/// The list of multiple names or titles for the same entity, possibly in different languages.

class LocalizedTexts {
  /// The list of text items.
  /// Recommended to use helper methods instead of directly accessing the items.
  List<LocalizedText> items;


  LocalizedTexts(this.items);


  /// Returns best name or title to be presented to the user according to specified
  /// locales.
  ///
  /// The locales are expected to be ordered by priority.
  /// If no matching locale found - the default is returned.
  /// In case of empty list returns `null`.
  ///
  String getPreferredValueForLocales(List<Locale> locales) {
    final _getPreferredValueForLocalesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocalizedTexts_getPreferredValueForLocales__ListOf_1Locale'));
    final _localesHandle = heresdkCoreBindingsListofLocaleToFfi(locales);
    final _handle = sdkCoreLocalizedtextsToFfi(this);
    final __resultHandle = _getPreferredValueForLocalesFfi(_handle, __lib.LibraryContext.isolateId, _localesHandle);
    sdkCoreLocalizedtextsReleaseFfiHandle(_handle);
    heresdkCoreBindingsListofLocaleReleaseFfiHandle(_localesHandle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Returns the default value.
  ///
  /// In case of empty list return `null`.
  ///
  String getDefaultValue() {
    final _getDefaultValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocalizedTexts_getDefaultValue'));
    final _handle = sdkCoreLocalizedtextsToFfi(this);
    final __resultHandle = _getDefaultValueFfi(_handle, __lib.LibraryContext.isolateId);
    sdkCoreLocalizedtextsReleaseFfiHandle(_handle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! LocalizedTexts) return false;
    LocalizedTexts _other = other;
    return DeepCollectionEquality().equals(items, _other.items);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(items);
    return result;
  }
}


// LocalizedTexts "private" section, not exported.

final _sdkCoreLocalizedtextsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_create_handle'));
final _sdkCoreLocalizedtextsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_release_handle'));
final _sdkCoreLocalizedtextsGetFielditems = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_get_field_items'));


Pointer<Void> sdkCoreLocalizedtextsToFfi(LocalizedTexts value) {
  final _itemsHandle = heresdkCoreBindingsListofSdkCoreLocalizedtextToFfi(value.items);
  final _result = _sdkCoreLocalizedtextsCreateHandle(_itemsHandle);
  heresdkCoreBindingsListofSdkCoreLocalizedtextReleaseFfiHandle(_itemsHandle);
  return _result;
}

LocalizedTexts sdkCoreLocalizedtextsFromFfi(Pointer<Void> handle) {
  final _itemsHandle = _sdkCoreLocalizedtextsGetFielditems(handle);
  try {
    return LocalizedTexts(
      heresdkCoreBindingsListofSdkCoreLocalizedtextFromFfi(_itemsHandle)
    );
  } finally {
    heresdkCoreBindingsListofSdkCoreLocalizedtextReleaseFfiHandle(_itemsHandle);
  }
}

void sdkCoreLocalizedtextsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreLocalizedtextsReleaseHandle(handle);

// Nullable LocalizedTexts

final _sdkCoreLocalizedtextsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_create_handle_nullable'));
final _sdkCoreLocalizedtextsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_release_handle_nullable'));
final _sdkCoreLocalizedtextsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_get_value_nullable'));

Pointer<Void> sdkCoreLocalizedtextsToFfiNullable(LocalizedTexts value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLocalizedtextsToFfi(value);
  final result = _sdkCoreLocalizedtextsCreateHandleNullable(_handle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_handle);
  return result;
}

LocalizedTexts? sdkCoreLocalizedtextsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLocalizedtextsGetValueNullable(handle);
  final result = sdkCoreLocalizedtextsFromFfi(_handle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLocalizedtextsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocalizedtextsReleaseHandleNullable(handle);

// End of LocalizedTexts "private" section.

