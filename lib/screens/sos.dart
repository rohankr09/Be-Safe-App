import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class SOS_Screen extends StatefulWidget {
  const SOS_Screen({Key? key}) : super(key: key);

  @override
  State<SOS_Screen> createState() => _SOS_ScreenState();
}

class _SOS_ScreenState extends State<SOS_Screen> {


  /// This has to happen only once per app
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     FlutterRingtonePlayer.play(fromAsset:"assets/images/Police-Siren.mp3");
  }


  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Text(
          "SOS Screen",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
