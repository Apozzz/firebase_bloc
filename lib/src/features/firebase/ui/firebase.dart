import 'package:flutter/material.dart';

class FireBase extends StatelessWidget {
  const FireBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(hintText: 'Enter name'),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Submit')),
      ]),
    );
  }
}
