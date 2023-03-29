import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class Emergency extends StatefulWidget{
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> { 

  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
          appBar: AppBar(
            title: Text("Open Phone Dialer"),
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            padding: EdgeInsets.only(top:20, left:20, right:20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                 ElevatedButton(
                  onPressed: ()async{
                      Uri phoneno = Uri.parse('tel:+91100');
                      if (await launchUrl(phoneno)) {
                          //dialer opened
                      }else{
                          //dailer is not opened
                      }
                  }, 
                  child: Text("Call Us Now")
                )
            ],)
          )
       );
  }
}