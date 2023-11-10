import 'package:ecommerce/models/favorite_model.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final FavoriteModel model;

  const FavoriteItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    print('Width = $width');
    print('Height = $height');

    return Container(
      width: double.infinity,
      height: height * 0.13,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff004182).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.267,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xff004182).withOpacity(0.3)),
              image: DecorationImage(
                image: AssetImage(model.imagePath),
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
                    height: height * 0.046,
                    elevation: 0,
                    minWidth: width * 0.23,
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
                        model.title,
                        style: const TextStyle(
                          color: Color(0xff06004F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: model.color,
                            radius: 8,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            model.color.toString(),
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
                            'EGP ${model.offeredPrice}',
                            style: const TextStyle(
                              color: Color(0xff06004F),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          model.originalPrice != null
                              ? Text(
                            '${model.originalPrice} EGP ',
                                  style: TextStyle(
                                    color: const Color(0xff004182)
                                        .withOpacity(0.6),
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
