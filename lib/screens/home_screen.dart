import 'package:flutter/material.dart';
import 'package:ocr/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), child: CustomAppbar()),
      body: const Center(
        child: Text(
          "No Texts Captured yet",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
