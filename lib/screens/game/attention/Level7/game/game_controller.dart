import 'dart:collection';
import 'dart:math';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/base/game_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/base/radar.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/base/scanable.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/enemy/enemy_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/enemy/enemy_factory.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/game/game_setting.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/neutual/neutual_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level7/view/weapon_factory_view.dart';

import 'package:flutter_application_1/screens/game/attention/Level7/weapon/weapon_component.dart';

GameSetting gameSetting = GameSetting();

enum GameControl {
  WEAPON_BUILDING,
  WEAPON_SELECTED,
  /*change type */
  WEAPON_BUILD_DONE,
  WEAPON_DESTROYED,
  WEAPON_SHOW_ACTION,
  WEAPON_SHOW_PROFILE,
  ENEMY_SPAWN,
  ENEMY_MISSED,
  ENEMY_KILLED,
  ENEMY_NEXT_WAVE,
  GAME_OVER,
  GAME_TIMER,
  GAME_NEXT
}

class GameInstruction {
  GameControl instruction;
  GameComponent source;
  late Timer countDown;
  int _remainingTime = 30;
  bool timerStarted = false;
  late Vector2 vecto;
  bool checkbool = true;

  GameInstruction(this.source, this.instruction);
  Future<void> process(GameController controller) async {
    switch (instruction) {
      case GameControl.WEAPON_BUILDING:
        // WeaponViewWidget.hide();
        WeaponComponent? component =
            controller.gameRef.weaponFactory.buildWeapon(this.source.position);
        vecto = this.source.position;
        if (component != null) {
          controller.add(component);
          controller.buildingWeapon?.removeFromParent();
          controller.buildingWeapon = component;
          // component.blockMap = component.collision(controller.rc01) ||
          //     component.collision(controller.rc02) ||
          //     component.collision(controller.rc03) ||
          //     component.collision(controller.rc04) ||
          //     component.collision(controller.rc05) ||
          //     component.collision(controller.rc06) ||
          //     component.collision(controller.rc07) ||
          //     component.collision(controller.rc08) ||
          //     component.collision(controller.rc10) ||
          //     component.collision(controller.rc11) ||
          //     component.collision(controller.rc12) ||
          //     component.collision(controller.rc13) ||
          //     component.collision(controller.rc14) ||
          //     component.collision(controller.rc16) ||
          //     component.collision(controller.rc17) ||
          //     component.collision(controller.rc18) ||
          //     component.collision(controller.rc19) ||
          //     component.collision(controller.rc20) ||
          //     component.collision(controller.rc21) ||
          //     component.collision(controller.rc22) ||
          //     component.collision(controller.rc23) ||
          //     component.collision(controller.rc27) ||
          //     component.collision(controller.rc28) ||
          //     component.collision(controller.rc29) ||
          //     component.collision(controller.rc30) ||
          //     component.collision(controller.rc31) ||
          //     component.collision(controller.rc32) ||
          //     component.collision(controller.rc33) ||
          //     component.collision(controller.rc37) ||
          //     component.collision(controller.rc38) ||
          //     component.collision(controller.rc39) ||
          //     component.collision(controller.rc40) ||
          //     component.collision(controller.rc41) ||
          //     component.collision(controller.rc42) ||
          //     component.collision(controller.rc43) ||
          //     component.collision(controller.rc44) ||
          //     component.collision(controller.rc46) ||
          //     component.collision(controller.rc47) ||
          //     component.collision(controller.rc48) ||
          //     component.collision(controller.rc49) ||
          //     component.collision(controller.rc50) ||
          //     component.collision(controller.rc51) ||
          //     component.collision(controller.rc52) ||
          //     component.collision(controller.rc53) ||
          //     component.collision(controller.rc54) ||
          //     component.collision(controller.rc55) ||
          //     component.collision(controller.rc56) ||
          //     component.collision(controller.rc57) ||
          //     component.collision(controller.rc58) ||
          //     component.collision(controller.rc59) ||
          //     component.collision(controller.rc60) ||
          //     component.collision(controller.rc61) ||
          //     component.collision(controller.rc63) ||
          //     component.collision(controller.rc64) ||
          //     component.collision(controller.rc65) ||
          //     component.collision(controller.rc66) ||
          //     component.collision(controller.rc68) ||
          //     component.collision(controller.rc69) ||
          //     component.collision(controller.rc70) ||
          //     component.collision(controller.rc74) ||
          //     component.collision(controller.rc75) ||
          //     component.collision(controller.rc79) ||
          //     component.collision(controller.rc80) ||
          //     component.collision(controller.rc84) ||
          //     component.collision(controller.rc85) ||
          //     component.collision(controller.rc89) ||
          //     component.collision(controller.rc90) ||
          //     component.collision(controller.rc91) ||
          //     component.collision(controller.rc93) ||
          //     component.collision(controller.rc94) ||
          //     component.collision(controller.rc95) ||
          //     component.collision(controller.rc96) ||
          //     component.collision(controller.rc98) ||
          //     component.collision(controller.rc99);

          // print(component.collision(controller.gateEnd));
        }

        break;
      // case GameControl.WEAPON_SELECTED:
      //   // WeaponViewWidget.hide();
      //   controller.gameRef.weaponFactory.select(source as SingleWeaponView);
      //   if (controller.buildingWeapon != null) {
      //     controller.send(
      //         controller.buildingWeapon!, GameControl.WEAPON_BUILDING);
      //   }
      //   break;
      case GameControl.WEAPON_BUILD_DONE:
        // controller.buildingWeapon.buildDone = true;
        // controller.gameRef.weaponFactory.onBuildDone(source as WeaponComponent);
        // controller.gameRef.mapController.astarMapAddObstacle(source.position);

        WeaponComponent? component =
            controller.gameRef.weaponFactory.buildWeapon(this.source.position);
        // controller.buildingWeapon = null;
        // await Future.delayed(Duration(seconds: 2));
        if (controller.buildingWeapon != null) {
          controller.send(
              controller.buildingWeapon!, GameControl.WEAPON_BUILDING);
          // controller.processEnemySmartMove();
          // var intValue = Random().nextInt(4);

          // if(intValue > 2){
          //   controller.processEnemySmartMove2();
          // } else if(intValue < 2){
          //   controller.processEnemySmartMove3();
          // }else if (intValue == 2){
          //   controller.processEnemySmartMove();
          // }
        }

        // print(source.position);
        // print(component.collision(controller.gateStart));
        // if(source.position == controller.gateEnd){
        //   controller.processEnemySmartMove2();
        // } if(source.position == controller.gateEnd2){
        //   controller.processEnemySmartMove();
        // }if(source.position == controller.gateEnd3){
        //   controller.processEnemySmartMove2();
        // }
        // var intValue = Random().nextInt(4);
        // controller.processEnemySmartMove();
        // // await Future.delayed(Duration(seconds: 3));
        // //
        // // if(intValue > 2){
        // //   controller.processEnemySmartMove2();
        // // } else if(intValue <= 2){
        // //   controller.processEnemySmartMove3();
        // // }

        break;
      // case GameControl.WEAPON_DESTROYED:
      //   WeaponViewWidget.hide();
      //   controller.gameRef.weaponFactory.onDestroy(source as WeaponComponent);
      //   controller.gameRef.mapController
      //       .astarMapRemoveObstacle(source.position);
      //   controller.processEnemySmartMove();
      //   break;
      case GameControl.ENEMY_SPAWN:
        controller.enemyFactory.start();
        break;
      case GameControl.ENEMY_MISSED:
        controller.gameRef.gamebarView.missedEnemy += 1;
        break;
      case GameControl.ENEMY_KILLED:
        controller.gameRef.gamebarView.killedEnemy += 1;
        // controller.gameRef.gamebarView.remainingTime -=1;
        break;
        // case GameControl.ENEMY_KILLED:
        //   // timerStarted =true;
        //   // // countDown = Timer(1, onTick: (){
        //   //   if(_remainingTime > 0){
        //   //     _remainingTime -= 1;
        //   //     // overlays.notifyListeners();
        //   //   }
        //   // }
        //   // );
        //   controller.gameRef.gamebarView.remainingTime -=1;
        break;
      case GameControl.ENEMY_NEXT_WAVE:
        controller.gameRef.gamebarView.wave += 1;
        break;
      // case GameControl.WEAPON_SHOW_ACTION:
      //   WeaponViewWidget.show(source as WeaponComponent);
      //   break;
      case GameControl.GAME_OVER:
        controller.gameRef.overlays.add('gameover');
        controller.gameRef.pauseEngine();
        break;
      case GameControl.GAME_NEXT:
        controller.gameRef.overlays.add('nextlevel');
        controller.gameRef.pauseEngine();
        break;
      default:
    }
  }
}

class GameController extends GameComponent {
  WeaponComponent? buildingWeapon;
  EnemyFactory enemyFactory = EnemyFactory();
  GameController({
    position,
    size,
  }) : super(position: position, size: size, priority: 10) {
    add(enemyFactory);
  }

  @override
  void update(double dt) {
    processInstruction();
    processRadarScan();
    super.update(dt);
  }

  /* Instruction Queue*/
  Queue _instructQ = new Queue<GameInstruction>();
  send(GameComponent source, GameControl _instruct) {
    _instructQ.add(GameInstruction(source, _instruct));
  }

  void processInstruction() {
    while (_instructQ.isNotEmpty) {
      GameInstruction _instruct = _instructQ.removeFirst();
      _instruct.process(this);
    }
  }

  /* Process Routine */
  void processRadarScan() {
    Iterable<Component> radars =
        children.where((e) => e is Radar && e.radarOn).cast();
    Iterable<Component> scanbles =
        children.where((e) => e is Scanable && e.scanable).cast();

    radars.forEach((element) {
      (element as Radar).radarScan(scanbles);
    });
  }

  void processEnemySmartMove() {
    Iterable<Component> enemies =
        children.where((e) => e is EnemyComponent && e.active).cast();
    enemies.forEach((element) {
      var intValue = Random().nextInt(2);
      // if(intValue ==1){
      (element as EnemyComponent).moveSmart(gateEnd.position);
      // }else{
      (element as EnemyComponent).moveSmart(gateEnd2.position);
      (element as EnemyComponent).moveSmart(gateEnd3.position);
      // }
    });
  }

  void processEnemySmartMove2() {
    Iterable<Component> enemies =
        children.where((e) => e is EnemyComponent && e.active).cast();
    enemies.forEach((element) {
      var intValue = Random().nextInt(2);
      // if(intValue ==1){
      (element as EnemyComponent).moveSmart(gateEnd2.position);
      // }else{
      //   (element as EnemyComponent).moveSmart(gateEnd2.position);
      // (element as EnemyComponent).moveSmart(gateEnd3.position);
      // }
    });
  }

  void processEnemySmartMove3() {
    Iterable<Component> enemies =
        children.where((e) => e is EnemyComponent && e.active).cast();
    enemies.forEach((element) {
      var intValue = Random().nextInt(2);
      // if(intValue ==1){
      (element as EnemyComponent).moveSmart(gateEnd3.position);
      // }else{
      //   (element as EnemyComponent).moveSmart(gateEnd2.position);
      // (element as EnemyComponent).moveSmart(gateEnd3.position);
      // }
    });
  }

  /* Load Initialization */
  late NeutualComponent Test;
  late NeutualComponent gateStart;
  late NeutualComponent gateStart2;
  late NeutualComponent gateEnd;
  late NeutualComponent gateEnd2;
  late NeutualComponent gateEnd3;
  late NeutualComponent rc01;
  late NeutualComponent rc02;
  late NeutualComponent rc03;
  late NeutualComponent rc04;
  late NeutualComponent rc05;
  late NeutualComponent rc06;
  late NeutualComponent rc07;
  late NeutualComponent rc08;
  late NeutualComponent rc10;
  late NeutualComponent rc11;
  late NeutualComponent rc12;
  late NeutualComponent rc13;
  late NeutualComponent rc14;
  late NeutualComponent rc15;
  late NeutualComponent rc16;
  late NeutualComponent rc17;
  late NeutualComponent rc18;
  late NeutualComponent rc19;
  late NeutualComponent rc20;
  late NeutualComponent rc21;
  late NeutualComponent rc22;
  late NeutualComponent rc23;
  late NeutualComponent rc24;
  // late NeutualComponent rc25;
  late NeutualComponent rc26;
  late NeutualComponent rc27;
  late NeutualComponent rc28;
  late NeutualComponent rc29;
  late NeutualComponent rc30;
  late NeutualComponent rc31;
  late NeutualComponent rc32;
  late NeutualComponent rc33;
  late NeutualComponent rc34;
  late NeutualComponent rc35;
  late NeutualComponent rc36;
  late NeutualComponent rc37;
  late NeutualComponent rc38;
  late NeutualComponent rc39;
  late NeutualComponent rc40;
  late NeutualComponent rc41;
  late NeutualComponent rc42;
  late NeutualComponent rc43;
  late NeutualComponent rc44;
  late NeutualComponent rc45;
  late NeutualComponent rc46;
  late NeutualComponent rc47;
  late NeutualComponent rc48;
  late NeutualComponent rc49;
  late NeutualComponent rc50;
  late NeutualComponent rc51;
  late NeutualComponent rc52;
  late NeutualComponent rc53;
  late NeutualComponent rc54;
  late NeutualComponent rc55;
  late NeutualComponent rc56;
  late NeutualComponent rc57;
  late NeutualComponent rc58;
  late NeutualComponent rc59;
  late NeutualComponent rc60;
  late NeutualComponent rc61;
  late NeutualComponent rc62;
  late NeutualComponent rc63;
  late NeutualComponent rc64;
  late NeutualComponent rc65;
  late NeutualComponent rc66;
  late NeutualComponent rc67;
  late NeutualComponent rc68;
  late NeutualComponent rc69;
  late NeutualComponent rc70;
  late NeutualComponent rc71;
  // late NeutualComponent rc72;
  late NeutualComponent rc73;
  late NeutualComponent rc74;
  late NeutualComponent rc75;
  late NeutualComponent rc76;
  // late NeutualComponent rc77;
  late NeutualComponent rc78;
  late NeutualComponent rc79;
  late NeutualComponent rc80;
  late NeutualComponent rc81;
  late NeutualComponent rc82;
  late NeutualComponent rc83;
  late NeutualComponent rc84;
  late NeutualComponent rc85;
  late NeutualComponent rc86;
  late NeutualComponent rc87;
  late NeutualComponent rc88;
  late NeutualComponent rc89;
  late NeutualComponent rc90;
  late NeutualComponent rc91;
  late NeutualComponent rc92;
  late NeutualComponent rc93;
  late NeutualComponent rc94;
  late NeutualComponent rc95;
  late NeutualComponent rc96;
  late NeutualComponent rc97;
  late NeutualComponent rc98;
  late NeutualComponent rc99;
  @override
  Future<void>? onLoad() {
    super.onLoad();
    loadGate();
  }

  void loadGate() async {
    /*random gate */
    //   double rndx = Random().nextDouble();
    //   double rndy = Random().nextDouble();
    //   Vector2 start, end;
    //
    //   if (rndx < rndy) {
    //     start = Vector2(0,
    //         (Random().nextDouble() * gameSetting.mapGrid.y).toInt().toDouble());
    //     end = Vector2(gameSetting.mapGrid.x - 1,
    //         (Random().nextDouble() * gameSetting.mapGrid.y).toInt().toDouble());
    //   } else {
    //     start = Vector2(
    //         (Random().nextDouble() * gameSetting.mapGrid.x).toInt().toDouble(),
    //         0);
    //     end = Vector2(
    //         (Random().nextDouble() * gameSetting.mapGrid.x).toInt().toDouble(),
    //         gameSetting.mapGrid.y - 1);
    //   }
    //   start = gameSetting.dotMultiple(start, gameSetting.mapTileSize) +
    //       (gameSetting.mapTileSize / 2);
    //   end = gameSetting.dotMultiple(end, gameSetting.mapTileSize) +
    //       (gameSetting.mapTileSize / 2);
    //
    //   // final images = Flame.images.load;
    //   gateStart = NeutualComponent(
    //       position: start,
    //       size: gameSetting.mapTileSize,
    //       neutualType: NeutualType.GATE_START)
    //     ..sprite = Sprite(await Flame.images.load('blackhole.png'));
    //   gateEnd = NeutualComponent(
    //       position: end,
    //       size: gameSetting.mapTileSize,
    //       neutualType: NeutualType.GATE_END)
    //     ..sprite = Sprite(await Flame.images.load('whitehole.png'));
    //   add(gateStart);
    //   add(gateEnd);
    // }
    Vector2 test, start, end, start2, end2, end3;
    Vector2 rcv01,
        rcv02,
        rcv03,
        rcv04,
        rcv05,
        rcv06,
        rcv07,
        rcv08,
        rcv10,
        rcv11,
        rcv12,
        rcv13,
        rcv14,
        rcv15,
        rcv16,
        rcv17,
        rcv18,
        rcv19;
    Vector2 rcv20,
        rcv21,
        rcv22,
        rcv23,
        rcv24,
        rcv25,
        rcv26,
        rcv27,
        rcv28,
        rcv29,
        rcv30,
        rcv31,
        rcv32,
        rcv33,
        rcv34,
        rcv35,
        rcv36,
        rcv37,
        rcv38,
        rcv39;
    Vector2 rcv50,
        rcv51,
        rcv52,
        rcv53,
        rcv54,
        rcv55,
        rcv56,
        rcv57,
        rcv58,
        rcv59,
        rcv40,
        rcv41,
        rcv42,
        rcv43,
        rcv44,
        rcv45,
        rcv46,
        rcv47,
        rcv48,
        rcv49;
    Vector2 rcv60,
        rcv61,
        rcv62,
        rcv63,
        rcv64,
        rcv65,
        rcv66,
        rcv67,
        rcv68,
        rcv69,
        rcv70,
        rcv71,
        rcv72,
        rcv73,
        rcv74,
        rcv75,
        rcv76,
        rcv77,
        rcv78,
        rcv79;
    Vector2 rcv80,
        rcv81,
        rcv82,
        rcv83,
        rcv84,
        rcv85,
        rcv86,
        rcv87,
        rcv88,
        rcv89,
        rcv90,
        rcv91,
        rcv92,
        rcv93,
        rcv94,
        rcv95,
        rcv96,
        rcv97,
        rcv98,
        rcv99;

    start = Vector2(0, 0);
    start2 = Vector2(0, 9);

    end = Vector2(2, 5);
    end3 = Vector2(7, 2);
    end2 = Vector2(7, 7);

    start = gameSetting.dotMultiple(start, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    end = gameSetting.dotMultiple(end, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    end3 = gameSetting.dotMultiple(end3, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);

    start2 = gameSetting.dotMultiple(start2, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    end2 = gameSetting.dotMultiple(end2, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);

    // final images = Images();
    gateStart = NeutualComponent(
        position: start,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    gateStart2 = NeutualComponent(
        position: start2,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    gateEnd = NeutualComponent(
        position: end,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_END)
      ..sprite = Sprite(await Flame.images.load('whitehole.png'));
    gateEnd2 = NeutualComponent(
        position: end2,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_END)
      ..sprite = Sprite(await Flame.images.load('whitehole.png'));
    gateEnd3 = NeutualComponent(
        position: end3,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_END)
      ..sprite = Sprite(await Flame.images.load('whitehole.png'));
    rcv01 = gameSetting.dotMultiple(Vector2(0, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv02 = gameSetting.dotMultiple(Vector2(0, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv03 = gameSetting.dotMultiple(Vector2(0, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv04 = gameSetting.dotMultiple(Vector2(0, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv05 = gameSetting.dotMultiple(Vector2(0, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv06 = gameSetting.dotMultiple(Vector2(0, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv07 = gameSetting.dotMultiple(Vector2(0, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv08 = gameSetting.dotMultiple(Vector2(0, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv10 = gameSetting.dotMultiple(Vector2(1, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    //
    rcv11 = gameSetting.dotMultiple(Vector2(1, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv12 = gameSetting.dotMultiple(Vector2(1, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv13 = gameSetting.dotMultiple(Vector2(1, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv14 = gameSetting.dotMultiple(Vector2(1, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv15 = gameSetting.dotMultiple(Vector2(1, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv16 = gameSetting.dotMultiple(Vector2(1, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv17 = gameSetting.dotMultiple(Vector2(1, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv18 = gameSetting.dotMultiple(Vector2(1, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv19 = gameSetting.dotMultiple(Vector2(1, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    //
    rcv20 = gameSetting.dotMultiple(Vector2(2, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv21 = gameSetting.dotMultiple(Vector2(2, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv22 = gameSetting.dotMultiple(Vector2(2, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv23 = gameSetting.dotMultiple(Vector2(2, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv24 = gameSetting.dotMultiple(Vector2(2, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv25 = gameSetting.dotMultiple(Vector2(2, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv26 = gameSetting.dotMultiple(Vector2(2, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv27 = gameSetting.dotMultiple(Vector2(2, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv28 = gameSetting.dotMultiple(Vector2(2, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv29 = gameSetting.dotMultiple(Vector2(2, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv30 = gameSetting.dotMultiple(Vector2(3, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv31 = gameSetting.dotMultiple(Vector2(3, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv32 = gameSetting.dotMultiple(Vector2(3, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv33 = gameSetting.dotMultiple(Vector2(3, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv34 = gameSetting.dotMultiple(Vector2(3, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv35 = gameSetting.dotMultiple(Vector2(3, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv36 = gameSetting.dotMultiple(Vector2(3, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv37 = gameSetting.dotMultiple(Vector2(3, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv38 = gameSetting.dotMultiple(Vector2(3, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv39 = gameSetting.dotMultiple(Vector2(3, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    //
    rcv40 = gameSetting.dotMultiple(Vector2(4, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv41 = gameSetting.dotMultiple(Vector2(4, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv42 = gameSetting.dotMultiple(Vector2(4, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv43 = gameSetting.dotMultiple(Vector2(4, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv44 = gameSetting.dotMultiple(Vector2(4, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv45 = gameSetting.dotMultiple(Vector2(4, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv46 = gameSetting.dotMultiple(Vector2(4, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv47 = gameSetting.dotMultiple(Vector2(4, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv48 = gameSetting.dotMultiple(Vector2(4, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv49 = gameSetting.dotMultiple(Vector2(4, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv50 = gameSetting.dotMultiple(Vector2(5, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv51 = gameSetting.dotMultiple(Vector2(5, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv52 = gameSetting.dotMultiple(Vector2(5, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv53 = gameSetting.dotMultiple(Vector2(5, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv54 = gameSetting.dotMultiple(Vector2(5, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv55 = gameSetting.dotMultiple(Vector2(5, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv56 = gameSetting.dotMultiple(Vector2(5, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv57 = gameSetting.dotMultiple(Vector2(5, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv58 = gameSetting.dotMultiple(Vector2(5, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv59 = gameSetting.dotMultiple(Vector2(5, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    //
    rcv60 = gameSetting.dotMultiple(Vector2(6, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv61 = gameSetting.dotMultiple(Vector2(6, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv62 = gameSetting.dotMultiple(Vector2(6, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv63 = gameSetting.dotMultiple(Vector2(6, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv64 = gameSetting.dotMultiple(Vector2(6, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv65 = gameSetting.dotMultiple(Vector2(6, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv66 = gameSetting.dotMultiple(Vector2(6, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv67 = gameSetting.dotMultiple(Vector2(6, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv68 = gameSetting.dotMultiple(Vector2(6, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv69 = gameSetting.dotMultiple(Vector2(6, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv70 = gameSetting.dotMultiple(Vector2(7, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv71 = gameSetting.dotMultiple(Vector2(7, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv72 = gameSetting.dotMultiple(Vector2(7, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv73 = gameSetting.dotMultiple(Vector2(7, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv74 = gameSetting.dotMultiple(Vector2(7, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv75 = gameSetting.dotMultiple(Vector2(7, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv76 = gameSetting.dotMultiple(Vector2(7, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv77 = gameSetting.dotMultiple(Vector2(7, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv78 = gameSetting.dotMultiple(Vector2(7, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv79 = gameSetting.dotMultiple(Vector2(7, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    //
    rcv80 = gameSetting.dotMultiple(Vector2(8, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv81 = gameSetting.dotMultiple(Vector2(8, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv82 = gameSetting.dotMultiple(Vector2(8, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv83 = gameSetting.dotMultiple(Vector2(8, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv84 = gameSetting.dotMultiple(Vector2(8, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv85 = gameSetting.dotMultiple(Vector2(8, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv86 = gameSetting.dotMultiple(Vector2(8, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv87 = gameSetting.dotMultiple(Vector2(8, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv88 = gameSetting.dotMultiple(Vector2(8, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv89 = gameSetting.dotMultiple(Vector2(8, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv90 = gameSetting.dotMultiple(Vector2(9, 0), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv91 = gameSetting.dotMultiple(Vector2(9, 1), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv92 = gameSetting.dotMultiple(Vector2(9, 2), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv93 = gameSetting.dotMultiple(Vector2(9, 3), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv94 = gameSetting.dotMultiple(Vector2(9, 4), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv95 = gameSetting.dotMultiple(Vector2(9, 5), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv96 = gameSetting.dotMultiple(Vector2(9, 6), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv97 = gameSetting.dotMultiple(Vector2(9, 7), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv98 = gameSetting.dotMultiple(Vector2(9, 8), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    rcv99 = gameSetting.dotMultiple(Vector2(9, 9), gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);

    rc01 = NeutualComponent(
        position: rcv01,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);

    rc02 = NeutualComponent(
        position: Vector2(0, 2),
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc03 = NeutualComponent(
        position: rcv03,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc04 = NeutualComponent(
        position: rcv04,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc05 = NeutualComponent(
        position: rcv05,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc06 = NeutualComponent(
        position: rcv06,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc07 = NeutualComponent(
        position: rcv07,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc08 = NeutualComponent(
        position: rcv08,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc10 = NeutualComponent(
        position: rcv10,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc11 = NeutualComponent(
        position: rcv11,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc12 = NeutualComponent(
        position: rcv12,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc13 = NeutualComponent(
        position: rcv13,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc14 = NeutualComponent(
        position: rcv14,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc15 = NeutualComponent(
        position: rcv15,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc16 = NeutualComponent(
        position: rcv16,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc17 = NeutualComponent(
        position: rcv17,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc18 = NeutualComponent(
        position: rcv18,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc19 = NeutualComponent(
        position: rcv19,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    //
    rc20 = NeutualComponent(
        position: rcv20,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc21 = NeutualComponent(
        position: rcv21,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc22 = NeutualComponent(
        position: rcv22,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc23 = NeutualComponent(
        position: rcv23,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc24 = NeutualComponent(
        position: rcv24,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    // rc25 = NeutualComponent(
    //     position: rcv15,
    //     size: gameSetting.mapTileSize,
    //     neutualType: NeutualType.GATE_START);
    rc26 = NeutualComponent(
        position: rcv26,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc27 = NeutualComponent(
        position: rcv27,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc28 = NeutualComponent(
        position: rcv28,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc29 = NeutualComponent(
        position: rcv29,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc30 = NeutualComponent(
        position: rcv30,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc31 = NeutualComponent(
        position: rcv31,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc32 = NeutualComponent(
        position: rcv32,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc33 = NeutualComponent(
        position: rcv33,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc34 = NeutualComponent(
        position: rcv34,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc35 = NeutualComponent(
        position: rcv35,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc36 = NeutualComponent(
        position: rcv36,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc37 = NeutualComponent(
        position: rcv37,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc38 = NeutualComponent(
        position: rcv38,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc39 = NeutualComponent(
        position: rcv39,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc40 = NeutualComponent(
        position: rcv40,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc41 = NeutualComponent(
        position: rcv41,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc42 = NeutualComponent(
        position: rcv42,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc43 = NeutualComponent(
        position: rcv43,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc44 = NeutualComponent(
        position: rcv44,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc45 = NeutualComponent(
        position: rcv45,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc46 = NeutualComponent(
        position: rcv46,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc47 = NeutualComponent(
        position: rcv47,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc48 = NeutualComponent(
        position: rcv48,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc49 = NeutualComponent(
        position: rcv49,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc50 = NeutualComponent(
        position: rcv50,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc51 = NeutualComponent(
        position: rcv51,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc52 = NeutualComponent(
        position: rcv52,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc53 = NeutualComponent(
        position: rcv53,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc54 = NeutualComponent(
        position: rcv54,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc55 = NeutualComponent(
        position: rcv55,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc56 = NeutualComponent(
        position: rcv56,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc57 = NeutualComponent(
        position: rcv57,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc58 = NeutualComponent(
        position: rcv58,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc59 = NeutualComponent(
        position: rcv59,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc60 = NeutualComponent(
        position: rcv60,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc61 = NeutualComponent(
        position: rcv61,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc62 = NeutualComponent(
        position: rcv62,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc63 = NeutualComponent(
        position: rcv63,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc64 = NeutualComponent(
        position: rcv64,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc65 = NeutualComponent(
        position: rcv65,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc66 = NeutualComponent(
        position: rcv66,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc67 = NeutualComponent(
        position: rcv67,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc68 = NeutualComponent(
        position: rcv68,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc69 = NeutualComponent(
        position: rcv69,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc70 = NeutualComponent(
        position: rcv70,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc71 = NeutualComponent(
        position: rcv71,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    // rc72 = NeutualComponent(
    //     position:rcv72,
    //     size: gameSetting.mapTileSize,
    //     neutualType: NeutualType.GATE_START);
    rc73 = NeutualComponent(
        position: rcv73,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc74 = NeutualComponent(
        position: rcv74,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc75 = NeutualComponent(
        position: rcv75,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc76 = NeutualComponent(
        position: rcv76,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    // rc77 = NeutualComponent(
    //     position: rcv77,
    //     size: gameSetting.mapTileSize,
    //     neutualType: NeutualType.GATE_START);
    rc78 = NeutualComponent(
        position: rcv78,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc79 = NeutualComponent(
        position: rcv79,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc80 = NeutualComponent(
        position: rcv80,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc81 = NeutualComponent(
        position: rcv81,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc82 = NeutualComponent(
        position: rcv82,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc83 = NeutualComponent(
        position: rcv83,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc84 = NeutualComponent(
        position: rcv84,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc85 = NeutualComponent(
        position: rcv85,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc86 = NeutualComponent(
        position: rcv86,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc87 = NeutualComponent(
        position: rcv87,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc88 = NeutualComponent(
        position: rcv88,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc89 = NeutualComponent(
        position: rcv89,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc90 = NeutualComponent(
        position: rcv90,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc91 = NeutualComponent(
        position: rcv91,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc92 = NeutualComponent(
        position: rcv92,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc93 = NeutualComponent(
        position: rcv93,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc94 = NeutualComponent(
        position: rcv94,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc95 = NeutualComponent(
        position: rcv95,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc96 = NeutualComponent(
        position: rcv96,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc97 = NeutualComponent(
        position: rcv97,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc98 = NeutualComponent(
        position: rcv98,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);
    rc99 = NeutualComponent(
        position: rcv99,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START);

    add(gateEnd);
    add(gateEnd2);
    add(gateEnd3);
    // add(rc02);
  }
}
