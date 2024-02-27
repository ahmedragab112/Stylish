import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/onboarding/model/page_view_model.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  PageController controller = PageController(initialPage: 0);
  int index = 0;
  List<PageViewModel> pages = const [
    PageViewModel(
      title: AppStrings.chooseProducts,
      description: AppStrings.onBoarding1Description,
      image: AppAssets.svgOnBoarding1,
    ),
    PageViewModel(
      title: AppStrings.makePayment,
      description: AppStrings.onBoarding2Description,
      image: AppAssets.svgOnBoarding2,
    ),
    PageViewModel(
      title: AppStrings.getYourOrder,
      description: AppStrings.onBoarding3Description,
      image: AppAssets.svgOnBoarding3,
    )
  ];
  OnboardingCubit() : super(const OnboardingState.initial());

  void onPageChanged(int page) {
    emit(const OnboardingState.changePageLoading());
    index = page;
    emit(const OnboardingState.changePageSuccess());
  }
}
