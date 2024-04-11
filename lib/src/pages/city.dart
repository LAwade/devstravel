import 'package:devstravel/src/common/fonts.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final city =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final bottomBarHeight = MediaQuery.of(context).padding.bottom;

    final stars = double.parse(city['review']);

    return Consumer<AppData>(builder: (context, AppData appdata, child) {
      bool heart = appdata.hasFavorite(city['name']);
      return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
              child: Image.network(
                city['places'][0]['img'],
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 220),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  city['name'],
                                  style: FontesApp.textMedium,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      stars > 0.1 && stars < 0.9
                                          ? Icons.star_half
                                          : (stars < 0
                                              ? Icons.star_border
                                              : Icons.star),
                                      color: stars > 0.1
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      stars > 1.0 && stars < 1.9
                                          ? Icons.star_half
                                          : (stars < 1
                                              ? Icons.star_border
                                              : Icons.star),
                                      color: stars > 1.1
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Icon(
                                        stars > 2.0 && stars < 2.9
                                            ? Icons.star_half
                                            : (stars < 2
                                                ? Icons.star_border
                                                : Icons.star),
                                        color: stars > 2.1
                                            ? Colors.blue
                                            : Colors.grey),
                                    Icon(
                                      stars > 3.0 && stars < 3.9
                                          ? Icons.star_half
                                          : (stars < 3
                                              ? Icons.star_border
                                              : Icons.star),
                                      color: stars > 3.1
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      stars > 4.0 && stars < 4.9
                                          ? Icons.star_half
                                          : (stars < 4
                                              ? Icons.star_border
                                              : Icons.star),
                                      color: stars > 4.1
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text(city['review'])
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  heart = appdata.favorite(city['name']);
                                });
                              },
                              icon: Icon(
                                heart ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, left: 15, right: 15, bottom: 10),
                        child: Text(city['description'],
                            style: FontesApp.textXsmall),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          'PRINCIPAIS PONTOS TURÍSTICOS',
                          style: FontesApp.textXsmall,
                        ),
                      ),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        padding: EdgeInsets.only(bottom: bottomBarHeight),
                        childAspectRatio: 10 / 11,
                        children: List.generate(city['places'].length, (index) {
                          return Column(
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      city['places'][index]['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  city['places'][index]['name'],
                                  style: FontesApp.textSmall,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Ponto Turístico',
                                  style: FontesApp.textXsmallNormal,
                                ),
                              ),
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(top: statusBarHeight, left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.white10,
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
