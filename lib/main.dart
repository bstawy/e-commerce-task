import 'package:ecommerce/features/favorites/favorites_view.dart';
import 'package:ecommerce/features/favorites/widgets/favorites_item.dart';
import 'package:flutter/material.dart';

import 'features/products/products_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsView.routeName,
      routes: {
        ProductsView.routeName : (context) => ProductsView(),
        FavoriteView.routeName : (context) => FavoriteView(),
      },
    );
  }
}
