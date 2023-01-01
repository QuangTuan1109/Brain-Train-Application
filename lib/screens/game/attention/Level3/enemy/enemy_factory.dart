import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_application_1/screens/game/attention/Level3/base/game_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level3/enemy/enemy_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level3/enemy/enemy_v1.dart';
import 'dart:math' as math;

import 'package:flutter_application_1/screens/game/attention/Level3/game/game_controller.dart';

class EnemyFactory extends GameComponent {
  EnemyFactory() : super(position: Vector2.zero(), size: Vector2.zero()) {
    active = false;
  }

  EnemyComponent spawnEnemey(Vector2 anchor, EnemyType type) {
    late EnemyComponent enemy;
    enemy = EnemyV1(position: anchor, type: type);

    return enemy;
  }

  EnemyComponent spawnOneEnemy(EnemyType type) {
    EnemyComponent enemy;
    var intValue = Random().nextInt(3);
    Vector2 initPosition = gameRef.gameController.gateStart.position;
    enemy = spawnEnemey(initPosition, type);
    gameRef.gameController.add(enemy);
    enpowerEnemy(enemy);
    if (intValue == 0) {
      enemy.moveSmart(gameRef.gameController.gateEnd.position);
    } else if (intValue == 1) {
      enemy.moveSmart(gameRef.gameController.gateEnd2.position);
    } else if (intValue > 1) {
      enemy.moveSmart(gameRef.gameController.gateEnd3.position);
    }
    // enemy.moveSmart(gameRef.gameController.gateEnd.position);
    return enemy;
  }

  EnemyComponent spawnOneEnemy2(EnemyType type) {
    EnemyComponent enemy;
    var intValue = Random().nextInt(3);
    // Vector2 initPosition = gameRef.gameController.gateStart.position;
    Vector2 initPosition2 = gameRef.gameController.gateStart2.position;
    enemy = spawnEnemey(initPosition2, type);
    gameRef.gameController.add(enemy);
    enpowerEnemy(enemy);
    if (intValue == 0) {
      enemy.moveSmart(gameRef.gameController.gateEnd.position);
    } else if (intValue == 1) {
      enemy.moveSmart(gameRef.gameController.gateEnd2.position);
    } else if (intValue > 1) {
      enemy.moveSmart(gameRef.gameController.gateEnd3.position);
    }
    // enemy.moveSmart(gameRef.gameController.gateEnd2.position);
    return enemy;
  }

  EnemyComponent spawnOneEnemy3(EnemyType type) {
    EnemyComponent enemy;
    // Vector2 initPosition = gameRef.gameController.gateStart.position;
    Vector2 initPosition = gameRef.gameController.gateStart2.position;
    enemy = spawnEnemey(initPosition, type);
    gameRef.gameController.add(enemy);
    enpowerEnemy(enemy);
    enemy.moveSmart(gameRef.gameController.gateEnd3.position);
    return enemy;
  }

  int currentWave = 0;
  int _spwanCount = 0;
  double _interval = 1;

  void start() => nextWave();

  void nextWave() {
    currentWave++;
    gameRef.gameController.send(this, GameControl.ENEMY_NEXT_WAVE);
    switch (currentWave) {
      case 1:
        spawnEnemy(5, 6, spawnEnemyA);
        break;
      case 2:
        spawnEnemy(5, 5, spawnEnemyA);
        break;
      case 3:
        spawnEnemy(5, 4, spawnEnemyA);
        break;
      case 4:
        spawnEnemy(5, 3, spawnEnemyA);
        break;
      default:
        spawnEnemy(5, 2, spawnEnemyA);
        break;
    }
  }

  void spawnEnemy(int number, double interval, Function spawnF) {
    _spwanCount = number;
    _interval = interval;
    spawnEnemyLoop(spawnF);
  }

  void spawnEnemyLoop(Function spawnF) {
    if (_spwanCount <= 0) {
      add(TimerComponent(
          period: _interval,
          repeat: false,
          removeOnFinish: true,
          onTick: () => nextWave()));
    } else {
      spawnF();
      add(TimerComponent(
          period: _interval,
          repeat: false,
          removeOnFinish: true,
          onTick: () => spawnEnemyLoop(spawnF)));
      _spwanCount--;
    }
  }

  void spawnEnemyA() {
    var intValue = Random().nextInt(4);
    if (intValue == 1) {
      spawnOneEnemy(EnemyType.ENEMYA);
    } else if (intValue == 2) {
      spawnOneEnemy2(EnemyType.ENEMYA);
    } else if (intValue == 3) {
      spawnOneEnemy(EnemyType.ENEMYA);
    } else {
      spawnOneEnemy2(EnemyType.ENEMYA);
    }
  }
  // void spawnEnemyA() => spawnOneEnemy(EnemyType.ENEMYA);

  void spawnEnemyB() => spawnOneEnemy(EnemyType.ENEMYB);

  void spawnEnemyMix() {
    math.Random rnd = math.Random();
    int r = rnd.nextInt(4);
    spawnOneEnemy(EnemyType.values[r]);
  }

  void enpowerEnemy(EnemyComponent enemy) {
    num exp = (currentWave - 1);
    // enemy.maxLife *= math.pow(1.1, exp);
  }
}
