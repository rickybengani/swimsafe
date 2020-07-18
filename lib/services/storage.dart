import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:swim_safe/screens/profiles/checker.dart';

class Uploader extends StatefulWidget {
  final File file;
  final String name;
  final String careNeeded;

  Uploader({Key key, this.file, this.name, this.careNeeded}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage = FirebaseStorage(storageBucket: '');

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  void _startUpload() {
    String filePath = 'images/${widget.name.replaceAll(' ', '')}.png';

    // setState(() {
    //   _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    // });
    print("Works");
    print(widget.name);
    print(widget.careNeeded);
    print(filePath);
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Column(
              children: [
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
              ],
            );
          });
    } else {
      // Allows user to decide when to start the upload
      return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Send",
              icon: Icon(Icons.send, color: Colors.white),
              color: Colors.deepPurple.shade500),
          ButtonState.loading:
              IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
          ButtonState.fail: IconedButton(
              text: "Failed",
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red.shade300),
          ButtonState.success: IconedButton(
              text: "Success",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400)
        },
        onPressed: () {
          _startUpload();
        },
        state: ButtonState.idle,
      );
    }
  }
}
