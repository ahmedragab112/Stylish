import 'package:get_it/get_it.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/login/data/datasources/remote_datasoucre_implementation.dart';
import 'package:stylehub/features/login/data/repositories/data_repo.dart';
import 'package:stylehub/features/login/domain/repositories/login_domainrepo.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource_implementation.dart';
import 'package:stylehub/features/signup/data/repositories/remote_repo_implmentation.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register SignUpDataRepo with its dependencies
  locator.registerLazySingleton(() => SignUpRemoteDataSoucresImplementation(
      apiManager:
          ApiManager(DioFactory.getDio(), baseUrl: AppConstant.signUpBaseUrl)));

  locator.registerLazySingleton(() => SignUpDataRepo(
        remoteDataSource: locator<SignUpRemoteDataSoucresImplementation>(),
      ));

  locator.registerLazySingleton(() => SignUpUsecase(
        signUpRepo: locator<SignUpDataRepo>(),
      ));

  // Register SignUpCubit with its dependencies
  locator.registerFactory(() => SignupCubit(
        signUpUsecase: locator<SignUpUsecase>(),
      ));
  locator.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Register LoginDataRepo with its dependencies
  locator.registerLazySingleton(() => LoginRemoteDataSoucreImplementation(
      apiManager: ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => LoginDataRepo(
        loginRemoteDataSouce: locator<LoginRemoteDataSoucreImplementation>(),
      ));

  locator.registerLazySingleton<LoginRepo>(() => locator<LoginDataRepo>());

  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(
        loginRepo: locator<LoginRepo>(),
      ));
  locator.registerFactory<LoginCubit>(
      () => LoginCubit(loginUseCase: locator<LoginUseCase>()));
}
