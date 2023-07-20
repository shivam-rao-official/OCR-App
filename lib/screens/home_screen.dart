import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/firestore_controller.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:ocr/model/notes_model.dart';
import 'package:ocr/widgets/custom_appbar.dart';
import 'package:ocr/widgets/custom_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  var textRecognizerController = Get.put(TextRecognizerController());
  var fireStoreController = Get.put(FireStoreController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), child: CustomAppbar()),
      body: StreamBuilder<List<Notes>>(
        stream: FireStoreController.doFetchAll(),
        builder: (context, AsyncSnapshot<List<Notes>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      print(snapshot.data);
                    },
                    title: Text(snapshot.data![index].title.toString()),
                    subtitle: Text(
                      snapshot.data![index].notes.toString(),
                      // maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                    // isThreeLine: true,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "No Texts Captured yet",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          CustomDialog.showImageDialog(context);
        },
        label: Row(
          children: const [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 10),
            Text("Capture Text"),
          ],
        ),
      ),
    );
  }
}
