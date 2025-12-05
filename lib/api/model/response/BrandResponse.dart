import 'package:ecommerce_app/domain/model/Brand.dart';

class BrandResponse {
  BrandResponse({
      this.results, 
      this.metadata, 
      this.data,});

  BrandResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? paginatioInfo.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDto.fromJson(v));
      });
    }
  }
  num? results;
  paginatioInfo? metadata;
  List<BrandDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BrandDto {
  BrandDto({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  BrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  Brand toBrand(){
    return Brand(
      id: id,
      name: name,
      image: image,

    );
  }

}

class paginatioInfo {
  paginatioInfo({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,});

  paginatioInfo.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}