import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<ImageSource?> imagePickOptions(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Container(
              height: MediaQuery.of(context).size.height * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, ImageSource.camera);
                        },
                        child: const Text(
                          'Camera',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, ImageSource.gallery);
                        },
                        child: Text(
                          'Gallery',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
