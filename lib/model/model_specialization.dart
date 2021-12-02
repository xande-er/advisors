class ModelSpecialization {
  int? id;
  String? title;
  int? viewsCount;
  String? questionType;
  DateTime? createDate;
  int? authorId;
  String? coverImage;
  String? media;
  String? authorName;
  String? authorPhoto;
  bool? isSubscribed;
  List<String>? tagsList;
  bool? responseCreated;

  ModelSpecialization(
      {this.id,
      this.title,
      this.authorId,
      this.authorName,
      this.authorPhoto,
      this.coverImage,
      this.createDate,
      this.isSubscribed,
      this.media,
      this.questionType,
      this.responseCreated,
      this.tagsList,
      this.viewsCount});
}
