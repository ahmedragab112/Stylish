class ProductEntity {
  int? results;
  List<DataEntity>? data;
  ProductEntity({this.results, this.data});
}

class DataEntity {
  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? sId;
  String? title;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryEntity? category;
  CategoryEntity? brand;
  double? ratingsAverage;
  String? id;
  int? priceAfterDiscount;

  DataEntity(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.sId,
      this.title,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id,
      this.priceAfterDiscount});
}

class SubcategoryEntity {
  String? sId;
  String? name;

  String? category;

  SubcategoryEntity({this.sId, this.name, this.category});
}

class CategoryEntity {
  String? sId;
  String? name;
  String? image;

  CategoryEntity({this.sId, this.name, this.image});
}
