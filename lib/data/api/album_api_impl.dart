import 'dart:convert';

import 'package:http/http.dart' as http;
import '../dto/album_dto.dart';
import 'album_api.dart';

class AlbumApiImpl implements AlbumApi {
  @override
  Future<List<AlbumDto>> getAlbums() async {
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    /// List<dynamic>
    final json = jsonDecode(response.body) as List<dynamic>;
    final fromJson = json.map((e) => AlbumDto.fromJson(e)).toList();

    return fromJson;
  }
}
