// subject_api.dart
import 'package:dio/dio.dart';
import 'package:trogon_app/model/module_model.dart';
import 'package:trogon_app/model/subject_model.dart';

import 'dart:convert';

import 'package:trogon_app/model/video_model.dart';

class ApiServicess {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://trogon.info/interview/php/api'),
  );

  Future<List<SubjectModel>> getSubjects() async {
    try {
      final response = await dio.get('/subjects.php');

      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;

        if (data is List) {
          return data.map((e) => SubjectModel.fromJson(e)).toList();
        } else {
          throw Exception("Expected a list but got: $data");
        }
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<List<ModuleModel>> getModules() async {
    try {
      final response = await dio.get('/modules.php');

      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;

        if (data is List) {
          return data.map((e) => ModuleModel.fromJson(e)).toList();
        } else {
          throw Exception("Expected a list but got: $data");
        }
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<List<VideoModel>> getVideos() async {
    try {
      final response = await dio.get('/videos.php');

      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;

        if (data is List) {
          return data.map((e) => VideoModel.fromJson(e)).toList();
        } else {
          throw Exception("Expected a list but got: $data");
        }
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }
}
