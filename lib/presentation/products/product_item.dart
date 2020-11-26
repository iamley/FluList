import 'package:Products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product _product;
  final ValueChanged<Product> onTap;

  const ProductItem(this._product, this.onTap) : assert(_product != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTap(_product),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image.network(
              _product.image,
              fit: BoxFit.fitHeight,
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          _product.nameProduct,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
