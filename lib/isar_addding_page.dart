import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:playground/price.dart';
import 'package:playground/product.dart';
import 'package:playground/productVariant.dart';
import 'package:playground/tax.dart';

class IsarAddingPage extends StatelessWidget {
  late final Isar isar;
  IsarAddingPage({
    Key? key,
    required this.isar,
  }) : super(key: key);

  final productVariant1 = ProductVariant()
    ..name = 'beverages'
    ..status = 'There'
    ..stockQuantity = 90;
  final productVariant2 = ProductVariant()
    ..name = 'beverages'
    ..status = 'There Stock'
    ..stockQuantity = 80;
  List<ProductVariant> productVariants = [];

  static Price prices = Price()
    ..sellingPrice = 90
    ..costPrice = 89;

  final product1 = Product()
    ..category = 'beverages'
    ..name = 'lays'
    ..prices.value = prices
    ..prices.value!.taxes.addAll(taxeslist);

  final tax1 = Tax(type: 'CGST', percentage: '20');
  final tax2 = Tax(type: 'SGST', percentage: '40');
  static List<Tax> taxeslist = [];

  _addToIsar(Product product) async {
    //- Simply add the Dummy data into List

    taxeslist.add(tax1);
    taxeslist.add(tax2);

    productVariants.add(productVariant1);
    productVariants.add(productVariant2);
    //- Add the Product to the Isar
    //- Add the ProductVariants to Isar
    await isar.writeTxn(() async {
      await isar.products.put(product);
      await isar.prices.put(prices);

      await isar.taxs.putAll(taxeslist);

      await isar.productVariants.putAll(productVariants);
    });

    //-- Get the Product By using Product id

    Product? prod = await isar.products.get(product.id!);
    print('prod is $prod');

    Price? pr = await isar.prices.get(product.id!);

    print('pr is ${pr!}');

//- From the getting product   load the variants

    await prod!.variants.load();
    await prod.prices.load();
    await prices.taxes.load();
    // await product1.prices.value!.taxes.load();
    // print(product1.prices.value!.taxes);

    // - Add all the ProductVariants to that product
    prices.taxes.addAll(taxeslist);
    prod.variants.addAll(productVariants);
    // product1.prices.value!.taxes.addAll(taxeslist);
    // print('addding');
    // print(product1.prices.value!.taxes);
    // await product1.prices.value!.taxes.load();
    // print(product1.prices.value!.taxes.isLoaded);

    //-- Save the Productvaraints in that product
    await isar.writeTxn(() async {
      await prod.variants.save();
      await prod.prices.save();
      await prices.taxes.save();
      await product1.prices.save();
      // print(product1.prices.value!.taxes);
      //await product1.prices.value!.taxes.save();
    });
  }
  //Add products to isar
  // get from isar and add variants individually
  // variants.addall
  // save

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _addToIsar(product1);
          print(isar.products.where().findAll());
        },
        tooltip: 'Add Isar Data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
