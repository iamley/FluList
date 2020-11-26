import 'package:Products/domain/entities/product.dart';
import 'package:Products/infrastructure/rest/products_api.dart';
import 'package:Products/presentation/products/product_details.dart';
import 'package:Products/presentation/products/product_item.dart';
import 'package:Products/presentation/shared/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatefulWidget {
  ListProducts({Key key}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  final _product = <Product>[];
  Product _currentProduct;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_product.isEmpty) {
      await _loadProducts();
    }
  }

  Future _loadProducts() async {
    final api = ProductsApi();
    final product = await api.getProducts();
    setState(() {
      _product.addAll(product);
    });
  }

  void _onProductTapped(Product product) {
    setState(() {
      _currentProduct = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontTitle: Text("List of products"),
      backTitle: Text("Products"),
      currentProduct: _currentProduct,
      backPanel: _buildBackPanel(),
      frontPanel: _buildFrontPanel(),
    );
  }

  Widget _buildFrontPanel() {
    return ProductDetail(_currentProduct);
  }

  Widget _buildBackPanel() {
    if (_product.isEmpty) {
      return _buildForLoadingState();
    } else {
      return _buildForLoadedState();
    }
  }

  Widget _buildForLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildForLoadedState() {
    return Padding(
      padding: EdgeInsets.only(bottom: 48.0),
      child: GridView.count(
          crossAxisCount: _getCharacterGridViewSpanCount(),
          children: _product
              .map((product) => ProductItem(product, _onProductTapped))
              .toList()),
    );
  }

  int _getCharacterGridViewSpanCount() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) return 2;
    return 4;
  }
}
