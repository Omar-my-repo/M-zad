import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mzady/model/product.dart';

class DatabaseUtils {
  static CollectionReference<Product> getProductCollectionRef() {
    return FirebaseFirestore.instance
        .collection('products')
        .withConverter<Product>(
          fromFirestore: (snapshot, options) =>
              Product.fromJson(snapshot.data()!),
          toFirestore: (product, options) => product.toJson(),
        );
  }

  static setProductToFirestore(Product product) async {
    var ref = getProductCollectionRef();
    return await ref.doc(product.id).set(product);
  }

  static deleteProductFromFirestore(String productID) async {
    var ref = getProductCollectionRef();
    return await ref.doc(productID).delete();
  }

  static Future<List<Product>> getSelectedProductsList(
      {required bool confirmed}) async {
    // this method showing confirmed products for user
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot =
          await ref.where('available', isEqualTo: confirmed).get();

      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();
      return products;
    } catch (e) {
      throw (e);
    }
  }

  static Future<List<Product>> getAllProductsList() async {
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot = await ref.get();
      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();
      return products;
    } catch (e) {
      throw (e);
    }
  }

  static Future<List<Product>> getProductsListByCategory(
      String category) async {
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot =
          await ref.where('category', isEqualTo: category).get();
      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();
      return products;
    } catch (e) {
      print('=========$e');
      throw (e);
    }
  }

  static Future<List<Product>> getProductsListByTitleSearch(
      String title) async {
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot = await ref
          .orderBy('title')
          .startAt([title]).endAt(['$title\uf8ff']).get();
      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();
      return products;
    } catch (e) {
      print('=========$e');
      throw (e);
    }
  }

  static Future<Product> getProductDetailsByID(String productId) async {
    try {
      var ref = getProductCollectionRef();
      DocumentSnapshot<Product> product = await ref.doc(productId).get();
      return product.data()!;
    } catch (e) {
      print('=========$e');
      throw (e);
    }
  }

  static Future<List<Product>> getProductsWitchUserWin(String userId) async {
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot =
          await ref.where('winnerID', isEqualTo: userId).get();
      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();

      return products;
    } catch (e) {
      print('=========$e');
      throw (e);
    }
  }

  static Future<List<Product>> getProductsWitchUserUpload(String userId) async {
    try {
      var ref = getProductCollectionRef();
      QuerySnapshot<Product> productsSnapshot =
          await ref.where('sellerId', isEqualTo: userId).get();
      List<Product> products =
          productsSnapshot.docs.map((e) => e.data()).toList();

      return products;
    } catch (e) {
      print('=========$e');
      throw (e);
    }
  }
}

///
/// ?????????? ???????????? ???????? ?? ?????????????? ???? ???? ???????????????? ???? ?????? ?????????????? ???? ???????????????? ???? ???????????????? ???????????? ?????????? ???? id ???? ???????????????? ??????
