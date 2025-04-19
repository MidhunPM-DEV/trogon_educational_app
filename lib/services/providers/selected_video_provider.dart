import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_app/model/video_model.dart';

final selectedVideoProvider = StateProvider<VideoModel?>((ref) => null);
