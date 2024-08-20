import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;
  Product(this.name, this.description, this.image, this.price, this.rating);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['image'],
      json['price'],
      json['rating'],
    );
  }
  void updateRating(int myRating) {
    rating = myRating;

    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product(
        'iPhone', 'iPhone is the stylist phone ever', 'iphone.PNG', 1000, 0));
    items.add(Product('Pixel', 'Pixel is the most featureful phone ever',
        'pixel.PNG', 800, 0));
    items.add(Product('Laptop', 'Laptop is most productive development tool',
        'laptop.PNG', 2000, 0));
    items.add(Product(
        'Tablet',
        'Tablet is the most useful device ever for meeting',
        'phone.PNG',
        1500,
        0));
    items.add(Product(
        'Pendrive', 'Pendrive is useful storage medium', 'techno.PNG', 100, 0));
    items.add(Product('Floppy Drive',
        'Floppy drive is useful rescue storage medium', 'adewale.PNG', 20, 0));

    return items;
  }
}
