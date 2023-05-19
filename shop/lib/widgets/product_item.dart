import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/product_detail_page.dart';
import 'package:shop/utilities/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
      child: GestureDetector(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          );
        },
      ),
    );
  }
}
