class Hotel
{
  final String imageUrl;
  final String name;
  final String address;
  final int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: "assets/images/hotel1.jpg",
    name: "L Hotel",
    address: "404, Grand St",
    price: 175
  ),
  Hotel(
      imageUrl: "assets/images/hotel2.jpg",
      name: "Angelica Hotel",
      address: "402, Grand St",
      price: 300
  ),
  Hotel(
      imageUrl: "assets/images/hotel3.jpeg",
      name: "Hotel Grand",
      address: "12, Great St",
      price: 450
  ),
];