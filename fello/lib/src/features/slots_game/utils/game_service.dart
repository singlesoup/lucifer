import 'dart:math';

import 'package:just_audio/just_audio.dart';

/// Get One chance to spin
///
/// Random number from the items list will be generated for the images
/// and if all three images matches you have won the jackpot
/// otherwise you loose.
///

class GameService {
  final _player = AudioPlayer();
  var items = [
    "gfx-bell.png",
    "gfx-cherry.png",
    "gfx-coin.png",
    "gfx-grape.png",
    "gfx-seven.png",
    "gfx-strawberry.png"
  ];
  var reels = [0, 1, 2];

  spin() {
    playSound('spin');
    reels = List.generate(
      3,
      (_) => Random().nextInt(items.length),
    );
    if (reels[0] == reels[1] && reels[0] == reels[2]) {
      playSound('win');
      return 'WIN';
    } else {
      playSound('game-over');
      return 'GAME END';
    }
  }

  playSound(soundname) async {
    await _player.setAsset('assets/Sounds/$soundname.mp3');
    _player.play();
  }
}
