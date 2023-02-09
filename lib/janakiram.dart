import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  static String dropdownValue = 'Pattern Value';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leadingWidth: 190,
          leading: const Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              'All Reports',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage("assets/images/bg1.jpeg"), fit: BoxFit.fill),
              ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'SIX BITS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Track Twin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                height: 52,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.blue,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child:
                        Icon(Icons.expand_more_outlined, color: Colors.white),
                  ),
                  //style: AppFonts.mediumTextBB,
                  underline: Container(
                    height: 0,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Pattern Value', '2X3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                          child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
