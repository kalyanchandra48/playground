import 'package:flutter/material.dart';

class ScrollNumberTerm extends StatefulWidget {
  const ScrollNumberTerm({Key? key}) : super(key: key);

  @override
  State<ScrollNumberTerm> createState() => _ScrollNumberTermState();
}

class _ScrollNumberTermState extends State<ScrollNumberTerm> {
  int? number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 40),
            height: 270,
            width: 240,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.yellow,
            ),
            child: (number == 1)
                ? Image.asset('assets/card.png')
                : (number == 2)
                    ? Image.asset('assets/isar.png')
                    : (number == 3)
                        ? Image.asset('assets/rootpremiumlogo.png')
                        : (number == 4)
                            ? Image.asset('assets/message.png')
                            : Image.asset('assets/chapter5.png')),
        const SizedBox(
          height: 90,
        ),
        SizedBox(
          height: 50,
          child: ListWheelScrollView(
              onSelectedItemChanged: (value) => {
                    setState(() {
                      number = 5 - value;
                      print(value);
                      print(number);
                    })
                  },
              magnification: 300,
              squeeze: 1.0,
              itemExtent: 40,
              children: const [
                Text(
                  '5',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '4',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('3', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
        )
      ],
    ));
  }
}
