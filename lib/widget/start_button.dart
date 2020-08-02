import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartButton extends AnimatedWidget {
  final AnimationController buttonAnimationController;
  final Function onTap;

  StartButton({@required this.buttonAnimationController, @required this.onTap})
      : super(listenable: buttonAnimationController);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onLongPress: () {},
        onTap: () {
          buttonAnimationController.forward();
          playLocalAsset();
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Color(0xff29304D),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff2573D5),
                    blurRadius: 4,
                    offset: buttonAnimationController
                        .drive(Tween<Offset>(
                            begin: Offset(0, 8), end: Offset(0, 0)))
                        .value)
              ]),
          width: size.width * 0.4,
          height: size.width * 0.4,
          child: Center(
            child: Image(
              width: size.width * 0.3,
              height: size.width * 0.3,
              image: AssetImage("assets/images/mustang.png"),
            ),
          ),
        ),
      ),
    );
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("audio/car_start.mp3");
  }
}
