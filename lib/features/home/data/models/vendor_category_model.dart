class VendorCategoryModel {
  final int id;
  final String name;

  VendorCategoryModel({required this.id, required this.name});

  factory VendorCategoryModel.fromJson(Map<String, dynamic> json) {
    return VendorCategoryModel(id: json['id'] ?? -1, name: json['name'] ?? '');
  }
}
