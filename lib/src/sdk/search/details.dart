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
import 'package:here_sdk/src/sdk/search/contact.dart';
import 'package:here_sdk/src/sdk/search/ev_connector.dart';
import 'package:here_sdk/src/sdk/search/opening_hours.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/supplier_reference.dart';
import 'package:here_sdk/src/sdk/search/web_editorial.dart';
import 'package:here_sdk/src/sdk/search/web_image.dart';
import 'package:here_sdk/src/sdk/search/web_rating.dart';
import 'package:meta/meta.dart';


/// Contains details of a specific place, such as contact information,
/// opening hours and assigned categories.
@immutable
class Details {
  /// The list of contact information of the place.
  final List<Contact> contacts;

  /// The list of opening hours information of the place (not available in result of suggest request).
  final List<OpeningHours> openingHours;

  /// The list of categories assigned to this place.
  final List<PlaceCategory> categories;

  /// The list of images associated with the place.
  /// The images are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  final List<WebImage> images;

  /// The list of editorials associated with the place.
  /// The editorials are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  final List<WebEditorial> editorials;

  /// The list of ratings associated with the place.
  /// The ratings are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  final List<WebRating> ratings;

  /// The list of supplier references to this place.
  /// The references are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  final List<SupplierReference> references;


  const Details(this.contacts, this.openingHours, this.categories, this.images, this.editorials, this.ratings, this.references);


  /// Gets the list of primary categories assigned to this place.
  ///
  /// Returns [List<PlaceCategory>]. List of categories.
  ///
  List<PlaceCategory> getPrimaryCategories() {
    final _getPrimaryCategoriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Details_getPrimaryCategories'));
    final _handle = sdkSearchDetailsToFfi(this);
    final __resultHandle = _getPrimaryCategoriesFfi(_handle, __lib.LibraryContext.isolateId);
    sdkSearchDetailsReleaseFfiHandle(_handle);
    try {
      return heresdkSearchCommonBindingsListofSdkSearchPlacecategoryFromFfi(__resultHandle);
    } finally {
      heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Details) return false;
    Details _other = other;
    return DeepCollectionEquality().equals(contacts, _other.contacts) &&
        DeepCollectionEquality().equals(openingHours, _other.openingHours) &&
        DeepCollectionEquality().equals(categories, _other.categories) &&
        DeepCollectionEquality().equals(images, _other.images) &&
        DeepCollectionEquality().equals(editorials, _other.editorials) &&
        DeepCollectionEquality().equals(ratings, _other.ratings) &&
        DeepCollectionEquality().equals(references, _other.references);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(contacts);
    result = 31 * result + DeepCollectionEquality().hash(openingHours);
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + DeepCollectionEquality().hash(images);
    result = 31 * result + DeepCollectionEquality().hash(editorials);
    result = 31 * result + DeepCollectionEquality().hash(ratings);
    result = 31 * result + DeepCollectionEquality().hash(references);
    return result;
  }
}

/// Contains details that are specific to places that are EV charging stations.
/// @nodoc

class DetailsEvChargingStation {
  /// List of connectors that are available at the charging station.
  /// @nodoc
  List<EvConnector> internalconnectors;

  /// Number of physical connectors at the charging station.
  /// @nodoc
  int internalconnectorCount;


  DetailsEvChargingStation(this.internalconnectors, this.internalconnectorCount);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DetailsEvChargingStation) return false;
    DetailsEvChargingStation _other = other;
    return DeepCollectionEquality().equals(internalconnectors, _other.internalconnectors) &&
        internalconnectorCount == _other.internalconnectorCount;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(internalconnectors);
    result = 31 * result + internalconnectorCount.hashCode;
    return result;
  }
}


// DetailsEvChargingStation "private" section, not exported.

final _sdkSearchDetailsEvchargingstationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_create_handle'));
final _sdkSearchDetailsEvchargingstationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_release_handle'));
final _sdkSearchDetailsEvchargingstationGetFieldconnectors = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_get_field_connectors'));
final _sdkSearchDetailsEvchargingstationGetFieldconnectorCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_get_field_connectorCount'));


Pointer<Void> sdkSearchDetailsEvchargingstationToFfi(DetailsEvChargingStation value) {
  final _connectorsHandle = heresdkSearchCommonBindingsListofSdkSearchEvconnectorToFfi(value.internalconnectors);
  final _connectorCountHandle = intToFfiNullable(value.internalconnectorCount);
  final _result = _sdkSearchDetailsEvchargingstationCreateHandle(_connectorsHandle, _connectorCountHandle);
  heresdkSearchCommonBindingsListofSdkSearchEvconnectorReleaseFfiHandle(_connectorsHandle);
  intReleaseFfiHandleNullable(_connectorCountHandle);
  return _result;
}

DetailsEvChargingStation sdkSearchDetailsEvchargingstationFromFfi(Pointer<Void> handle) {
  final _connectorsHandle = _sdkSearchDetailsEvchargingstationGetFieldconnectors(handle);
  final _connectorCountHandle = _sdkSearchDetailsEvchargingstationGetFieldconnectorCount(handle);
  try {
    return DetailsEvChargingStation(
      heresdkSearchCommonBindingsListofSdkSearchEvconnectorFromFfi(_connectorsHandle), 
      intFromFfiNullable(_connectorCountHandle)!
    );
  } finally {
    heresdkSearchCommonBindingsListofSdkSearchEvconnectorReleaseFfiHandle(_connectorsHandle);
    intReleaseFfiHandleNullable(_connectorCountHandle);
  }
}

void sdkSearchDetailsEvchargingstationReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchDetailsEvchargingstationReleaseHandle(handle);

// Nullable DetailsEvChargingStation

final _sdkSearchDetailsEvchargingstationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_create_handle_nullable'));
final _sdkSearchDetailsEvchargingstationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_release_handle_nullable'));
final _sdkSearchDetailsEvchargingstationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_EvChargingStation_get_value_nullable'));

Pointer<Void> sdkSearchDetailsEvchargingstationToFfiNullable(DetailsEvChargingStation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchDetailsEvchargingstationToFfi(value);
  final result = _sdkSearchDetailsEvchargingstationCreateHandleNullable(_handle);
  sdkSearchDetailsEvchargingstationReleaseFfiHandle(_handle);
  return result;
}

DetailsEvChargingStation? sdkSearchDetailsEvchargingstationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchDetailsEvchargingstationGetValueNullable(handle);
  final result = sdkSearchDetailsEvchargingstationFromFfi(_handle);
  sdkSearchDetailsEvchargingstationReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchDetailsEvchargingstationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchDetailsEvchargingstationReleaseHandleNullable(handle);

// End of DetailsEvChargingStation "private" section.

// Details "private" section, not exported.

final _sdkSearchDetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle'));
final _sdkSearchDetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle'));
final _sdkSearchDetailsGetFieldcontacts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_contacts'));
final _sdkSearchDetailsGetFieldopeningHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_openingHours'));
final _sdkSearchDetailsGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_categories'));
final _sdkSearchDetailsGetFieldimages = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_images'));
final _sdkSearchDetailsGetFieldeditorials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_editorials'));
final _sdkSearchDetailsGetFieldratings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_ratings'));
final _sdkSearchDetailsGetFieldreferences = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_references'));


Pointer<Void> sdkSearchDetailsToFfi(Details value) {
  final _contactsHandle = heresdkSearchCommonBindingsListofSdkSearchContactToFfi(value.contacts);
  final _openingHoursHandle = heresdkSearchCommonBindingsListofSdkSearchOpeninghoursToFfi(value.openingHours);
  final _categoriesHandle = heresdkSearchCommonBindingsListofSdkSearchPlacecategoryToFfi(value.categories);
  final _imagesHandle = heresdkSearchCommonBindingsListofSdkSearchWebimageToFfi(value.images);
  final _editorialsHandle = heresdkSearchCommonBindingsListofSdkSearchWebeditorialToFfi(value.editorials);
  final _ratingsHandle = heresdkSearchCommonBindingsListofSdkSearchWebratingToFfi(value.ratings);
  final _referencesHandle = heresdkSearchCommonBindingsListofSdkSearchSupplierreferenceToFfi(value.references);
  final _result = _sdkSearchDetailsCreateHandle(_contactsHandle, _openingHoursHandle, _categoriesHandle, _imagesHandle, _editorialsHandle, _ratingsHandle, _referencesHandle);
  heresdkSearchCommonBindingsListofSdkSearchContactReleaseFfiHandle(_contactsHandle);
  heresdkSearchCommonBindingsListofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
  heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  heresdkSearchCommonBindingsListofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
  heresdkSearchCommonBindingsListofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
  heresdkSearchCommonBindingsListofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
  heresdkSearchCommonBindingsListofSdkSearchSupplierreferenceReleaseFfiHandle(_referencesHandle);
  return _result;
}

Details sdkSearchDetailsFromFfi(Pointer<Void> handle) {
  final _contactsHandle = _sdkSearchDetailsGetFieldcontacts(handle);
  final _openingHoursHandle = _sdkSearchDetailsGetFieldopeningHours(handle);
  final _categoriesHandle = _sdkSearchDetailsGetFieldcategories(handle);
  final _imagesHandle = _sdkSearchDetailsGetFieldimages(handle);
  final _editorialsHandle = _sdkSearchDetailsGetFieldeditorials(handle);
  final _ratingsHandle = _sdkSearchDetailsGetFieldratings(handle);
  final _referencesHandle = _sdkSearchDetailsGetFieldreferences(handle);
  try {
    return Details(
      heresdkSearchCommonBindingsListofSdkSearchContactFromFfi(_contactsHandle), 
      heresdkSearchCommonBindingsListofSdkSearchOpeninghoursFromFfi(_openingHoursHandle), 
      heresdkSearchCommonBindingsListofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      heresdkSearchCommonBindingsListofSdkSearchWebimageFromFfi(_imagesHandle), 
      heresdkSearchCommonBindingsListofSdkSearchWebeditorialFromFfi(_editorialsHandle), 
      heresdkSearchCommonBindingsListofSdkSearchWebratingFromFfi(_ratingsHandle), 
      heresdkSearchCommonBindingsListofSdkSearchSupplierreferenceFromFfi(_referencesHandle)
    );
  } finally {
    heresdkSearchCommonBindingsListofSdkSearchContactReleaseFfiHandle(_contactsHandle);
    heresdkSearchCommonBindingsListofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
    heresdkSearchCommonBindingsListofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    heresdkSearchCommonBindingsListofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
    heresdkSearchCommonBindingsListofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
    heresdkSearchCommonBindingsListofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
    heresdkSearchCommonBindingsListofSdkSearchSupplierreferenceReleaseFfiHandle(_referencesHandle);
  }
}

void sdkSearchDetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchDetailsReleaseHandle(handle);

// Nullable Details

final _sdkSearchDetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle_nullable'));
final _sdkSearchDetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle_nullable'));
final _sdkSearchDetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_value_nullable'));

Pointer<Void> sdkSearchDetailsToFfiNullable(Details value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchDetailsToFfi(value);
  final result = _sdkSearchDetailsCreateHandleNullable(_handle);
  sdkSearchDetailsReleaseFfiHandle(_handle);
  return result;
}

Details? sdkSearchDetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchDetailsGetValueNullable(handle);
  final result = sdkSearchDetailsFromFfi(_handle);
  sdkSearchDetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchDetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchDetailsReleaseHandleNullable(handle);

// End of Details "private" section.

