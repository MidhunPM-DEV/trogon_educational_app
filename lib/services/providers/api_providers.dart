// subject_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_app/model/module_model.dart';
import 'package:trogon_app/model/subject_model.dart';
import 'package:trogon_app/model/video_model.dart';
import 'package:trogon_app/services/api_services/api_services.dart';

final subjectProvider = FutureProvider<List<SubjectModel>>((ref) async {
  return await ApiServicess().getSubjects();
});

final moduleProvider = FutureProvider<List<ModuleModel>>((ref) async {
  return await ApiServicess().getModules();
});

final videoProvider = FutureProvider<List<VideoModel>>((ref) async {
  return await ApiServicess().getVideos();
});
