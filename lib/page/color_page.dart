import 'package:flutter/material.dart';
import '/main.dart';
import '/widget/state_widget.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyColorButton(Colors.red),
                  MyColorButton(Colors.orange),
                  MyColorButton(Colors.greenAccent),
                  MyColorButton(Colors.indigo),
                ],
              ),
            ),
          ),
        ),
      );
}

class MyColorButton extends StatelessWidget {
  final Color color;

  const MyColorButton(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 0),
        onPressed: () {
          final provider = StateInheritedWidget.of(context);
          final newState = provider.setColor(color);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => StateInheritedWidget(
                      state: newState, child: provider.child)));
        },
        child: Container(height: 100),
      ),
    );
  }
}
