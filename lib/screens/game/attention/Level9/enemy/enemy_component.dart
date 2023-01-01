import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_application_1/astar/astarnode.dart';
// import 'package:flutter_application_1//astar/astarnode.dart';
import 'package:flutter_application_1/screens/game/attention/Level9/base/game_component.dart';

import 'package:flutter_application_1/screens/game/attention/Level9/base/movable.dart';
import 'package:flutter_application_1/screens/game/attention/Level9/base/scanable.dart';
import 'dart:math';

import 'package:flutter_application_1/screens/game/attention/Level9/game/game_controller.dart';

enum EnemyType { ENEMYA, ENEMYB }

class EnemyComponent extends GameComponent
    with Scanable, Movable, EnemySmartMove {
  double _maxLife = 0;
  double speedstart = 0;
  double life = 0;
  int mineValue = 5;
  bool dead = false;
  late EnemyType enemyType;

  late Timer countDown;
  int _remainingTime = 30;
  bool timerStarted = true;

  EnemyComponent({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, priority: 30);

  // get maxLife => _maxLife;
  set maxLife(double m) {
    _maxLife = m;
    life = m;
  }

  @override
  void update(double t) {
    super.update(t);

    if (life < 0) {
      if (!dead) onKilled();
      dead = true;
      active = false;
    }

    if (active) {
      updateMovable(t);
    }
  }

  @override
  void render(Canvas c) {
    super.render(c);
    // renderLifIndicator(c);
  }

  @override
  void onRemove() {
    pathNode = null;
    super.onRemove();
  }

  Future<void> receiveDamage(double damage) async {
    // speedstart = speed;
    // speed =speedstart-60;
    // life -= damage;
    this.removeFromParent();
    // await Future.delayed(Duration(seconds: 3));
    // speed = 40;
  }

  void onArrived() {
    if (!dead) {
      active = false;
      gameRef.gameController.send(this, GameControl.ENEMY_MISSED);
      this.removeFromParent();
    }
  }

  void onKilled() {
    active = false;
    gameRef.gameController.send(this, GameControl.ENEMY_KILLED);
    gameRef.gamebarView.mineCollected += mineValue;
    this.removeFromParent();
  }

  void TimerDown() {
    countDown = Timer(1, onTick: () {
      if (_remainingTime > 0) {
        _remainingTime -= 1;
        // overlays.notifyListeners();
        gameRef.gameController.send(this, GameControl.ENEMY_KILLED);
      }
    });
  }
}

mixin EnemySmartMove on GameComponent {
  /*Enemy move path controller */
  AstarNode? pathNode;
  void moveSmart(Vector2 to) {
    pathNode = gameRef.mapController.astarMapResolve(position, to);
    if (pathNode != null) {
      pathNextMove();
    }
  }

  void pathNextMove() {
    if (pathNode != null) {
      pathNode = pathNode!.next;
      if (pathNode != null) {
        (this as Movable).moveTo(moveRadomPosition(pathNode!), pathNextMove);
      } else {
        // If we reach the exit, but fail to hit it because of CPU load
        // Just 'Arrive'
        (this as EnemyComponent).onArrived();
      }
    }
  }

  Vector2 moveRadomPosition(AstarNode node) {
    if (node.next == null) {
      /*target goto center*/
      Vector2 lefttop = gameRef.mapController.nodeToPosition(node);
      return lefttop + (gameRef.mapController.tileSize / 2);
    } else {
      Vector2 lefttop = gameRef.mapController.nodeToPosition(node);
      Vector2 randomArea = Vector2(
          gameRef.mapController.tileSize.x - this.size.x,
          gameRef.mapController.tileSize.y - this.size.y);
      lefttop = lefttop + Vector2(this.size.x / 2, this.size.y / 2);
      double rndx = Random().nextDouble();
      double rndy = Random().nextDouble();
      return lefttop + Vector2(randomArea.x * rndx, randomArea.y * rndy);
    }
  }
}
