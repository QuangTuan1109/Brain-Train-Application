import 'package:flame/components.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/base/game_component.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/base/movable.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/base/radar.dart';
import 'package:flutter_application_1/screens/game/attention/Level1/enemy/enemy_component.dart';

class BulletComponent extends GameComponent
    with Movable, Radar<EnemyComponent> {
  // double range = 0;
  Function? onExplosion;
  double damage = 0;
  BulletComponent({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, priority: 50);

  @override
  Future<void>? onLoad() {
    radarOn = true;
    radarRange = (size.x + size.y) / 4;
    radarScanAlert = onHitEnemy;
    radarScanNothing = null;
    radarCollisionDepth = 0.2;
    onMoveFinish = this.outOfRange;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (active) {
      updateMovable(dt);
    }
    super.update(dt);
  }

  void onHitEnemy(GameComponent enemy) {
    radarOn = false;
    (enemy as EnemyComponent).receiveDamage(damage);
    this.removeFromParent();
    onExplosion?.call(enemy);
  }

  void outOfRange() {
    radarOn = false;
    this.removeFromParent();
  }
}

class ExplosionComponent extends GameComponent {
  ExplosionComponent({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, priority: 55);
  set animation(SpriteAnimation? a) {
    if (a == null) {
      this.removeFromParent();
    }
    super.animation = a;
    this.animation!.onComplete = this.removeFromParent;
    // this.debugMode = true;
  }
}
