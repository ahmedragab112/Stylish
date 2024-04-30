import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';

class CaterogyProductArgumentModel {
  final HomeCubit cubit;
  final String categoryName;

 const CaterogyProductArgumentModel(
      {required this.cubit, required this.categoryName});
}
