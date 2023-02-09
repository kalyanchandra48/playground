import 'package:flutter/material.dart';

class SaveDat extends StatelessWidget {
  // late SharedPreferences prefs;

  // SharedPreferences({Key? key}) : super(key: key);
  // Future init() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  // save() async {
  //   await init();
  //   await prefs.setString('string', "Geno Tech");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Store, Fetch & Delete Shared Preferences",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(child: const Text("Save Data"), onPressed: () {}),
            // RaisedButton(child: const Text("Fetch Data"), onPressed: fetch),
            // RaisedButton(child: const Text("Delete Data"), onPressed: remove)
          ],
        ),
      ),
    ));
  }

  setString(String s, String t) {}

  static getInstance() {}
}
