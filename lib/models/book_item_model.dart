final class BookModel {
  final String id;
  final String selfLink;
  final BookInfoModel bookInfo;

  BookModel({required this.id, required this.selfLink, required this.bookInfo});
  factory BookModel.fromJson(Map<String, dynamic> json) {
    print("hai");
    return BookModel(
      id: json['id'],
      selfLink: json['selfLink'],
      bookInfo: BookInfoModel.fromJson(json['volumeInfo']),
    );
  }
}

final class BookInfoModel {
  final String title;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final double? averageRating;
  final String previewLink;
  final BookImagesModel? images;

  BookInfoModel({
    required this.title,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    this.averageRating,
    required this.previewLink,
    required this.images,
  });
  factory BookInfoModel.fromJson(Map<String, dynamic> json) {
    return BookInfoModel(
      title: json['title'],
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      pageCount: json['pageCount'],
      averageRating: double.tryParse(json['averageRating'].toString()),
      previewLink: json['previewLink'],
      images:json['imageLinks'] ==null?null: BookImagesModel.fromJson(json['imageLinks']??{}),
    );
  }
}

final class BookImagesModel {
  final String? smallThumbnail;
  final String thumbnail;

  BookImagesModel(this.smallThumbnail, this.thumbnail);
  factory BookImagesModel.fromJson(Map<String, dynamic> json) {
    return BookImagesModel(
      json['smallThumbnail'],
      json['thumbnail'],
    );
  }
}
