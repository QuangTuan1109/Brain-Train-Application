import 'package:flame/extensions.dart';
import 'package:flutter_application_1/astar/astarnode.dart';
import 'package:flutter_application_1/screens/game/attention/Level6/map/astarmap_minxin.dart';
import 'package:flutter_application_1/screens/game/attention/Level6/base/game_component.dart';

import 'map_tile_component.dart';

class MapController extends GameComponent with AstarMapMixin {
  late Vector2 tileSize;
  late Vector2 mapGrid;

  MapController({
    required this.tileSize,
    required this.mapGrid,
    position,
    size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (var w = 0; w < mapGrid.x; w++) {
      for (var h = 0; h < mapGrid.y; h++) {
        this.add(MapTileComponent(
            position: Vector2(w * tileSize.x, h * tileSize.y) +
                (Vector2(tileSize.x / 2, tileSize.y / 2)),
            size: tileSize));
      }
    }

    initBackground();
    astarMapInit(mapGrid);
  }

  void initBackground() {}

  bool testBlock(Vector2 position) {
    astarMapAddObstacle(position);
    AstarNode? goal = astarMapResolve(
        gameRef.gameSetting.enemySpawn, gameRef.gameSetting.enemyTarget);
    astarMapRemoveObstacle(position);
    return goal == null ? true : false;
  }
}
