import 'package:charity_circle/core/images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Caraousel extends StatelessWidget {
  const Caraousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: AppImages.carouselList.map((i) {
        return Builder(
          builder: (context) {
            return Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(i),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
