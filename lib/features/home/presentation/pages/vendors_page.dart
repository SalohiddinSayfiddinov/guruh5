import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/presentation/cubit/vendor_category_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/vendor_category_state.dart';
import 'package:guruh5/features/home/presentation/cubit/vendors_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/vendors_state.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  @override
  void initState() {
    super.initState();
    context.read<VendorsCubit>().getVendors(0);
    context.read<VendorCategoryCubit>().getVendorCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vendors")),
      body: BlocBuilder<VendorCategoryCubit, VendorCategoryState>(
        builder: (context, state) {
          if (state is VendorCategoryLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is VendorCategoryError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is VendorCategorySuccess) {
            final categories = state.vendorCategories;
            return DefaultTabController(
              length: state.vendorCategories.length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs:
                        categories.map((category) {
                          return Tab(text: category.name);
                        }).toList(),

                    onTap: (value) {
                      context.read<VendorsCubit>().getVendors(value);
                    },
                  ),
                  BlocBuilder<VendorsCubit, VendorsState>(
                    builder: (context, state) {
                      if (state is VendorsLoading) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is VendorsError) {
                        return Center(child: Text(state.errorMessage));
                      } else if (state is VendorsSuccess) {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [Text(state.vendors[index].name)],
                              );
                            },
                            itemCount: state.vendors.length,
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
