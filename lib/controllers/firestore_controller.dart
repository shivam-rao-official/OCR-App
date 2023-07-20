import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ocr/widgets/custom_loader.dart';

import '../model/notes_model.dart';

class FireStoreController extends GetxController {
  static final _db = FirebaseFirestore.instance;
  static final collectionReference = _db.collection("notes");
  List<dynamic> fetchedData = [].obs;

  static doInsert(String collectionName, Notes data) async {
    CustomLoader.showLoadingDialog("Saving Data....");
    var jsonData = data.toJson();
    var response = await collectionReference.add(jsonData);
    CustomLoader.hideLoadingDialog();
    if (response.id.isNotEmpty) {
      CustomLoader.showSuccessToast(description: "Data saved successfully");
    } else {
      CustomLoader.showErrorToast();
    }
  }

  doUpdate() {}

  doDelete() {}

  static Stream<List<Notes>> doFetchAll() {
    var data = collectionReference.snapshots().map(
          (notes) => notes.docs
              .map(
                (note) => Notes.fromJson(
                  note.data(),
                ),
              )
              .toList(),
        );
    return data;
  }

  doPartialUpdate() {}
}
