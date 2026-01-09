import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/features/home/model/brand_model.dart';
import 'package:car_rental/features/home/model/car_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

   List<CarModel> cars = [
    CarModel(
      name: "Maruthi Alto",
      image: ImageConst.carF1,
      additionalImages: [
        ImageConst.carF2,
        "assets/images/cars/lamborghini_2.png",
        "assets/images/cars/lamborghini_3.png",
      ],
      overview:
          "The Maruthi Alto offers a perfect balance of performance and luxury, delivering an unforgettable driving experience.",
      rating: 4.9,
      ratingCount: 245,
      pricePerDay: 450.0,
      seats: 2,
      horsePower: 610,
      topSpeed: 325,
      isAutomatic: true,
      bags: 2,
      owner: CarOwnerModel(
        name: "Alex Morgan",
        image: ImageConst.owner,
        phoneNumber: "+91 98765 43210",
      ),
    ),

    CarModel(
      name: "BMW Cabrio",
      image: ImageConst.carS1,
      additionalImages: [
        ImageConst.carS2,
      ],
      overview:
          "BMW Cabrio blends everyday usability with motorsport-inspired performance and precision handling.",
      rating: 4.7,
      ratingCount: 189,
      pricePerDay: 280.0,
      seats: 4,
      horsePower: 503,
      topSpeed: 290,
      isAutomatic: true,
      bags: 3,
      owner: CarOwnerModel(
        name: "Daniel Roy",
        image: "assets/images/owners/daniel.png",
        phoneNumber: "+91 91234 56789",
      ),
    ),

    CarModel(
      name: "Audi RS7 Sportback",
      image: "assets/images/cars/audi_main.png",
      additionalImages: [
        "assets/images/cars/audi_1.png",
        "assets/images/cars/audi_2.png",
        "assets/images/cars/audi_3.png",
      ],
      overview:
          "Audi RS7 Sportback combines luxury, advanced technology, and brutal performance in a sleek design.",
      rating: 4.8,
      ratingCount: 312,
      pricePerDay: 350.0,
      seats: 4,
      horsePower: 591,
      topSpeed: 305,
      isAutomatic: true,
      bags: 4,
      owner: CarOwnerModel(
        name: "Michael Stone",
        image: "assets/images/owners/michael.png",
        phoneNumber: "+91 99887 77665",
      ),
    ),
  ];

   List<BrandModel> brand = [
    BrandModel(name: 'Audi', image: ImageConst.brand1),
    BrandModel(name: 'Mercedes', image: ImageConst.brand2),
    BrandModel(name: 'Nissan', image: ImageConst.brand3),
    BrandModel(name: 'Hyundai', image: ImageConst.brand4),
    BrandModel(name: 'Citroen', image: ImageConst.brand5),
    BrandModel(name: 'Renault', image: ImageConst.brand6),

  ];


}