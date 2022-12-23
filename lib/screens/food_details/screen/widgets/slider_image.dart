import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.food.gallery!
        .map(
          (image) => Container(
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
              ),
            ),
          ),
        )
        .toList();
    final carousel = Expanded(
      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
    );
    return Flexible(
      child: Hero(
        tag: 'productImage',
        child: Column(
          children: [
            carousel,
            ImageList(
              controller: _controller,
              current: _current,
              food: widget.food,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.food,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final CarouselController _controller;
  final int _current;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: food.gallery!.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : AppColors.lightOrange)
                  .withOpacity(_current == entry.key ? 1 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
