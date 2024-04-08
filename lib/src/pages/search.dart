import 'package:devstravel/src/common/fonts.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, AppData appdata, child) => CustomScaffold(
        scaffoldKey: _scaffoldKey,
        customAppBar: CustomAppBar(
                context: context,
                scaffoldKey: _scaffoldKey,
                text: 'Buscar Cidade',
                search: false,
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
                  'Seja bem-vindo(a)',
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
