import 'package:finance_app/pages/home_page.dart';
import 'package:finance_app/pages/settings_page.dart';
import 'package:finance_app/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
//?
//?
//? NIKHIL KUMAR
//?
//? Software Engineer
//?
//? @flutter.fury
//?
//?
//?
//?
//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isDark =
      (await SharedPreferences.getInstance()).getBool('isDark') ?? true;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(isDark: isDark),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedIndex = 0;
  final destinationViews = [
    const HomePage(),
    const SizedBox(),
    const SizedBox(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData.getTheme(),
      home: Scaffold(
        body: destinationViews[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: Colors.white,
          destinations: [
            NavigationDestination(
              tooltip: "Home",
              selectedIcon: Icon(
                IconlyBold.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: Icon(
                IconlyLight.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                IconlyBold.wallet,
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: Icon(
                IconlyLight.wallet,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "Wallet",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                IconlyBold.graph,
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: Icon(
                IconlyLight.graph,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "Statistics",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                IconlyBold.setting,
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: Icon(
                IconlyLight.setting,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

// class NavigationItem extends StatelessWidget {
//   final Icon icon;
//   final String
//   const NavigationItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
