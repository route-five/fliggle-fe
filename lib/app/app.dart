import 'package:fliggle/app/view/chat_screen.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_icons.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';
import 'package:fliggle/app/view/home_screen.dart';
import 'package:fliggle/app/view/profile_screen.dart';
import 'package:fliggle/app/view/search_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
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
          children: _screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: FliggleColors.of(context).border,
                width: 1,
              ),
            ),
          ),
          child: NavigationBar(
            indicatorColor: Colors.transparent,
            backgroundColor: FliggleColors.of(context).background,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _currentIndex,
            onDestinationSelected: _onNavTap,
            destinations: [
              NavigationDestination(
                icon:
                    _currentIndex == 0
                        ? FliggleIcons.homeSelected(
                          color: FliggleColors.of(context).text,
                        )
                        : FliggleIcons.home(
                          color: FliggleColors.of(context).text,
                        ),
                tooltip: 'Home',
                label: 'Home',
              ),
              NavigationDestination(
                icon:
                    _currentIndex == 1
                        ? FliggleIcons.searchSelected(
                          color: FliggleColors.of(context).text,
                        )
                        : FliggleIcons.search(
                          color: FliggleColors.of(context).text,
                        ),
                tooltip: 'Search',
                label: 'Search',
              ),
              NavigationDestination(
                icon:
                    _currentIndex == 2
                        ? FliggleIcons.chatSelected(
                          color: FliggleColors.of(context).text,
                        )
                        : FliggleIcons.chat(
                          color: FliggleColors.of(context).text,
                        ),
                tooltip: 'Chat',
                label: 'Chat',
              ),
              NavigationDestination(
                icon:
                    _currentIndex == 3
                        ? FliggleIcons.profileSelected(
                          color: FliggleColors.of(context).text,
                        )
                        : FliggleIcons.profile(
                          color: FliggleColors.of(context).text,
                        ),

                tooltip: 'Profile',
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
