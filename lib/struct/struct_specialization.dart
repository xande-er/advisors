import 'package:advisors/model/model_specialization.dart';

structSpecialization({required data}) {
  ModelSpecialization modelSpecialization = ModelSpecialization();

  List<String> tag = [];

  if (data['tagsList'] != null) {
    for (final i in data['tagsList']) {
      tag.add(i);
    }
  }

  modelSpecialization.id = data['id'];
  modelSpecialization.title = data['title'];
  modelSpecialization.viewsCount = data['viewsCount'];
  modelSpecialization.questionType = data['questionType'];
  modelSpecialization.authorId = data['authorId'];
  modelSpecialization.coverImage = data['coverImage'];
  modelSpecialization.media = data['media'];
  modelSpecialization.authorName = data['authorName'];
  modelSpecialization.authorPhoto = data['authorPhoto'];
  modelSpecialization.isSubscribed = data['isSubscribed'];
  modelSpecialization.tagsList = tag;
  modelSpecialization.responseCreated = data['responseCreated'];

  return modelSpecialization;
}
