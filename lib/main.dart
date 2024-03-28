// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Title',
      home: const ComboBoxDemo(),
      routes: {
        TestScreen.routeName: (ctx) => const TestScreen(),
      },
    ),
  );
}

class ComboBoxDemo extends StatefulWidget {
  const ComboBoxDemo({super.key});

  @override
  State<ComboBoxDemo> createState() => _ComboBoxDemoState();
}

class _ComboBoxDemoState extends State<ComboBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context)
              .pushNamed(TestScreen.routeName, arguments: "some arg")
              .then((value) => setState(() {})),
          child: const Text('press me'),
        ),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  static const routeName = '/route';

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building new screen!');
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(body: SfPdfViewer.asset('assets/radio.pdf'));
  }
}
