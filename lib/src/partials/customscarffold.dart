import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final AppBar customAppBar;
  final CustomDrawer customDrawer;
  final Widget body;

  CustomScaffold(
      {required this.scaffoldKey,
      required this.customAppBar,
      required this.customDrawer,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: customAppBar,
      drawer: customDrawer,
      body: body,
    );
  }
}
