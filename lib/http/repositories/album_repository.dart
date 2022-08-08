import '../../models/album_model/album_model.dart';
import '../dio.dart';

class AlbumRepository {
  static Future<List<AlbumModel>> getAlbums({
    required int userId,
  }) async {
    final response = await dio.get(
      '/albums',
      queryParameters: {
        "userId": userId,
      },
    );
    if (response.statusCode == 200) {
      List<AlbumModel> albums = [];
      response.data
          .map((json) => albums.add(AlbumModel.fromJson(json)))
          .toList();
      return albums;
    } else {
      throw Exception("error");
    }
  }
}
