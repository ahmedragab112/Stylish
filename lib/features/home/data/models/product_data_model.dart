import 'package:stylehub/features/home/domain/entities/product_entity.dart';

class ProductDataModel extends ProductEntity {
  Metadata? metadata;

  ProductDataModel({super.results, this.metadata, super.data});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    super.results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
     super.data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? prevPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.prevPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['numberOfPages'] = numberOfPages;
    data['limit'] = limit;
    data['prevPage'] = prevPage;
    return data;
  }
}

class Data extends DataEntity {
  String? slug;

  String? createdAt;
  String? updatedAt;

  Data(
      {super.sold,
      super.images,
      super.subcategory,
      super.ratingsQuantity,
      super.sId,
      super.title,
      this.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      this.createdAt,
      this.updatedAt,
      super.id,
      super.priceAfterDiscount});

  Data.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Category.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
  }
}

class Subcategory extends SubcategoryEntity {
  String? slug;

  Subcategory({super.sId, super.name, this.slug, super.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['category'] = category;
    return data;
  }
}

class Category extends CategoryEntity {
  String? slug;

  Category({super.sId, super.name, this.slug, super.image});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}
