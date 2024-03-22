import 'package:stylehub/features/home/domain/entities/category_intiy.dart';

class CategoryData extends ProductCategoryEntity {
  Metadata? metadata;

  CategoryData({super.results, this.metadata, super.data});

  CategoryData.fromJson(Map<String, dynamic> json) {
    super.results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      super.data = <Data>[];
      json['data'].forEach((v) {
        super.data!.add(Data.fromJson(v));
      });
    }
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class Data extends CategoryDataEntity {
  Data(
      {super.sId,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
