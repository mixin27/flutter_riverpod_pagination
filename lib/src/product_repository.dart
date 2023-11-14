import 'package:dio/dio.dart';
import 'package:paginate_demo/src/models/product.dart';
import 'package:paginate_demo/src/pagination/pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  late Dio _dio;

  ProductRepository() {
    _dio = Dio();
  }

  FutureOr<PaginatedResponse<Product>> getProducts() async {
    // limit=10&skip=10&select=title,price
    final response = await _dio.get(
      'https://dummyjson.com/products',
      queryParameters: {
        'limit': '10',
        'skip': '10',
        'select': 'title,price',
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      return PaginatedResponse<Product>.fromJson(
        response.data,
        (json) => Product.fromJson(json! as Map<String, dynamic>),
      );
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository();
}
