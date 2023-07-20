import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ocr/widgets/custom_loader.dart';

import '../model/Notes.dart';

class FireStoreController extends GetxController {
  static final _db = FirebaseFirestore.instance;
  List<dynamic> fetchedData = [].obs;

  doInsert(String collectionName, Map<String, dynamic> data) async{
   await _db.collection(collectionName).add(data).whenComplete(() {
     CustomLoader.showSuccessToast(
         description: "Data Saved Successfully");
   }
   ).catchError(() => CustomLoader.showErrorToast());

  }

  doUpdate() {}

  doDelete() {}

  doFetch(String collectionName) async{
    var querySnapshot = await _db.collection(collectionName).get();

    fetchedData = querySnapshot.docs.map((e) => Notes.fromSnapshot(e)).toList();
    for(var i = 0;i < fetchedData.length; i++){
      // print(fetchedData[i].);
    }
  }

  doPartialUpdate() {}
}
