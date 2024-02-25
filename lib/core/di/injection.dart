import 'package:get_it/get_it.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource_implementation.dart';
import 'package:stylehub/features/signup/data/repositories/remote_repo_implmentation.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';
import 'package:stylehub/features/signup/presentation/cubit/signup_cubit.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register SignUpDataRepo with its dependencies
  locator.registerLazySingleton(() => RemoteDataSoucresImplementation(
      apiManager: ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => SignUpDataRepo(
        remoteDataSource: locator<RemoteDataSoucresImplementation>(),
      ));

  locator.registerLazySingleton(() => SignUpUsecase(
        signUpRepo: locator<SignUpDataRepo>(),
      ));

  // Register SignUpCubit with its dependencies
  locator.registerFactory(() => SignupCubit(
        signUpUsecase: locator<SignUpUsecase>(),
      ));
}
