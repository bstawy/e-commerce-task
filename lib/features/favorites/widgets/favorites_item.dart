import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final String title;
  final Color color;
  final int offeredPrice;
  final int? originalPrice;
  final String imagePath;

  const FavoriteItem({
    super.key,
    required this.title,
    required this.color,
    required this.offeredPrice,
    this.originalPrice,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff004182).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xff004182).withOpacity(0.3)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 3,
                  right: 0,
                  child: Image.asset('assets/images/fav_filled.png'),
                ),
                Positioned(
                  bottom: 3,
                  right: 5,
                  child: MaterialButton(
                    onPressed: () {},
                    height: 40,
                    elevation: 0,
                    minWidth: 100,
                    padding: EdgeInsets.zero,
                    color: const Color(0xff004182),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xff06004F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: color,
                            radius: 8,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            color.toString(),
                            style: const TextStyle(
                              color: Color(0xff06004F),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'EGP $offeredPrice',
                            style: const TextStyle(
                              color: Color(0xff06004F),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          originalPrice != null
                              ? Text(
                            '$originalPrice EGP ',
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
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
