import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter_application_1/screens/game/attention/base/game_component.dart';
import 'package:flutter_application_1/screens/game/attention/game/game_controller.dart';
import 'package:flutter_application_1/screens/game/attention/game/game_setting.dart';
import 'package:flutter_application_1/screens/game/attention/map/map_controller.dart';
import 'package:flutter_application_1/screens/game/attention/view/gamebar_view.dart';
import 'package:flutter_application_1/screens/game/attention/view/weapon_factory_view.dart';
import 'package:http/http.dart';
import '../attention_game3.dart';
import 'package:flutter/material.dart';

class GameMain extends FlameGame with HasTappables {
  late MapController mapController;
  Color backgroundColor() => const Color(0xFFEEEEEE);
  late WeaponFactoryView weaponFactory;
  late GameController gameController;
  late GamebarView gamebarView;

  late AppView appViewState;
  bool started = false;

  bool loadDone = false;

  // GameView view = GameView();
  GameSetting gameSetting = GameSetting();
  // GameController controller = GameController();
  // EnemySpawner enemySpawner = EnemySpawner();
  // StatusBar statusBar;
  // GameUtil util;
  late Timer countDown;
  int lateTime = 300;
  int remainingTime = 300;
  bool timerStarted = false;

  GameMain();

  @override
  void onGameResize(Vector2 size) {
    if (!loadDone) setting.setScreenSize(size);
    super.onGameResize(size);
  }

  int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  @override
  Future<void> onLoad() async {
    int timeRecord = currentTimeMillis();

    await super.onLoad();

    // await setting.onLoad();
    // await setting.neutual.load();

    mapController = MapController(
        tileSize: setting.mapTileSize,
        mapGrid: setting.mapGrid,
        position: setting.mapPosition,
        size: setting.mapSize);
    /*game controller should have same range as map */
    gameController =
        GameController(position: setting.mapPosition, size: setting.mapSize);

    gamebarView = GamebarView();
    weaponFactory = WeaponFactoryView();

    await setting.weapons.load(gameSetting);
    // delete(mapController);
    add(mapController);
    add(gameController);
    add(gamebarView);
    add(weaponFactory);

    setting.enemies.load();

    loadDone = true;
    int d = currentTimeMillis() - timeRecord;
    print("GameMain onLoad done takke $d");
  }

  @override
  void update(double t) {
    super.update(t);
    // if (recordFps()) {
    //   double _fps = fps();
    //   int len = components.length;
    //   print('GameMain FPS $_fps, components $len');
    // }
    // Iterable<Component> test = components
    //     .where((o) => o is! MapTileComponent)
    //     .where((o) => o is!  0x7d2b523304a0) (first time)
    // print(test.length);
    if (timerStarted && remainingTime > 0) {
      countDown.update(t);
    }
  }

  void start() {
    if (loadDone) {
      countDown = Timer(1, onTick: () {
        if (remainingTime > 0) {
          remainingTime -= 1;
          // overlays.notifyListeners();
        }
        // print(remainingTime);
        gamebarView.remainingTime = remainingTime;
        // appViewState.remainingTime = remainingTime;
      }, repeat: true);

      timerStarted = true;
      gameController.send(GameComponent(), GameControl.ENEMY_SPAWN);
      gamebarView.killedEnemy = 0;
      gamebarView.mineCollected = 999;
      gamebarView.missedEnemy = 0;

      print(remainingTime);
    }
  }
}
