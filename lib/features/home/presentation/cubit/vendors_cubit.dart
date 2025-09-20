import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/data/repos/vendors_repo.dart';
import 'package:guruh5/features/home/presentation/cubit/vendors_state.dart';

class VendorsCubit extends Cubit<VendorsState> {
  VendorsCubit({required this.repo}) : super(VendorsInit());
  final VendorsRepo repo;

  Future<void> getVendors(int categoryId) async {
    emit(VendorsLoading());
    final result = await repo.getVendors(categoryId);
    result.fold(
      (error) {
        emit(VendorsError(errorMessage: error.message));
      },
      (vendors) {
        emit(VendorsSuccess(vendors: vendors));
      },
    );
  }
}
