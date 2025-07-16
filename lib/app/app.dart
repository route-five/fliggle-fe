import 'package:flutter/material.dart';
import 'package:fliggle/app/view/auth/register/step_4.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF6C98FF), // primary
          secondary: Color(0xFF87A9F7), // secondary
          surface: Color(0xFFFFFFFF),
          onPrimary: Color(0xFF000000), // text
          onSecondary: Color(0xFF000000),
          onSurface: Color(0xFF000000),
          error: Color(0xFFF88787), // warning
          onError: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF497BEE), // primary (dark)
          secondary: Color(0xFF6C98FF), // secondary (dark)
          surface: Color(0xFF17161A),
          onPrimary: Color(0xFFFFFFFF), // text (dark)
          onSecondary: Color(0xFFFFFFFF),
          onSurface: Color(0xFFFFFFFF),
          error: Color(0xFFF88787), // warning (dark)
          onError: Colors.black,
        ),
      ),
      themeMode: ThemeMode.system, // 시스템 다크/라이트 따라감
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
