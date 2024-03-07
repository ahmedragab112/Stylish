class CategoryEntity {
  int? results;

  List<CategoryDataEntity>? data;

  CategoryEntity({this.results, this.data});
}

class CategoryDataEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryDataEntity(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});
}
