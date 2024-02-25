import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/features/signup/domain/entities/singup_entitey.dart';
import 'package:stylehub/features/signup/domain/repositories/signup_repo.dart';

class SignUpUsecase {
  SignUpRepo signUpRepo;
  SignUpUsecase({required this.signUpRepo});
  Future<ApiResponse<UserEntity>> call({required UserData userData}) =>
      signUpRepo.signUp(userData: userData);
}
