import 'dart:convert';
import 'package:app_jadwal_solat/public_variable.dart';
import 'package:app_jadwal_solat/screen2_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/ResponseJadwal.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  Future<ResponseJadwal> getJadwal({String location}) async {
    String url =
        'https://api.pray.zone/v2/times/today.json?city=$location&school=9';

    final response = await http.get(url);
    final jsonResponses = json.decode(response.body);

    return ResponseJadwal.fromJsonMap(jsonResponses);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(icon: const Icon(Icons.schedule, color: Colors.white,),onPressed: (){
          });
        }),
      ),
      backgroundColor: Colors.black87,
      body: Container(
        child: Expanded(
            child: FutureBuilder(
              future: getJadwal(
                  location: locationController.text.toString().toLowerCase()),
              builder: (context, snapshot) {

                if(snapshot.hasData){
                  return Content(snapshot.data);
                }else if(snapshot.hasError){
                  print(snapshot.error);
                }

                return Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()));
              },
            )),
      ),
    );
  }
}
