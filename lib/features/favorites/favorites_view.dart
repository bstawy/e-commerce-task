import 'package:ecommerce/features/favorites/widgets/favorites_item.dart';
import 'package:ecommerce/features/products/products_view.dart';
import 'package:ecommerce/models/favorite_model.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  static const String routeName = 'favorite-view';
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List<FavoriteItem> products = const [
    FavoriteItem(
      model: FavoriteModel(
        title: 'Nike Air Jordan',
        color: Colors.black,
        imagePath: 'assets/images/nike_shoes_01.jpg',
        offeredPrice: 1200,
        originalPrice: 1500,
      ),
    ),
    FavoriteItem(
      model: FavoriteModel(
        title: 'Nike Air Jordan',
        color: Colors.black,
        imagePath: 'assets/images/nike_shoes_02.jpg',
        offeredPrice: 1200,
        originalPrice: 1500,
      ),
    ),
    FavoriteItem(
      model: FavoriteModel(
        title: 'Nike Air Jordan',
        color: Colors.black,
        imagePath: 'assets/images/nike_shoes_03.jpg',
        offeredPrice: 1200,
        originalPrice: 1500,
      ),
    ),
  ];

  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, ProductsView.routeName);
              },
              child: Image.asset('assets/images/route_logo.png'),
            ),
          ],
        ),
        leadingWidth: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBar(
                  onChanged: (value) {
                    searchController.text = value;
                    print(searchController.text);
                  },
                  elevation: const MaterialStatePropertyAll(0),
                  constraints: BoxConstraints(
                      maxWidth: width * 0.75, minHeight: height * 0.055),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                        color: Color(0xff004182),
                      ),
                    ),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  leading: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset('assets/images/search_icon.png'),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  controller: searchController,
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  hintText: 'what do you search for?',
                  hintStyle: MaterialStatePropertyAll(
                    TextStyle(
                      color: const Color(0xff06004f).withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Image.asset('assets/images/shopping_cart.png'),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => products[index],
                itemCount: products.length,
                padding: const EdgeInsets.only(top: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
