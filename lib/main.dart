import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'config/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  static const envText = String.fromEnvironment('TEST_VAR', defaultValue: 'def');
  static const envSome = String.fromEnvironment('ANDROID_SDK_ROOT', defaultValue: 'def');
  final platformText = Platform.environment['TEST_VAR'];

  List<String> pl = Platform.environment.entries.map((e) => '${e.key}: ${e.value}').toList();

  final dotEnvAText = dotenv.env['DOT_VAR_A'];
  final dotEnvBText = dotenv.env['DOT_VAR_B'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('env: $envText'),
              const Text('env some: $envSome'),
              Text('DOT_VAR_A: $dotEnvAText'),
              Text('DOT_VAR_B: $dotEnvBText'),
              Text('platform: $platformText'),
              const SizedBox(
                height: 20,
              ),
              ...pl.map((e) => Text(e)),
            ],
          ),
        ),
      ),
    );
  }
}
