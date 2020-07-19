import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:swim_safe/screens/profiles/checker.dart';
import 'package:swim_safe/services/database.dart';

class Uploader extends StatefulWidget {
  final File file;
  final String name;
  final String careNeeded;
  final String locationName;

  Uploader({Key key, this.file, this.name, this.careNeeded, this.locationName})
      : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  Future<void> _success() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You have been checked in!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://swim-safe-87ed8.appspot.com');

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  Future<void> _startUpload() async {
    String filePath = 'images/${widget.name.replaceAll(' ', '')}.png';
    final StorageReference storageReference =
        FirebaseStorage().ref().child(filePath);
    final StorageUploadTask uploadTask = storageReference.putFile(widget.file);
    await uploadTask.onComplete;
    final ref = FirebaseStorage().ref().child(filePath);
    var imageURL = await ref.getDownloadURL();

    // setState(() {
    //   _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    // });
    DatabaseService().setMemberData(widget.locationName, widget.name, filePath,
        imageURL, widget.careNeeded);
    await _success();
    Navigator.of(context).pop();
    print('storage.dart' + widget.locationName);
    print(imageURL);
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
