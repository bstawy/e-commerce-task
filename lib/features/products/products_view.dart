import 'package:ecommerce/features/favorites/favorites_view.dart';
import 'package:ecommerce/features/products/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  static const String routeName = 'products-view';

  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<ProductItem> products = [
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_01.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 1500,
      offeredPrice: 1100,
      imagePath: 'assets/images/nike_shoes_02.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 1300,
      offeredPrice: 1000,
      imagePath: 'assets/images/nike_shoes_03.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1500,
      imagePath: 'assets/images/nike_shoes_04.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2100,
      offeredPrice: 1800,
      imagePath: 'assets/images/nike_shoes_05.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_06.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_01.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_02.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_03.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_04.jpg',
      rating: 4.6,
      isFavourited: false,
    ),
    ProductItem(
      title: 'Nike Air Jordon',
      description: 'Nike shoes flexible for women',
      originalPrice: 2000,
      offeredPrice: 1200,
      imagePath: 'assets/images/nike_shoes_05.jpg',
      rating: 4.6,
      isFavourited: false,
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
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, FavoriteView.routeName);
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
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBar(
                  onTap: () {},
                  elevation: const MaterialStatePropertyAll(0),
                  constraints:
                      const BoxConstraints(maxWidth: 300, minHeight: 50),
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 7 / 10,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => products[index],
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
