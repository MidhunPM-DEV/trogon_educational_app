import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_app/services/providers/api_providers.dart';
import 'package:trogon_app/views/pages/videopage/widgets/vimeo_player.dart';
import 'package:trogon_app/views/pages/videopage/widgets/youtube_player_widget.dart';

class VideoPage extends ConsumerWidget {
  final int moduleId;

  const VideoPage({super.key, required this.moduleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(videoProvider); // this returns a list

    return SafeArea(
      child: Scaffold(
        body: videos.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          data: (videos) {
            final matchedVideo = videos.firstWhere(
              (v) => v.id == moduleId,
              orElse: () => showError("Video not found"),
            );

            final url = matchedVideo.videoUrl;
            final type = matchedVideo.videoType;

            if (url == null || url.isEmpty || type == null || type.isEmpty) {
              return const Center(child: Text("Video URL is missing"));
            }

            if (type.toLowerCase() == "youtube") {
              return YoutubePlayerWidget(videoUrl: url);
            } else if (type.toLowerCase() == "vimeo") {
              return VimeoPlayerWidget(videoUrl: url);
            } else {
              return const Center(child: Text("Unsupported video type"));
            }
          },
        ),
      ),
    );
  }

  showError(String s) {}
}
