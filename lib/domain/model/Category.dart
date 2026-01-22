class Category {
  String? id;
  String? image;
  String? title;

  Category({this.id, this.image, this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
    };
  }

  List<Object?> get props => [id, image, title];
}
