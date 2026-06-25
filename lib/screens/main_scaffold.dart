import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/grade_tracker_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GradeTrackerProvider>(context);

    final List<Widget> screens = [
      const AddSubjectScreen(),
      const SubjectListScreen(),
      const SummaryScreen(),
    ];

    final List<String> titles = [
      'Add New Subject',
      'Subject List',
      'Performance Summary',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[provider.currentTabIndex]),
        actions: [
          IconButton(
            icon: Icon(
              provider.isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
            tooltip: 'Toggle Theme',
            onPressed: provider.toggleTheme,
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: screens[provider.currentTabIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentTabIndex,
        onTap: provider.setTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            activeIcon: Icon(Icons.add_circle_rounded),
            label: 'Add Subject',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            activeIcon: Icon(Icons.list_alt_rounded),
            label: 'Subject List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            activeIcon: Icon(Icons.analytics_rounded),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}
