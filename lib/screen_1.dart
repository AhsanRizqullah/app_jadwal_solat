import 'dart:convert';
import 'package:app_jadwal_solat/model/ResponseJadwal.dart';
import 'package:app_jadwal_solat/public_variable.dart';
import 'package:app_jadwal_solat/screen1_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// ignore: camel_case_types
class Screen1 extends StatefulWidget {
  @override
  Screen1State createState() => Screen1State();
}

// ignore: camel_case_types
class Screen1State extends State<Screen1> {

  Future<ResponseJadwal> getJadwal({String location}) async {
    String url =
        'https://api.pray.zone/v2/times/today.json?city=$location&school=9';

    final response = await http.get(url);
    final jsonResponses = json.decode(response.body);

    return ResponseJadwal.fromJsonMap(jsonResponses);



  }

  @override
  void initState() {
    if (locationController.text.isEmpty || locationController.text == null) {
      locationController.text = 'jakarta';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var content1 = Stack(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height - 57,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.pink.withOpacity(0.2), BlendMode.luminosity),
              fit: BoxFit.cover,
              image: AssetImage('images/vector.jpg'),
            )),

            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: FutureBuilder(
                      future: getJadwal(
                          location: locationController.text
                              .toLowerCase()
                              .toString()),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return contentscreen1(snapshot.data);
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return Center(
                            child: Text(
                              'Data tak Tersedia',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
      ],
    );




    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(icon: const Icon(Icons.location_on, color: Colors.white,),onPressed: (){
            _showDialoqButton(context);
          });
        }),
      ),
      body: Column(
        children: <Widget>[content1],
      ),
    );
  }





  _showDialoqButton(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ubah lokasi'),
            content: TextField(
              controller: locationController,
              decoration: InputDecoration(hintText: 'masukkan lokasi'),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Batal")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, () {
                      setState(() {
                        getJadwal(
                            location: locationController.text
                                .toLowerCase()
                                .toString());
                      });
                    });
                  },
                  child: Text("Ok")),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          );
        });
  }
}
