import 'package:car_rental/features/details/controller/car_detailes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarImageCarousel extends StatelessWidget {
  final String mainImage;
  final List<String> additionalImages;

  const CarImageCarousel({
    super.key,
    required this.mainImage,
    required this.additionalImages,
  });

  @override
  Widget build(BuildContext context) {
    final allImages = [mainImage, ...additionalImages];

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: allImages.length,
            onPageChanged: context.read<CarDetailesController>().onPageChanged,
            itemBuilder: (context, index) {
              return _CarImageWidget(imagePath: allImages[index]);
            },
          ),
        ),
        const SizedBox(height: 12),
        _PageIndicator(count: allImages.length),
      ],
    );
  }
}

  class _PageIndicator extends StatelessWidget {
  final int count;

  const _PageIndicator({required this.count});

  @override
  Widget build(BuildContext context) {
    return Consumer<CarDetailesController>(
      builder: (context, controller, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            count,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: controller.currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? Colors.black
                    : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}


class _CarImageWidget extends StatelessWidget {
  final String imagePath;

  const _CarImageWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.directions_car,
          size: 60,
        ),
      ),
    );
  }
}

