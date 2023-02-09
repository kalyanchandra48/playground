import 'package:flutter/material.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/car.png'),
              fit: BoxFit.fill,
            )),
          ),
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42)),
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
