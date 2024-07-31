import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
        backgroundColor: Colors.amberAccent,
      ),
      body: const Center(child: Text("Achievements")),
    );
  }
}
