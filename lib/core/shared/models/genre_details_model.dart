import 'package:music_app/core/shared/models/genre_model.dart';
import 'package:music_app/core/shared/models/music_model.dart';

class GenreDetailsModel extends GenreModel {
  //Lista de musicas do gênero
  final List<MusicModel> musics;

  GenreDetailsModel(
      {required super.title,
      required super.searchString,
      super.img,
      required this.musics});

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailsModel(
        title: map['title'] ?? '',
        searchString: map['searchString'] ?? '',
        img: map['img'] ?? '',
        musics: (map['musics'] as List)
            .map((e) => MusicModel.fromJson(e))
            .toList());
  }
}
