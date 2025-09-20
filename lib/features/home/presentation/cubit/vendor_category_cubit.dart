import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/data/repos/vendors_repo.dart';
import 'package:guruh5/features/home/presentation/cubit/vendor_category_state.dart';

class VendorCategoryCubit extends Cubit<VendorCategoryState> {
  VendorCategoryCubit({required this.repo}) : super(VendorCategoryInit());
  final VendorsRepo repo;

  Future<void> getVendorCategories() async {
    emit(VendorCategoryLoading());
    final result = await repo.getVendorCategories();
    result.fold(
      (error) {
        emit(VendorCategoryError(errorMessage: error.message));
      },
      (categories) {
        emit(VendorCategorySuccess(vendorCategories: categories));
      },
    );
  }
}
