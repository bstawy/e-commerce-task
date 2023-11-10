import 'package:flutter/material.dart';

class FavoriteModel {
  final String title;
  final Color color;
  final int offeredPrice;
  final int? originalPrice;
  final String imagePath;

  const FavoriteModel({
    required this.title,
    required this.color,
    required this.offeredPrice,
    this.originalPrice,
    required this.imagePath,
  });
}
