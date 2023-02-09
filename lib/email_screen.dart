import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 14, bottom: 40),
            color: Colors.lightGreen,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: 'Enter Your Email',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xffF2F2F2),
              ),
              controller: emailController,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/password');
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => NewPasswordScreen()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const Center(
                child: Text(
                  "Send A Recovery Email",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
