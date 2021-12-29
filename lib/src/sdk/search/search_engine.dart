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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/address_query.dart';
import 'package:here_sdk/src/sdk/search/category_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';
import 'package:here_sdk/src/sdk/search/search_options.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback.dart';
import 'package:here_sdk/src/sdk/search/text_query.dart';

/// The SearchEngine API unlocks the search, geocoding and suggesting capabilities of HERE services
/// to provide developers with unmatched flexibility to create differentiating location-enabled
/// applications.
///
/// It enables to search for HERE points of interests, forward and reverse
/// geocode addresses and geographic coordinates from the HERE map and search for suggested addresses or
/// place candidates based on incomplete or misspelled queries.
/// It also allows to search along a given [GeoPolyline] set inside a [GeoCorridor]
/// as part of a [TextQuery].
/// The SearchEngine API requires an online connection to execute the requests.
abstract class SearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine() => SearchEngine$Impl.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => SearchEngine$Impl.withSdkEngine(sdkEngine);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Performs an asynchronous request to do a text query search for [Place] instances.
  ///
  /// Optionally, search along a polyline, such as a route, by specifying a [GeoCorridor].
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on a given address.
  ///
  /// This is the same process as forward geocoding, except that more data is returned
  /// than just the geographic coordinates of a given address. Note that an address can
  /// belong to more than one [Place] result, although all found places will
  /// share the same geographic coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form address query text to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for places based on given geographic coordinates.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates can
  /// belong to more than one [Place] result, but all found places will
  /// share the same coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on given circular spatial filter.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates can
  /// belong to more than one [Place] result, but all found places will
  /// share the same coordinates.
  /// Provides candidate places sorted by relevance and located inside the radius of filter.
  ///
  /// [circle] The coordinates where to search and radius of the circular spatial filter.
  /// Passed in form of [GeoCircle].
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinatesWithRadius(GeoCircle circle, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request by using the given href.
  ///
  /// The href value can be obtained from [Suggestion] objects,
  /// which are the result of successful call to [SearchEngine.suggest].
  /// Currently supports only /v1/discover path.
  /// Provides candidate places sorted by relevance.
  ///
  /// [href] The direct link.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle sendRequest(String href, SearchCallback callback);
  /// Performs an asynchronous request to do a category search for [Place] instances.
  ///
  /// A list containing at least one [PlaceCategory] must be provided
  /// as part of the [SearchEngine.searchByCategory.query].
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback);
  /// Sets custom option.
  ///
  /// [name] Option name.
  ///
  /// [value] Option value.
  ///
  /// Returns [SearchError]. Error in case when setting the option fails.
  ///
  SearchError setCustomOption(String name, String value);
}


// SearchEngine "private" section, not exported.

final _sdkSearchSearchengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_copy_handle'));
final _sdkSearchSearchengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_release_handle'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_has_error'));











class SearchEngine$Impl extends __lib.NativeBase implements SearchEngine {

  SearchEngine$Impl(Pointer<Void> handle) : super(handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _sdkSearchSearchengineReleaseHandle(handle);
    handle = nullptr;
  }


  SearchEngine$Impl.$init() : super(_$init()) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  SearchEngine$Impl.withSdkEngine(SDKNativeEngine sdkEngine) : super(_withSdkEngine(sdkEngine)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_SearchEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByTextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__TextQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByTextFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__AddressQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchAddressqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchAddressqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode languageCode, PlaceIdSearchCallback callback) {
    final _searchByPlaceIdWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__PlaceIdQuery_LanguageCode_PlaceIdSearchCallback'));
    final _queryHandle = sdkSearchPlaceidqueryToFfi(query);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByPlaceIdWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _languageCodeHandle, _callbackHandle);
    sdkSearchPlaceidqueryReleaseFfiHandle(_queryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCoordinates_SearchOptions_SearchCallback'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinatesWithRadius(GeoCircle circle, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesWithRadiusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCircle_SearchOptions_SearchCallback'));
    final _circleHandle = sdkCoreGeocircleToFfi(circle);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesWithRadiusFfi(_handle, __lib.LibraryContext.isolateId, _circleHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle sendRequest(String href, SearchCallback callback) {
    final _sendRequestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_sendRequest__String_SearchCallback'));
    final _hrefHandle = stringToFfi(href);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _sendRequestFfi(_handle, __lib.LibraryContext.isolateId, _hrefHandle, _callbackHandle);
    stringReleaseFfiHandle(_hrefHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__CategoryQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchCategoryqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCategoryFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_suggest__TextQuery_SearchOptions_SuggestCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  SearchError setCustomOption(String name, String value) {
    final _setCustomOptionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_setCustomOption__String_String'));
    final _nameHandle = stringToFfi(name);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setCustomOptionFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle, _valueHandle);
    stringReleaseFfiHandle(_nameHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return sdkSearchSearcherrorFromFfiNullable(__resultHandle)!;
    } finally {
      sdkSearchSearcherrorReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkSearchSearchengineToFfi(SearchEngine value) =>
  _sdkSearchSearchengineCopyHandle((value as __lib.NativeBase).handle);

SearchEngine sdkSearchSearchengineFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SearchEngine;
  if (instance != null) return instance;

  final _copiedHandle = _sdkSearchSearchengineCopyHandle(handle);
  final result = SearchEngine$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdkSearchSearchengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSearchengineReleaseHandle(handle);

Pointer<Void> sdkSearchSearchengineToFfiNullable(SearchEngine value) =>
  value != null ? sdkSearchSearchengineToFfi(value) : Pointer<Void>.fromAddress(0);

SearchEngine? sdkSearchSearchengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchSearchengineFromFfi(handle) : null;

void sdkSearchSearchengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearchengineReleaseHandle(handle);

// End of SearchEngine "private" section.

