import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/signup/domain/repositories/signup_repo.dart';

class SignUpUsecase {
 final SignUpRepo signUpRepo;
 const SignUpUsecase({required this.signUpRepo});
  Future<ApiResponse<UserEntity>> call({required UserData userData}) =>
      signUpRepo.signUp(userData: userData);
}
