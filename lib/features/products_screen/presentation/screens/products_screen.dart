import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/products_bloc.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => ProductsBloc()..add(GetAllProductsEvent()),
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return switch (state) {
                ProductsInitial() => const SizedBox(),
                LoadingGetProductsState() => _buildLoadingState(),
                SuccessGetProductsState(products: final products) =>
                  _buildSuccessState(products, width, height),
                ErrorGetProductsState(message: final message) =>
                  _buildErrorState(message),
              };
            },
          ),
        ),
      ),
    );
  }


  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessState(
      List<ProductData> products, double width, double height) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 7 / 10,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return CustomProductWidget(
                product: product,
                height: height,
                width: width,
              );
            },
            scrollDirection: Axis.vertical,
          ),
        )
      ],
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.h,
            color: Colors.red,
          ),
          SizedBox(height: 16.h),
          Text(
            'Error loading products',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              // context.read<ProductsBloc>().add(GetAllProductsEvent());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
