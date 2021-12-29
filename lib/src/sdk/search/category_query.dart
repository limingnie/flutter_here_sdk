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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:meta/meta.dart';

















/// The options to specify a query by categories.
@immutable
class CategoryQuery {
  /// List of categories.
  final List<PlaceCategory> categories;

  /// Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based on other parameters provided.
  final String filter;

  /// Geographic coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// Geographic rectangle area in which to provide the most relevant places.
  /// Usage of rectangle area in category search query is not supported when using offline search
  /// in OfflineSearchEngine.
  final GeoBox boxArea;

  /// Geographic circle area in which to provide the most relevant places.
  /// Usage of circle area in category search query is not supported when using offline search in
  /// OfflineSearchEngine.
  final GeoCircle circleArea;

  /// Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  /// When [CategoryQuery.corridorArea] is provided,
  /// [CategoryQuery.areaCenter] has to be within it, otherwise
  /// [CategoryQuery.areaCenter] is ignored when searching.
  final GeoCorridor corridorArea;


  const CategoryQuery._(this.categories, this.filter, this.areaCenter, this.boxArea, this.circleArea, this.corridorArea);

  CategoryQuery._copy(CategoryQuery _other) : this._(_other.categories, _other.filter, _other.areaCenter, _other.boxArea, _other.circleArea, _other.corridorArea);

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  CategoryQuery.withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) : this._copy(_withFilter(categories, filter, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  CategoryQuery.withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) : this._copy(_withCategoryAndFilter(category, filter, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  CategoryQuery(List<PlaceCategory> categories, GeoCoordinates areaCenter) : this._copy(_$init(categories, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  CategoryQuery.withCategory(PlaceCategory category, GeoCoordinates areaCenter) : this._copy(_withCategory(category, areaCenter));

  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  CategoryQuery.nearCenterInBoxArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoBox boxArea) : this._copy(_nearCenterInBoxArea(categories, areaCenter, boxArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  CategoryQuery.withFilterNearCenterInBoxArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoBox boxArea) : this._copy(_withFilterNearCenterInBoxArea(categories, filter, areaCenter, boxArea));

  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  CategoryQuery.withCategoryNearCenterInBoxArea(PlaceCategory category, GeoCoordinates areaCenter, GeoBox boxArea) : this._copy(_withCategoryNearCenterInBoxArea(category, areaCenter, boxArea));

  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  CategoryQuery.withCategoryAndFilterNearCenterInBoxArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoBox boxArea) : this._copy(_withCategoryAndFilterNearCenterInBoxArea(category, filter, areaCenter, boxArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  CategoryQuery.nearCenterInCircleArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoCircle circleArea) : this._copy(_nearCenterInCircleArea(categories, areaCenter, circleArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  CategoryQuery.withFilterNearCenterInCircleArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) : this._copy(_withFilterNearCenterInCircleArea(categories, filter, areaCenter, circleArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  CategoryQuery.withCategoryNearCenterInCircleArea(PlaceCategory category, GeoCoordinates areaCenter, GeoCircle circleArea) : this._copy(_withCategoryNearCenterInCircleArea(category, areaCenter, circleArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  CategoryQuery.withCategoryAndFilterNearCenterInCircleArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) : this._copy(_withCategoryAndFilterNearCenterInCircleArea(category, filter, areaCenter, circleArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  CategoryQuery.withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) : this._copy(_withCorridorArea(categories, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  CategoryQuery.withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) : this._copy(_withCategoryAndCorridorArea(category, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  CategoryQuery.withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) : this._copy(_withFilterAndCorridorArea(categories, filter, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  CategoryQuery.withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) : this._copy(_withCategoryAndFilterAndCorridorArea(category, filter, corridorArea));

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  static CategoryQuery _withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) {
    final _withFilterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCoordinates'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withFilterFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  static CategoryQuery _withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) {
    final _withCategoryAndFilterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCategoryAndFilterFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  static CategoryQuery _$init(List<PlaceCategory> categories, GeoCoordinates areaCenter) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCoordinates'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  static CategoryQuery _withCategory(PlaceCategory category, GeoCoordinates areaCenter) {
    final _withCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCategoryFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  static CategoryQuery _nearCenterInBoxArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _nearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCoordinates_GeoBox'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _nearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle, _boxAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withFilterNearCenterInBoxArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withFilterNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCoordinates_GeoBox'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withFilterNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle, _boxAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withCategoryNearCenterInBoxArea(PlaceCategory category, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withCategoryNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates_GeoBox'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withCategoryNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle, _boxAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withCategoryAndFilterNearCenterInBoxArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withCategoryAndFilterNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates_GeoBox'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withCategoryAndFilterNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle, _boxAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  static CategoryQuery _nearCenterInCircleArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _nearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCoordinates_GeoCircle'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _nearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle, _circleAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withFilterNearCenterInCircleArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withFilterNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCoordinates_GeoCircle'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withFilterNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle, _circleAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withCategoryNearCenterInCircleArea(PlaceCategory category, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCategoryNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates_GeoCircle'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCategoryNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle, _circleAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  static CategoryQuery _withCategoryAndFilterNearCenterInCircleArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCategoryAndFilterNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates_GeoCircle'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCategoryAndFilterNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle, _circleAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  static CategoryQuery _withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) {
    final _withCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCorridor'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _corridorAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  static CategoryQuery _withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) {
    final _withCategoryAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCorridor'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCategoryAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _corridorAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  static CategoryQuery _withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) {
    final _withFilterAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCorridor'));
    final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withFilterAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _corridorAreaHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  static CategoryQuery _withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) {
    final _withCategoryAndFilterAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCorridor'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCategoryAndFilterAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _corridorAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQuery) return false;
    CategoryQuery _other = other;
    return DeepCollectionEquality().equals(categories, _other.categories) &&
        filter == _other.filter &&
        areaCenter == _other.areaCenter &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + filter.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }
}


// CategoryQuery "private" section, not exported.

final _sdkSearchCategoryqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle'));
final _sdkSearchCategoryqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle'));
final _sdkSearchCategoryqueryGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_categories'));
final _sdkSearchCategoryqueryGetFieldfilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_filter'));
final _sdkSearchCategoryqueryGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_areaCenter'));
final _sdkSearchCategoryqueryGetFieldboxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_boxArea'));
final _sdkSearchCategoryqueryGetFieldcircleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_circleArea'));
final _sdkSearchCategoryqueryGetFieldcorridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_corridorArea'));


Pointer<Void> sdkSearchCategoryqueryToFfi(CategoryQuery value) {
  final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(value.categories);
  final _filterHandle = stringToFfiNullable(value.filter);
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(value.areaCenter);
  final _boxAreaHandle = sdkCoreGeoboxToFfiNullable(value.boxArea);
  final _circleAreaHandle = sdkCoreGeocircleToFfiNullable(value.circleArea);
  final _corridorAreaHandle = sdkCoreGeocorridorToFfiNullable(value.corridorArea);
  final _result = _sdkSearchCategoryqueryCreateHandle(_categoriesHandle, _filterHandle, _areaCenterHandle, _boxAreaHandle, _circleAreaHandle, _corridorAreaHandle);
  heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  stringReleaseFfiHandleNullable(_filterHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
  sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
  sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  return _result;
}

CategoryQuery sdkSearchCategoryqueryFromFfi(Pointer<Void> handle) {
  final _categoriesHandle = _sdkSearchCategoryqueryGetFieldcategories(handle);
  final _filterHandle = _sdkSearchCategoryqueryGetFieldfilter(handle);
  final _areaCenterHandle = _sdkSearchCategoryqueryGetFieldareaCenter(handle);
  final _boxAreaHandle = _sdkSearchCategoryqueryGetFieldboxArea(handle);
  final _circleAreaHandle = _sdkSearchCategoryqueryGetFieldcircleArea(handle);
  final _corridorAreaHandle = _sdkSearchCategoryqueryGetFieldcorridorArea(handle);
  try {
    return CategoryQuery._(
      heresdkSearchCommonBindingsListofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      stringFromFfiNullable(_filterHandle), 
      sdkCoreGeocoordinatesFromFfi(_areaCenterHandle), 
      sdkCoreGeoboxFromFfiNullable(_boxAreaHandle)!,
      sdkCoreGeocircleFromFfiNullable(_circleAreaHandle)!,
      sdkCoreGeocorridorFromFfiNullable(_corridorAreaHandle)!
    );
  } finally {
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandleNullable(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
    sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  }
}

void sdkSearchCategoryqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchCategoryqueryReleaseHandle(handle);

// Nullable CategoryQuery

final _sdkSearchCategoryqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle_nullable'));
final _sdkSearchCategoryqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle_nullable'));
final _sdkSearchCategoryqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_value_nullable'));

Pointer<Void> sdkSearchCategoryqueryToFfiNullable(CategoryQuery value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchCategoryqueryToFfi(value);
  final result = _sdkSearchCategoryqueryCreateHandleNullable(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

CategoryQuery? sdkSearchCategoryqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchCategoryqueryGetValueNullable(handle);
  final result = sdkSearchCategoryqueryFromFfi(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchCategoryqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchCategoryqueryReleaseHandleNullable(handle);

// End of CategoryQuery "private" section.

