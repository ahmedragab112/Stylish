class UpdateProductModel {
  String? status;
  int? numOfCartItems;
  Data? data;

  UpdateProductModel({this.status, this.numOfCartItems, this.data});

  UpdateProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['numOfCartItems'] = numOfCartItems;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  Data(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['cartOwner'] = cartOwner;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['totalCartPrice'] = totalCartPrice;
    return data;
  }
}

class Products {
  int? count;
  String? sId;
  Product? product;
  int? price;

  Products({this.count, this.sId, this.product, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['_id'] = sId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['price'] = price;
    return data;
  }
}

class Product {
  List<Subcategory>? subcategory;
  String? sId;
  String? title;
  String? imageCover;
  Category? category;
  Category? brand;
  double? ratingsAverage;
  String? id;

  Product(
      {this.subcategory,
      this.sId,
      this.title,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? Category.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['imageCover'] = imageCover;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['ratingsAverage'] = ratingsAverage;
    data['id'] = id;
    return data;
  }
}

class Subcategory {
  String? sId;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

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

class Category {
  String? sId;
  String? name;
  String? slug;
  String? image;

  Category({this.sId, this.name, this.slug, this.image});

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
