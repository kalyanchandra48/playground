import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playground/change_password_screen.dart';
import 'package:playground/isar_addding_page.dart';
import 'package:playground/price.dart';
import 'package:playground/product.dart';
import 'package:playground/productVariant.dart';
import 'package:playground/tax.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();

  final isar = await Isar.open(
      [ProductSchema, ProductVariantSchema, PriceSchema, TaxSchema],
      directory: dir.path, inspector: true);

  runApp(MyApp(isar: isar));
  isar.products.where().findAll().then((value) => print(value));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isar}) : super(key: key);
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IsarAddingPage(isar: isar),
        '/password': (context) => NewPasswordScreen(),
      },
    );
  }
}

// class AnimatedFlutterLogo extends StatefulWidget {
//   const AnimatedFlutterLogo({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _AnimatedFlutterLogoState();
// }

// class _AnimatedFlutterLogoState extends State<AnimatedFlutterLogo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Row(
//           children: [
//             Container(
//               height: 300,
//               width: 200,
//               color: Colors.yellow,
//             ),
//           ],
//         ));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: CircleAvatar(
//       backgroundColor: Colors.transparent,
//       radius: 100,
//       child: Image.asset("assets/card.png"),
//     ))

//         // child: RiveAnimation.asset(
//         //   'assets/Success.riv',
//         // ),
//         );
//     //);
//   }
// }
