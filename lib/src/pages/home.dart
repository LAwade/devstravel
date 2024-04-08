import 'package:devstravel/src/common/images.dart';
import 'package:devstravel/src/common/fonts.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, AppData appdata, child) => CustomScaffold(
        scaffoldKey: _scaffoldKey,
        customAppBar: CustomAppBar(
                context: context,
                scaffoldKey: _scaffoldKey,
                text: 'Página Home',
                search: true,
                drawer: true)
            .getAppBar(),
        customDrawer: CustomDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Bem vindo(a) ao',
                  style: FontesApp.textSmall,
                ),
              ),
              ImagesApp.preLoad,
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Seu guia de viagem perfeito',
                  style: FontesApp.textSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
