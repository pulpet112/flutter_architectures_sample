// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';

void main() => runApp(ArchitecturesSampleApp());

class ArchitecturesSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.architecturesSampleApp,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Strings.architecturesSampleApp),
        ),
        body: Center(
          child: Text(Strings.architecturesSampleApp),
        ),
      ),
    );
  }
}