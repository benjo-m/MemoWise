import 'package:flutter/material.dart';
import 'package:mobile/achievements_page.dart';
import 'package:mobile/decks_page.dart';
import 'package:mobile/settings_page.dart';
import 'package:mobile/stats_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.amber[100],
        indicatorColor: Colors.amberAccent,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.view_agenda),
            label: 'Decks',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.stars),
            label: 'Achievements',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
      body: <Widget>[
        const DecksPage(),
        const StatsPage(),
        const AchievementsPage(),
        const SettingsPage(),
      ][currentPageIndex],
    );
  }
}
