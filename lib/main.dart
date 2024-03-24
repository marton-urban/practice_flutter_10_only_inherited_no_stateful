// state_widget.dart StateInheritedWidget "of" method why needs to be dynamic???
// it doesn't need dynamic if  we use
// _StateWidgetState createState() instead of
// State<StateWidget> createState()
// but then we have lint warning.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/color_page.dart';
import 'page/counter_page.dart';
import 'widget/state_widget.dart';
import 'widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Inherited Widget';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: title,
              theme: ThemeData(
                scaffoldBackgroundColor:
                    StateInheritedWidget.of(context).state.backgroundColor,
                primaryColor: Colors.white,
              ),
              home: const MainPage(title: title),
            );
          },
        ),
      );
}

class MainPage extends StatelessWidget {
  final String title;

  const MainPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${StateInheritedWidget.of(context).state.counter}',
              style: const TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 47),
            ButtonWidget(
              text: 'Change Color',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ColorPage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Change Counter',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CounterPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
