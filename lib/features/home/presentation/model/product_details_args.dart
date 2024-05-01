import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';

class ProductDetailsArgs {
  final HomeCubit cubit;
  final DataEntity data;
  ProductDetailsArgs({required this.cubit, required this.data});
}
