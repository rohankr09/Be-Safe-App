import 'dart:async';

import 'package:besafe/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        actions: [
          ElevatedButton(
            child: Text("LogOut"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          )
        ],
      ),
      body: Center(
        child: GridView.count(
          // shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            padding: EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          
          children: [
            Container(
              child: TextButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)
                ),
                  onPressed: () {

                    Timer(Duration( seconds: 4), () {
                         FlutterRingtonePlayer.play(fromAsset:"assets/images/Police-Siren.mp3");
                     });
                      

                  },
                  icon: Icon(Icons.add_alert,
                  color: Colors.white,
                  ),
                  label: Text(
                      "SOS",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    
                  )
              ),
            ),
            Container(
              child: TextButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)
                  ),
                  onPressed: 

                    
                    ()async{
                      Uri phoneno = Uri.parse('tel:+91100');
                      if (await launchUrl(phoneno)) {
                          //dialer opened
                      }else{
                          //dailer is not opened
                      }
                    


                    // Navigator.pushNamed(context, "/emergency");
                  },
                  icon: Icon(Icons.call,
                    color: Colors.white,
                  ),
                  label: Text(
                      "Call Emergency Contact",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ),
            Container(
              child: TextButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/map");
                  
                  },
                  icon: Icon(Icons.location_on,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Share Live Location",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ),
            Container(
              child: TextButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.local_police,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Call Police",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ),
          ],
        ),

      ),
      floatingActionButton: Container(
        child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/record");
          },
          backgroundColor: Colors.blue,
          child: Text("Click here"),
        ),
      ),
      ),
    );
  }
}
