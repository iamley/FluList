class Product {
  final int id;
  final String nameProduct;
  final String description;
  final String brand;
  final int price;
  final int barcode;
  final String image;

  Product.fromJson(Map jsonMap)
      : id = jsonMap['sku'],
        nameProduct = valueOrDefaultValue(jsonMap['nameProduct']),
        description = valueOrDefaultValue(jsonMap['description']),
        brand = valueOrDefaultValue(jsonMap['brand']),
        price = jsonMap['price'],
        barcode = jsonMap['barcode'],
        image = valueOrDefaultValue(jsonMap['image']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
