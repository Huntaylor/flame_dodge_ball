import 'dart:async';

import 'package:assets/assets/resources.dart';
import 'package:flame/components.dart';

class Level extends World with HasGameReference {
  @override
  FutureOr<void> onLoad() async {
    final image = await game.images.load(PlatformImages.basketballCourt);

    add(SpriteComponent(sprite: Sprite(image), priority: 1));
    return super.onLoad();
  }
}
