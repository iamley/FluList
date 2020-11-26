import 'package:Products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Product _product;
  const ProductDetail(this._product);

  @override
  Widget build(BuildContext context) {
    return _product == null
        ? _buildForNullCharacter()
        : _buildForNonNullCharacter(context);
  }

  Widget _buildForNullCharacter() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            'Not view products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget _buildForNonNullCharacter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                _product.nameProduct,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          _buildInformationWidget(
              Icons.grading_rounded, 'Description', _product.description),
          _buildInformationWidget(
              Icons.how_to_reg_sharp, 'Brand', _product.brand),
          _buildInformationWidget(
              Icons.local_atm, 'Price', _product.price.toString()),
          _buildInformationWidget(
              Icons.local_attraction, 'Barcode', _product.barcode.toString()),
        ],
      ),
    );
  }

  Widget _buildInformationWidget(IconData icon, String key, String value) {
    return Row(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 20.0,
            bottom: 16.0,
          ),
          child: Icon(icon, color: Colors.grey[600]),
        ),
        _buildKeyValueWidget(key, value)
      ],
    );
  }

  Widget _buildKeyValueWidget(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(value)
      ],
    );
  }
}
