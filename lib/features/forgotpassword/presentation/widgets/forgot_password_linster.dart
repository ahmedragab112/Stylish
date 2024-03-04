import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/forgotpassword/data/repositories/data_repo.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasource_implementation.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';
import 'package:stylehub/features/forgotpassword/presentation/pages/rest_code.dart';
import 'package:stylehub/features/forgotpassword/presentation/pages/update_user.dart';

class ForgotPasswordListern extends StatelessWidget {
  const ForgotPasswordListern({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotpasswordState>(
      listenWhen: (previous, current) =>
          current is Success ||
          current is Fail ||
          current is Loading ||
          current is SuccessRestCode ||
          current is FailRestCode ||
          current is LoadingRestCode,
      listener: (context, state) => state.whenOrNull(
        success: (data) {
          Navigator.pop(context);
          context.showSnackBar(data.message!);
          context.push(BlocProvider(
            create: (context) => ForgotPasswordCubit(
              repo: ForgotPasswordDataRepo(
                dataSource: ForgotPasswordRemoteDataSourceImplementation(
                  apiManager: ApiManager(
                    DioFactory.getDio(),
                  ),
                ),
              ),
            ),
            child: const RestCode(),
          ));
          return null;
        },
        fail: (apiResponseModel) {
          Navigator.pop(context);
          context.showSnackBar(apiResponseModel.message!);
          return null;
        },
        loading: () => showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: AppColor.primeryColor),
          ),
        ),
        successRestCode: (data) {
          Navigator.pop(context);
          context.showSnackBar(data.status);
          context.push(BlocProvider(
            create: (context) => ForgotPasswordCubit(
                repo: ForgotPasswordDataRepo(
                    dataSource: ForgotPasswordRemoteDataSourceImplementation(
                        apiManager: ApiManager(
              DioFactory.getDio(),
            )))),
            child: const UpdateUserPassword(),
          ));
          return null;
        },
        failRestCode: (apiResponseModel) {
          Navigator.pop(context);
          context.showSnackBar(apiResponseModel.message!);
          return null;
        },
        loadingRestCode: () => showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: AppColor.primeryColor),
          ),
        ),
      ),
      child: const SizedBox.shrink(),
    );
  }
}
