import 'package:flutter/material.dart';

class DeleteAlertBox extends StatelessWidget {
  DeleteAlertBox(
      {Key key,
      this.uid,
      this.name,
      this.onPressedCancel,
      this.onPressedDelete})
      : super(key: key);
  String uid;
  String name;
  final onPressedCancel;
  final onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 9,
      color: const Color(0xFFFFFFFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'Do you want to delete\n$name?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: onPressedDelete,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                child: const SizedBox(
                  width: 60,
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              TextButton(
                onPressed: onPressedCancel,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                child: const SizedBox(
                  width: 60,
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
