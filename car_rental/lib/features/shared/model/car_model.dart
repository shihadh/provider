class CarModel {
  final String name;
  final String image; // main image
  final List<String> additionalImages;

  final String overview;

  final double rating;
  final int ratingCount;

  final double pricePerDay;

  final int seats;
  final int horsePower;
  final double topSpeed; // km/h

  final bool isAutomatic;
  final int bags;

  final CarOwnerModel owner;

  const CarModel({
    required this.name,
    required this.image,
    required this.additionalImages,
    required this.overview,
    required this.rating,
    required this.ratingCount,
    required this.pricePerDay,
    required this.seats,
    required this.horsePower,
    required this.topSpeed,
    required this.isAutomatic,
    required this.bags,
    required this.owner,
  });
}

class CarOwnerModel {
  final String name;
  final String image;
  final String phoneNumber;

  const CarOwnerModel({
    required this.name,
    required this.image,
    required this.phoneNumber,
  });
}
