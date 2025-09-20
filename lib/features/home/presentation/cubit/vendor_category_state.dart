import 'package:guruh5/features/home/data/models/vendor_category_model.dart';

abstract class VendorCategoryState {
  const VendorCategoryState();
}

class VendorCategoryInit extends VendorCategoryState {
  const VendorCategoryInit();
}

class VendorCategoryLoading extends VendorCategoryState {
  const VendorCategoryLoading();
}

class VendorCategorySuccess extends VendorCategoryState {
  final List<VendorCategoryModel> vendorCategories;

  const VendorCategorySuccess({required this.vendorCategories});
}

class VendorCategoryError extends VendorCategoryState {
  final String errorMessage;
  const VendorCategoryError({required this.errorMessage});
}
