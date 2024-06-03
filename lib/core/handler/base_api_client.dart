import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/utils/custom_toasts.dart';

import '../../data/models/filter/filter_model.dart';
import '../../di_injection/get_di_init.dart';

class BaseApiClient {
  static const int timeoutDuration = 20;

  static Future<dynamic> fetch({
    required String collection,
    String? docId,
    bool hasQuery = false,
    dynamic queryData,
  }) async {
    try {
      final ref = firebaseService.firebaseInstance.collection(collection);
      Object response;
      if (docId != null) {
        response = ref
            .doc(docId)
            .get()
            .timeout(const Duration(seconds: timeoutDuration));
      } else {
        Query<Map<String, dynamic>> filteredData =
            hasQuery ? filteredShoes(queryData, ref) : ref;
        response = await filteredData
            .get()
            .timeout(const Duration(seconds: timeoutDuration));
        // .catchError((error) =>
        //     errorToast(message: "Failed to load $collection: $error"));
      }

      return response;
    } on FirebaseException catch (e) {
      log(e.toString());
      throw errorToast(message: e.message ?? '');
    }
  }

  static Query<Map<String, dynamic>> filteredShoes(
      FilterModel? filterModel, CollectionReference<Map<String, dynamic>> ref) {
    Query<Map<String, dynamic>> queryRef = ref;

    if (filterModel?.sortBy?.id != null) {
      switch (filterModel?.sortBy?.id) {
        case "recent":
          queryRef =
              ref.orderBy("createdAt", descending: true); //for recent shoes
          break;
        case "lowest":
          queryRef = ref.orderBy("price"); //for lowest price
          break;
        case "highest":
          queryRef = ref.orderBy("price", descending: true); //for highest price
          break;
        default:
      }
    }
    if (filterModel?.maxPrice != 0.0) {
      queryRef = ref
          .where("price", isGreaterThanOrEqualTo: filterModel?.minPrice)
          .where("price", isLessThanOrEqualTo: filterModel?.maxPrice);
    }
    return queryRef
        .where("brandInfo.brandName", isEqualTo: filterModel?.brand)
        .where("colors", arrayContains: filterModel?.color)
        .where("gender", isEqualTo: filterModel?.gender);
  }

  static Future<dynamic> post({
    required String collection,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final ref = firebaseService.firebaseInstance.collection(collection);

      return ref.add(payload).then((value) => value.id).catchError(
          (error) => errorToast(message: "Failed to save order: $error"));
    } on FirebaseException catch (e) {
      throw errorToast(message: e.message ?? '');
    }
  }
}
