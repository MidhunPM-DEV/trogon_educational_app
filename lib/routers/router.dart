import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trogon_app/views/pages/modulepage/modules_page.dart';
import 'package:trogon_app/views/pages/subjectpage/subject_page.dart';
import 'package:trogon_app/views/pages/videopage/video_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const SubjectPage(),
      ),
      GoRoute(
        path: '/modules/:title',
        name: 'modules',
        builder: (context, state) {
          final title = state.pathParameters['title'];
          return ModulesPage(title: title!);
        },
      ),
      GoRoute(
        path: '/videos/:moduleId',
        name: 'video',
        builder: (context, state) {
          final moduleId = state.pathParameters['moduleId'];
          return VideoPage(
            moduleId: int.parse(moduleId!),
          );
        },
      ),
    ],
  );
});
