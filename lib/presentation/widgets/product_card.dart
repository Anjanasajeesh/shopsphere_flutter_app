import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../screens/product_detail/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(productId: product.id),
          ),
        );
      },

      child: Card(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.images.first,
              height: 100,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
            ),

            Text(product.title),

            Text("\$${product.price}"),
          ],
        ),
      ),
    );
  }
}
