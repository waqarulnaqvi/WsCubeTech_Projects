import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app_ui_homework/features/model/curated_photos.dart';
import 'package:wallpaper_app_ui_homework/features/model/photo.dart';
import 'package:wallpaper_app_ui_homework/features/model/search_by_photos.dart';

class ApiServices {
  ApiServices._privateConstructor();

  static final ApiServices _instance = ApiServices._privateConstructor();

  factory ApiServices() {
    return _instance;
  }

  static final String baseUrl = "https://api.pexels.com/v1";

  Future<List<SearchByPhotos>> searchByPhotos(
      {required String searchQuery}) async {
    try {
      final String url = '$baseUrl/search?query=$searchQuery';

      final http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization":
        "nxknNI8Pu7cf4y8H92mW2LKM5DlPugRZasas0VkM1eWPI6YbHwLj8ys7"
      });
      // print('Response URL: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print('Response data Search By Photos: ${response.body}');


        final List photos = data['photos'] as List;

        // print('Response data Search By Photos: ${response.body}');
        return photos.map((photo) => SearchByPhotos.fromJson(photo)).toList();
      } else {
        // print('Failed to load photos: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return [];
  }

  Future<Photo?> getPhotoDetails({required String photoId}) async {
    try {
      final String url = '$baseUrl/photos/2014$photoId';

      final http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "nxknNI8Pu7cf4y8H92mW2LKM5DlPugRZasas0VkM1eWPI6YbHwLj8ys7"
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);


        return Photo.fromJson(data);

// Handle the response data
//         print('Response data: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  Future<CuratedPhotos?> getCuratedPhoto() async {
    try {
      final String url = '$baseUrl/curated';

      final http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "nxknNI8Pu7cf4y8H92mW2LKM5DlPugRZasas0VkM1eWPI6YbHwLj8ys7"
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return CuratedPhotos.fromJson(data);
// Handle the response data
//         print('Response data: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }
}
