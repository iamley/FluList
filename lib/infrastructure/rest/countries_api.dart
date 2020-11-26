import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:Products/domain/entities/product.dart';

class CountriesApi {
  final String _baseUrl = '5u2d6uxvfc.execute-api.us-east-2.amazonaws.com';
  final String _productsUrl = '/Etapa-Pruebas';
  final String _productsJsonKey = 'data';
  final String _itemsProducts = 'Items';

  final HttpClient _httpClient = HttpClient();

  Future<List<Product>> getProducts() async {
    final uri = Uri.https(_baseUrl, _productsUrl);
    final response = await _getJson(uri);

    if (response == null ||
        response[_productsJsonKey][_itemsProducts] == null) {
      print('ProductsApi.getProducts(): Error while retriving products');
      return null;
    }

    return _convert(response[_productsJsonKey][_itemsProducts]);
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        print(
            'ProductsApi._getJson($uri) status code is ${response.statusCode}');
        return null;
      }
      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('ProductsApi._getJson($uri) exception thrown $e');
      return null;
    }
  }

  List<Product> _convert(List productsJson) {
    List<Product> products = <Product>[];
    productsJson.forEach((character) {
      products.add(Product.fromJson(character));
    });
    return products;
  }
}
