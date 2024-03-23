import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:s_store/features/shop/models/category.model.dart';
import 'package:s_store/utils/exceptions/firebase_exceptions.dart';
import 'package:s_store/utils/exceptions/format_exceptions.dart';
import 'package:s_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository {
  // --- Variables
  static final _db = FirebaseFirestore.instance;

  // --- Get All Categories
  static Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document: document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
