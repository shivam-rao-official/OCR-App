import 'package:flutter/material.dart';

class CustomLoader {
  Widget showLoader(BuildContext context, {bool showLoaderFlag = false}) {
    return (showLoaderFlag)
        ? SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width / 3,
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                  Text(
                    "Loading",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
