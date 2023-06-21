import 'package:flutter/material.dart';
import 'package:example/src/custom_radio_list_group.dart';
import 'package:example/src/gender_radio_group.dart';
import 'package:example/src/modal_bottom_sheet_radio_group.dart';
import 'package:example/src/radio_list_group.dart';
import 'package:flutter/cupertino.dart';

/// Main Function
void main() {
  /// Initializing the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Radio Group',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Custom Radio Group"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          /// Modal Bottom Sheet radio Group
          ModalBottomSheetRadioGroup(),
          SizedBox(height: 24,),
          /// Gender Radio Group
          GenderRadioGroup(),
          SizedBox(height: 24,),
          /// Radio List Tile
          RadioListGroup(),
          SizedBox(height: 24,),
          /// Custom Radio List Group
          CustomRadioListGroup()
        ],
      ),
    );
  }
}