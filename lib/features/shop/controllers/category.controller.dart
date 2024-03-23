import 'package:get/get.dart';
import 'package:s_store/data/repositories/categories/category_repository.dart';
import 'package:s_store/features/shop/models/category.model.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxBool isLoading = false.obs;
  RxList allCategories = <CategoryModel>[].obs;
  RxList featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      // Show Loader While loading categories
      isLoading(true);

      // Fetch Categories from data source
      final categories = await CategoryRepository.getAllCategories();

      // Update Categories List
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      AppSnackBar.warningSnackBar(
        title: 'Error',
        message: 'Something went wrong.',
      );
    } finally {
      isLoading(false);
    }
  }
}
