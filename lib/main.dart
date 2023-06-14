import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primaryColorDark: const Color(0xFF333333),
        primaryColorLight: const Color(0xFFFFFFFF), 
        hintColor: const Color(0xFF237F80),
        focusColor: const Color(0xFFF88155),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
    const Home({super.key});

    @override
    Widget build(BuildContext context){
        return SafeArea(child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).hintColor,
                title: const Text("shiz")
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Theme.of(context).primaryColorDark,
                  child: const Center(child: Text('Entry A')),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Theme.of(context).primaryColorLight,
                  child: const Center(child: Text('Entry B')),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Theme.of(context).primaryColorDark,
                  child: const Center(child: Text('Entry C')),
                ),
              ],
            ),
        )
    );
    }
}
