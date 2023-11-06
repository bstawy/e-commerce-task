import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  String title;
  String description;
  int? originalPrice;
  int offeredPrice;
  String imagePath;
  double rating;
  bool isFavourited;

  ProductItem({
    super.key,
    required this.title,
    required this.description,
    required this.originalPrice,
    required this.offeredPrice,
    required this.imagePath,
    required this.rating,
    required this.isFavourited,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 600,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff004182).withOpacity(0.3),width: 2),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 190,
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.imagePath,
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
                    widget.isFavourited = !widget.isFavourited;
                    setState(() {
                    });
                  },
                  child: Image.asset(widget.isFavourited == true
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
                  widget.title,
                  style: const TextStyle(
                    color: Color(0xff06004F),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.description,
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
                      'EGP ${widget.offeredPrice}',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    widget.originalPrice != null
                        ? Text(
                            '${widget.originalPrice} EGP ',
                            style: TextStyle(
                              color: const Color(0xff00418299).withOpacity(0.6),
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
                      'Review (${widget.rating})',
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
