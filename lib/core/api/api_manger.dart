import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stylehub/core/api/end_point.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/forgotpassword/data/model/forgotpassword_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/model/user_model.dart';

import '../../features/home/data/models/wishlist_body.dart';

part 'api_manger.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @POST(EndPoint.signUpEndPoint)
  Future<UserModel> signUpUser(@Body() UserData userData);
  @POST(EndPoint.loginEndPoint)
  Future<UserModel> loginUser(@Body() LoginData loginData);
  @POST(EndPoint.forgotPasswordEndPoint)
  Future<ApiResponseModel> forgotPassword(@Body() ForgotPasswordBody email);
  @POST(EndPoint.verifyRestCodeEndPoint)
  Future<VerificationCodeModel> verifyRestCode(@Body() RestCodeModel code);

  @PUT(EndPoint.resetPasswordEndPoint)
  Future<UserTokenModel> resetPassword(
      @Body() UpdatePasswordBody updatePasswordBody);

  @GET(EndPoint.getAlllCategories)
  Future<CategoryData> getAllCategories();

  @GET(EndPoint.getAllProducts)
  Future<ProductDataModel> getProducts({
    @Query('sort') String? sortType,
    @Query('price[gte]') String? minPrice,
    @Query('price[lte]') String? maxPrice,
    @Query('category[in]') String? productsInCategory,
    @Query('brand') String? productsInBrand,
  });
  @POST(EndPoint.addToWishList)
  Future<AddToWishListModel> addToWishList(
      @Header('token') String token, @Body() WishListBody productId);

  @DELETE('${EndPoint.removeFromWishList}/{productId}')
  Future<AddToWishListModel> deleteWishList(
    @Header('token') String token,
    @Path('productId') String productId,
  );

  @GET(EndPoint.addToWishList)
  Future<UserWishListModel> getUserWishList(
    @Header('token') String token,
  );
  @GET(EndPoint.allBrands)
  Future<BrandsModel> getAllBrands();
}
