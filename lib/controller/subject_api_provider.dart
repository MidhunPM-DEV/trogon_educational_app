import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trogon_app/model/subject_model.dart';
import 'package:trogon_app/services/api_services/api_services.dart';

part 'subject_api_provider.g.dart';

@riverpod
class SubjectProvider extends _$SubjectProvider {
  final _api = ApiServicess(); // Directly use the class here

  @override
  Future<List<SubjectModel>> build() async {
    return _api.getSubjects(); // No need to read a provider
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _api.getSubjects());
  }
}
