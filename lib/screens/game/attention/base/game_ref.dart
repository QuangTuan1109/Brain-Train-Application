import 'package:flame/components.dart';
import 'package:flutter_application_1/screens/game/attention/game/game_main.dart';
import 'package:flutter_application_1/screens/game/attention/game/game_main copy.dart';

mixin GameRef<T extends GameMain> on Component {
  T? _gameRef;

  T get gameRef {
    if (_gameRef == null) {
      var c = parent;
      while (c != null) {
        if (c is HasGameRef<T>) {
          _gameRef = c.gameRef;
          return _gameRef!;
        } else if (c is T) {
          _gameRef = c;
          return c;
        } else {
          c = c.parent;
        }
      }
      throw StateError('Cannot find reference $T in the component tree');
    }
    return _gameRef!;
  }

  @override
  void onRemove() {
    super.onRemove();
    _gameRef = null;
  }

  registerToGame() {
    gameRef.add(this);
  }
}
