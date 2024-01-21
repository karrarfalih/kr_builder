import 'package:flutter/material.dart';
import 'package:kr_builder/kr_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'kr_builder example',
      home: ExamplePage(),
    );
  }
}


class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: KrFutureBuilder<String>(
          future: Future.delayed(const Duration(seconds: 2), () => 'Hello World'),
          builder: (data) => Text(data),
          onLoading: const CircularProgressIndicator(),
          onError: (error) => Text('Error: $error'),
          onEmpty: const Text('No Data'),
          shimmerSize: const Size(100, 50),
        ),
      ),
    );
  }
}