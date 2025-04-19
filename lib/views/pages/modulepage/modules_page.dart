import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trogon_app/services/providers/api_providers.dart';
import 'package:trogon_app/views/pages/modulepage/widgets/module_card_widget.dart';

class ModulesPage extends ConsumerWidget {
  final String title;
  const ModulesPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchmodules = ref.watch(moduleProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => context.go('/'),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Modules",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          fetchmodules.when(
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Text(error.toString()),
              ),
            ),
            data: (modules) => fetchmodules.when(
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text(error.toString())),
              ),
              data: (modules) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final module = modules[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: InkWell(
                        onTap: () {
                          context.goNamed('video');
                        },
                        child: ModuleCardWidget(module: module),
                      ),
                    );
                  },
                  childCount: modules.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
