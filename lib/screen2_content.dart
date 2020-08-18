import 'package:app_jadwal_solat/style.dart';
import 'package:flutter/material.dart';
import 'model/ResponseJadwal.dart';

class Content extends StatelessWidget {
  ResponseJadwal data;

  Content(this.data);


//  List<String> gambar = [
//    'images/subuh.jpg',
//    'images/siang.jpg',
//    'images/sore.jpg',
//    'images/petang.jpg',
//    'images/malam.jpg',
//  ];


  Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Container(
        width: 800,
        height: 200,
        child: Stack(
          children: <Widget>[
        Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.luminosity),
          image: AssetImage('images/malam.jpg'),
        ),
      ),
    ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(waktu,
                    style: bigHeaderTextStyle,
                  ),
                  Container(
                    height: 2.0,
                    width: 80.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  Text(jam,
                    style: bigHeaderTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        containerWaktu(
            "Subuh", data.results.datetime[0].times.Fajr.toUpperCase()),
        containerWaktu(
            "Dzuhur", data.results.datetime[0].times.Dhuhr.toUpperCase()),
        containerWaktu(
            "Ashar", data.results.datetime[0].times.Asr.toUpperCase()),
        containerWaktu(
            "Maghrib", data.results.datetime[0].times.Maghrib.toUpperCase()),
        containerWaktu(
            "Isya", data.results.datetime[0].times.Isha.toUpperCase()),
      ],
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');

final bigHeaderTextStyle =
baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);

