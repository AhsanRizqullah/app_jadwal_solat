import 'package:app_jadwal_solat/model/ResponseJadwal.dart';
import 'package:app_jadwal_solat/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class contentscreen1 extends StatelessWidget {
  ResponseJadwal respon;

  contentscreen1(this.respon);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
          children: <Widget>[
            Text(respon.results.location.city, style: styleCityHeader),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20.0,
                ),
                SizedBox(width: 20.0,),
                Text(
                  respon.results.location.country,
                  style: styleAdressHeader,
                ),
              ],
            ),
          ],
        ),


      );
  }
}

