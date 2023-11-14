import 'package:paginate_demo/src/models/product.dart';
import 'package:paginate_demo/src/pagination/pagination.dart';
import 'package:paginate_demo/src/pagination/pagination_controller.dart';
import 'package:paginate_demo/src/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@riverpod
class PaginatedProductController extends _$PaginatedProductController
    with PaginationControllerMixin<Product> {
  @override
  FutureOr<PaginatedResponse<Product>> build() =>
      loadData(const PaginationRequest(page: 1, limit: 10));

  @override
  FutureOr<PaginatedResponse<Product>> loadData(PaginationRequest? query) {
    final repository = ref.read(productRepositoryProvider);
    return repository.getProducts();
  }
}
