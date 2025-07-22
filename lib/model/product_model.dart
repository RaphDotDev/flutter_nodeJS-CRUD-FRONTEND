class Product {

final String? name;
final String? price;
final String? desc;

Product({this.name,this.price, this.desc});

@override
  String toString() {
    return 'Product(name: $name, price: $price, desc: $desc)';
  }

}