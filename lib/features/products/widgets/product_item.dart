import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductItem extends StatefulWidget {
  final ProductModel model;

  const ProductItem({
    super.key,
    required this.model,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    print('Width = $width');
    print('Height = $height');

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff004182).withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width * 0.45,
                height: height * 0.15, //128,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.model.imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    widget.model.isFavourited = !widget.model.isFavourited;
                    setState(() {});
                  },
                  child: Image.asset(widget.model.isFavourited == true
                      ? 'assets/images/fav_filled.png'
                      : 'assets/images/fav_button.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.title,
                  style: const TextStyle(
                    color: Color(0xff06004F),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.model.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff06004F),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'EGP ${widget.model.offeredPrice}',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    widget.model.originalPrice != null
                        ? Text(
                      '${widget.model.originalPrice} EGP ',
                            style: TextStyle(
                              color: const Color(0xff004182).withOpacity(0.6),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Review (${widget.model.rating})',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset('assets/images/star.png'),
                    const Spacer(),
                    Image.asset('assets/images/add_icon.png'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
