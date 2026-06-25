import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/grade_tracker_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<GradeTrackerProvider>(context);
    final subjects = provider.subjects;

    if (subjects.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withAlpha(51),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'No Subjects Tracked Yet',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You haven\'t added any subjects yet. Tap the button below to start tracking your grades.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => provider.setTabIndex(0),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add Your First Subject'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemCount: subjects.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          final subject = subjects[index];
          final isPassing = subject.mark >= 50;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Dismissible(
              key: ValueKey(subject),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.delete_sweep_rounded,
                  color: theme.colorScheme.onError,
                  size: 28,
                ),
              ),
              confirmDismiss: (direction) async {
                return true;
              },
              onDismissed: (direction) {
                provider.removeSubject(index);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${subject.name} removed'),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: 'Undo',
                      textColor: theme.colorScheme.primaryContainer,
                      onPressed: () {
                        // Insert back
                        provider.addSubject(subject);
                      },
                    ),
                  ),
                );
              },
              child: Card(
                elevation: theme.cardTheme.elevation,
                shape: theme.cardTheme.shape,
                color: theme.cardTheme.color,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subject.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_half_rounded,
                                  size: 16,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Score: ${subject.mark.toStringAsFixed(1)}/100',
                                  style: theme.textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  isPassing
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.cancel_outlined,
                                  size: 16,
                                  color: isPassing
                                      ? theme.colorScheme.secondary
                                      : theme.colorScheme.error,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  isPassing ? 'Passing' : 'Failing',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: isPassing
                                        ? theme.colorScheme.secondary
                                        : theme.colorScheme.error,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: isPassing
                              ? theme.colorScheme.secondaryContainer
                              : theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          subject.grade,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: isPassing
                                ? theme.colorScheme.onSecondaryContainer
                                : theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
