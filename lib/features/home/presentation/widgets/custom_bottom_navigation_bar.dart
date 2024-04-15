import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_bottom_nav_icon.dart';

class CustomBottonNavigationBar extends StatelessWidget {
  const CustomBottonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is ChangePageIndex,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          child: BottomNavigationBar(
            currentIndex: cubit.pageIndex,
            onTap: (index) {
              cubit.changePageIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: CustomBottomNavIcon(icon: Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Wishlist',
                  activeIcon:
                      CustomBottomNavIcon(icon: Icons.favorite_outline)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                  activeIcon:
                      CustomBottomNavIcon(icon: Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_business_outlined),
                  activeIcon:
                      CustomBottomNavIcon(icon: Icons.add_business_outlined),
                  label: 'Brands'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  activeIcon:
                      CustomBottomNavIcon(icon: Icons.account_circle_outlined),
                  label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon:
                      CustomBottomNavIcon(icon: Icons.settings_outlined),
                  label: 'Setting'),
            ],
          ),
        );
      },
    );
  }
}
