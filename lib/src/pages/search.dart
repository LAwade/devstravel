import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var list = [];

  void doSearch(context, text) async {
    var newList =
        await Provider.of<AppData>(context, listen: false).searchCity(text);

    setState(() {
      list = newList;
    });
  }

  cityBoxAction(context, data, index) {
    Navigator.pushNamed(context, '/city', arguments: data);
  }

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
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  doSearch(context, value);
                },
                decoration: const InputDecoration(
                    hintText: 'Digite o nome da cidade',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                list.length,
                (index) {
                  return CityBox(
                    data: list[index],
                    onTap: cityBoxAction,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
