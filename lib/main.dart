import 'package:adaptive_theme_extension/theme/app_colors.dart';
import 'package:adaptive_theme_extension/theme/text_roles.dart';
import 'package:adaptive_theme_extension/theme/typography_tokens.dart';
import 'package:flutter/material.dart';

import 'theme/adaptive_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _mode = (_mode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdaptiveTheme(
        themeMode: _mode,
        child: HomeScreen(onToggleTheme: _toggleTheme),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ComponentRoleStyles styles ;

  @override
  void didChangeDependencies() {
    AppColors  c = Theme.of(context).extension<AppColors>()!;
    AppTypographyTokens   t = Theme.of(context).extension<AppTypographyTokens>()!;
    super.didChangeDependencies();
    styles = ComponentRoleStyles(colors:c,tokens: t, buildContext: context );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Adaptive Theme', style: styles.navigationTitleTextStyle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Body Medium', style: styles.bodyMediumTextStyle),
          const SizedBox(height: 8),
          Text('Title Large', style: styles.titleLargeTextStyle),
          const SizedBox(height: 8),
          Text('Headline Medium', style: styles.headlineLargeTextStyle),
          const SizedBox(height: 8),
          Text('Display Small', style: styles.displayMediumTextStyle),
          const SizedBox(height: 8),
          Text('Caption', style: styles.captionTextStyle),
          const SizedBox(height: 24),
          TextField(decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated', style: styles.buttonTextStyle)),
            FilledButton(onPressed: () {}, child: Text('Filled', style: styles.buttonTextStyle)),
            OutlinedButton(onPressed: () {}, child: Text('Outlined', style: styles.actionTextStyle)),
            TextButton(onPressed: widget.onToggleTheme, child: Text('Toggle Theme', style: styles.actionTextStyle)),
          ]),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: Text('Card Title', style: styles.titleMediumTextStyle),
              subtitle: Text('Card subtitle', style: styles.bodySmallTextStyle),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 24),
          Row(children: const [Checkbox(value: true, onChanged: null), SizedBox(width: 8), Text('Checkbox')]),
          Row(children: const [Radio(value: 1, groupValue: 1, onChanged: null), SizedBox(width: 8), Text('Radio')]),
          Row(children: const [Switch(value: true, onChanged: null), SizedBox(width: 8), Text('Switch')]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
      floatingActionButton: const FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
    );
  }
}
