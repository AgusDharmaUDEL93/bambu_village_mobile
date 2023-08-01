import 'package:flutter/material.dart';

import '../../models/location.dart';

class PopUpDiaglog extends StatelessWidget {
  const PopUpDiaglog({super.key, required this.tempatPariwisata});

  final TempatPariwisata tempatPariwisata;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                tempatPariwisata.nama,
                overflow: TextOverflow.fade,
                softWrap: false,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text(
                tempatPariwisata.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
