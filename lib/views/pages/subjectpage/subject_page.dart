import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trogon_app/services/providers/api_providers.dart';
import 'package:trogon_app/views/pages/subjectpage/widgets/subject_card_widget.dart';
import 'package:trogon_app/views/pages/subjectpage/widgets/subject_page_header_widget.dart';

class SubjectPage extends ConsumerWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(subjectProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header Section
          const SliverToBoxAdapter(
            child: SubjectPageHeaderWidget(),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          subjectsAsync.when(
            loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator())),
            error: (error, stackTrace) =>
                SliverToBoxAdapter(child: Center(child: Text('Error: $error'))),
            data: (subjects) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final subject = subjects[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: InkWell(
                        onTap: () => context.pushNamed('modules',
                            pathParameters: {'title': subject.title}),
                        child: SubjectCardWidget(subject: subject),
                      ));
                },
                childCount: subjects.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
