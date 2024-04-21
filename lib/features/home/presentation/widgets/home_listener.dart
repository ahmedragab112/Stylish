import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/function/motion_toast.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';

class HomeListener extends StatelessWidget {
  const HomeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state is GetUserWishListError) {
          errorToast(context, title: state.error);
        } else if (state is DeleteWishListLoading) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColor.primeryColor,
              ),
            ),
          );
        } else if (state is DeleteWishListLoaded) {
          Navigator.pop(context);
          successToast(
            context,
            title: 'iteam has been deleted from wish list',
          );
          await context.read<HomeCubit>().getLoggedUserWishList();
        } else if (state is AddToWishListError) {
          Navigator.pop(context);
          errorToast(context, title: state.error);
        } else if (state is AddToWishListLoaded) {
          Navigator.pop(context);
          successToast(
            context,
            title: 'iteam has been added to wish list',
          );
          await context.read<HomeCubit>().getLoggedUserWishList();
        } else if (state is AddToWishListLoading) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColor.primeryColor,
              ),
            ),
          );
        } else if (state is GetAllBrandsError) {
          errorToast(context, title: state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
