import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  ProductCubit() : super([]);

  final ProductRepository repository = ProductRepository();

  void getProducts() async {
    final products = await repository.fetchProducts();

    emit(products);
  }
}
