import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  final data;
  final onTap;

  CityBox({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: GestureDetector(
          onTap: () {
            onTap(context, data);
          },
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    data['places'][0]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black]),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Text(
                  data['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
