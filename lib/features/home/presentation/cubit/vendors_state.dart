import 'package:guruh5/features/home/data/models/vendor_model.dart';

abstract class VendorsState {
  const VendorsState();
}

class VendorsInit extends VendorsState {
  const VendorsInit();
}

class VendorsLoading extends VendorsState {
  const VendorsLoading();
}

class VendorsSuccess extends VendorsState {
  final List<VendorModel> vendors;

  const VendorsSuccess({required this.vendors});
}

class VendorsError extends VendorsState {
  final String errorMessage;
  const VendorsError({required this.errorMessage});
}


