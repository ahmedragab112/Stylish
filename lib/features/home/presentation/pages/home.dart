import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is ChangePageIndex,
        builder: (context, state) {
          return SafeArea(child: screens[cubit.pageIndex]);
        },
      ),
      bottomNavigationBar: const CustomBottonNavigationBar(),
    );
  }
}
