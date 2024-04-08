import 'package:devstravel/src/common/fonts.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  final String text;
  final bool search;
  final bool drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext context;

  CustomAppBar({
    required this.scaffoldKey,
    required this.context,
    required this.text,
    this.search = true,
    this.drawer = true,
  });

  AppBar getAppBar() {
    return AppBar(
      title: Text(
        text,
        style: FontesApp.textMedium,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: drawer
          ? IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
              color: Colors.black,
              iconSize: 30,
            )
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      actions: [
        search
            ? IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/search');
                },
                icon: const Icon(Icons.search),
                color: Colors.black,
                iconSize: 30,
              )
            : Container()
      ],
    );
  }
}
