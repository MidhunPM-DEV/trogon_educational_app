import 'package:flutter/material.dart';
import 'package:trogon_app/model/subject_model.dart';

class SubjectCardWidget extends StatelessWidget {
  const SubjectCardWidget({
    super.key,
    required this.subject,
  });

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              // API Image
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  subject.image,
                  width: 120,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(width: 12),

              // Title and Description
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title text with ellipsis for overflow
                      Text(
                        subject.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis, // Avoid overflow here
                        maxLines: 1, // Limit title to 1 line
                      ),
                      const SizedBox(height: 8),
                      // Description text with overflow handling
                      Expanded(
                        child: Text(
                          subject.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3, // Limit the description to 3 lines
                          overflow: TextOverflow
                              .ellipsis, // Truncate with ellipsis if overflow
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
