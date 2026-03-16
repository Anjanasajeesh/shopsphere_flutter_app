import 'package:flutter/material.dart';
import 'package:shopsphere/data/models/product_model.dart';
import 'package:shopsphere/data/repositories/product_repository.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  Future<ProductModel> getProduct() {
    return ProductRepository().fetchProductDetail(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEDFA),

      body: SafeArea(
        child: FutureBuilder<ProductModel>(
          future: getProduct(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final product = snapshot.data!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 10),

                    /// APPBAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),

                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),

                        const Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.thumb_up, size: 30),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// PRODUCT IMAGE
                    Container(
                      height: 283,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.images[0],
                          width: double.infinity,
                          height: 283,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// SIZE + RATING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Text("4.7"),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// SIZE BUTTONS
                    Row(
                      children: ["32", "33", "34", "35", "36"]
                          .map(
                            (size) => Padding(
                              padding: const EdgeInsets.only(right: 8),

                              child: Container(
                                width: 45,
                                height: 45,
                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Text(size),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 20),

                    /// TITLE + PRICE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Text(
                          "₹${product.price}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// DESCRIPTION
                    Text(
                      product.description,
                      style: const TextStyle(height: 1.4),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTONS
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.shopping_cart),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFF333740),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: const Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
