import 'dart:async';

import 'package:assets/assets/resources.dart';
import 'package:flame/components.dart';
import 'package:flutter/gestures.dart';
import 'package:ui/src/game/entities/player/player.dart';

class Level extends World with HasGameReference{
  @override
  FutureOr<void> onLoad() async{
    final basketballCourt = PlatformImages.basketballCourt;

    final loadedBasketballCourt =  await game.images.load(basketballCourt);
  
    add(SpriteComponent(sprite:Sprite(loadedBasketballCourt ), priority: 1), );
    // hi
    return super.onLoad();
  }
}


