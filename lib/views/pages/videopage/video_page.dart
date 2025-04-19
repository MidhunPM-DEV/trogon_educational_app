import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_app/services/providers/selected_video_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends ConsumerWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final video = ref.watch(selectedVideoProvider);

    if (video == null) {
      return const Scaffold(body: Center(child: Text("No video selected")));
    }

    if (video.videoType == 'YouTube') {
      return Scaffold(
        appBar: AppBar(title: Text(video.title)),
        body: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(video.videoUrl)!,
            flags: const YoutubePlayerFlags(autoPlay: true),
          ),
          showVideoProgressIndicator: true,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(video.title)),
        body: WebViewWidget(
            controller: WebViewController()
              ..loadRequest(Uri.parse(video.videoUrl))),
      );
    }
  }
}
