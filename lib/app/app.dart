import 'package:fliggle/app/view/chat_screen.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_icons.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';
import 'package:fliggle/app/view/home_screen.dart';
import 'package:fliggle/app/view/profile_screen.dart';
import 'package:fliggle/app/view/search_screen.dart';
import 'package:flutter/material.dart';

enum NavigationTab {
  home,
  search,
  chat,
  profile;

  Widget get screen {
    switch (this) {
      case NavigationTab.home:
        return const HomeScreen();
      case NavigationTab.search:
        return const SearchScreen();
      case NavigationTab.chat:
        return const ChatScreen();
      case NavigationTab.profile:
        return const ProfileScreen();
    }
  }

  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.search:
        return 'Search';
      case NavigationTab.chat:
        return 'Chat';
      case NavigationTab.profile:
        return 'Profile';
    }
  }

  Widget getIcon(BuildContext context, {required bool isSelected}) {
    final color = FliggleColors.of(context).text;

    switch (this) {
      case NavigationTab.home:
        return isSelected
            ? FliggleIcons.homeSelected(color: color)
            : FliggleIcons.home(color: color);
      case NavigationTab.search:
        return isSelected
            ? FliggleIcons.searchSelected(color: color)
            : FliggleIcons.search(color: color);
      case NavigationTab.chat:
        return isSelected
            ? FliggleIcons.chatSelected(color: color)
            : FliggleIcons.chat(color: color);
      case NavigationTab.profile:
        return isSelected
            ? FliggleIcons.profileSelected(color: color)
            : FliggleIcons.profile(color: color);
    }
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();
  NavigationTab _currentTab = NavigationTab.home;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentTab = NavigationTab.values[index];
    });
  }

  void _onNavTap(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fliggle',
      theme: FliggleThemeData.lightTheme,
      darkTheme: FliggleThemeData.darkTheme,
      themeMode: ThemeMode.system, // 시스템 다크/라이트 따라감
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: NavigationTab.values.map((tab) => tab.screen).toList(),
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: FliggleColors.of(context).border,
                    width: 1,
                  ),
                ),
              ),
              child: Builder(
                builder: (context) {
                  return NavigationBar(
                    indicatorColor: Colors.transparent,
                    backgroundColor: FliggleColors.of(context).background,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    selectedIndex: _currentTab.index,
                    onDestinationSelected: _onNavTap,
                    destinations:
                        NavigationTab.values.map((tab) {
                          return NavigationDestination(
                            icon: tab.getIcon(
                              context,
                              isSelected: tab == _currentTab,
                            ),
                            tooltip: tab.label,
                            label: tab.label,
                          );
                        }).toList(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
