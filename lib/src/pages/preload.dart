import 'package:devstravel/src/common/images.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  State<PreloadPage> createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();
    if (!req) {
      setState(() {
        loading = false;
      });
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImagesApp.preLoad,
            loading
                ? Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'Carregando informações ...',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Container(),
            loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xFF3DA642),
                    ),
                  )
                : Container(),
            !loading
                ? ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tentar Novamente'),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
