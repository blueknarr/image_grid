import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_grid/data/api/photo_api.dart';
import '../dto/photo_dto.dart';

class PhotoApiImpl implements PhotoApi {
  @override
  Future<List<PhotoDto>> getPhotos(int albumId) async {
    final http.Response response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    final json = jsonDecode(response.body) as List<dynamic>;
    final fromJson = json.map((e) => PhotoDto.fromJson(e)).toList();

    return fromJson;
  }
}
