import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/colors_code.dart';

class SerchPage extends StatefulWidget {
  const SerchPage({Key? key}) : super(key: key);

  @override
  State<SerchPage> createState() => _HomeState();
}

class _HomeState extends State<SerchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorsCode.primary_color,
            bottomOpacity: 0.0,
            elevation: 0.0,

          ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {}, child: Icon(Icons.navigation)),
        body:Container(child: Column(children: [],),)
      ),
    );
  }
}
